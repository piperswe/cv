#import "@preview/pigmentpedia:0.3.3": pantone

#let american = false

#set document(title: "Piper McCorkle CV")
#set page(
  paper: if american { "us-letter" } else { "a4" },
  margin: if american { (x: 0.5in, y: 0.5in) } else { (x: 1cm, y: 1cm) },
)

#set text(
  font: "Inter",
  size: 10pt,
)

#let secondary = pantone.c._220

// Set link color
#show link: set text(fill: secondary)

// Helper function for OSM relation links
#let osmrelationhref(id, text) = link("https://www.openstreetmap.org/relation/" + id)[#text]

// Calculate years of experience (equivalent to yoe.lua)
#let yoe = {
  let now = datetime.today()
  let current-year = now.year() + (now.month() - 1) / 12.0
  let start-casual = 2007 + 11.0 / 12.0 // dec 2007
  let start-professional = 2017 + 6.0 / 12.0 // jul 2017
  let start-fulltime = 2019 + 5.0 / 12.0 // jun 2019

  (
    casual: calc.floor(current-year - start-casual),
    professional: calc.floor(current-year - start-professional),
    fullTime: calc.floor(current-year - start-fulltime),
  )
}

// Section heading style
#show heading.where(level: 1): it => {
  set text(fill: secondary, size: 12pt, weight: "regular")
  block(breakable: false)[
    #smallcaps(it.body)
    #v(-8pt)
    #line(length: 100%, stroke: 0.5pt + secondary)
    #v(2pt)
  ]
}

// Subsection heading style
#show heading.where(level: 2): it => {
  set text(size: 11pt, weight: "bold")
  block(breakable: false)[
    #v(-2pt)
    #it
    #v(-2pt)
  ]
}

#let position(title, years, organization, location) = [
  == #title #h(1fr) #years
  #text(style: "italic")[#organization #h(1fr) #location]
]

// Update this to the job title you're applying for
#let seeking-position = "Software Engineer"

// Header
#align(center)[
  #grid(
    columns: (1fr, 2fr, 1fr),
    align: (left + bottom, center + horizon, right + bottom),
    [
      #text(size: 10pt)[
        #link("mailto:contact@piperswe.me")[contact\@piperswe.me] \
        #link("tel:+15084938615")[(508) 493-8615]
      ]
    ],
    [
      #text(size: 24pt, font: "Calluna", weight: "bold")[Piper McCorkle] \
      #v(-5pt)
      #text(fill: secondary, size: 14pt)[#seeking-position]
    ],
    [
      #text(size: 10pt)[
        #link("https://piperswe.me")[piperswe.me] \
        #link("https://www.linkedin.com/in/link/pmcswe")[linkedin.com/in/pswe]
      ]
    ]
  )
  #v(-2pt)
  #line(length: 100%, stroke: 0.5pt + secondary)
]

#v(-4pt)

#align(center)[
  #block(width: 95%)[
    #par(justify: true)[
      Generalist software engineer with #str(yoe.casual)+ years of casual software development experience, #str(yoe.professional) years of professional software development experience, #str(yoe.fullTime) years of full-time software engineering experience, and some experience with early stage (pre-seed) startups. Seeking full-time software engineering work in #osmrelationhref("113314", "Austin, Texas").
    ]
  ]


  #block(width: 80%)[
    #par(leading: .5em)[
      #emph[
        Curious about something? If it's #text(fill: secondary)[this color], it's probably a link to a related webpage - no need to go searching around! \
        Extra curious? Feel free to ask me about anything here, I'm happy to talk about any of it.
      ]
    ]
  ]
]

#v(-4pt)

= Full-Time Experience

#position(
  [Systems Engineer, #link("https://www.cloudflare.com/application-services/products/load-balancing/")[Load Balancing] - Health & Analytics],
  [Sept 2025 --- Present],
  link("https://www.cloudflare.com/")[Cloudflare],
  [#osmrelationhref("113314", "Austin, TX, USA")\; Hybrid with distributed team]
)

- Maintained Go services (HTTP/gRPC servers, Kafka consumers, etc.) for the #link("https://www.cloudflare.com/application-services/products/load-balancing/")[Load Balancing] product's health and analytics pipeline
- Deployed said Go services to Kubernetes and the Cloudflare edge, rolling out deployments across thousands of machines and monitoring for impact

#position(
  [Systems Engineer, #link("https://www.cloudflare.com/application-services/products/waiting-room/")[Waiting Room] & #link("https://developers.cloudflare.com/health-checks/")[Health Checks]],
  [Nov 2021 --- Sept 2025],
  link("https://www.cloudflare.com/")[Cloudflare],
  [#osmrelationhref("113314", "Austin, TX, USA")\; Hybrid with distributed team]
)

- Maintained Go services (HTTP/gRPC servers, Kafka consumers, etc.) for #link("https://www.cloudflare.com/application-services/products/waiting-room/")[Waiting Room] and #link("https://developers.cloudflare.com/health-checks/")[Health Checks] products
- Deployed said Go services to Kubernetes and the Cloudflare edge, rolling out deployments across thousands of machines and monitoring for impact
- Maintained JavaScript and TypeScript services, built on and dogfooding #link("https://workers.cloudflare.com/")[Cloudflare Workers] and #link("https://developers.cloudflare.com/workers/runtime-apis/durable-objects")[Cloudflare Durable Objects] as a complex globally distributed system, for the #link("https://www.cloudflare.com/waiting-room/")[Waiting Room] product
- Submitted changes to Go, Rust, JavaScript, TypeScript, and Lua codebases maintained by other teams, for the purpose of integration with my team's products
- Built integration between Waiting Room and Cloudflare's #link("https://developers.cloudflare.com/ruleset-engine/")[Edge Rules Engine], a multi-service product with Go, Rust, and Lua components, to help satisfy one of the largest asks from customers and secure a large sales contract
- Collaborated remotely with teams in America and Europe alike - with most of my team being in the San Francisco Bay Area and many infrastructure teams (e.g. Edge Rules Engine) being in London
- Built parts of an analytics pipeline, channelling data from global Waiting Room requests through multiple Cloudflare Workers and Durable Objects, serializing data to #link("https://capnproto.org/")[Cap'n Proto] messages, and passing those messages through Kafka to a #link("https://clickhouse.com/")[ClickHouse] inserter.
- Wrote the technical sections of multiple Cloudflare Blog posts about the details of inter-product integrations @olache_introducing_2023@wyatt_banish_2025
- Optimized CI for a service, reducing CI runtime from 30 minutes to 10 minutes
- Deployed a #link("https://www.fedramp.gov/archive/2017-11-16-understanding-baselines-and-impact-levels/")[FedRAMP High]-compliant version of the Waiting Room product on-time, despite setbacks from upstream dependencies

#position(
  [Software Engineer],
  [Oct 2019 --- Nov 2021],
  link("https://www.ladderlife.com/")[Ladder],
  [#osmrelationhref("1544955", "Palo Alto, CA, USA")\; Remote during COVID-19]
)

- Deployed microservices written in Clojure/ClojureScript on Kubernetes, using Kafka as a message queue
- Built user-facing experiments which, in aggregate, nearly doubled overall conversion rates
- Worked with compliance department to ensure compliance with all applicable laws
- Built and refined internal engineering tools to increase fellow engineers' productivity
- Mentored new hires, bringing them up to speed well ahead of schedule

// #position(
//   [Software Engineer],
//   [Jun 2019 -- Oct 2019],
//   link("https://zeusliving.com/")[Zeus],
//   osmrelationhref("111968", "San Francisco, CA, USA")
// )

= Technical Skills/Keywords

#emph[Listed in no particular order.]

#table(
  columns: (auto, auto, 1fr),
  stroke: none,
  align: (left, left, left),

  [*Programming*], [], [
    #link("https://www.typescriptlang.org/")[TypeScript],
    #link("https://en.wikipedia.org/wiki/JavaScript")[JavaScript] (#link("https://www.ecma-international.org/publications-and-standards/standards/ecma-262/")[ECMAScript], ES6),
    #link("https://golang.org/")[Golang],
    #link("https://www.rust-lang.org/")[Rust],
    #link("https://clojure.org/")[Clojure] (#link("https://clojurescript.org/")[ClojureScript]),
    #link("https://reactjs.org/")[React] (#link("https://reactnative.dev/")[React Native]),
    #link("https://svelte.dev/")[Svelte] (#link("https://kit.svelte.dev/")[SvelteKit]),
    #link("https://nodejs.org/en/")[Node.js],
    #link("https://en.wikipedia.org/wiki/SQL")[SQL],
    #link("https://rubyonrails.org/")[Ruby on Rails],
    #link("https://www.lua.org/")[Lua],
    #link("https://buck.build/")[Buck],
    #link("https://bazel.build/")[Bazel]
  ],

  [*AI & LLMs*], [], [
    #link("https://www.anthropic.com/claude-code")[Anthropic Claude Code],
    #link("https://opencode.ai/")[OpenCode],
    #link("https://windsurf.com/")[Windsurf],
    #link("https://www.anthropic.com/claude")[Anthropic Claude],
    #link("https://cline.bot/")[Cline],
    #link("https://openrouter.ai/")[OpenRouter]
  ],

  [*Data/Databases*], [], [
    #link("https://www.postgresql.org/")[PostgreSQL],
    #link("https://www.datomic.com/")[Datomic],
    #link("https://clickhouse.com/")[ClickHouse],
    #link("https://cloud.google.com/bigquery")[BigQuery],
    #link("https://kafka.apache.org/")[Kafka],
    #link("https://prometheus.io/")[Prometheus],
    #link("https://grafana.com/")[Grafana]
  ],

  [*DevOps/Infrastructure*], [], [
    #link("https://nixos.org/")[NixOS] (Nix, nixpkgs\; I'm a big fan of Nix, where it makes sense),
    #link("https://www.cloudflare.com/")[Cloudflare]
    (#link("https://workers.cloudflare.com/")[Cloudflare Workers],
      #link("https://www.cloudflare.com/zero-trust/products/access/")[Cloudflare Access],
      #link("https://www.cloudflare.com/products/tunnel/")[Cloudflare Tunnel],
      basically everything else - Cloudflare is all-in on dogfooding),
    #link("https://kubernetes.io/")[Kubernetes] (#link("https://k3s.io/")[k3s]),
    #link("https://www.terraform.io/")[Terraform],
    #link("https://www.debian.org/")[Debian GNU/Linux],
    #link("https://ubuntu.com/")[Ubuntu],
    #link("https://www.alpinelinux.org/")[Alpine Linux],
    #link("https://www.proxmox.com/en/")[Proxmox VE],
    #link("https://aws.amazon.com/")[Amazon Web Services] (AWS),
    #link("https://cloud.google.com/")[Google Cloud Platform] (GCP),
    #link("https://www.jetbrains.com/teamcity/")[JetBrains TeamCity],
    #link("https://buildkite.com/")[Buildkite],
    #link("https://github.com/features/actions")[GitHub Actions],
    #link("https://about.gitlab.com/")[GitLab CI],
    #link("https://fly.io/")[Fly.io],
    #link("https://railway.app/")[Railway]
  ],

  [*Collaboration Tools*], [], [
    #link("https://slack.com/")[Slack],
    #link("https://workspace.google.com/")[Google Workspace]
    (#link("https://workspace.google.com/products/chat/")[Google Chat],
      #link("https://workspace.google.com/products/meet/")[Google Meet],
      #link("https://workspace.google.com/products/drive/")[Google Drive],
      #link("https://workspace.google.com/products/docs/")[Google Docs],
      #link("https://workspace.google.com/products/sheets/")[Google Sheets],
      #link("https://workspace.google.com/products/slides/")[Google Slides]),
    #link("https://zoom.us/")[Zoom],
    #link("https://github.com/")[GitHub],
    #link("https://bitbucket.org/")[Bitbucket],
    #link("https://about.gitlab.com/")[GitLab],
    #link("https://www.atlassian.com/software/jira")[Atlassian Jira],
    #link("https://www.atlassian.com/software/confluence")[Atlassian Confluence],
    #link("https://www.notion.so/")[Notion]
  ],

  [*Networking*], [], [
    #link("https://en.wikipedia.org/wiki/Border_Gateway_Protocol")[BGP] (former owner of AS394894),
    #link("https://en.wikipedia.org/wiki/IPv4")[IPv4],
    #link("https://en.wikipedia.org/wiki/IPv6")[IPv6],
    #link("https://mikrotik.com/")[Mikrotik] #link("https://mikrotik.com/software")[RouterOS],
    #link("https://ui.com/")[Ubiquiti] #link("https://ui.com/consoles")[UniFi],
    #link("https://vyos.io/")[VyOS],
    Linux #link("https://www.netfilter.org/")[iptables]
  ],

  [*Accounting/HR*], [], [
    #link("https://quickbooks.intuit.com/")[QuickBooks] (QuickBooks Online, #link("https://quickbooks.intuit.com/desktop/pro/")[QuickBooks Desktop]),
    #link("https://www.xero.com/us/")[Xero],
    #link("https://gusto.com/")[Gusto],
    #link("https://www.ledger-cli.org/")[ledger] (#link("https://hledger.org/")[hledger]),
    #link("https://www.gnucash.org/")[GnuCash],
    #link("https://carta.com/")[Carta] (both managing as a business and using as an employee)
  ],

  [*Design/CAD*], [], [
    #link("https://www.adobe.com/products/photoshop.html")[Adobe Photoshop],
    #link("https://www.adobe.com/products/illustrator.html")[Adobe Illustrator],
    #link("https://www.adobe.com/products/indesign.html")[Adobe InDesign],
    #link("https://affinity.serif.com/en-us/photo/")[Affinity Photo],
    #link("https://affinity.serif.com/en-us/designer/")[Affinity Designer],
    #link("https://affinity.serif.com/en-us/publisher/")[Affinity Publisher],
    #link("https://www.figma.com/")[Figma],
    #link("https://www.autodesk.com/products/fusion-360/overview")[Autodesk Fusion 360],
    #link("https://www.kicad.org/")[KiCAD],
    #link("https://www.latex-project.org/")[LaTeX],
    #link("https://typst.app/")[Typst]
  ],

  [*Amateur Radio*], [], [
    Technician license, USA callsign #link("https://www.qrz.com/db/K5PMC")[K5PMC]
  ],

  [*Compliance*], [], [
    #link("https://www.fedramp.gov/archive/2017-11-16-understanding-baselines-and-impact-levels/")[FedRAMP High]
  ]
)

= Entrepreneurship and Part-Time Experience

#position(
  [Founder, Engineer],
  [2017 --- 2023],
  [#link("https://lutris.engineering/")[Lutris] (formerly Conduit Implementations)],
  osmrelationhref("6586770", "Brenham, TX, USA")
)

- Founded the company, incorporated with the state of Texas
- Operated an Internet BGP autonomous system on Mikrotik RouterOS
- Operated virtualization infrastructure on Proxmox
- Managed both bare metal and cloud Kubernetes clusters
- Undertook many contract projects for an assortment of clients, from embedded AVR programming with C for industrial machinery to full stack web development with React and Node.js for court data analysis

#position(
  [Consultant],
  [2021],
  link("https://www.hydrotek.io/")[Hydrotek],
  [#osmrelationhref("253556", "San Antonio, TX, USA")\; Mostly Remote]
)

- Kick-started the mobile React Native app development project

= Volunteer Experience

#position(
  [President of the Board, Treasurer],
  [2021 --- 2022],
  [fleetbase (defunct)],
  osmrelationhref("6586770", "Brenham, TX, USA")
)

- Managed the day-to-day activities of the organization
- Completed bookkeeping, accounts receivable, accounts payable, and other accounting tasks
- Organized club activities

= Education

#position(
  [Part-Time Student, BSc (Hons) Mathematics],
  [2026 -- Present],
  link("https://www.open.ac.uk/")[Open University],
  [Remote]
)

#cite(label("mccorkle_how_2021"), form: none)
#bibliography("zotero.bib", title: "Selected Publications and Other Writing", style: "association-for-computing-machinery")
