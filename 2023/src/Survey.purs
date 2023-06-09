module Survey where

newtype Question = Question String
newtype Option = Option String
newtype HasOther = HasOther Boolean
data SurveyQuestion
  = SelectResponse Question (Array Option)
  | CheckSeveralResponse Question (Array Option) HasOther
  | FreeFormResponse Question
  | ChooseACountryResponse Question

newtype Survey = Survey (Array SurveyQuestion)

survey :: Survey
survey = Survey
  [ SelectResponse (Question "Do you use PureScript?")
      [ (Option "Yes, I currently use PureScript.")
      , ( Option
            "No, I don't currently use PureScript, but I hav]e in the past."
        )
      , (Option "No, I have never used PureScript.")
      ]
  , FreeFormResponse (Question "Why did you start using PureScript?")
  , CheckSeveralResponse
      ( Question
          "As you have indicated that you're no longer using PureScript, what prompted you to participate in this survey?"
      )
      [ (Option "To provide feedback on PureScript in general.")
      , ( Option
            "Specifically to provide feedback on why I stopped using PureScript."
        )
      , (Option "I plan to return to PureScript in the future.")
      , (Option "I consider myself part of the PureScript community.")
      , (Option "Curiosity.")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "As you have indicated that you have never used PureScript, what prompted you to participate in this survey?"
      )
      [ (Option "To provide feedback on PureScript in general.")
      , ( Option
            "Specifically to provide feedback on why I have never used PureScript."
        )
      , (Option "I plan to start using PureScript in the future.")
      , (Option "I consider myself part of the PureScript community.")
      , (Option "Curiosity.")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "What issues in the PureScript ecosystem do you feel need the most urgent attention?"
      )
      [ (Option "The community is not large enough.")
      , ( Option
            "There are not enough large companies using PureScript in production."
        )
      , (Option "There is not yet a killer app written in PureScript.")
      , ( Option
            "There is not enough PureScript documentation online, including examples and tutorials."
        )
      , ( Option
            "My language and/or community lacks enough documentation and meetups for me to get involved."
        )
      , (Option "The language is too difficult to grasp.")
      , (Option "The tooling is not mature enough.")
      ]
      (HasOther true)
  , FreeFormResponse
      ( Question
          "Please use this input to provide free-form feedback about why you're no longer using PureScript."
      )
  , FreeFormResponse
      ( Question
          "Please use this input to provide free-form feedback about why you've never used PureScript."
      )
  , FreeFormResponse
      ( Question
          "Do you intend to start using PureScript again in the next three months? If so, why?"
      )
  , SelectResponse (Question "On average, how often do you use PureScript?")
      [ (Option "Daily or nearly so")
      , (Option "Weekly or nearly so")
      , (Option "Monthly or nearly so")
      , (Option "Rarely")
      ]
  , SelectResponse (Question "How would you rate your PureScript expertise?")
      [ ( Option
            "I can write and review simple scripts, services, applications or programs in PureScript."
        )
      , ( Option
            "I can write and review useful, production-ready code but it is a struggle."
        )
      , ( Option
            "I am productive writing PureScript and regularly review/write production-level code."
        )
      , (Option "I am an expert.")
      ]
  , SelectResponse (Question "When did you learn to program in PureScript?")
      [ (Option "During 2021 (0.14.x)")
      , (Option "During 2019 or 2020 (0.13.x)")
      , (Option "During 2017 or 2018 (0.11.x, 0.12.x)")
      , (Option "I'm still actively trying to learn PureScript.")
      , (Option "During 2015 or 2016 (0.7.x, 0.8.x, 0.9.x, 0.10.x)")
      ]
  , CheckSeveralResponse
      ( Question
          "Which operating systems do you use regularly for PureScript development?"
      )
      [ (Option "Linux")
      , (Option "Windows")
      , (Option "Windows Subsystem for Linux")
      , (Option "Mac OS")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "What tools do you most frequently use to compile PureScript code?"
      )
      [ (Option "Using the purescript Haskell library directly.")
      , (Option "purs")
      , (Option "purs-ide (auto-compilation via an editor)")
      , (Option "pscid (auto-compilation on the command line)")
      , (Option "spago")
      , (Option "pulp")
      ]
      (HasOther true)
  , CheckSeveralResponse
      (Question "How often do you use the following output targets?")
      [ (Option "JavaScript via purs")
      , (Option "CoreFn via purs")
      , (Option "Erlang via purerl")
      , (Option "Go via purescript-native")
      , (Option "C++ via purescript-native")
      , (Option "C via pure-c")
      , (Option "Nix via PureNix")
      , (Option "Python via purescript-python")
      , (Option "Scheme via purescm")
      ]
      (HasOther false)
  , CheckSeveralResponse
      (Question "Which PureScript backends would you like to see either developed more or created? Please only choose those that you believe you would personally use in the next year.")
      [ (Option "Java")
      , (Option "Kotlin")
      , (Option "Python")
      , (Option "Scala")
      , (Option "C")
      , (Option "Go")
      , (Option "Ocaml")
      , (Option "F#")
      , (Option "C#")
      , (Option "Swift")
      , (Option "Erlang")
      , (Option "Wasm")
      , (Option "Haskell")
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "What statement below best describes the way you iterate on PureScript code as you develop?"
      )
      [ ( Option
            "I periodically compile as I write PureScript code (via spago build, pulp build, etc.)."
        )
      , ( Option
            "I continuously compile (via spago watch, pulp watch, pscid, an IDE extension, etc.)"
        )
      , (Option "I check and test my work in the PureScript repl.")
      , (Option "I continuously verify results via a hot-reload mechanism.")
      , ( Option
            "I push to a CI/CD pipeline that builds a staging environment against which I iterate."
        )
      , (Option "I write pristine code and push it straight to production.")
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "What libraries or frameworks do you use for testing PureScript code?"
      )
      [ (Option "jest")
      , (Option "mocha")
      , (Option "spec")
      , (Option "benchotron")
      , (Option "test-unit")
      , (Option "quickcheck")
      , (Option "assert")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "What tools do you use for bundling code generated by the PureScript JS backend?"
      )
      [ (Option "purs bundle (directly, not via other tooling)")
      , (Option "spago")
      , (Option "webpack")
      , (Option "parcel")
      , (Option "esbuild")
      , (Option "I do not use the JS backend.")
      , (Option "I use the JS backend, but I do not use a bundler.")
      , (Option "pulp")
      ]
      (HasOther true)
  , CheckSeveralResponse
      (Question "What PureScript frontend frameworks do you regularly use?")
      [ (Option "halogen")
      , (Option "react-basic (classic and/or hooks)")
      , (Option "thermite")
      , (Option "react")
      , (Option "concur")
      , (Option "elmish (classic and/or hooks)")
      , (Option "spork")
      , (Option "flame")
      , (Option "deku")
      , (Option "jelly")
      , (Option "presto")
      , (Option "halogen-hooks")
      ]
      (HasOther true)
  , CheckSeveralResponse
      (Question "What PureScript backend frameworks do you regularly use?")
      [ (Option "httpure")
      , (Option "payload")
      , (Option "hyper")
      , (Option "express")
      ]
      (HasOther true)
  , FreeFormResponse (Question "What packages, if any, do you use via the FFI?")
  , CheckSeveralResponse
      ( Question
          "Which platforms or environments do you develop PureScript software for?"
      )
      [ (Option "Browsers")
      , (Option "Servers")
      , (Option "Mobile (Android, iOS)")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "Which version(s) of PureScript do you use for local development?"
      )
      [ (Option "A 0.15.x version")
      , (Option "A 0.14.x version")
      , (Option "A 0.13.x version")
      , (Option "A 0.12.x version or older")
      , (Option "Current main from GitHub")
      ]
      (HasOther true)
  , CheckSeveralResponse (Question "If you use a fork of the compiler, why?")
      [ (Option "I don't use a custom fork")
      , ( Option
            "For a particular language feature or set of language features I need"
        )
      , (Option "To help test the compiler and report bugs")
      , (Option "For testing in CI")
      , (Option "A library I use requires it")
      , (Option "A tool I use requires it")
      ]
      (HasOther true)
  , CheckSeveralResponse (Question "In which ways do you install PureScript?")
      [ (Option "via NPM (i.e. npm, yarn, pnpm)")
      , (Option "via Nix (i.e. easy-purescript-nix, purs-nix)")
      , (Option "via a Linux distro package")
      , (Option "via Homebrew")
      , (Option "psvm")
      , (Option "purescript-setup")
      , (Option "I download official tarballs from GitHub")
      , (Option "I build from source")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "Which editor or IDE setup do you use with PureScript code on a regular basis?"
      )
      [ (Option "Visual Studio Code (VS Code)")
      , (Option "Vi/Vim/other Vim derivative")
      , (Option "IntelliJ/WebStorm/other JetBrains IDE")
      , (Option "Emacs")
      , (Option "Sublime Text")
      , (Option "Atom")
      , (Option "Kakoune")
      ]
      (HasOther true)
  , CheckSeveralResponse (Question "How do you debug PureScript programs?")
      [ (Option "")
      , (Option "Via logs stored in a backend for review later on")
      , (Option "Via sourcemaps")
      , ( Option
            "Via browser tooling like Chrome or Firefox dev tools (not including sourcemaps)"
        )
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "To what extent would you like to see the following pull requests and issues having to do with _language changes_ expediently resolved?"
      )
      [ (Option "PR 4235: Visible type applications")
      , (Option "PR 3897: Local type synonyms")
      , (Option "PR 4345: Allow most leading and trailing delimiters")
      , (Option "PR 3824: Support deriving via")
      , (Option "PR 4390: Add compilersupport for deriving Debug type class")
      , (Option "PR 4097: Implement Typeable")
      , ( Option
            "Issue 3662: Consider changing Char to represent a code point rather than a UTF16 code unit"
        )
      , ( Option
            "Issue 314: Deprecate and eventually remove IsSymbol in favor of the Reflectable type class"
        )
      , (Option "Issue 4396: Data Type Qualification")
      , (Option "Issue 127: Rethinking data kinds and foreign import data")
      , (Option "Compilation changes:")
      , (Option "PR 4339: More aggressive dirty module checking")
      , (Option "PR 4407: Remove invalid entries from cachedb")
      , (Option "Issue 3493: Make the compiler package aware")
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "To what extent would you like to see the following pull requests and issues having to do with _compilation changes_ expediently resolved?"
      )
      [ (Option "PR 4339: More aggressive dirty module checking")
      , (Option "PR 4407: Remove invalid entries from cachedb")
      , (Option "Issue 3493: Make the compiler package aware")
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "To what extent would you like to see the following pull requests and issues having to do with _installation and usage_ expediently resolved?"
      )
      [ ( Option
            "Issue 4191: Make installation/deployment easier on non-Ubuntu Linux environments"
        )
      , ( Option
            "Issue 4106: The compiler integrates the repl runtime environment by default"
        )
      , (Option "Issue 1333: Collaborating on improving the REPL evaluator")
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "To what extent would you like to see the following pull requests and issues having to do with _compiler error reporting_ expediently resolved?"
      )
      [ (Option "PR 4421: Better row unification error messages")
      , (Option "PR 4190: Color compiler warnings and errors")
      , (Option "Issue 4143: Fold purescriptpsa into purs compile")
      , ( Option
            "Issue 4154: Show warning and error statistics at the end of compilations"
        )
      , ( Option
            "Issue 4153: Add strict flag to promote src/ warnings into errors (NOTE: PR 4156, blocked on Issue 3493)"
        )
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "To what extent would you like to see the following pull requests and issues having to do with _code generation_ expediently resolved?"
      )
      [ ( Option
            "PR 4284: Emitting value and type information for IDE/IDElike consumers"
        )
      , (Option "PR 4092: New command: purs codegen")
      , ( Option
            "Issue 4206: Proposal: Move nonJSspecific optimizations to the CoreFn optimization pass"
        )
      ]
      (HasOther false)
  , FreeFormResponse
      ( Question
          "If you had to create one issue on the PureScript issue tracker that does not exist yet, what would the title and a brief description be?"
      )
  , FreeFormResponse
      ( Question
          "What PureScript backends, if any, would you like to see improved in the next 12 months (ie JS, Erlang, Python, Go)? Why? Would you be comfortable contributing to their maintenance?"
      )
  , FreeFormResponse
      ( Question
          "What PureScript backends, if any, would you like to see implemented in the next 12 months (ie Scheme, Rust)? Why? Would you be comfortable contributing to the implementation?"
      )
  , CheckSeveralResponse
      ( Question
          "Which of the following activities do you find helpful or effective for learning PureScript or improving your PureScript skills?"
      )
      [ ( Option
            "Reading books or other written material geared towards learning PureScript"
        )
      , ( Option
            "Watching videos, streams, etc. geared towards learning PureScript"
        )
      , ( Option
            "Attending an organized training session or course (in person or virtual)"
        )
      , ( Option
            "Doing PureScript coding exercises or challenges created to help learn PureScript"
        )
      , ( Option
            "Building a non-trivial project in PureScript or contributing to an open source project"
        )
      , ( Option
            "Asking questions in PureScript community channels (Discord, Discourse)"
        )
      , ( Option
            "Reading through open source PureScript libraries or applications"
        )
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "Which learning resources did you use when learning PureScript?"
      )
      [ ( Option
            "Jordan's PureScript Reference"
        )
      , ( Option
            "The PureScript Book"
        )
      , ( Option
            "Functional Programming Made Easier"
        )
      , ( Option
            "Framework documentation like the Halogen Guide"
        )
      ]
      (HasOther true)
  , CheckSeveralResponse (Question "Why did you first start using PureScript?")
      [ ( Option
            "I am/was using Elm and found PureScript a better option for my use case"
        )
      , ( Option
            "I am/was using Idris and found PureScript a better option for my use case"
        )
      , ( Option
            "I am/was using Haskell and found PureScript a better option for my use case"
        )
      , ( Option
            "I am/was a JS/TS developer and found PureScript a better option for my use case"
        )
      , ( Option
            "The tooling is better than other FP or compile-to-JS languages"
        )
      , ( Option
            "The libraries are better than other FP or compile-to-JS languages"
        )
      , (Option "PureScript has fewer features than other similar languages")
      , (Option "PureScript has more features than other similar languages")
      , (Option "PureScript is used at my workplace, so I had to learn it")
      , (Option "I was curious")
      , (Option "A friend recommended it to me")
      ]
      (HasOther true)
  , SelectResponse
      (Question "How do you feel about mentoring in the PureScript community?")
      [ ( Option
            "If volunteer mentoring existed, I would use it, but I would not pay for mentoring."
        )
      , (Option "I would pay for mentoring if it existed.")
      , (Option "I would like to be a mentor.")
      , (Option "I would like both mentor others and be mentored.")
      , (Option "Mentoring does not interest me.")
      ]
  , CheckSeveralResponse
      ( Question
          "In which of the following ways have you participated in the PureScript community in the last 6 months?"
      )
      [ ( Option
            "I have produced informational content about PureScript (e.g., blogged, live streamed, made a YouTube video, presented at a conference/meetup, etc.)"
        )
      , ( Option
            "On several occasions I have consumed informational content about PureScript (e.g., blogs, live streams, YouTube videos, etc.)"
        )
      , ( Option
            "I have participated in conversations on the PureScript Discord."
        )
      , ( Option
            "I have participated in conversations on the PureScript Discourse."
        )
      , ( Option
            "On several occasions I have read comments about PureScript content on news sites (e.g., Hacker News, reddit.com/r/purescript, lobste.rs/t/purescript, etc.)."
        )
      , ( Option
            "On several occasions I have participated in conversations about PureScript on social media (Twitter, etc.)."
        )
      , ( Option
            "I have attended a PureScript meetup or conference (virtual or in-person)."
        )
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "Roughly how often do you contribute to PureScript (language, ecosystem, community, etc)?"
      )
      [ ( Option
            "Discuss the PureScript project an official community channel (Discord, Discourse)"
        )
      , ( Option
            "Open or comment on an issue on any repo in the PureScript GitHub organization"
        )
      , ( Option
            "Open or comment on an issue on any repo in another PureScript GitHub organization (web, contrib, node)"
        )
      , (Option "Contribute code to the PureScript compiler (including tests)")
      , ( Option
            "Contribute code to any project other than the compiler in the PureScript organization, including the web, contrib, and node organizations."
        )
      , ( Option
            "Contribute non-code changes (documentation, etc.) to any project in the PureScript organization, including the web, contrib, and node organizations."
        )
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "How often have you felt explicitly welcome in the PureScript community?"
      )
      [ ( Option
            "Official PureScript community forums or chats (the PureScript Discourse or the PureScript Discord)"
        )
      , ( Option
            "Unofficial PureScript community forums or chats (e.g. reddit.com/r/purescript, Hacker News, the #purescript channel on the FP Slack, etc.)"
        )
      , ( Option
            "Attending a conference where PureScript is discussed or presented"
        )
      , ( Option
            "Attending a meetup or local community event where PureScript is discussed or presented"
        )
      , ( Option
            "Discussion (issues, pull requests, etc.) on a repository inside the PureScript GitHub organization"
        )
      , ( Option
            "Discussion (issues, pull requests, etc.) on a repository outside of the PureScript GitHub organization"
        )
      ]
      (HasOther false)
  , FreeFormResponse
      ( Question
          "If you indicated that you did not feel welcome in the PureScript community, are there any details about your experience that you would like to share with us?"
      )
  , CheckSeveralResponse
      ( Question
          "Through which mechanisms, if any, would you be most likely to contribute funding to the PureScript project?"
      )
      [ (Option "Books")
      , (Option "Merchandise")
      , (Option "Crowdfunding (recurring) - i.e. Open Collective")
      , (Option "Donation button")
      , (Option "Crowdfunding (one-time) i.e. Kickstarter")
      , (Option "Open source sponsorship")
      , (Option "Company donation for time/moral license")
      ]
      (HasOther true)
  , CheckSeveralResponse
      (Question "How should the PureScript project's funding be used?")
      [ ( Option
            "To fund mission-critical infrastructure like Pursuit and important community endeavors like this survey (this is the status quo)"
        )
      , ( Option
            "To start and maintain a foundation, similar to The Haskell Foundation or The Rust Foundation."
        )
      , ( Option
            "For a bounty program where the community agrees upon bounty-worthy issues and pays those who complete them."
        )
      , (Option "To fund a conference and/or meetups.")
      ]
      (HasOther true)
  , SelectResponse
      ( Question
          "To what extent is PureScript currently being used by your company?"
      )
      [ ( Option
            "My company uses PureScript for a large portion of production projects."
        )
      , ( Option
            "My company has actively experimented with PureScript, but does not currently use it."
        )
      , ( Option
            "My company has seriously considered, but not experimented with, using PureScript."
        )
      , ( Option
            "My company has not seriously considered PureScript for any use."
        )
      , ( Option
            "I don't work for a company or my company does not develop software of any kind."
        )
      , ( Option
            "My company uses PureScript only for non-production projects (e.g., tooling)."
        )
      , ( Option
            "I am unsure whether my company has considered using or currently uses PureScript."
        )
      , ( Option
            "My company uses PureScript for a small portion of production projects."
        )
      ]
  , SelectResponse
      ( Question
          "Approximately how many total developers does your company employ?"
      )
      [ (Option "Over 10,000")
      , (Option "11-49")
      , (Option "500-1,000")
      , (Option "Under 10")
      , (Option "100-500")
      , (Option "50-99")
      , (Option "1,000-10,000")
      ]
  , SelectResponse
      ( Question
          "Is your company planning on hiring PureScript developers in the next year?"
      )
      [ (Option "No"), (Option "Yes"), (Option "Not sure") ]
  , CheckSeveralResponse
      ( Question
          "If your company uses PureScript at work, rate how much you agree or disagree with the following statements."
      )
      [ ( Option
            "We're already comfortable with other Haskell-family languages (Haskell, Idris, etc)"
        )
      , ( Option
            "A PureScript evangelist or guru works or worked at my workplace and evangelized the language"
        )
      , ( Option
            "PureScript provides specific features we need, and which other languages don't have"
        )
      , (Option "We find it enjoyable or fun to program in PureScript")
      , (Option "PureScript is our default choice for starting new projects")
      , (Option "We find it easy to prototype with")
      , (Option "We must interact with existing PureScript code")
      ]
      (HasOther false)
  , FreeFormResponse
      ( Question
          "Are there any additional reasons why your team uses PureScript at work?"
      )
  , CheckSeveralResponse
      ( Question
          "Please rate your agreement with the following statements regarding your team's experience using PureScript at work."
      )
      [ (Option "Using PureScript has helped us achieve our goals")
      , (Option "Adopting PureScript has been challenging")
      , (Option "Overall, adopting PureScript has slowed down our team")
      , (Option "Using PureScript has been worth the cost of adoption")
      , (Option "We're likely to use PureScript again in the future")
      ]
      (HasOther false)
  , FreeFormResponse
      (Question "What about your usage of PureScript has been challenging?")
  , CheckSeveralResponse
      (Question "What are your biggest worries for the future of PureScript?")
      [ (Option "Not enough usage in industry")
      , (Option "Not enough support from big companies")
      , (Option "Not enough open source contributions to the ecosystem")
      , (Option "Doesn't add a specific feature I want")
      , (Option "PureScript doesn't evolve quickly enough")
      , (Option "Instability of the language")
      , (Option "Superseded by an alternative")
      , (Option "Becomes too complex")
      , ( Option
            "Tools and documentation are not accessible enough (e.g., due to language or incompatibility with screen readers)"
        )
      , ( Option
            "Developers/maintainers of the language are not properly supported"
        )
      , (Option "I'm not worried")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "Please rate your agreement with the following statements about PureScript."
      )
      [ ( Option
            "PureScript provides a real benefit over other programming languages"
        )
      , ( Option
            "PureScript is significantly more complicated to program in than other programming languages"
        )
      , ( Option
            "PureScript requires significantly more effort to learn than other programming languages"
        )
      , ( Option
            "PureScript code tends to contain significantly fewer bugs than equivalent code written in another programming language"
        )
      , (Option "PureScript is risky to use in production")
      , (Option "PureScript makes me more productive")
      , (Option "PureScript is fun to use")
      ]
      (HasOther false)
  , FreeFormResponse
      ( Question
          "Any further comments related to these statements about PureScript?"
      )
  , CheckSeveralResponse
      ( Question
          "In your opinion, how do you find the following aspects of PureScript?"
      )
      [ (Option "Compile times")
      , (Option "Bundle size")
      , (Option "Runtime memory usage")
      , (Option "Release frequency of compiler and core libraries")
      , (Option "Bugs in the compiler")
      , (Option "IDE experience")
      , (Option "Compiler error messages")
      , (Option "Debugging experience")
      , (Option "Available tools and support")
      , (Option "Backend development")
      , (Option "Web development")
      , (Option "Library documentation")
      , (Option "Bundle splitting")
      , (Option "Ease of installation and starting new projects")
      , (Option "Language documentation")
      , (Option "Stability of the language and compiler")
      ]
      (HasOther false)
  , FreeFormResponse
      (Question "Any further comments about these aspects of PureScript?")
  , CheckSeveralResponse
      ( Question
          "In your opinion, how do you find the following PureScript tools and services?"
      )
      [ (Option "Try PureScript")
      , (Option "Pursuit")
      , (Option "Pulp")
      , (Option "Spago")
      , (Option "PureScript IDE (language server)")
      , (Option "PureScript Installer")
      ]
      (HasOther false)
  , FreeFormResponse
      ( Question
          "Any further comments about these PureScript tools and services?"
      )
  , CheckSeveralResponse
      ( Question
          "Do you agree with the following statements on PureScript employment?"
      )
      [ ( Option
            "It is easy for qualified applicants to find jobs which use PureScript for the majority of programming"
        )
      , (Option "Existing PureScript jobs are attractive")
      , ( Option
            "Learning PureScript provides me with skills that employers seek"
        )
      , ( Option
            "I feel qualified to apply for at least some advertised PureScript jobs"
        )
      ]
      (HasOther false)
  , SelectResponse
      ( Question
          "Do you consider yourself a member of a group which is underrepresented or marginalized in technology?"
      )
      [ (Option "No")
      , (Option "neither agree nor disagree")
      , (Option "Yes")
      , (Option "I prefer not to say")
      ]
  , CheckSeveralResponse
      ( Question
          "Which of the following underrepresented or marginalized groups in technology do you consider yourself a part of?"
      )
      [ (Option "Cultural beliefs")
      , ( Option
            "Disabled or person with disability (including physical, mental, and other)"
        )
      , (Option "Educational background")
      , (Option "Language")
      , (Option "Lesbian, gay, bisexual, queer or otherwise non-heterosexual")
      , (Option "Non-binary gender")
      , (Option "Older or younger than the average developers I know")
      , (Option "Political beliefs")
      , (Option "Racial or ethnic minority")
      , (Option "Religious beliefs")
      , (Option "Trans")
      , (Option "Woman or perceived as a woman")
      ]
      (HasOther true)
  , SelectResponse
      ( Question
          "Do you feel that belonging to an underrepresented or marginalized group in technology makes it difficult for you to participate in the PureScript community?"
      )
      [ (Option "Never"), (Option "Often"), (Option "Sometimes") ]
  , FreeFormResponse
      ( Question
          "Have you contributed to the PureScript compiler or ecosystem? If so, how and what motivated you to make that contribution? If not, why not?"
      )
  , SelectResponse (Question "Do you write or design software in your work?")
      [ (Option "No")
      , (Option "Never")
      , (Option "I primarily manage others who do")
      , ( Option
            "Yes, primarily as an individual contributor (i.e., non-manager)"
        )
      ]
  , SelectResponse
      ( Question
          "How long have you been programming (in any language, for any reason)?"
      )
      [ (Option "No")
      , (Option "Never")
      , (Option "< 10 years")
      , (Option "< 5 years")
      , (Option "< 1 year")
      , (Option ">= 10 years")
      , (Option "< 3 years")
      ]
  , SelectResponse
      (Question "How long have you worked in software professionally?")
      [ ( Option
            "Yes, primarily as an individual contributor (i.e., non-manager)"
        )
      , (Option "< 10 years")
      , (Option "I do not work professionally in software")
      , (Option "< 5 years")
      , (Option "I am currently a student")
      , (Option "< 1 year")
      , (Option ">= 10 years")
      , (Option "< 3 years")
      ]
  , CheckSeveralResponse
      ( Question
          "Which categories best describes the tech domain(s) you currently write or design software in?"
      )
      [ (Option "Audio programming")
      , (Option "Blockchain")
      , (Option "Cloud computing applications")
      , (Option "Cloud computing infrastructure or utilities")
      , (Option "Computer graphics")
      , (Option "Data science")
      , (Option "Distributed systems")
      , (Option "Embedded devices (with operating systems)")
      , (Option "Embedded devices (bare metal)")
      , (Option "Game development")
      , (Option "Frontend web development")
      , (Option "HPC (High-performance computing)")
      , (Option "IoT (Internet of Things)")
      , (Option "Machine learning")
      , (Option "Computer networking")
      , ( Option
            "Programming languages and related tools (including compilers, IDEs, standard libraries, etc.)"
        )
      , (Option "Robotics")
      , (Option "Computer security")
      , (Option "Scientific and/or numeric computing")
      , (Option "Simulation")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "What programming languages were you fluent in before starting with PureScript"
      )
      [ (Option "Agda")
      , (Option "C")
      , (Option "C++")
      , (Option "C#")
      , (Option "Clojure")
      , (Option "COBOL")
      , (Option "CoffeeScript")
      , (Option "Coq")
      , (Option "D")
      , (Option "Dart")
      , (Option "Elixir")
      , (Option "Elm")
      , (Option "Emacs Lisp")
      , (Option "Erlang")
      , (Option "F#")
      , (Option "F*")
      , (Option "FAUST")
      , (Option "Fortran")
      , (Option "Go")
      , (Option "Groovy")
      , (Option "Haskell")
      , (Option "Idris")
      , (Option "Java")
      , (Option "JavaScript")
      , (Option "Julia")
      , (Option "Kotlin")
      , (Option "Lean")
      , (Option "Lua")
      , (Option "MATLAB")
      , (Option "Nix")
      , (Option "Objective-C")
      , (Option "OCaml")
      , (Option "OpenCL")
      , (Option "Pascal")
      , (Option "Perl")
      , (Option "Processing")
      , (Option "Prolog")
      , (Option "Python")
      , (Option "Racket")
      , (Option "Reason")
      , (Option "Ruby")
      , (Option "Rust")
      , (Option "Scala")
      , (Option "Scheme")
      , (Option "Solidity")
      , (Option "SuperCollider")
      , (Option "Swift")
      , (Option "TeX")
      , (Option "TypeScript")
      , (Option "Vim script")
      , (Option "Zig")
      ]
      (HasOther true)
  , ChooseACountryResponse (Question "Where do you live?")
  , CheckSeveralResponse
      ( Question
          "In what ways are you comfortable communicating about technical topics in English?"
      )
      [ ( Option
            "I feel comfortable and capable of having a spoken technical conversation in English"
        )
      , ( Option
            "I feel comfortable and capable of having a written technical conversation in English"
        )
      , ( Option
            "I feel comfortable and capable of reading technical documentation in English"
        )
      , ( Option
            "I feel comfortable and capable of consuming a technical talk (e.g., at a conference or meetup) in English"
        )
      , ( Option
            "I feel comfortable and capable of consuming a written technical educational material (e.g., technical books, blog posts, etc.) in English"
        )
      ]
      (HasOther false)
  , CheckSeveralResponse
      ( Question
          "What is/are your preferred language(s) for technical communication?"
      )
      [ (Option "Chinese")
      , (Option "Spanish")
      , (Option "English")
      , (Option "Hindi")
      , (Option "Bengali")
      , (Option "Persian")
      , (Option "Portuguese")
      , (Option "Russian")
      , (Option "Japanese")
      , (Option "Turkish")
      , (Option "Korean")
      , (Option "French")
      , (Option "German")
      , (Option "Italian")
      ]
      (HasOther true)
  , CheckSeveralResponse
      ( Question
          "What is/are your preferred language(s) for day-to-day communication?"
      )
      [ (Option "Chinese")
      , (Option "Spanish")
      , (Option "English")
      , (Option "Hindi")
      , (Option "Bengali")
      , (Option "Persian")
      , (Option "Portuguese")
      , (Option "Russian")
      , (Option "Japanese")
      , (Option "Turkish")
      , (Option "Korean")
      , (Option "French")
      , (Option "German")
      , (Option "Italian")
      ]
      (HasOther true)
  , FreeFormResponse
      (Question "Is there anything else you'd like to share with us?")
  ]
