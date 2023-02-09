# this file is used to read the surveyhero csv file and generate the purescript code
# the csv is not checked into version control as it has sensitive data

class FreeForm:
    def __init__(self, question):
        self.question = question
    def __str__(self) -> str:
        return f'FREEFORM: Question: {self.question}'
    def __repr__(self) -> str:
        return f'FREEFORM: Question: {self.question}'

class MultipleChoice:
    def __init__(self, question):
        self.question = question
        self.options = []
    def __str__(self) -> str:
        return f'MULTIPLECHOICE: Question: {self.question} Options: {self.options}'
    def __repr__(self) -> str:
        return f'MULTIPLECHOICE: Question: {self.question} Options: {self.options}'

class Check:
    def __init__(self, question, has_other=False):
        self.question = question
        self.options = []
        self.has_other = has_other
    def __str__(self) -> str:
        return f'CHECK: Question: {self.question} Options: {self.options} Other: {self.has_other}'
    def __repr__(self) -> str:
        return f'CHECK: Question: {self.question} Options: {self.options} Other: {self.has_other}'

ORDERED = []
class Question:
    def __init__(self, question):
        self.question = question
        self.responses = []
    def __str__(self) -> str:
        return f'Question: {self.question} Responses: {self.responses}'
    def __repr__(self) -> str:
        return f'Question: {self.question} Responses: {self.responses}'
class Answer:
    def __init__(self, answer):
        self.answer = answer
    def __str__(self) -> str:
        return f'Answer: {self.answer}'

with open('/Users/mikesol/devel/survey-2023/surveyhero-responses-2022-03-22.csv', 'r') as csvf:
    csv = csvf.read().split('\n5')
    csv = [x.split(';') for x in csv]
    starts_at = 0
    for i, x in enumerate(csv[0]):
        if x == 'Device':
            starts_at = i + 1
    questions = []
    while starts_at < len(csv[0]):
        # determine nature of question
        question = csv[0][starts_at]
        while ('?' not in question) and ('Please' not in question) and ('following' not in question):
            starts_at += 1
            ORDERED.append(Answer(question))
            question = csv[0][starts_at]
        ORDERED.append(Question(question))
        for y in range(1,len(csv)):
            txt = csv[y][starts_at]
            if (txt != ''):
                ORDERED[-1].responses.append(txt)
        starts_at += 1

x = 0
OUT = []
while x < len(ORDERED):
    if isinstance(ORDERED[x], Question) and (x < len(ORDERED) - 1) and isinstance(ORDERED[x+1], Answer):
        holder = Check(ORDERED[x].question)
        x += 1
        while x < len(ORDERED) and isinstance(ORDERED[x], Answer):
            holder.options.append(ORDERED[x].answer)
            x += 1
        OUT.append(holder)
    elif isinstance(ORDERED[x], Question) and len(ORDERED[x].responses) > len(list(set(ORDERED[x].responses))):
        holder = MultipleChoice(ORDERED[x].question)
        holder.options = list(set(ORDERED[x].responses))
        OUT.append(holder)
        x += 1
    elif isinstance(ORDERED[x], Question):
        OUT.append(FreeForm(ORDERED[x].question))
        x += 1
    else:
        raise ValueError(f'Unexpected type: {ORDERED[x]}')

for x in OUT:
    if isinstance(x, Check):
        if 'Other' in x.options:
            x.has_other = True
            x.options.remove('Other')


PSQUESTIONS = []
for x in OUT:
    if isinstance(x, FreeForm):
            PSQUESTIONS.append('FreeFormResponse (Question "{}")'.format(x.question.replace('"','').replace('\n',' ').strip()))
    elif isinstance(x, MultipleChoice):
        PSQUESTIONS.append('SelectResponse (Question "{}") [{}]'.format(x.question.replace('"','').replace('\n',' ').strip(), ', '.join(['(Option "{}")'.format(y.replace('"','').replace('\n',' ').strip()) for y in x.options])))
    elif isinstance(x, Check):
        PSQUESTIONS.append('CheckSeveralResponse (Question "{}") [{}] (HasOther {})'.format(x.question.replace('"','').replace('\n',' ').strip(), ', '.join(['(Option "{}")'.format(y.replace('"','').replace('\n',' ').strip()) for y in x.options]), str(x.has_other).lower()))
JOINED_PS = '\n  ,'.join(PSQUESTIONS)
DECL = f'''
newtype Question = Question String
newtype Option = Option String
newtype HasOther =  HasOther Boolean
data SurveyQuestion = SelectResponse Question (Array Option)
  | CheckSeveralResponse Question (Array Option) HasOther
  | FreeFormResponse Question
newtype Survey = Survey (Array SurveyQuestion)

survey :: Survey
survey = Survey
  [
    {JOINED_PS}
  ]
'''

print(DECL)
