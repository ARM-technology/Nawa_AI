# Nawa AI — Privacy Policy, Terms of Use, and AI Safety Policy

**Effective date:** October 22, 2026  
**Last updated:** October 22, 2026

> **Publisher notice — complete before publication:** Replace every bracketed placeholder, verify every factual statement against the released application and all third-party SDKs, and obtain legal review appropriate to your markets. This document is a practical template, not legal advice and not a guarantee against claims, regulatory action, or Google Play rejection. Do not publish statements about local-only processing unless you have tested and verified the actual app, including backup settings, network calls, model downloads, website retrieval, reporting, and third-party libraries.

**App name:** Nawa AI  
**Developer / data controller:** [Insert the developer’s legal name or registered business name]  
**Privacy and support contact:** [Insert an active email address controlled by the developer]  
**Public policy URL:** [Insert the permanent public HTTPS URL where this document will be hosted]  
**Intended audience / minimum age:** 18+ (change this if the product’s actual target audience differs, and align it with the app’s design, age rating, and Google Play declarations).

---

# Part I — Privacy Policy

## 1. Overview

Nawa AI is a mobile application that provides text conversations with an on-device language model, customization of the assistant’s role and instructions, local conversation history, and an optional feature for retrieving content from website URLs selected by the user.

The app is designed so that ordinary prompts, model responses, custom persona instructions, and saved conversations are processed and stored on the user’s device. Website retrieval and initial model downloads require an internet connection. Certain network requests necessarily disclose ordinary connection information to the relevant website or download host. If a reporting feature allows a user to send a report to the developer, the app must explain what will be sent and obtain the user’s clear consent before transmission.

The statements in this policy apply only to the released app’s actual behavior. If the app, an SDK, the operating system, a backup service, or a third-party integration processes data differently, this policy and the Google Play Data safety disclosures must be updated before release or before the change takes effect.

## 2. Information the App Processes

### 2.1 Prompts, responses, persona instructions, and conversation history

The on-device language model processes the text entered by the user and generates responses on the device. Conversation history and custom assistant instructions may be stored in the app’s local storage so that the user can return to them later.

Under the intended architecture, ordinary conversation text is not sent to Nawa AI’s developer or to a remote AI inference service. The developer does not use ordinary local conversations to train a model. These statements must not be used unless the code, dependencies, network behavior, and backup configuration have been reviewed and verified.

The app may store this information in the application’s private storage. The developer must configure and test Android backup and device-transfer behavior before promising that saved conversations can never leave the device. Users should avoid entering secrets or highly sensitive information unless they understand the app’s actual data flows and device-level risks.

### 2.2 Model downloads and updates

When the user downloads the AI model or an update, the app contacts the model host or content-delivery service. That service may receive ordinary connection data such as the device’s IP address, the requested file, request time, and standard technical metadata, according to its own practices and policies. The model download should not require sending the user’s conversation text.

### 2.3 Optional website retrieval

Website retrieval requires an internet connection. When the user asks the app to retrieve a URL, the app requests content from that website. The website operator, hosting provider, or intermediaries may receive the user’s IP address and normal request metadata and may log them under their own policies.

The app may extract readable page content and pass that content to the on-device model to help prepare an answer. The app should not transmit the user’s full private conversation to a website merely because the user requests retrieval. The developer cannot control external sites’ content, accuracy, security, logging, or privacy practices.

The app must validate URLs, handle redirects safely, restrict access to loopback, private, link-local, and internal network destinations, block dangerous URL schemes, and enforce reasonable time and response-size limits. Website content is untrusted and must not be treated as executable instructions.

### 2.4 User reports and support requests

If the app provides a report function for inappropriate AI output, it must show the user a clear notice explaining what information will be transmitted, to whom, and for what purpose. It must obtain affirmative user consent before sending any report. The report should include only the minimum material reasonably necessary to investigate the issue and must not transmit the full conversation by default.

Reports may include the specific model response selected by the user, any additional details the user chooses to provide, and limited technical information needed to investigate the report. Reports are used for safety review, support, and application improvement, not advertising. The developer must define and publish a realistic retention period before enabling remote report submission: [Insert the report-retention period and deletion practice]. If the app does not actually provide a working reporting mechanism, do not claim that reports can be submitted until it is implemented and tested.

### 2.5 Diagnostics, analytics, advertising, and other SDKs

This policy assumes the app does not use advertising SDKs, analytics SDKs, remote crash reporting, account registration, or tracking tools that collect personal or device data. This is an assumption to verify, not a factual guarantee.

Before publication, the developer must inspect every dependency, SDK, permission, manifest entry, logging mechanism, and network request. If any tool collects crash logs, identifiers, usage events, diagnostics, advertising data, or other information, this policy and the Google Play Data safety form must describe it accurately, including relevant recipients and purposes.

## 3. Purposes of Processing

Information is processed only as needed to:

- Generate responses through the on-device language model.
- Apply user-selected persona instructions and settings.
- Store and retrieve the conversation history requested by the user.
- Download the model or necessary updates at the user’s request.
- Retrieve website content selected by the user.
- Receive and investigate reports that the user explicitly chooses to submit.
- Protect the app, address abuse, meet legal obligations, and respond to user requests where applicable.

The developer must identify and document the applicable legal basis for any personal-data processing under relevant law, including Saudi Arabia’s Personal Data Protection Law and its Implementing Regulations where applicable. Do not assume that consent is the only possible legal basis or that local model inference removes all privacy obligations.

## 4. Sharing and Disclosure

The developer does not sell ordinary conversation history. Under the intended local-only design, ordinary conversation text is not routinely accessible to the developer. Data may be processed by the following parties when the related feature is used:

- The model host or file-delivery provider, to deliver the requested model file.
- The external website selected by the user, to respond to the requested page retrieval.
- The provider of a user-selected reporting or support channel, if the user explicitly approves sending a report or support request.
- Additional service providers, if any are introduced in the future and disclosed in an updated policy before their relevant processing begins.

External websites and service providers operate under their own terms and privacy practices. They may be located outside the user’s country. The developer does not control their independent practices. Any cross-border processing by the developer or its service providers must be assessed under applicable law.

The developer may disclose information when required by applicable law or valid legal process, or when reasonably necessary to protect users, security, legal rights, and the integrity of the service, to the extent permitted by law. This clause does not mean the developer can access locally stored conversations that the developer does not possess.

## 5. Local Storage, Security, and Retention

Conversation history and user-created settings are intended to remain in the app’s local storage. Users may delete conversations or clear local history through the app’s available controls. Uninstalling the app may delete local app data, but operating-system backups, device transfers, screenshots, exported files, or copies outside the app may be governed by separate settings or choices.

The developer does not retain ordinary conversations on developer-operated servers under the intended design. If the developer receives a report or support request, it will be retained for [insert a defined, operationally realistic period] or longer only where required by law or reasonably necessary to establish, exercise, or defend legal claims; it will then be deleted or de-identified where feasible.

Reasonable technical and organizational measures should be used to protect any information the developer actually receives. No method of storage, software, or transmission is completely secure. Users are responsible for securing their devices and keeping their operating systems up to date.

## 6. User Privacy Rights and Requests

Depending on applicable law, users may have rights to request access to, correction of, deletion of, or other action concerning personal data processed by the developer, and may have rights concerning consent or complaints. To submit a privacy request, contact [insert privacy contact email] and describe the request without including unnecessary sensitive information.

The developer will assess and respond to requests in accordance with applicable law, including Saudi Arabia’s Personal Data Protection Law and its Implementing Regulations where applicable. The developer cannot delete or correct data held independently by an external website or provider on that party’s behalf; the user may need to contact that party directly.

Deleting a conversation from the app removes the applicable local record managed by the app, subject to the app’s implementation and any device backups or copies outside the app. The developer cannot remotely delete local-only information that the developer never receives.

## 7. Children and Minimum Age

Nawa AI is intended for users aged 18 and older and is not designed or marketed for children. If the developer changes the target age, this section must be revised to match the app’s actual audience, age rating, product design, applicable law, and Google Play declarations. Do not use an age restriction as a substitute for complying with rules that apply to the actual audience.

## 8. Third-Party Websites and Model Licenses

The app may retrieve webpages and use an open-weight model and third-party software components. The model, inference engine, and dependencies may be subject to separate licenses and notices. The developer will provide applicable notices as required by those licenses. Links to external websites do not imply endorsement or control by the developer.

## 9. Changes to This Privacy Policy

This policy may be updated when the app’s features, data practices, service providers, or legal requirements change. The “Last updated” date will be revised, and material changes will be communicated through the app or policy page where appropriate. The policy must be updated before any significant new collection, sharing, or remote processing begins.

## 10. Contact

**Developer / data controller:** [Insert legal name]  
**Privacy and support email:** [Insert a working email address]  
**Public policy URL:** [Insert the public HTTPS URL]

---

# Part II — Terms of Use

## 11. Acceptance and Eligibility

By installing or using Nawa AI, you agree to these Terms of Use and the Privacy Policy. If you do not agree, do not use the app and uninstall it. The app is intended for users aged 18 and older unless the developer validly changes the audience and updates the app’s design and disclosures accordingly.

**Developer:** [Insert legal name]  
**Contact:** [Insert a working email address]

## 12. The Service

Nawa AI provides an on-device language-model chat experience, user-customizable assistant instructions or personas, locally stored conversation history, and optional retrieval of web content from URLs selected by the user. The app is currently intended to be free to use; features, availability, or pricing may change with appropriate notice and subject to applicable law.

The core chat is designed to run locally after the model has been downloaded. Downloading the model and retrieving websites require internet access. Availability and performance may vary by device, operating-system version, available storage, memory, thermal conditions, and model compatibility.

## 13. AI Output Is Not Professional Advice

AI responses may be inaccurate, incomplete, misleading, outdated, biased, offensive, or unsuitable for a user’s situation. The model may misunderstand Arabic dialects, English wording, context, or emotional nuance and may generate statements or references that are not true. The developer does not guarantee that any output is accurate, complete, safe, original, or suitable for a particular purpose.

Nawa AI is not a doctor, therapist, lawyer, financial adviser, emergency service, or other licensed professional. Its emotional-support or “venting” features are not a substitute for qualified human support, diagnosis, treatment, or emergency services. Do not rely solely on the app for decisions concerning health, safety, finances, legal rights, or other high-impact matters. Verify important information with reliable sources or qualified professionals.

If you or another person faces immediate danger or a medical or mental-health emergency, contact appropriate local emergency services or a qualified human professional. The developer does not continuously monitor local conversations and cannot guarantee that the model will detect or respond appropriately to a crisis.

## 14. Custom Personas and Instructions

You may configure the assistant to adopt a role or communication style, such as an English tutor, study companion, coding helper, or conversational companion. A persona is a user-defined instruction to an automated model; it does not make the model a real person, create professional credentials, or establish a professional relationship. The model may not follow every instruction and may produce errors even when configured carefully.

Do not configure or use a persona to deceptively impersonate a real person, mislead others about the source of content, or facilitate unlawful activity.

## 15. User Responsibilities and Prohibited Uses

You are responsible for the text, URLs, instructions, and other content you provide, and for how you use, share, or rely on the resulting output. You agree not to use the app to:

- Create, facilitate, or distribute child sexual abuse or exploitation material, or sexual content involving minors.
- Facilitate real-world violence, credible threats, abuse, dangerous self-harm instructions, or other unlawful harm.
- Commit fraud, phishing, impersonation, credential theft, or deceptive activity.
- Create or deploy malware, steal data, bypass security controls, or gain unauthorized access to systems.
- Harass, threaten, dox, or unlawfully invade another person’s privacy.
- Infringe copyright, trademark, privacy, or other third-party rights.
- Circumvent website access controls or retrieve information without authorization.
- Violate applicable law, valid legal orders, or Google Play policies.

The model may not prevent every prohibited request or harmful output. These Terms do not represent that technical safeguards are perfect. The developer may take proportionate action to protect users, respond to abuse, comply with law, and maintain the app, to the extent permitted by law.

## 16. Website Retrieval and External Services

Website retrieval operates only when a network connection is available. The app may request publicly accessible webpage content from URLs selected by the user and may display source links. External websites control their own content, availability, logging, security, and privacy practices. The developer does not guarantee that external content is accurate, safe, lawful, or available.

You must have the right to access and use the URLs and content you submit. You must not use the feature to evade authentication, paywalls, access restrictions, or technical protections, or to retrieve confidential information without authorization. Web content is untrusted; it may contain malicious, misleading, or irrelevant instructions and should not be followed blindly.

## 17. Intellectual Property and Third-Party Licenses

The app’s original code, branding, and design belong to the developer or the relevant licensors, except for third-party components. These Terms do not replace the separate licenses governing the model, inference engine, or dependencies. Use of the open-weight model and third-party libraries remains subject to their applicable license terms and notices.

You must not copy, redistribute, reverse engineer, or misuse the app except as allowed by applicable law and the relevant licenses. Nothing in these Terms transfers ownership of the developer’s trademarks or branding to you.

## 18. Free Service, Changes, and Suspension

The current release is free. The developer may change, suspend, discontinue, or restrict features when reasonably needed for maintenance, security, legal compliance, or prevention of misuse, subject to applicable law. The developer will not promise perpetual availability or support for every device or model configuration.

## 19. Disclaimers and Limitation of Liability

To the maximum extent permitted by applicable law, the app is provided “as is” and “as available,” without warranties that are not expressly required by law. The developer does not guarantee uninterrupted availability, compatibility with every device, error-free AI output, the security or accuracy of external websites, or recovery of local data lost because of device failure, operating-system behavior, user action, or backup settings.

To the maximum extent permitted by law, the developer will not be liable for indirect or consequential losses arising from reliance on AI output, third-party website content, or the user’s misuse of the app. Nothing in these Terms excludes or limits any liability, consumer right, statutory guarantee, or other protection that cannot lawfully be excluded or limited. This section must be reviewed for the jurisdictions in which the app is distributed and must not be relied on as a blanket exemption from legal responsibility.

## 20. Changes to These Terms

The developer may update these Terms to reflect changes to the app, the law, security requirements, or service availability. The “Last updated” date will be revised and material changes will be communicated where appropriate. Continued use after a change takes effect constitutes acceptance only to the extent permitted by applicable law.

## 21. Governing Law and Disputes

These Terms are intended to be governed by the laws of the Kingdom of Saudi Arabia, except where mandatory law provides otherwise. Any dispute will be handled by the competent authority or court with jurisdiction under applicable law. Obtain local legal review before publication, especially if the app is distributed to users outside Saudi Arabia.

---

# Part III — AI Safety and Reporting Policy

## 22. Purpose and Limitations

This section describes the intended safe use of Nawa AI and complements the Privacy Policy and Terms of Use. The model is an automated system and may generate false, biased, incomplete, offensive, or otherwise harmful content. The developer does not continuously review local conversations and does not guarantee that the model can detect every harmful request or crisis.

## 23. Safety Expectations

Users must not use Nawa AI to create or facilitate unlawful harm, exploitation of minors, real-world violence, fraud, credential theft, malware, unauthorized access, harassment, doxxing, or infringement of others’ rights. The app must be designed and tested with reasonable safeguards for foreseeable harmful uses. Written rules alone do not replace technical testing and mitigation.

## 24. Reporting Inappropriate AI Output

The released app should provide an accessible, working in-app mechanism to report inappropriate or harmful AI output. Before the user submits a report, the app must clearly show which response, text, or other information will be sent, identify the intended recipient and purpose, and obtain affirmative consent.

The app should transmit only the minimum information necessary to investigate the report; it must not send the full conversation by default. Reports must be handled through a real, monitored channel and retained according to the period disclosed in the Privacy Policy. If the reporting workflow has not been implemented and tested, it must not be represented as operational and the app should not be released until the applicable Google Play requirement is met.

## 25. Emotional Support and Crisis Limitations

Nawa AI may be used for everyday conversation and personal reflection, but it is not a therapist, clinician, or emergency service. It must not imply that a human professional is monitoring the conversation when that is not true. It should not discourage users from seeking appropriate human help. Users facing immediate danger should contact local emergency services or trusted, qualified human support.

## 26. Technical Safeguards and Review

Before each release, the developer should test the actual model and app for foreseeable risks, including harmful requests, attempts to elicit sexual content involving minors, violence, self-harm, privacy invasion, impersonation, and malicious website instructions. Network retrieval must restrict unsafe URL schemes and internal network targets and must safely handle redirects, timeouts, and oversized responses. App logs and telemetry must not silently capture private conversations.

The developer will review this policy when the model, prompts, website retrieval, reporting flow, data practices, or applicable requirements materially change.

---


## Official Resources for Publisher Review

- Google Play Developer Program Policy: https://support.google.com/googleplay/android-developer/answer/9858738
- Google Play User Data / Privacy Policy guidance: https://support.google.com/googleplay/android-developer/answer/10144311
- Google Play AI-generated content policy: https://support.google.com/googleplay/android-developer/answer/13985936
- Saudi Data & AI Authority — laws and regulations: https://sdaia.gov.sa/en/SDAIA/about/Pages/RegulationsAndPolicies.aspx
- Saudi Data & AI Authority — Privacy Policy Guideline: https://dgp.sdaia.gov.sa/wps/portal/pdp/knowledgecenter/details/ElaborationandDevelopingPrivacyPolicyGuideline

---

**End of document.**
