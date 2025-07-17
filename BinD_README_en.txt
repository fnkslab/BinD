
     ========================================================================
     Science Tokyo Multimodal Dialogue Corpus with Respiration Signals (BinD)
     ========================================================================

                                                                July 15, 2025
                                                    Insitute of Science Tokyo
                                                             Kotaro FUNAKOSHI

This is a multimodal dialogue corpus of two human speakers recorded at Institue of Science Tokyo (Science Tokyo, formerly Tokyo Institute of Technology). In addition to the speakers' voices and frontal images, it includes respiratory waveform signals recorded during the dialogue by both speakers wearing elastic belt-type sensors, heart rate waveform signals recorded by an optical sensor worn on the index finger (only for some sessions), and responses to questionnaires conducted before and after recording.

There are 72 speakers in 36 pairs. Half of the pairs (18 pairs) are acquaintances, and the remaining 18 pairs are conversation data between people meeting for the first time. A total of 180 sessions, 5 sessions per pair, were recorded. Each session is about 10 to 15 minutes long (some sessions were re-recorded and are shorter than that). The recording conditions for each session are different (see [Contents of each session]).

IDR will provide video and audio files from this corpus that contain personal information. Other files will be provided from the GitHub repository (https://github.com/fnkslab/BinD/).

Therefore, the first step is to reconstruct the corpus.


[Corpus reconstruction]

The "BinD22" folder downloaded from GitHub contains the data files for the corpus itself. Extract and merge the contents of the ZIP file you received from IDR into the BinD22 folder. This will reconstruct the entire corpus.

To download from GitHub, click the "<> Code" button on the GitHub repository home page, and select "Download ZIP" from the panel that appears (see github_how_to_download.png).

There are multiple ways to extract the ZIP file and merge the files depending on your environment, but if you call the folder into which you extracted the ZIP file you received from IDR IDR-ZIP, one of the simplest ways is to copy all the folders in IDR-ZIP with two-digit numbers from 01 to 36 into the BinD22 folder downloaded from GitHub (there are also folders with two-digit numbers from 01 to 36 in this folder, but the contents are different).


[Contents of each session]

The dialogues (S3-S7) were recorded in different environmental settings. Prior to S3, data recording sessions (S1, S2) were also conducted for each speaker individually, but these are not included in this corpus. (Parts of S1 and S2 have been anonymized and released separately as the VRWi Dataset (*1).)

(*1) https://github.com/fnkslab/VRWiDataset/

Since the recording took place during the COVID-19 pandemic, masks were worn during the face-to-face sessions S5-S7.

Below we describe the five sessions, S3 to S7.

* S3: 1st dialogue in a soundproof booth, 15 minutes
  * Participants will enter separate booths and sit at tables within the booths to talk to each other.
  * Randomly assign each group to either audio-only or video (front-facing image of the other person) conversations.
  * Audio was recorded using a microphone placed on a table
  * Wear earphones in both ears to hear the other person's voice
  * The other person's image is captured by a web camera and displayed on a PC monitor placed on the table.
  * Randomly split the image display size into large and small for each group
  * Both audio and video are transmitted with virtually no delay without going through a LAN or the Internet
  * Work on survival tasks (surviving in the desert) (consult with your partner to prioritize items)
  * Provide a pen and a blank A4 sheet of paper to take notes on tasks

* S4: 2nd dialogue in soundproof booth, 15 min
  * Same as S3 except for the following differences
  * Changed the survival task scene to the sea instead of the desert
  * If S3 was a voice conversation, S4 will be a video conversation, and if S3 was a video conversation, S4 will be a voice conversation.

* S5: 1st face-to-face conversation, 10 minutes
  * Sit on chairs and talk
  * The participants were randomly assigned to either a diagonal cross chair arrangement or a horizontal arrangement.
  * Free dialogue (Suggested topics for reviewing dialogues from S3 and S4)

* S6: Video viewing, 15 minutes
  * Watch Chaplin's silent films side by side
  * Conversation is prohibited. Talking to yourself, laughing, exclamations, etc. are allowed.

* S7: 2nd face-to-face conversation, 10 minutes
  * Same as S5 except for the following differences
  * Reverse the orientation of the chairs from S5
  * Free conversation (suggested topic: reviewing the S6 movie)


[Folder structure and various files]

Each group is given a two-digit group number (hereafter referred to as NN) between 01 and 36, and the group number is used as the name of the folder in which each group's files are placed. Each group folder contains folders S3 to S7, which contain files as described below. Participants in each group are distinguished by giving them a three-digit number, such as NN1 and NN2. Video, audio, and biosignal waveforms of both participants in each session can be displayed synchronously using MPI ELAN (*2) (confirmed with macOS version of ELAN 6.8). 
* As of July 15, 2025, transcripts of the dialogue have not been provided.

(*2) https://archive.mpi.nl/tla/elan

To display biosignal waveforms on ELAN, the path of the CSV file in tsconf.xml must be rewritten to an absolute path to suit each user's PC environment. A shell script called repair_tsconf.sh that rewrites the path to an absolute path is available in the BinD GitHub repository. If you cannot run repair_tsconf.sh in your environment, you can create a similar program or manually modify the tsconf.xml file. The absolute path must start with the file URI scheme(*3) file:// (or more accurately, file:///). If the absolute path contains a half-width space, ELAN may not be able to read the CSV file. Extract the corpus to a location that does not contain a half-width space.

(*3) https://en.wikipedia.org/wiki/File_URI_scheme

If your environment is one in which repair_tsconf.sh works properly, you can make bulk repairs with the following command.
> find . -name '*tsconf.xml' | xargs -I % bash repair_tsconf.sh %
(Please run it in the Bind22 folder)

If the signal waveform does not appear in ELAN, right-click on the Timeseries panel above the audio waveform panel (Signal Viewer) and select "Add track panel to each track" to display it. This may not work depending on your environment. In that case, please manually reconfigure it according to the ELAN manual.

In the following explanation, the following three symbols are used as variables:
* NN is a number between 01 and 36 (group number)
* x is a number between 3 and 7 (session number)
* p is 1 or 2 (participant number)

The participant ID is a three-digit number in the format 'NNp' that combines the group number and participant number.

◯ S3, S4

* Each group's participants have separate video and audio
* The ELAN file has an offset value set so that the videos of participant 1 (left) and participant 2 (right) are synchronized.

NN --+-- Sx --+-- NNp --+-- NN-xp.mp4    Video of participant p in session x of group NN
              |         +-- NN-xp.wav    Mono PCM of participant p synchronized with NN-xp.mp4
              |         +-- NN-xp.csv    Biosignal data of participant p synchronized with NN-xp.mp4
              |         
              +-- NN-x.eaf           MPI ELAN file for session x of NN set
              +-- NN-x.wav           Stereo PCM file of participant 1 and participant 2's audio synchronized
              +-- NN-x_tsconf.xml    Configuration file for displaying biosignal data (need to be modified according to your environment)

◯ S5, S6 and S7

* Each group of participants was filmed with one camera
* Audio is not separated

NN --+-- Sx --+-- NN-x.mp4           Video of session x of group NN
              +-- NN-x.wav           Mono PCM mix of participant 1 and participant 2 audio synchronized with NN-x.mp4
              +-- NN-xp.csv          Biosignal data (respiration only) of participant p synchronized with NN-x.mp4
              |         
              +-- NN-x.eaf           MPI ELAN file for session x of NN set
              +-- NN-x_tsconf.xml    Configuration file for displaying biosignal data (need to be modified according to your environment)


[About reshoots]

If a measurement problem was discovered after the start of recording for each session, the recording was stopped, adjustments were made, and then it was resumed. In this case, only the data after the resumption was included in the corpus.

[Biological signals]

The biosignals contained in the CSV files for each participant's session are as follows.
* RSPT: Respiratory movement of the chest measured with BIOPAC TSD201

Below is the signal where only S3 and S4 are recorded.
* RSPA: Abdominal respiratory movement measured with BIOPAC TSD201
* PULS: Pulse waves measured by attaching the NONIN 8000SM to the index finger of the dominant and non-dominant hands.
* PR: Average heart rate (beats/min)
* SPO2: Percutaneous arterial oxygen saturation

The ELAN display settings prefix each signal with the speaker ID (e.g. 1-PR, see attached ELAN screenshot).
(SPO2 value is not displayed because it hardly changes)


[Experiment participants]

* 72 people recruited from the general public by the contracted experiment company (with compensation)
* breakdown
  * 32 men, 40 women
  * 17 people in their 20s, 19 people in their 30s, 18 people in their 40s, 13 people in their 50s, 5 people in their 60s
* Participation conditions
  * Native Japanese speaker
  * There is no problem with belt-type respiration measurement.
  * Ability to understand the experiment instructions and sign the consent form

BinD22_participants_info.tsv records each participant's attributes, recording conditions, and whether or not they have given permission to use their photograph and voice in research presentations. The contents of each column in the TSV file are as follows:

* ID: Participant ID in the format 'NNp'
* Sex: Participant's reported gender
* Age: Age group reported by the participant
* Known/Unknown: Acquaintances (K) or First Time (U)
* Order
  * A: S3: Voice conversation, S4: Video conversation, S5: Face-to-face conversation, S7: Side-by-side conversation
  * B: S3: Video conversation, S4: Audio conversation, S5: Side-by-side conversation, S7: Face-to-face conversation
* Video Size: The image size of the other party during video conversation in S3/S4. Large (L) or small (S)
* Face Use in Publication: Whether or not permission has been granted to use face photos and audio in research presentations. If it is granted, they can be used to the minimum extent necessary.
  * !! Caution !! Because the survey responses, which contain sensitive information, are published on GitHub, it is prohibited to include the group numbers and participant IDs of participants in the images published in the paper.


[Survey questions and answers]

We collected responses from all participants to a questionnaire twice, before and after the event, mainly consisting of impression ratings. The responses are stored in the following folder as TSV format files.

 Bind22/questionnaires

The files contained in the folder are as follows:

Pre-questionnaire
* before-questions.txt: Question items (Q1-Q25)
  * Q01 is the subjective perception of the relationship with the other person (first meeting: U0, acquaintance: K1, friend: K2, best friend: K3, family: K4)
  * Q02-Q15 are ratings of the other person's impression (7-point scale, 1: completely disagree - 7: strongly agree)
  * Q16-Q25 are personality assessments (7-point scale, same as above)
* before-responses-booth1.txt: Responses from participant 1 (participant ID NN1) of each group
* before-responses-booth2.txt: Responses from participant 2 (participant ID NN2) in each group

Post-event survey
* after-questions.txt: Questions (Q1-Q51)
  *Q01-Q14 are ratings of the other person's impression (7-point scale, 1: completely disagree - 7: strongly agree)
  * Q15-Q19 are impressions of the conversation with the other person (7-point scale, same as above)
  * Q20-Q29 are personality assessments of the other person (7-point scale, same as above)
  * Q30-Q39 are personality assessments (7-point scale, same as above)
  * Q40-Q51 are questions about the availability of video footage and masks (7-point scale, same as above)
* after-responses-booth1.txt: Responses from participant 1 (participant ID NN1) of each group
* after-responses-booth2.txt: Responses from participant 2 (participant ID NN2) of each group

For details about the survey, please refer to reference 2 below.

Note: The survey items include subjective impressions of the other person, and if this is known to the other person, it may have an unfavorable impact on the relationship between participants, especially if they are acquaintances. The survey response file itself does not contain personal information, but please handle it with care. For example, please do not publish a specific participant's survey responses in a paper or other publication along with a video snapshot of that participant.


[Literature information]

1. When referencing this corpus, please use the following bibliographic information:

Japanese: Kotaro Funakoshi (2025): Tokyo University of Science Multimodal Dialogue Corpus with Breathing Waveform Signals (BinD). National Institute of Informatics Research Data Repository. (Dataset). https://doi.org/10.32130/rdata.11.1
English: Kotaro Funakoshi (2025): Science Tokyo Multimodal Dialogue Corpus with Respiration Signals (BinD). Informatics Research Data Repository, National Institute of Informatics. (dataset). https://doi.org/10.32130/rdata.11.1
Note: The publication year is the year when the data used was provided or updated.


2. For more details about the experiments and surveys used to collect this corpus, please refer to the following literature.

Kotaro Funakoshi and Kensei Obi. "BinD: A Multimodal Dialogue Corpus with Respiration Signals",
Japanese Society for Artificial Intelligence, The 104th meeting of the Special Interest Group on Speech and Language Understanding and Dialogue Processing, 2025. (in Japanese)


3. For information on respiratory measurement methods and how to interpret the measured waveforms, please refer to the following literature:

T. Obi, K. Funakoshi. "Video-based Respiratory Waveform Estimation in Dialogue: A Novel Task and Dataset for Human-Machine Interaction." In Proceedings of the 25th International Conference on Multimodal Interaction (ICMI '23):, pp.649-660, 2023. https://doi.org/10.1145/3577190.3614154


[Acknowledgements]

The construction of this corpus was supported by and JSPS KAKENHI Grant Number JP22H04859. 
We thank Dr. Ludovico Minati, formerly with Tokyo Tech, for his help with the respiratory measurement device.
