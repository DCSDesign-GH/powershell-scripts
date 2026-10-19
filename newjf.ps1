# =====================================================================
# PROJECT CREATION ROUTINE - ITERATION 2
# CONSOLIDATED ROUTINES 
# =====================================================================

# -----------------------------
# PATHS
# -----------------------------
$NewJF = "\\dcs-fs\sys\netutils\usage\newjf.txt"
$ActiveRoot = "\\dcs-fs\data-1\jf"
$ArchiveRoot = "\\dcs-fs-archive\data-1\jf"
$ArchiveTape = "\\dcs-fs\sys\archive"

$MarketingGuide = "\\dcs-fs\sys\netutils\project image management guide.url"
$BEPMasters = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\BEP Masters"
$CentralFileNaming = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\CentralFile"
$DeliverableNaming = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\DeliverableFile"
$PhotosNaming = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\ExitingPhotos"
$DrawingNaming = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\ExistingDWGs"
$ProjSchedules = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\ProjectSchedule"
$CADFolders = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\CADFile"
$BOMAPath = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\BOMA2017"
$TestFitNaming = "\\dcs-fs\sys\Netutils\NewProjectTemplateFiles\TestFitNaming"

$QAURL = "http://192.168.0.2/download/157/document-templates/13186/dcs-quality-control-process-forms-2015.xlsx"
$MAURL = "http://192.168.0.2/download/157/document-templates/9623/yyyy-mm-dd-meeting-agenda.dotx"
$MMOFURL = "http://192.168.0.2/download/157/document-templates/9624/yyyy-mm-dd-meeting-minutes-outline-format.dotx"
$MMTFURL = "http://192.168.0.2/download/157/document-templates/9627/yyyy-mm-dd-meeting-minutes-table-format.dotx"


# -----------------------------
# BASE FOLDER SETS
# -----------------------------
$BaseFolderSets = @{
    1 = @("01_Drawings\01_Design", "01_Drawings\01_Design\01_Model", "01_Drawings\01_Design\01_Model\01_Materials", "01_Drawings\01_Design\02_Renderings", "01_Drawings\01_Design\03_Animations", "01_Drawings\01_Design\04_Sketches", "01_Drawings\02_Existing", "01_Drawings\02_Existing\01_Existing Photos", "01_Drawings\02_Existing\02_Existing Drawings", "01_Drawings\03_Families", "01_Drawings\04_Links", "01_Drawings\05_CAD", "01_Drawings\05_CAD\01_Anno", "01_Drawings\05_CAD\02_Blocks", "01_Drawings\05_CAD\03_Details", "01_Drawings\05_CAD\04_Elev", "01_Drawings\05_CAD\05_Notes", "01_Drawings\05_CAD\06_Plans", "01_Drawings\05_CAD\07_Sheets", "01_Drawings\06_Issued Sets", "01_Drawings\06_Issued Sets\01_Entitlements", "01_Drawings\06_Issued Sets\02_Progress", "01_Drawings\06_Issued Sets\03_Submissions", "01_Drawings\06_Issued Sets\04_Test Fits", "01_Drawings\06_Issued Sets\05_Space Plans", "01_Drawings\06_Issued Sets\06_Pricing Plans", "01_Drawings\07_Current Set", "02_Docs\01_Legal", "02_Docs\01_Legal\01_Proposals", "02_Docs\01_Legal\02_Contracts", "02_Docs\01_Legal\02_Contracts\01_Client", "02_Docs\01_Legal\02_Contracts\02_Consultants", "02_Docs\01_Legal\03_Project Initiations", "02_Docs\01_Legal\04_Requests for Additional Services", "02_Docs\02_Area Calcs", "02_Docs\03_Zoning", "02_Docs\04_Programming", "02_Docs\05_Cost Estimates", "02_Docs\06_Letters", "02_Docs\06_Letters\01_Owner", "02_Docs\06_Letters\02_Consultants", "02_Docs\06_Letters\03_Contractors", "02_Docs\06_Letters\04_Agencies", "02_Docs\07_Permits", "02_Docs\08_Meetings", "02_Docs\09_Schedules", "02_Docs\10_Quality Assurance", "02_Docs\10_Quality Assurance\01_Project Reviews", "02_Docs\10_Quality Assurance\02_Checklists", "02_Docs\11_BEP", "03_Consultants\00_Owner", "03_Consultants\01_Structural", "03_Consultants\02_MEP", "03_Consultants\03_Civil", "03_Consultants\04_Interiors", "03_Consultants\05_Landscape", "03_Consultants\06_Green", "03_Consultants\06_Green\02_Occupancy", "03_Consultants\06_Green\03_Design Review", "03_Consultants\06_Green\04_Meetings", "03_Consultants\06_Green\05_Local Jurisdiction", "03_Consultants\06_Green\06_Energy Modeling", "03_Consultants\06_Green\07_Commissioning", "03_Consultants\06_Green\08_Green Documentation", "03_Consultants\06_Green\09_Old Scorecards", "03_Consultants\06_Green\01_Project Setup\01_Registration", "03_Consultants\06_Green\06_Energy Modeling\01_Outgoing", "03_Consultants\06_Green\06_Energy Modeling\02_Incoming", "03_Consultants\06_Green\08_Green Documentation\01_PI Files", "03_Consultants\06_Green\08_Green Documentation\02_Design Phase", "03_Consultants\06_Green\08_Green Documentation\03_Construction Phase", "03_Consultants\06_Green\08_Green Documentation\04_Green Reviewer Comments", "03_Consultants\06_Green\08_Green Documentation\05_Final LEED Submission", "03_Consultants\07_IT", "03_Consultants\08_Security", "03_Consultants\09_FFE", "03_Consultants\10_Signage", "03_Consultants\11_Envelope", "03_Consultants\12_Acoustic", "03_Consultants\13_AV", "03_Consultants\14_GeoTech", "04_CA\01_Contract Docs", "04_CA\01_Contract Docs\01_Drawings", "04_CA\01_Contract Docs\02_Specs", "04_CA\01_Contract Docs\03_Contracts", "04_CA\02_Bidding", "04_CA\02_Bidding\01_Addenda", "04_CA\02_Bidding\02_Bid RFIs", "04_CA\02_Bidding\03_Misc", "04_CA\03_Submittals", "04_CA\04_RFIs", "04_CA\05_ASIs", "04_CA\06_RFPs", "04_CA\07_CCDs", "04_CA\08_PCOs", "04_CA\09_Change Orders", "04_CA\10_Pay Apps", "04_CA\11_Schedules", "04_CA\12_Meetings", "04_CA\13_Job Site Photos", "04_CA\14_Field Reports", "04_CA\15_Punch Lists", "04_CA\16_Closeout", "04_CA\17_Misc", "05_Specs", "05_Specs\01_BOD PRODUCTS", "10_Branding", "99_Archives", "99_Marketing", "99_Newforma", "99_OneNote")
    2 = @("01_Drawings\01_Design", "01_Drawings\01_Design\01_Model", "01_Drawings\01_Design\01_Model\01_Materials", "01_Drawings\01_Design\02_Renderings", "01_Drawings\01_Design\03_Animations", "01_Drawings\01_Design\04_Sketches", "01_Drawings\02_Existing", "01_Drawings\02_Existing\01_Existing Photos", "01_Drawings\02_Existing\02_Existing Drawings", "01_Drawings\03_Families", "01_Drawings\04_Links", "01_Drawings\05_CAD", "01_Drawings\05_CAD\01_Anno", "01_Drawings\05_CAD\02_Blocks", "01_Drawings\05_CAD\03_Details", "01_Drawings\05_CAD\04_Elev", "01_Drawings\05_CAD\05_Notes", "01_Drawings\05_CAD\06_Plans", "01_Drawings\05_CAD\07_Sheets", "01_Drawings\06_Issued Sets", "01_Drawings\06_Issued Sets\01_Entitlements", "01_Drawings\06_Issued Sets\02_Progress", "01_Drawings\06_Issued Sets\03_Submissions", "01_Drawings\06_Issued Sets\04_Test Fits", "01_Drawings\06_Issued Sets\05_Space Plans", "01_Drawings\06_Issued Sets\06_Pricing Plans", "01_Drawings\07_Current Set", "02_Docs\01_Legal", "02_Docs\01_Legal\01_Proposals", "02_Docs\01_Legal\02_Contracts", "02_Docs\01_Legal\02_Contracts\01_Client", "02_Docs\01_Legal\02_Contracts\02_Consultants", "02_Docs\01_Legal\03_Project Initiations", "02_Docs\01_Legal\04_Requests for Additional Services", "02_Docs\02_Area Calcs", "02_Docs\03_Zoning", "02_Docs\04_Programming", "02_Docs\05_Cost Estimates", "02_Docs\06_Letters", "02_Docs\06_Letters\01_Owner", "02_Docs\06_Letters\02_Consultants", "02_Docs\06_Letters\03_Contractors", "02_Docs\06_Letters\04_Agencies", "02_Docs\07_Permits", "02_Docs\08_Meetings", "02_Docs\09_Schedules", "02_Docs\10_Quality Assurance", "02_Docs\10_Quality Assurance\01_Project Reviews", "02_Docs\10_Quality Assurance\02_Checklists", "02_Docs\11_BEP", "03_Consultants\00_Owner", "03_Consultants\01_Structural", "03_Consultants\02_MEP", "03_Consultants\03_Civil", "03_Consultants\04_Interiors", "03_Consultants\05_Landscape", "03_Consultants\06_Green", "03_Consultants\06_Green\02_Occupancy", "03_Consultants\06_Green\03_Design Review", "03_Consultants\06_Green\04_Meetings", "03_Consultants\06_Green\05_Local Jurisdiction", "03_Consultants\06_Green\06_Energy Modeling", "03_Consultants\06_Green\07_Commissioning", "03_Consultants\06_Green\08_Green Documentation", "03_Consultants\06_Green\09_Old Scorecards", "03_Consultants\06_Green\01_Project Setup\01_Registration", "03_Consultants\06_Green\06_Energy Modeling\01_Outgoing", "03_Consultants\06_Green\06_Energy Modeling\02_Incoming", "03_Consultants\06_Green\08_Green Documentation\01_PI Files", "03_Consultants\06_Green\08_Green Documentation\02_Design Phase", "03_Consultants\06_Green\08_Green Documentation\03_Construction Phase", "03_Consultants\06_Green\08_Green Documentation\04_Green Reviewer Comments", "03_Consultants\06_Green\08_Green Documentation\05_Final LEED Submission", "03_Consultants\07_IT", "03_Consultants\08_Security", "03_Consultants\09_FFE", "03_Consultants\10_Signage", "03_Consultants\11_Envelope", "03_Consultants\12_Acoustic", "03_Consultants\13_AV", "03_Consultants\14_GeoTech", "04_CA\01_Contract Docs", "04_CA\01_Contract Docs\01_Drawings", "04_CA\01_Contract Docs\02_Specs", "04_CA\01_Contract Docs\03_Contracts", "04_CA\02_Bidding", "04_CA\02_Bidding\01_Addenda", "04_CA\02_Bidding\02_Bid RFIs", "04_CA\02_Bidding\03_Misc", "04_CA\03_Submittals", "04_CA\04_RFIs", "04_CA\05_ASIs", "04_CA\06_RFPs", "04_CA\07_CCDs", "04_CA\08_PCOs", "04_CA\09_Change Orders", "04_CA\10_Pay Apps", "04_CA\11_Schedules", "04_CA\12_Meetings", "04_CA\13_Job Site Photos", "04_CA\14_Field Reports", "04_CA\15_Punch Lists", "04_CA\16_Closeout", "04_CA\17_Misc", "05_Specs", "05_Specs\01_BOD PRODUCTS", "10_Branding", "99_Archives", "99_Marketing", "99_Newforma", "99_OneNote")
    3 = @("01_Base", "01_Base\01_Base CAD", "01_Base\02_As Builts", "01_Base\03_Survey", "02_Leasing", "02_Leasing\01_BOMA", "02_Leasing\02_Marketing Plans", "02_Leasing\01_BOMA\01_PDF", "02_Leasing\02_Marketing Plans\01_PDF", "03_Programming", "03_Programming\01_POR", "03_Programming\02_Visioning", "03_Programming\03_Image Presentation", "04_TestFit", "04_TestFit\01_PDF", "05_Design", "05_Design\01_Sketchup", "05_Design\02_Renderings", "05_Design\03_Animations", "05_Design\04_Finish Schemes", "05_Design\05_Specs", "05_Design\06_D5", "06_CD", "06_CD\01_Submissions", "06_CD\02_Keynotes", "07_CA", "07_CA\01_Addenda", "07_CA\02_Bids", "07_CA\03_Submittals", "07_CA\04_RFIs", "07_CA\05_ASIs", "07_CA\07_CCDs", "07_CA\08_PCOs", "07_CA\09_Change Orders", "07_CA\10_Pay Apps", "07_CA\11_Schedules", "07_CA\12_Meetings", "07_CA\13_Job Site Photos", "07_CA\14_Field Reports", "07_CA\15_Punch Lists", "07_CA\16_Closeout", "07_CA\17_Misc", "07_CA\02_Bids\01_Bid RFIs", "07_CA\02_Bids\02_Bids", "07_CA\13_Job Site Photos\Guardian_05082020", "08_Doc", "08_Doc\01_Incoming", "08_Doc\02_Legal", "08_Doc\03_Meetings", "08_Doc\04_Schedules", "08_Doc\05_Quality Assurance", "08_Doc\06_Permit Documents", "08_Doc\02_Legal\01_Proposals", "08_Doc\02_Legal\02_Contracts", "08_Doc\02_Legal\03_Project Initiations", "08_Doc\02_Legal\04_Requests for Additional Services", "08_Doc\02_Legal\05_Electronic Trasmittal Form", "08_Doc\05_Quality Assurance\01_Project Reviews", "08_Doc\05_Quality Assurance\02_Checklists", "08_Doc\11_BEP", "09_Consultants", "09_Consultants\00_Owner", "09_Consultants\01_Structural", "09_Consultants\02_MEP", "09_Consultants\03_Civil", "09_Consultants\04_Lighting", "09_Consultants\05_Landscape", "09_Consultants\06_Green", "09_Consultants\07_IT", "09_Consultants\08_Security", "09_Consultants\09_FFE", "09_Consultants\10_Signage", "09_Consultants\12_Acoustic", "09_Consultants\13_AV", "09_Consultants\02_MEP\ProjNo-ProjName-Permit CheckSet_020720", "09_Consultants\06_Green\01_Project Setup", "09_Consultants\06_Green\02_Occupancy", "09_Consultants\06_Green\03_Design Review", "09_Consultants\06_Green\04_Meetings", "09_Consultants\06_Green\05_Local Jurisdiction", "09_Consultants\06_Green\06_Energy Modeling", "09_Consultants\06_Green\07_Commissioning", "09_Consultants\06_Green\08_Green Documentation", "09_Consultants\06_Green\09_Old Scorecards", "09_Consultants\06_Green\01_Project Setup\01_Registration", "09_Consultants\06_Green\06_Energy Modeling\01_Outgoing", "09_Consultants\06_Green\06_Energy Modeling\02_Incoming", "09_Consultants\06_Green\08_Green Documentation\01_PI Files", "09_Consultants\06_Green\08_Green Documentation\02_Design Phase", "09_Consultants\06_Green\08_Green Documentation\03_Construction Phase", "09_Consultants\06_Green\08_Green Documentation\04_Green Reviewer Comments", "09_Consultants\06_Green\08_Green Documentation\05_Final LEED Submission", "10_Branding", "99_Archives", "99_Marketing", "99_Newforma", "99_OneNote")
    4 = @("10_Branding", "10_Branding\00_Presentation", "10_Branding\01_Proposal", "10_Branding\02_Project Schedule", "10_Branding\03_Meeting Minutes", "10_Branding\04_Client Information", "10_Branding\PHASE 1_Visioning .01", "10_Branding\PHASE 1_Visioning .01\01_Visioning Meeting", "10_Branding\PHASE 1_Visioning .01\02_Brand Audit", "10_Branding\PHASE 1_Visioning .01\03_Brand Brief", "10_Branding\PHASE 1_Visioning .01\04_Supporting Doc", "10_Branding\PHASE 2_Brand Identity .01", "10_Branding\PHASE 2_Brand Identity .01\01_Naming", "10_Branding\PHASE 2_Brand Identity .01\02_Logo", "10_Branding\PHASE 2_Brand Identity .01\03_Color Palette & Typography", "10_Branding\PHASE 2_Brand Identity .01\04_Tag Line", "10_Branding\PHASE 2_Brand Identity .01\05_Brand Guidelines", "10_Branding\PHASE 2_Brand Identity .01\06_Supporting Doc", "99_Archives", "99_Marketing", "99_Newforma", "99_OneNote")
    5 = @("10_Branding", "10_Branding\00_Presentation", "10_Branding\01_Proposal", "10_Branding\02_Project Schedule", "10_Branding\03_Meeting Minutes", "10_Branding\04_Client Information", "10_Branding\PHASE 1_Visioning .01", "10_Branding\PHASE 1_Visioning .01\01_Visioning Meeting", "10_Branding\PHASE 1_Visioning .01\02_Brand Audit", "10_Branding\PHASE 1_Visioning .01\03_Brand Brief", "10_Branding\PHASE 1_Visioning .01\04_Supporting Doc", "10_Branding\PHASE 2_Brand Identity .01", "10_Branding\PHASE 2_Brand Identity .01\01_Naming", "10_Branding\PHASE 2_Brand Identity .01\02_Logo", "10_Branding\PHASE 2_Brand Identity .01\03_Color Palette & Typography", "10_Branding\PHASE 2_Brand Identity .01\04_Tag Line", "10_Branding\PHASE 2_Brand Identity .01\05_Brand Guidelines", "10_Branding\PHASE 2_Brand Identity .01\06_Supporting Doc", "99_Archives", "99_Marketing", "99_Newforma", "99_OneNote")
}

# -----------------------------
# ADDITONAL FOLDER SETS
# -----------------------------
$AdditionalFolderSets = @{
    1 = @("01_Drawings\01_Design\20yy-mm-dd Name of Deliverable", "01_Drawings\01_Design\01_Model\20yy-mm-dd Name of Deliverable", "01_Drawings\02_Existing\01_Existing Photos\20yy-mm-dd Description of photos", "01_Drawings\02_Existing\02_Existing Drawings\20yy-mm-dd Description of drawings", "01_Drawings\06_Issued Sets\01_Entitlements\20yy-mm-dd Issued Set Description", "01_Drawings\06_Issued Sets\02_Progress\20yy-mm-dd Progress Set Description", "01_Drawings\06_Issued Sets\03_Submissions\20yy-mm-dd Submission Description", "02_Docs\08_Meetings\20yy-mm-dd Meeting Description", "05_Specs\20yy-mm-dd Name of Set", "04_CA\04_RFIs\RFI's 001-009", "04_CA\04_RFIs\RFI's 010-019", "04_CA\04_RFIs\RFI's 020-029", "04_CA\04_RFIs\RFI's 030-039", "04_CA\04_RFIs\RFI's 040-049", "04_CA\04_RFIs\RFI's 050-059", "04_CA\04_RFIs\RFI's 060-069", "04_CA\04_RFIs\RFI's 070-079", "04_CA\04_RFIs\RFI's 080-089", "04_CA\04_RFIs\RFI's 090-099", "04_CA\04_RFIs\RFI's 100-109", "04_CA\04_RFIs\RFI's 110-119", "04_CA\04_RFIs\RFI's 120-129", "04_CA\04_RFIs\RFI's 130-139", "04_CA\04_RFIs\RFI's 140-149", "04_CA\04_RFIs\RFI's 150-159", "04_CA\04_RFIs\RFI's 160-169", "04_CA\04_RFIs\RFI's 170-179", "04_CA\04_RFIs\RFI's 180-189", "04_CA\04_RFIs\RFI's 190-199", "04_CA\04_RFIs\RFI's 200-209", "04_CA\04_RFIs\RFI's 210-219", "04_CA\04_RFIs\RFI's 220-229", "04_CA\04_RFIs\RFI's 230-239", "04_CA\04_RFIs\RFI's 240-249", "04_CA\04_RFIs\RFI's 250-259", "04_CA\04_RFIs\RFI's 260-269", "04_CA\04_RFIs\RFI's 270-279", "04_CA\04_RFIs\RFI's 280-289", "04_CA\04_RFIs\RFI's 290-299", "04_CA\04_RFIs\RFI's 300-309", "04_CA\04_RFIs\RFI's 310-319", "04_CA\04_RFIs\RFI's 320-329", "04_CA\04_RFIs\RFI's 330-339", "04_CA\04_RFIs\RFI's 340-349", "04_CA\04_RFIs\RFI's 350-359", "04_CA\04_RFIs\RFI's 360-369", "04_CA\04_RFIs\RFI's 370-379", "04_CA\04_RFIs\RFI's 380-389", "04_CA\04_RFIs\RFI's 390-399", "04_CA\04_RFIs\RFI's 400-409", "04_CA\04_RFIs\RFI's 410-419", "04_CA\04_RFIs\RFI's 420-429", "04_CA\04_RFIs\RFI's 430-439", "04_CA\04_RFIs\RFI's 440-449", "04_CA\04_RFIs\RFI's 450-459", "04_CA\04_RFIs\RFI's 460-469", "04_CA\04_RFIs\RFI's 470-479", "04_CA\04_RFIs\RFI's 480-489", "04_CA\04_RFIs\RFI's 490-499", "04_CA\04_RFIs\RFI's 001-009\RFI 1", "04_CA\04_RFIs\RFI's 001-009\RFI 2", "04_CA\04_RFIs\RFI's 001-009\RFI 3", "04_CA\04_RFIs\RFI's 001-009\RFI 4", "04_CA\04_RFIs\RFI's 001-009\RFI 5", "04_CA\04_RFIs\RFI's 001-009\RFI 6", "04_CA\04_RFIs\RFI's 001-009\RFI 7", "04_CA\04_RFIs\RFI's 001-009\RFI 8", "04_CA\04_RFIs\RFI's 001-009\RFI 9", "04_CA\04_RFIs\RFI's 010-019\RFI 10", "04_CA\04_RFIs\RFI's 010-019\RFI 11", "04_CA\04_RFIs\RFI's 010-019\RFI 12", "04_CA\04_RFIs\RFI's 010-019\RFI 13", "04_CA\04_RFIs\RFI's 010-019\RFI 14", "04_CA\04_RFIs\RFI's 010-019\RFI 15", "04_CA\04_RFIs\RFI's 010-019\RFI 16", "04_CA\04_RFIs\RFI's 010-019\RFI 17", "04_CA\04_RFIs\RFI's 010-019\RFI 18", "04_CA\04_RFIs\RFI's 010-019\RFI 19", "04_CA\04_RFIs\RFI's 020-029\RFI 20", "04_CA\04_RFIs\RFI's 020-029\RFI 21", "04_CA\04_RFIs\RFI's 020-029\RFI 22", "04_CA\04_RFIs\RFI's 020-029\RFI 23", "04_CA\04_RFIs\RFI's 020-029\RFI 24", "04_CA\04_RFIs\RFI's 020-029\RFI 25", "04_CA\04_RFIs\RFI's 020-029\RFI 26", "04_CA\04_RFIs\RFI's 020-029\RFI 27", "04_CA\04_RFIs\RFI's 020-029\RFI 28", "04_CA\04_RFIs\RFI's 020-029\RFI 29", "04_CA\04_RFIs\RFI's 030-039\RFI 30", "04_CA\04_RFIs\RFI's 030-039\RFI 31", "04_CA\04_RFIs\RFI's 030-039\RFI 32", "04_CA\04_RFIs\RFI's 030-039\RFI 33", "04_CA\04_RFIs\RFI's 030-039\RFI 34", "04_CA\04_RFIs\RFI's 030-039\RFI 35", "04_CA\04_RFIs\RFI's 030-039\RFI 36", "04_CA\04_RFIs\RFI's 030-039\RFI 37", "04_CA\04_RFIs\RFI's 030-039\RFI 38", "04_CA\04_RFIs\RFI's 030-039\RFI 39", "04_CA\04_RFIs\RFI's 040-049\RFI 40", "04_CA\04_RFIs\RFI's 040-049\RFI 41", "04_CA\04_RFIs\RFI's 040-049\RFI 42", "04_CA\04_RFIs\RFI's 040-049\RFI 43", "04_CA\04_RFIs\RFI's 040-049\RFI 44", "04_CA\04_RFIs\RFI's 040-049\RFI 45", "04_CA\04_RFIs\RFI's 040-049\RFI 46", "04_CA\04_RFIs\RFI's 040-049\RFI 47", "04_CA\04_RFIs\RFI's 040-049\RFI 48", "04_CA\04_RFIs\RFI's 040-049\RFI 49", "04_CA\04_RFIs\RFI's 050-059\RFI 50", "04_CA\04_RFIs\RFI's 050-059\RFI 51", "04_CA\04_RFIs\RFI's 050-059\RFI 52", "04_CA\04_RFIs\RFI's 050-059\RFI 53", "04_CA\04_RFIs\RFI's 050-059\RFI 54", "04_CA\04_RFIs\RFI's 050-059\RFI 55", "04_CA\04_RFIs\RFI's 050-059\RFI 56", "04_CA\04_RFIs\RFI's 050-059\RFI 57", "04_CA\04_RFIs\RFI's 050-059\RFI 58", "04_CA\04_RFIs\RFI's 050-059\RFI 59", "04_CA\04_RFIs\RFI's 060-069\RFI 60", "04_CA\04_RFIs\RFI's 060-069\RFI 61", "04_CA\04_RFIs\RFI's 060-069\RFI 62", "04_CA\04_RFIs\RFI's 060-069\RFI 63", "04_CA\04_RFIs\RFI's 060-069\RFI 64", "04_CA\04_RFIs\RFI's 060-069\RFI 65", "04_CA\04_RFIs\RFI's 060-069\RFI 66", "04_CA\04_RFIs\RFI's 060-069\RFI 67", "04_CA\04_RFIs\RFI's 060-069\RFI 68", "04_CA\04_RFIs\RFI's 060-069\RFI 69", "04_CA\04_RFIs\RFI's 070-079\RFI 70", "04_CA\04_RFIs\RFI's 070-079\RFI 71", "04_CA\04_RFIs\RFI's 070-079\RFI 72", "04_CA\04_RFIs\RFI's 070-079\RFI 73", "04_CA\04_RFIs\RFI's 070-079\RFI 74", "04_CA\04_RFIs\RFI's 070-079\RFI 75", "04_CA\04_RFIs\RFI's 070-079\RFI 76", "04_CA\04_RFIs\RFI's 070-079\RFI 77", "04_CA\04_RFIs\RFI's 070-079\RFI 78", "04_CA\04_RFIs\RFI's 070-079\RFI 79", "04_CA\04_RFIs\RFI's 080-089\RFI 80", "04_CA\04_RFIs\RFI's 080-089\RFI 81", "04_CA\04_RFIs\RFI's 080-089\RFI 82", "04_CA\04_RFIs\RFI's 080-089\RFI 83", "04_CA\04_RFIs\RFI's 080-089\RFI 84", "04_CA\04_RFIs\RFI's 080-089\RFI 85", "04_CA\04_RFIs\RFI's 080-089\RFI 86", "04_CA\04_RFIs\RFI's 080-089\RFI 87", "04_CA\04_RFIs\RFI's 080-089\RFI 88", "04_CA\04_RFIs\RFI's 080-089\RFI 89", "04_CA\04_RFIs\RFI's 090-099\RFI 90", "04_CA\04_RFIs\RFI's 090-099\RFI 91", "04_CA\04_RFIs\RFI's 090-099\RFI 92", "04_CA\04_RFIs\RFI's 090-099\RFI 93", "04_CA\04_RFIs\RFI's 090-099\RFI 94", "04_CA\04_RFIs\RFI's 090-099\RFI 95", "04_CA\04_RFIs\RFI's 090-099\RFI 96", "04_CA\04_RFIs\RFI's 090-099\RFI 97", "04_CA\04_RFIs\RFI's 090-099\RFI 98", "04_CA\04_RFIs\RFI's 090-099\RFI 99", "04_CA\04_RFIs\RFI's 100-109\RFI 100", "04_CA\04_RFIs\RFI's 100-109\RFI 101", "04_CA\04_RFIs\RFI's 100-109\RFI 102", "04_CA\04_RFIs\RFI's 100-109\RFI 103", "04_CA\04_RFIs\RFI's 100-109\RFI 104", "04_CA\04_RFIs\RFI's 100-109\RFI 105", "04_CA\04_RFIs\RFI's 100-109\RFI 106", "04_CA\04_RFIs\RFI's 100-109\RFI 107", "04_CA\04_RFIs\RFI's 100-109\RFI 108", "04_CA\04_RFIs\RFI's 100-109\RFI 109", "04_CA\04_RFIs\RFI's 110-119\RFI 110", "04_CA\04_RFIs\RFI's 110-119\RFI 111", "04_CA\04_RFIs\RFI's 110-119\RFI 112", "04_CA\04_RFIs\RFI's 110-119\RFI 113", "04_CA\04_RFIs\RFI's 110-119\RFI 114", "04_CA\04_RFIs\RFI's 110-119\RFI 115", "04_CA\04_RFIs\RFI's 110-119\RFI 116", "04_CA\04_RFIs\RFI's 110-119\RFI 117", "04_CA\04_RFIs\RFI's 110-119\RFI 118", "04_CA\04_RFIs\RFI's 110-119\RFI 119", "04_CA\04_RFIs\RFI's 120-129\RFI 120", "04_CA\04_RFIs\RFI's 120-129\RFI 121", "04_CA\04_RFIs\RFI's 120-129\RFI 122", "04_CA\04_RFIs\RFI's 120-129\RFI 123", "04_CA\04_RFIs\RFI's 120-129\RFI 124", "04_CA\04_RFIs\RFI's 120-129\RFI 125", "04_CA\04_RFIs\RFI's 120-129\RFI 126", "04_CA\04_RFIs\RFI's 120-129\RFI 127", "04_CA\04_RFIs\RFI's 120-129\RFI 128", "04_CA\04_RFIs\RFI's 120-129\RFI 129", "04_CA\04_RFIs\RFI's 130-139\RFI 130", "04_CA\04_RFIs\RFI's 130-139\RFI 131", "04_CA\04_RFIs\RFI's 130-139\RFI 132", "04_CA\04_RFIs\RFI's 130-139\RFI 133", "04_CA\04_RFIs\RFI's 130-139\RFI 134", "04_CA\04_RFIs\RFI's 130-139\RFI 135", "04_CA\04_RFIs\RFI's 130-139\RFI 136", "04_CA\04_RFIs\RFI's 130-139\RFI 137", "04_CA\04_RFIs\RFI's 130-139\RFI 138", "04_CA\04_RFIs\RFI's 130-139\RFI 139", "04_CA\04_RFIs\RFI's 140-149\RFI 140", "04_CA\04_RFIs\RFI's 140-149\RFI 141", "04_CA\04_RFIs\RFI's 140-149\RFI 142", "04_CA\04_RFIs\RFI's 140-149\RFI 143", "04_CA\04_RFIs\RFI's 140-149\RFI 144", "04_CA\04_RFIs\RFI's 140-149\RFI 145", "04_CA\04_RFIs\RFI's 140-149\RFI 146", "04_CA\04_RFIs\RFI's 140-149\RFI 147", "04_CA\04_RFIs\RFI's 140-149\RFI 148", "04_CA\04_RFIs\RFI's 140-149\RFI 149", "04_CA\04_RFIs\RFI's 150-159\RFI 150", "04_CA\04_RFIs\RFI's 150-159\RFI 151", "04_CA\04_RFIs\RFI's 150-159\RFI 152", "04_CA\04_RFIs\RFI's 150-159\RFI 153", "04_CA\04_RFIs\RFI's 150-159\RFI 154", "04_CA\04_RFIs\RFI's 150-159\RFI 155", "04_CA\04_RFIs\RFI's 150-159\RFI 156", "04_CA\04_RFIs\RFI's 150-159\RFI 157", "04_CA\04_RFIs\RFI's 150-159\RFI 158", "04_CA\04_RFIs\RFI's 150-159\RFI 159", "04_CA\04_RFIs\RFI's 160-169\RFI 160", "04_CA\04_RFIs\RFI's 160-169\RFI 161", "04_CA\04_RFIs\RFI's 160-169\RFI 162", "04_CA\04_RFIs\RFI's 160-169\RFI 163", "04_CA\04_RFIs\RFI's 160-169\RFI 164", "04_CA\04_RFIs\RFI's 160-169\RFI 165", "04_CA\04_RFIs\RFI's 160-169\RFI 166", "04_CA\04_RFIs\RFI's 160-169\RFI 167", "04_CA\04_RFIs\RFI's 160-169\RFI 168", "04_CA\04_RFIs\RFI's 160-169\RFI 169", "04_CA\04_RFIs\RFI's 170-179\RFI 170", "04_CA\04_RFIs\RFI's 170-179\RFI 171", "04_CA\04_RFIs\RFI's 170-179\RFI 172", "04_CA\04_RFIs\RFI's 170-179\RFI 173", "04_CA\04_RFIs\RFI's 170-179\RFI 174", "04_CA\04_RFIs\RFI's 170-179\RFI 175", "04_CA\04_RFIs\RFI's 170-179\RFI 176", "04_CA\04_RFIs\RFI's 170-179\RFI 177", "04_CA\04_RFIs\RFI's 170-179\RFI 178", "04_CA\04_RFIs\RFI's 170-179\RFI 179", "04_CA\04_RFIs\RFI's 180-189\RFI 180", "04_CA\04_RFIs\RFI's 180-189\RFI 181", "04_CA\04_RFIs\RFI's 180-189\RFI 182", "04_CA\04_RFIs\RFI's 180-189\RFI 183", "04_CA\04_RFIs\RFI's 180-189\RFI 184", "04_CA\04_RFIs\RFI's 180-189\RFI 185", "04_CA\04_RFIs\RFI's 180-189\RFI 186", "04_CA\04_RFIs\RFI's 180-189\RFI 187", "04_CA\04_RFIs\RFI's 180-189\RFI 188", "04_CA\04_RFIs\RFI's 180-189\RFI 189", "04_CA\04_RFIs\RFI's 190-199\RFI 190", "04_CA\04_RFIs\RFI's 190-199\RFI 191", "04_CA\04_RFIs\RFI's 190-199\RFI 192", "04_CA\04_RFIs\RFI's 190-199\RFI 193", "04_CA\04_RFIs\RFI's 190-199\RFI 194", "04_CA\04_RFIs\RFI's 190-199\RFI 195", "04_CA\04_RFIs\RFI's 190-199\RFI 196", "04_CA\04_RFIs\RFI's 190-199\RFI 197", "04_CA\04_RFIs\RFI's 190-199\RFI 198", "04_CA\04_RFIs\RFI's 190-199\RFI 199", "04_CA\04_RFIs\RFI's 200-209\RFI 200", "04_CA\04_RFIs\RFI's 200-209\RFI 201", "04_CA\04_RFIs\RFI's 200-209\RFI 202", "04_CA\04_RFIs\RFI's 200-209\RFI 203", "04_CA\04_RFIs\RFI's 200-209\RFI 204", "04_CA\04_RFIs\RFI's 200-209\RFI 205", "04_CA\04_RFIs\RFI's 200-209\RFI 206", "04_CA\04_RFIs\RFI's 200-209\RFI 207", "04_CA\04_RFIs\RFI's 200-209\RFI 208", "04_CA\04_RFIs\RFI's 200-209\RFI 209", "04_CA\04_RFIs\RFI's 210-219\RFI 210", "04_CA\04_RFIs\RFI's 210-219\RFI 211", "04_CA\04_RFIs\RFI's 210-219\RFI 212", "04_CA\04_RFIs\RFI's 210-219\RFI 213", "04_CA\04_RFIs\RFI's 210-219\RFI 214", "04_CA\04_RFIs\RFI's 210-219\RFI 215", "04_CA\04_RFIs\RFI's 210-219\RFI 216", "04_CA\04_RFIs\RFI's 210-219\RFI 217", "04_CA\04_RFIs\RFI's 210-219\RFI 218", "04_CA\04_RFIs\RFI's 210-219\RFI 219", "04_CA\04_RFIs\RFI's 220-229\RFI 220", "04_CA\04_RFIs\RFI's 220-229\RFI 221", "04_CA\04_RFIs\RFI's 220-229\RFI 222", "04_CA\04_RFIs\RFI's 220-229\RFI 223", "04_CA\04_RFIs\RFI's 220-229\RFI 224", "04_CA\04_RFIs\RFI's 220-229\RFI 225", "04_CA\04_RFIs\RFI's 220-229\RFI 226", "04_CA\04_RFIs\RFI's 220-229\RFI 227", "04_CA\04_RFIs\RFI's 220-229\RFI 228", "04_CA\04_RFIs\RFI's 220-229\RFI 229", "04_CA\04_RFIs\RFI's 230-239\RFI 230", "04_CA\04_RFIs\RFI's 230-239\RFI 231", "04_CA\04_RFIs\RFI's 230-239\RFI 232", "04_CA\04_RFIs\RFI's 230-239\RFI 233", "04_CA\04_RFIs\RFI's 230-239\RFI 234", "04_CA\04_RFIs\RFI's 230-239\RFI 235", "04_CA\04_RFIs\RFI's 230-239\RFI 236", "04_CA\04_RFIs\RFI's 230-239\RFI 237", "04_CA\04_RFIs\RFI's 230-239\RFI 238", "04_CA\04_RFIs\RFI's 230-239\RFI 239", "04_CA\04_RFIs\RFI's 240-249\RFI 240", "04_CA\04_RFIs\RFI's 240-249\RFI 241", "04_CA\04_RFIs\RFI's 240-249\RFI 242", "04_CA\04_RFIs\RFI's 240-249\RFI 243", "04_CA\04_RFIs\RFI's 240-249\RFI 244", "04_CA\04_RFIs\RFI's 240-249\RFI 245", "04_CA\04_RFIs\RFI's 240-249\RFI 246", "04_CA\04_RFIs\RFI's 240-249\RFI 247", "04_CA\04_RFIs\RFI's 240-249\RFI 248", "04_CA\04_RFIs\RFI's 240-249\RFI 249", "04_CA\04_RFIs\RFI's 250-259\RFI 250", "04_CA\04_RFIs\RFI's 250-259\RFI 251", "04_CA\04_RFIs\RFI's 250-259\RFI 252", "04_CA\04_RFIs\RFI's 250-259\RFI 253", "04_CA\04_RFIs\RFI's 250-259\RFI 254", "04_CA\04_RFIs\RFI's 250-259\RFI 255", "04_CA\04_RFIs\RFI's 250-259\RFI 256", "04_CA\04_RFIs\RFI's 250-259\RFI 257", "04_CA\04_RFIs\RFI's 250-259\RFI 258", "04_CA\04_RFIs\RFI's 250-259\RFI 259", "04_CA\04_RFIs\RFI's 260-269\RFI 260", "04_CA\04_RFIs\RFI's 260-269\RFI 261", "04_CA\04_RFIs\RFI's 260-269\RFI 262", "04_CA\04_RFIs\RFI's 260-269\RFI 263", "04_CA\04_RFIs\RFI's 260-269\RFI 264", "04_CA\04_RFIs\RFI's 260-269\RFI 265", "04_CA\04_RFIs\RFI's 260-269\RFI 266", "04_CA\04_RFIs\RFI's 260-269\RFI 267", "04_CA\04_RFIs\RFI's 260-269\RFI 268", "04_CA\04_RFIs\RFI's 260-269\RFI 269", "04_CA\04_RFIs\RFI's 270-279\RFI 270", "04_CA\04_RFIs\RFI's 270-279\RFI 271", "04_CA\04_RFIs\RFI's 270-279\RFI 272", "04_CA\04_RFIs\RFI's 270-279\RFI 273", "04_CA\04_RFIs\RFI's 270-279\RFI 274", "04_CA\04_RFIs\RFI's 270-279\RFI 275", "04_CA\04_RFIs\RFI's 270-279\RFI 276", "04_CA\04_RFIs\RFI's 270-279\RFI 277", "04_CA\04_RFIs\RFI's 270-279\RFI 278", "04_CA\04_RFIs\RFI's 270-279\RFI 279", "04_CA\04_RFIs\RFI's 280-289\RFI 280", "04_CA\04_RFIs\RFI's 280-289\RFI 281", "04_CA\04_RFIs\RFI's 280-289\RFI 282", "04_CA\04_RFIs\RFI's 280-289\RFI 283", "04_CA\04_RFIs\RFI's 280-289\RFI 284", "04_CA\04_RFIs\RFI's 280-289\RFI 285", "04_CA\04_RFIs\RFI's 280-289\RFI 286", "04_CA\04_RFIs\RFI's 280-289\RFI 287", "04_CA\04_RFIs\RFI's 280-289\RFI 288", "04_CA\04_RFIs\RFI's 280-289\RFI 289", "04_CA\04_RFIs\RFI's 290-299\RFI 290", "04_CA\04_RFIs\RFI's 290-299\RFI 291", "04_CA\04_RFIs\RFI's 290-299\RFI 292", "04_CA\04_RFIs\RFI's 290-299\RFI 293", "04_CA\04_RFIs\RFI's 290-299\RFI 294", "04_CA\04_RFIs\RFI's 290-299\RFI 295", "04_CA\04_RFIs\RFI's 290-299\RFI 296", "04_CA\04_RFIs\RFI's 290-299\RFI 297", "04_CA\04_RFIs\RFI's 290-299\RFI 298", "04_CA\04_RFIs\RFI's 290-299\RFI 299", "04_CA\04_RFIs\RFI's 300-309\300", "04_CA\04_RFIs\RFI's 300-309\301", "04_CA\04_RFIs\RFI's 300-309\302", "04_CA\04_RFIs\RFI's 300-309\303", "04_CA\04_RFIs\RFI's 300-309\304", "04_CA\04_RFIs\RFI's 300-309\305", "04_CA\04_RFIs\RFI's 300-309\306", "04_CA\04_RFIs\RFI's 300-309\307", "04_CA\04_RFIs\RFI's 300-309\308", "04_CA\04_RFIs\RFI's 300-309\309", "04_CA\04_RFIs\RFI's 310-319\310", "04_CA\04_RFIs\RFI's 310-319\311", "04_CA\04_RFIs\RFI's 310-319\312", "04_CA\04_RFIs\RFI's 310-319\313", "04_CA\04_RFIs\RFI's 310-319\314", "04_CA\04_RFIs\RFI's 310-319\315", "04_CA\04_RFIs\RFI's 310-319\316", "04_CA\04_RFIs\RFI's 310-319\317", "04_CA\04_RFIs\RFI's 310-319\318", "04_CA\04_RFIs\RFI's 310-319\319", "04_CA\04_RFIs\RFI's 320-329\320", "04_CA\04_RFIs\RFI's 320-329\321", "04_CA\04_RFIs\RFI's 320-329\322", "04_CA\04_RFIs\RFI's 320-329\323", "04_CA\04_RFIs\RFI's 320-329\324", "04_CA\04_RFIs\RFI's 320-329\325", "04_CA\04_RFIs\RFI's 320-329\326", "04_CA\04_RFIs\RFI's 320-329\327", "04_CA\04_RFIs\RFI's 320-329\328", "04_CA\04_RFIs\RFI's 320-329\329", "04_CA\04_RFIs\RFI's 330-339\330", "04_CA\04_RFIs\RFI's 330-339\331", "04_CA\04_RFIs\RFI's 330-339\332", "04_CA\04_RFIs\RFI's 330-339\334", "04_CA\04_RFIs\RFI's 330-339\335", "04_CA\04_RFIs\RFI's 330-339\336", "04_CA\04_RFIs\RFI's 330-339\337", "04_CA\04_RFIs\RFI's 330-339\338", "04_CA\04_RFIs\RFI's 330-339\339", "04_CA\04_RFIs\RFI's 340-349\340", "04_CA\04_RFIs\RFI's 340-349\341", "04_CA\04_RFIs\RFI's 340-349\342", "04_CA\04_RFIs\RFI's 340-349\343", "04_CA\04_RFIs\RFI's 340-349\344", "04_CA\04_RFIs\RFI's 340-349\345", "04_CA\04_RFIs\RFI's 340-349\346", "04_CA\04_RFIs\RFI's 340-349\347", "04_CA\04_RFIs\RFI's 340-349\348", "04_CA\04_RFIs\RFI's 340-349\349", "04_CA\04_RFIs\RFI's 350-359\350", "04_CA\04_RFIs\RFI's 350-359\351", "04_CA\04_RFIs\RFI's 350-359\352", "04_CA\04_RFIs\RFI's 350-359\353", "04_CA\04_RFIs\RFI's 350-359\354", "04_CA\04_RFIs\RFI's 350-359\355", "04_CA\04_RFIs\RFI's 350-359\356", "04_CA\04_RFIs\RFI's 350-359\357", "04_CA\04_RFIs\RFI's 350-359\358", "04_CA\04_RFIs\RFI's 350-359\359", "04_CA\04_RFIs\RFI's 360-369\360", "04_CA\04_RFIs\RFI's 360-369\361", "04_CA\04_RFIs\RFI's 360-369\362", "04_CA\04_RFIs\RFI's 360-369\363", "04_CA\04_RFIs\RFI's 360-369\364", "04_CA\04_RFIs\RFI's 360-369\365", "04_CA\04_RFIs\RFI's 360-369\366", "04_CA\04_RFIs\RFI's 360-369\367", "04_CA\04_RFIs\RFI's 360-369\368", "04_CA\04_RFIs\RFI's 360-369\369", "04_CA\04_RFIs\RFI's 370-379\370", "04_CA\04_RFIs\RFI's 370-379\371", "04_CA\04_RFIs\RFI's 370-379\372", "04_CA\04_RFIs\RFI's 370-379\373", "04_CA\04_RFIs\RFI's 370-379\374", "04_CA\04_RFIs\RFI's 370-379\375", "04_CA\04_RFIs\RFI's 370-379\376", "04_CA\04_RFIs\RFI's 370-379\377", "04_CA\04_RFIs\RFI's 370-379\378", "04_CA\04_RFIs\RFI's 370-379\379", "04_CA\04_RFIs\RFI's 380-389\380", "04_CA\04_RFIs\RFI's 380-389\381", "04_CA\04_RFIs\RFI's 380-389\382", "04_CA\04_RFIs\RFI's 380-389\383", "04_CA\04_RFIs\RFI's 380-389\384", "04_CA\04_RFIs\RFI's 380-389\385", "04_CA\04_RFIs\RFI's 380-389\386", "04_CA\04_RFIs\RFI's 380-389\387", "04_CA\04_RFIs\RFI's 380-389\388", "04_CA\04_RFIs\RFI's 380-389\389", "04_CA\04_RFIs\RFI's 390-399\390", "04_CA\04_RFIs\RFI's 390-399\391", "04_CA\04_RFIs\RFI's 390-399\392", "04_CA\04_RFIs\RFI's 390-399\393", "04_CA\04_RFIs\RFI's 390-399\394", "04_CA\04_RFIs\RFI's 390-399\395", "04_CA\04_RFIs\RFI's 390-399\396", "04_CA\04_RFIs\RFI's 390-399\397", "04_CA\04_RFIs\RFI's 390-399\398", "04_CA\04_RFIs\RFI's 390-399\399", "04_CA\04_RFIs\RFI's 400-409\400", "04_CA\04_RFIs\RFI's 400-409\401", "04_CA\04_RFIs\RFI's 400-409\402", "04_CA\04_RFIs\RFI's 400-409\403", "04_CA\04_RFIs\RFI's 400-409\404", "04_CA\04_RFIs\RFI's 400-409\405", "04_CA\04_RFIs\RFI's 400-409\406", "04_CA\04_RFIs\RFI's 400-409\407", "04_CA\04_RFIs\RFI's 400-409\408", "04_CA\04_RFIs\RFI's 400-409\409", "04_CA\04_RFIs\RFI's 410-419\410", "04_CA\04_RFIs\RFI's 410-419\411", "04_CA\04_RFIs\RFI's 410-419\412", "04_CA\04_RFIs\RFI's 410-419\413", "04_CA\04_RFIs\RFI's 410-419\414", "04_CA\04_RFIs\RFI's 410-419\415", "04_CA\04_RFIs\RFI's 410-419\416", "04_CA\04_RFIs\RFI's 410-419\417", "04_CA\04_RFIs\RFI's 410-419\418", "04_CA\04_RFIs\RFI's 410-419\419", "04_CA\04_RFIs\RFI's 420-429\420", "04_CA\04_RFIs\RFI's 420-429\421", "04_CA\04_RFIs\RFI's 420-429\422", "04_CA\04_RFIs\RFI's 420-429\423", "04_CA\04_RFIs\RFI's 420-429\424", "04_CA\04_RFIs\RFI's 420-429\425", "04_CA\04_RFIs\RFI's 420-429\426", "04_CA\04_RFIs\RFI's 420-429\427", "04_CA\04_RFIs\RFI's 420-429\428", "04_CA\04_RFIs\RFI's 420-429\429", "04_CA\04_RFIs\RFI's 430-439\430", "04_CA\04_RFIs\RFI's 430-439\431", "04_CA\04_RFIs\RFI's 430-439\432", "04_CA\04_RFIs\RFI's 430-439\433", "04_CA\04_RFIs\RFI's 430-439\434", "04_CA\04_RFIs\RFI's 430-439\435", "04_CA\04_RFIs\RFI's 430-439\436", "04_CA\04_RFIs\RFI's 430-439\437", "04_CA\04_RFIs\RFI's 430-439\438", "04_CA\04_RFIs\RFI's 430-439\439", "04_CA\04_RFIs\RFI's 440-449\440", "04_CA\04_RFIs\RFI's 440-449\441", "04_CA\04_RFIs\RFI's 440-449\442", "04_CA\04_RFIs\RFI's 440-449\443", "04_CA\04_RFIs\RFI's 440-449\444", "04_CA\04_RFIs\RFI's 440-449\445", "04_CA\04_RFIs\RFI's 440-449\446", "04_CA\04_RFIs\RFI's 440-449\447", "04_CA\04_RFIs\RFI's 440-449\448", "04_CA\04_RFIs\RFI's 440-449\449", "04_CA\04_RFIs\RFI's 450-459\450", "04_CA\04_RFIs\RFI's 450-459\451", "04_CA\04_RFIs\RFI's 450-459\452", "04_CA\04_RFIs\RFI's 450-459\453", "04_CA\04_RFIs\RFI's 450-459\454", "04_CA\04_RFIs\RFI's 450-459\455", "04_CA\04_RFIs\RFI's 450-459\456", "04_CA\04_RFIs\RFI's 450-459\457", "04_CA\04_RFIs\RFI's 450-459\458", "04_CA\04_RFIs\RFI's 450-459\459", "04_CA\04_RFIs\RFI's 460-469\460", "04_CA\04_RFIs\RFI's 460-469\461", "04_CA\04_RFIs\RFI's 460-469\462", "04_CA\04_RFIs\RFI's 460-469\463", "04_CA\04_RFIs\RFI's 460-469\464", "04_CA\04_RFIs\RFI's 460-469\465", "04_CA\04_RFIs\RFI's 460-469\466", "04_CA\04_RFIs\RFI's 460-469\467", "04_CA\04_RFIs\RFI's 460-469\468", "04_CA\04_RFIs\RFI's 460-469\469", "04_CA\04_RFIs\RFI's 470-479\470", "04_CA\04_RFIs\RFI's 470-479\471", "04_CA\04_RFIs\RFI's 470-479\472", "04_CA\04_RFIs\RFI's 470-479\473", "04_CA\04_RFIs\RFI's 470-479\474", "04_CA\04_RFIs\RFI's 470-479\475", "04_CA\04_RFIs\RFI's 470-479\476", "04_CA\04_RFIs\RFI's 470-479\477", "04_CA\04_RFIs\RFI's 470-479\478", "04_CA\04_RFIs\RFI's 470-479\479", "04_CA\04_RFIs\RFI's 480-489\480", "04_CA\04_RFIs\RFI's 480-489\481", "04_CA\04_RFIs\RFI's 480-489\482", "04_CA\04_RFIs\RFI's 480-489\483", "04_CA\04_RFIs\RFI's 480-489\484", "04_CA\04_RFIs\RFI's 480-489\485", "04_CA\04_RFIs\RFI's 480-489\486", "04_CA\04_RFIs\RFI's 480-489\487", "04_CA\04_RFIs\RFI's 480-489\488", "04_CA\04_RFIs\RFI's 480-489\489", "04_CA\04_RFIs\RFI's 490-499\490", "04_CA\04_RFIs\RFI's 490-499\491", "04_CA\04_RFIs\RFI's 490-499\492", "04_CA\04_RFIs\RFI's 490-499\493", "04_CA\04_RFIs\RFI's 490-499\494", "04_CA\04_RFIs\RFI's 490-499\495", "04_CA\04_RFIs\RFI's 490-499\496", "04_CA\04_RFIs\RFI's 490-499\497", "04_CA\04_RFIs\RFI's 490-499\498", "04_CA\04_RFIs\RFI's 490-499\499", "04_CA\05_ASIs\ASI's 1-9", "04_CA\05_ASIs\ASI's 10-19", "04_CA\05_ASIs\ASI's 20-29", "04_CA\05_ASIs\ASI's 30-39", "04_CA\05_ASIs\ASI's 40-49", "04_CA\05_ASIs\ASI's 1-9\ASI 1", "04_CA\05_ASIs\ASI's 1-9\ASI 2", "04_CA\05_ASIs\ASI's 1-9\ASI 3", "04_CA\05_ASIs\ASI's 1-9\ASI 4", "04_CA\05_ASIs\ASI's 1-9\ASI 5", "04_CA\05_ASIs\ASI's 1-9\ASI 6", "04_CA\05_ASIs\ASI's 1-9\ASI 7", "04_CA\05_ASIs\ASI's 1-9\ASI 8", "04_CA\05_ASIs\ASI's 1-9\ASI 9", "04_CA\05_ASIs\ASI's 10-19\ASI 10", "04_CA\05_ASIs\ASI's 10-19\ASI 11", "04_CA\05_ASIs\ASI's 10-19\ASI 12", "04_CA\05_ASIs\ASI's 10-19\ASI 13", "04_CA\05_ASIs\ASI's 10-19\ASI 14", "04_CA\05_ASIs\ASI's 10-19\ASI 15", "04_CA\05_ASIs\ASI's 10-19\ASI 16", "04_CA\05_ASIs\ASI's 10-19\ASI 17", "04_CA\05_ASIs\ASI's 10-19\ASI 18", "04_CA\05_ASIs\ASI's 10-19\ASI 19", "04_CA\05_ASIs\ASI's 20-29\ASI 20", "04_CA\05_ASIs\ASI's 20-29\ASI 21", "04_CA\05_ASIs\ASI's 20-29\ASI 22", "04_CA\05_ASIs\ASI's 20-29\ASI 23", "04_CA\05_ASIs\ASI's 20-29\ASI 24", "04_CA\05_ASIs\ASI's 20-29\ASI 25", "04_CA\05_ASIs\ASI's 20-29\ASI 26", "04_CA\05_ASIs\ASI's 20-29\ASI 27", "04_CA\05_ASIs\ASI's 20-29\ASI 28", "04_CA\05_ASIs\ASI's 20-29\ASI 29", "04_CA\05_ASIs\ASI's 30-39\ASI 30", "04_CA\05_ASIs\ASI's 30-39\ASI 31", "04_CA\05_ASIs\ASI's 30-39\ASI 32", "04_CA\05_ASIs\ASI's 30-39\ASI 33", "04_CA\05_ASIs\ASI's 30-39\ASI 34", "04_CA\05_ASIs\ASI's 30-39\ASI 35", "04_CA\05_ASIs\ASI's 30-39\ASI 36", "04_CA\05_ASIs\ASI's 30-39\ASI 37", "04_CA\05_ASIs\ASI's 30-39\ASI 38", "04_CA\05_ASIs\ASI's 30-39\ASI 39", "04_CA\05_ASIs\ASI's 40-49\ASI 40", "04_CA\05_ASIs\ASI's 40-49\ASI 41", "04_CA\05_ASIs\ASI's 40-49\ASI 42", "04_CA\05_ASIs\ASI's 40-49\ASI 43", "04_CA\05_ASIs\ASI's 40-49\ASI 44", "04_CA\05_ASIs\ASI's 40-49\ASI 45", "04_CA\05_ASIs\ASI's 40-49\ASI 46", "04_CA\05_ASIs\ASI's 40-49\ASI 47", "04_CA\05_ASIs\ASI's 40-49\ASI 48", "04_CA\05_ASIs\ASI's 40-49\ASI 49", "05_Specs\01_BOD PRODUCTS\Appliances", "05_Specs\01_BOD PRODUCTS\Canopies and Awnings", "05_Specs\01_BOD PRODUCTS\Chutes and Compactors", "05_Specs\01_BOD PRODUCTS\Elevators", "05_Specs\01_BOD PRODUCTS\Entrance Doors", "05_Specs\01_BOD PRODUCTS\Expansion Joints", "05_Specs\01_BOD PRODUCTS\Exterior Wall", "05_Specs\01_BOD PRODUCTS\Flooring", "05_Specs\01_BOD PRODUCTS\Hardware", "05_Specs\01_BOD PRODUCTS\Light Fixtures", "05_Specs\01_BOD PRODUCTS\Lockers", "05_Specs\01_BOD PRODUCTS\Louvers", "05_Specs\01_BOD PRODUCTS\Millwork and Cabinetry", "05_Specs\01_BOD PRODUCTS\Other", "05_Specs\01_BOD PRODUCTS\Overhead Doors", "05_Specs\01_BOD PRODUCTS\Plumbing Fixtures", "05_Specs\01_BOD PRODUCTS\Railings", "05_Specs\01_BOD PRODUCTS\Roofing and Waterproofing", "05_Specs\01_BOD PRODUCTS\Skylights", "05_Specs\01_BOD PRODUCTS\Specialty Finishes", "05_Specs\01_BOD PRODUCTS\Toilet Partitions", "05_Specs\01_BOD PRODUCTS\Window Systems", "04_CA\06_RFPs\RFP's 1-9", "04_CA\06_RFPs\RFP's 10-19", "04_CA\06_RFPs\RFP's 20-29", "04_CA\06_RFPs\RFP's 30-39", "04_CA\06_RFPs\RFP's 40-49", "04_CA\06_RFPs\RFP's 50-59", "04_CA\06_RFPs\RFP's 1-9\PR 1", "04_CA\06_RFPs\RFP's 1-9\PR 2", "04_CA\06_RFPs\RFP's 1-9\PR 3", "04_CA\06_RFPs\RFP's 1-9\PR 4", "04_CA\06_RFPs\RFP's 1-9\PR 5", "04_CA\06_RFPs\RFP's 1-9\PR 6", "04_CA\06_RFPs\RFP's 1-9\PR 7", "04_CA\06_RFPs\RFP's 1-9\PR 8", "04_CA\06_RFPs\RFP's 1-9\PR 9", "04_CA\06_RFPs\RFP's 10-19\PR 10", "04_CA\06_RFPs\RFP's 10-19\PR 11", "04_CA\06_RFPs\RFP's 10-19\PR 12", "04_CA\06_RFPs\RFP's 10-19\PR 13", "04_CA\06_RFPs\RFP's 10-19\PR 14", "04_CA\06_RFPs\RFP's 10-19\PR 15", "04_CA\06_RFPs\RFP's 10-19\PR 16", "04_CA\06_RFPs\RFP's 10-19\PR 17", "04_CA\06_RFPs\RFP's 10-19\PR 18", "04_CA\06_RFPs\RFP's 10-19\PR 19", "04_CA\06_RFPs\RFP's 20-29\PR 20", "04_CA\06_RFPs\RFP's 20-29\PR 21", "04_CA\06_RFPs\RFP's 20-29\PR 22", "04_CA\06_RFPs\RFP's 20-29\PR 23", "04_CA\06_RFPs\RFP's 20-29\PR 24", "04_CA\06_RFPs\RFP's 20-29\PR 25", "04_CA\06_RFPs\RFP's 20-29\PR 26", "04_CA\06_RFPs\RFP's 20-29\PR 27", "04_CA\06_RFPs\RFP's 20-29\PR 28", "04_CA\06_RFPs\RFP's 20-29\PR 29", "04_CA\06_RFPs\RFP's 30-39\PR 30", "04_CA\06_RFPs\RFP's 30-39\PR 31", "04_CA\06_RFPs\RFP's 30-39\PR 32", "04_CA\06_RFPs\RFP's 30-39\PR 33", "04_CA\06_RFPs\RFP's 30-39\PR 34", "04_CA\06_RFPs\RFP's 30-39\PR 35", "04_CA\06_RFPs\RFP's 30-39\PR 36", "04_CA\06_RFPs\RFP's 30-39\PR 37", "04_CA\06_RFPs\RFP's 30-39\PR 38", "04_CA\06_RFPs\RFP's 30-39\PR 39", "04_CA\06_RFPs\RFP's 40-49\PR 40", "04_CA\06_RFPs\RFP's 40-49\PR 41", "04_CA\06_RFPs\RFP's 40-49\PR 42", "04_CA\06_RFPs\RFP's 40-49\PR 43", "04_CA\06_RFPs\RFP's 40-49\PR 44", "04_CA\06_RFPs\RFP's 40-49\PR 45", "04_CA\06_RFPs\RFP's 40-49\PR 46", "04_CA\06_RFPs\RFP's 40-49\PR 47", "04_CA\06_RFPs\RFP's 40-49\PR 48", "04_CA\06_RFPs\RFP's 40-49\PR 49", "04_CA\06_RFPs\RFP's 50-59\PR 50", "04_CA\06_RFPs\RFP's 50-59\PR 51", "04_CA\06_RFPs\RFP's 50-59\PR 52", "04_CA\06_RFPs\RFP's 50-59\PR 53", "04_CA\06_RFPs\RFP's 50-59\PR 54", "04_CA\06_RFPs\RFP's 50-59\PR 55", "04_CA\06_RFPs\RFP's 50-59\PR 56", "04_CA\06_RFPs\RFP's 50-59\PR 57", "04_CA\06_RFPs\RFP's 50-59\PR 58", "04_CA\06_RFPs\RFP's 50-59\PR 59", "04_CA\07_CCDs\CCD's 1-9", "04_CA\07_CCDs\CCD's 10-19", "04_CA\07_CCDs\CCD's 1-9\CCD 1", "04_CA\07_CCDs\CCD's 1-9\CCD 2", "04_CA\07_CCDs\CCD's 1-9\CCD 3", "04_CA\07_CCDs\CCD's 1-9\CCD 4", "04_CA\07_CCDs\CCD's 1-9\CCD 5", "04_CA\07_CCDs\CCD's 1-9\CCD 6", "04_CA\07_CCDs\CCD's 1-9\CCD 7", "04_CA\07_CCDs\CCD's 1-9\CCD 8", "04_CA\07_CCDs\CCD's 1-9\CCD 9", "04_CA\07_CCDs\CCD's 10-19\CCD 10", "04_CA\07_CCDs\CCD's 10-19\CCD 11", "04_CA\07_CCDs\CCD's 10-19\CCD 12", "04_CA\07_CCDs\CCD's 10-19\CCD 13", "04_CA\07_CCDs\CCD's 10-19\CCD 14", "04_CA\07_CCDs\CCD's 10-19\CCD 15", "04_CA\07_CCDs\CCD's 10-19\CCD 16", "04_CA\07_CCDs\CCD's 10-19\CCD 17", "04_CA\07_CCDs\CCD's 10-19\CCD 18", "04_CA\07_CCDs\CCD's 10-19\CCD 19", "04_CA\08_PCOs\PCO's 1-9", "04_CA\08_PCOs\PCO's 10-19", "04_CA\08_PCOs\PCO's 20-29", "04_CA\08_PCOs\PCO's 30-39", "04_CA\08_PCOs\PCO's 40-49", "04_CA\08_PCOs\PCO's 50-59", "04_CA\08_PCOs\PCO's 60-69", "04_CA\08_PCOs\PCO's 70-79", "04_CA\08_PCOs\PCO's 80-89", "04_CA\08_PCOs\PCO's 90-99", "04_CA\08_PCOs\PCO's 1-9\PCO 1", "04_CA\08_PCOs\PCO's 1-9\PCO 2", "04_CA\08_PCOs\PCO's 1-9\PCO 3", "04_CA\08_PCOs\PCO's 1-9\PCO 4", "04_CA\08_PCOs\PCO's 1-9\PCO 5", "04_CA\08_PCOs\PCO's 1-9\PCO 6", "04_CA\08_PCOs\PCO's 1-9\PCO 7", "04_CA\08_PCOs\PCO's 1-9\PCO 8", "04_CA\08_PCOs\PCO's 1-9\PCO 9", "04_CA\08_PCOs\PCO's 10-19\PCO 10", "04_CA\08_PCOs\PCO's 10-19\PCO 11", "04_CA\08_PCOs\PCO's 10-19\PCO 12", "04_CA\08_PCOs\PCO's 10-19\PCO 13", "04_CA\08_PCOs\PCO's 10-19\PCO 14", "04_CA\08_PCOs\PCO's 10-19\PCO 15", "04_CA\08_PCOs\PCO's 10-19\PCO 16", "04_CA\08_PCOs\PCO's 10-19\PCO 17", "04_CA\08_PCOs\PCO's 10-19\PCO 18", "04_CA\08_PCOs\PCO's 10-19\PCO 19", "04_CA\08_PCOs\PCO's 20-29\PCO 20", "04_CA\08_PCOs\PCO's 20-29\PCO 21", "04_CA\08_PCOs\PCO's 20-29\PCO 22", "04_CA\08_PCOs\PCO's 20-29\PCO 23", "04_CA\08_PCOs\PCO's 20-29\PCO 24", "04_CA\08_PCOs\PCO's 20-29\PCO 25", "04_CA\08_PCOs\PCO's 20-29\PCO 26", "04_CA\08_PCOs\PCO's 20-29\PCO 27", "04_CA\08_PCOs\PCO's 20-29\PCO 28", "04_CA\08_PCOs\PCO's 20-29\PCO 29", "04_CA\08_PCOs\PCO's 30-39\PCO 30", "04_CA\08_PCOs\PCO's 30-39\PCO 31", "04_CA\08_PCOs\PCO's 30-39\PCO 32", "04_CA\08_PCOs\PCO's 30-39\PCO 33", "04_CA\08_PCOs\PCO's 30-39\PCO 34", "04_CA\08_PCOs\PCO's 30-39\PCO 35", "04_CA\08_PCOs\PCO's 30-39\PCO 36", "04_CA\08_PCOs\PCO's 30-39\PCO 37", "04_CA\08_PCOs\PCO's 30-39\PCO 38", "04_CA\08_PCOs\PCO's 30-39\PCO 39", "04_CA\08_PCOs\PCO's 40-49\PCO 40", "04_CA\08_PCOs\PCO's 40-49\PCO 41", "04_CA\08_PCOs\PCO's 40-49\PCO 42", "04_CA\08_PCOs\PCO's 40-49\PCO 43", "04_CA\08_PCOs\PCO's 40-49\PCO 44", "04_CA\08_PCOs\PCO's 40-49\PCO 45", "04_CA\08_PCOs\PCO's 40-49\PCO 46", "04_CA\08_PCOs\PCO's 40-49\PCO 47", "04_CA\08_PCOs\PCO's 40-49\PCO 48", "04_CA\08_PCOs\PCO's 40-49\PCO 49", "04_CA\08_PCOs\PCO's 50-59\PCO 50", "04_CA\08_PCOs\PCO's 50-59\PCO 51", "04_CA\08_PCOs\PCO's 50-59\PCO 52", "04_CA\08_PCOs\PCO's 50-59\PCO 53", "04_CA\08_PCOs\PCO's 50-59\PCO 54", "04_CA\08_PCOs\PCO's 50-59\PCO 55", "04_CA\08_PCOs\PCO's 50-59\PCO 56", "04_CA\08_PCOs\PCO's 50-59\PCO 57", "04_CA\08_PCOs\PCO's 50-59\PCO 58", "04_CA\08_PCOs\PCO's 50-59\PCO 59", "04_CA\08_PCOs\PCO's 60-69\PCO 60", "04_CA\08_PCOs\PCO's 60-69\PCO 61", "04_CA\08_PCOs\PCO's 60-69\PCO 62", "04_CA\08_PCOs\PCO's 60-69\PCO 63", "04_CA\08_PCOs\PCO's 60-69\PCO 64", "04_CA\08_PCOs\PCO's 60-69\PCO 65", "04_CA\08_PCOs\PCO's 60-69\PCO 66", "04_CA\08_PCOs\PCO's 60-69\PCO 67", "04_CA\08_PCOs\PCO's 60-69\PCO 68", "04_CA\08_PCOs\PCO's 60-69\PCO 69", "04_CA\08_PCOs\PCO's 70-79\PCO 70", "04_CA\08_PCOs\PCO's 70-79\PCO 71", "04_CA\08_PCOs\PCO's 70-79\PCO 72", "04_CA\08_PCOs\PCO's 70-79\PCO 73", "04_CA\08_PCOs\PCO's 70-79\PCO 74", "04_CA\08_PCOs\PCO's 70-79\PCO 75", "04_CA\08_PCOs\PCO's 70-79\PCO 76", "04_CA\08_PCOs\PCO's 70-79\PCO 77", "04_CA\08_PCOs\PCO's 70-79\PCO 78", "04_CA\08_PCOs\PCO's 70-79\PCO 79", "04_CA\08_PCOs\PCO's 80-89\PCO 80", "04_CA\08_PCOs\PCO's 80-89\PCO 81", "04_CA\08_PCOs\PCO's 80-89\PCO 82", "04_CA\08_PCOs\PCO's 80-89\PCO 83", "04_CA\08_PCOs\PCO's 80-89\PCO 84", "04_CA\08_PCOs\PCO's 80-89\PCO 85", "04_CA\08_PCOs\PCO's 80-89\PCO 86", "04_CA\08_PCOs\PCO's 80-89\PCO 87", "04_CA\08_PCOs\PCO's 80-89\PCO 88", "04_CA\08_PCOs\PCO's 80-89\PCO 89", "04_CA\08_PCOs\PCO's 90-99\PCO 90", "04_CA\08_PCOs\PCO's 90-99\PCO 91", "04_CA\08_PCOs\PCO's 90-99\PCO 92", "04_CA\08_PCOs\PCO's 90-99\PCO 93", "04_CA\08_PCOs\PCO's 90-99\PCO 94", "04_CA\08_PCOs\PCO's 90-99\PCO 95", "04_CA\08_PCOs\PCO's 90-99\PCO 96", "04_CA\08_PCOs\PCO's 90-99\PCO 97", "04_CA\08_PCOs\PCO's 90-99\PCO 98", "04_CA\08_PCOs\PCO's 90-99\PCO 99", "04_CA\09_Change Orders\CO #01", "04_CA\09_Change Orders\CO #02", "04_CA\09_Change Orders\CO #03", "04_CA\09_Change Orders\CO #04", "04_CA\09_Change Orders\CO #05", "04_CA\09_Change Orders\CO #06", "04_CA\09_Change Orders\CO #07", "04_CA\09_Change Orders\CO #08", "04_CA\09_Change Orders\CO #09", "04_CA\09_Change Orders\CO #10", "04_CA\10_Pay Apps\Pay App #01", "04_CA\10_Pay Apps\Pay App #02", "04_CA\10_Pay Apps\Pay App #03", "04_CA\10_Pay Apps\Pay App #04", "04_CA\10_Pay Apps\Pay App #05", "04_CA\10_Pay Apps\Pay App #06", "04_CA\10_Pay Apps\Pay App #07", "04_CA\10_Pay Apps\Pay App #08", "04_CA\10_Pay Apps\Pay App #09", "04_CA\10_Pay Apps\Pay App #10", "04_CA\10_Pay Apps\Pay App #11", "04_CA\10_Pay Apps\Pay App #12")
    2 = @("01_Drawings\01_Design\20yy-mm-dd Name of Deliverable", "01_Drawings\01_Design\01_Model\20yy-mm-dd Name of Deliverable", "01_Drawings\02_Existing\01_Existing Photos\20yy-mm-dd Description of photos", "01_Drawings\02_Existing\02_Existing Drawings\20yy-mm-dd Description of drawings", "01_Drawings\06_Issued Sets\01_Entitlements\20yy-mm-dd Issued Set Description", "01_Drawings\06_Issued Sets\02_Progress\20yy-mm-dd Progress Set Description", "01_Drawings\06_Issued Sets\03_Submissions\20yy-mm-dd Submission Description", "02_Docs\08_Meetings\20yy-mm-dd Meeting Description", "05_Specs\20yy-mm-dd Name of Set", "04_CA\04_RFIs\RFI's 001-009", "04_CA\04_RFIs\RFI's 010-019", "04_CA\04_RFIs\RFI's 020-029", "04_CA\04_RFIs\RFI's 030-039", "04_CA\04_RFIs\RFI's 040-049", "04_CA\04_RFIs\RFI's 050-059", "04_CA\04_RFIs\RFI's 060-069", "04_CA\04_RFIs\RFI's 070-079", "04_CA\04_RFIs\RFI's 080-089", "04_CA\04_RFIs\RFI's 090-099", "04_CA\04_RFIs\RFI's 100-109", "04_CA\04_RFIs\RFI's 110-119", "04_CA\04_RFIs\RFI's 120-129", "04_CA\04_RFIs\RFI's 130-139", "04_CA\04_RFIs\RFI's 140-149", "04_CA\04_RFIs\RFI's 150-159", "04_CA\04_RFIs\RFI's 160-169", "04_CA\04_RFIs\RFI's 170-179", "04_CA\04_RFIs\RFI's 180-189", "04_CA\04_RFIs\RFI's 190-199", "04_CA\04_RFIs\RFI's 200-209", "04_CA\04_RFIs\RFI's 210-219", "04_CA\04_RFIs\RFI's 220-229", "04_CA\04_RFIs\RFI's 230-239", "04_CA\04_RFIs\RFI's 240-249", "04_CA\04_RFIs\RFI's 250-259", "04_CA\04_RFIs\RFI's 260-269", "04_CA\04_RFIs\RFI's 270-279", "04_CA\04_RFIs\RFI's 280-289", "04_CA\04_RFIs\RFI's 290-299", "04_CA\04_RFIs\RFI's 300-309", "04_CA\04_RFIs\RFI's 310-319", "04_CA\04_RFIs\RFI's 320-329", "04_CA\04_RFIs\RFI's 330-339", "04_CA\04_RFIs\RFI's 340-349", "04_CA\04_RFIs\RFI's 350-359", "04_CA\04_RFIs\RFI's 360-369", "04_CA\04_RFIs\RFI's 370-379", "04_CA\04_RFIs\RFI's 380-389", "04_CA\04_RFIs\RFI's 390-399", "04_CA\04_RFIs\RFI's 400-409", "04_CA\04_RFIs\RFI's 410-419", "04_CA\04_RFIs\RFI's 420-429", "04_CA\04_RFIs\RFI's 430-439", "04_CA\04_RFIs\RFI's 440-449", "04_CA\04_RFIs\RFI's 450-459", "04_CA\04_RFIs\RFI's 460-469", "04_CA\04_RFIs\RFI's 470-479", "04_CA\04_RFIs\RFI's 480-489", "04_CA\04_RFIs\RFI's 490-499", "04_CA\04_RFIs\RFI's 001-009\RFI 1", "04_CA\04_RFIs\RFI's 001-009\RFI 2", "04_CA\04_RFIs\RFI's 001-009\RFI 3", "04_CA\04_RFIs\RFI's 001-009\RFI 4", "04_CA\04_RFIs\RFI's 001-009\RFI 5", "04_CA\04_RFIs\RFI's 001-009\RFI 6", "04_CA\04_RFIs\RFI's 001-009\RFI 7", "04_CA\04_RFIs\RFI's 001-009\RFI 8", "04_CA\04_RFIs\RFI's 001-009\RFI 9", "04_CA\04_RFIs\RFI's 010-019\RFI 10", "04_CA\04_RFIs\RFI's 010-019\RFI 11", "04_CA\04_RFIs\RFI's 010-019\RFI 12", "04_CA\04_RFIs\RFI's 010-019\RFI 13", "04_CA\04_RFIs\RFI's 010-019\RFI 14", "04_CA\04_RFIs\RFI's 010-019\RFI 15", "04_CA\04_RFIs\RFI's 010-019\RFI 16", "04_CA\04_RFIs\RFI's 010-019\RFI 17", "04_CA\04_RFIs\RFI's 010-019\RFI 18", "04_CA\04_RFIs\RFI's 010-019\RFI 19", "04_CA\04_RFIs\RFI's 020-029\RFI 20", "04_CA\04_RFIs\RFI's 020-029\RFI 21", "04_CA\04_RFIs\RFI's 020-029\RFI 22", "04_CA\04_RFIs\RFI's 020-029\RFI 23", "04_CA\04_RFIs\RFI's 020-029\RFI 24", "04_CA\04_RFIs\RFI's 020-029\RFI 25", "04_CA\04_RFIs\RFI's 020-029\RFI 26", "04_CA\04_RFIs\RFI's 020-029\RFI 27", "04_CA\04_RFIs\RFI's 020-029\RFI 28", "04_CA\04_RFIs\RFI's 020-029\RFI 29", "04_CA\04_RFIs\RFI's 030-039\RFI 30", "04_CA\04_RFIs\RFI's 030-039\RFI 31", "04_CA\04_RFIs\RFI's 030-039\RFI 32", "04_CA\04_RFIs\RFI's 030-039\RFI 33", "04_CA\04_RFIs\RFI's 030-039\RFI 34", "04_CA\04_RFIs\RFI's 030-039\RFI 35", "04_CA\04_RFIs\RFI's 030-039\RFI 36", "04_CA\04_RFIs\RFI's 030-039\RFI 37", "04_CA\04_RFIs\RFI's 030-039\RFI 38", "04_CA\04_RFIs\RFI's 030-039\RFI 39", "04_CA\04_RFIs\RFI's 040-049\RFI 40", "04_CA\04_RFIs\RFI's 040-049\RFI 41", "04_CA\04_RFIs\RFI's 040-049\RFI 42", "04_CA\04_RFIs\RFI's 040-049\RFI 43", "04_CA\04_RFIs\RFI's 040-049\RFI 44", "04_CA\04_RFIs\RFI's 040-049\RFI 45", "04_CA\04_RFIs\RFI's 040-049\RFI 46", "04_CA\04_RFIs\RFI's 040-049\RFI 47", "04_CA\04_RFIs\RFI's 040-049\RFI 48", "04_CA\04_RFIs\RFI's 040-049\RFI 49", "04_CA\04_RFIs\RFI's 050-059\RFI 50", "04_CA\04_RFIs\RFI's 050-059\RFI 51", "04_CA\04_RFIs\RFI's 050-059\RFI 52", "04_CA\04_RFIs\RFI's 050-059\RFI 53", "04_CA\04_RFIs\RFI's 050-059\RFI 54", "04_CA\04_RFIs\RFI's 050-059\RFI 55", "04_CA\04_RFIs\RFI's 050-059\RFI 56", "04_CA\04_RFIs\RFI's 050-059\RFI 57", "04_CA\04_RFIs\RFI's 050-059\RFI 58", "04_CA\04_RFIs\RFI's 050-059\RFI 59", "04_CA\04_RFIs\RFI's 060-069\RFI 60", "04_CA\04_RFIs\RFI's 060-069\RFI 61", "04_CA\04_RFIs\RFI's 060-069\RFI 62", "04_CA\04_RFIs\RFI's 060-069\RFI 63", "04_CA\04_RFIs\RFI's 060-069\RFI 64", "04_CA\04_RFIs\RFI's 060-069\RFI 65", "04_CA\04_RFIs\RFI's 060-069\RFI 66", "04_CA\04_RFIs\RFI's 060-069\RFI 67", "04_CA\04_RFIs\RFI's 060-069\RFI 68", "04_CA\04_RFIs\RFI's 060-069\RFI 69", "04_CA\04_RFIs\RFI's 070-079\RFI 70", "04_CA\04_RFIs\RFI's 070-079\RFI 71", "04_CA\04_RFIs\RFI's 070-079\RFI 72", "04_CA\04_RFIs\RFI's 070-079\RFI 73", "04_CA\04_RFIs\RFI's 070-079\RFI 74", "04_CA\04_RFIs\RFI's 070-079\RFI 75", "04_CA\04_RFIs\RFI's 070-079\RFI 76", "04_CA\04_RFIs\RFI's 070-079\RFI 77", "04_CA\04_RFIs\RFI's 070-079\RFI 78", "04_CA\04_RFIs\RFI's 070-079\RFI 79", "04_CA\04_RFIs\RFI's 080-089\RFI 80", "04_CA\04_RFIs\RFI's 080-089\RFI 81", "04_CA\04_RFIs\RFI's 080-089\RFI 82", "04_CA\04_RFIs\RFI's 080-089\RFI 83", "04_CA\04_RFIs\RFI's 080-089\RFI 84", "04_CA\04_RFIs\RFI's 080-089\RFI 85", "04_CA\04_RFIs\RFI's 080-089\RFI 86", "04_CA\04_RFIs\RFI's 080-089\RFI 87", "04_CA\04_RFIs\RFI's 080-089\RFI 88", "04_CA\04_RFIs\RFI's 080-089\RFI 89", "04_CA\04_RFIs\RFI's 090-099\RFI 90", "04_CA\04_RFIs\RFI's 090-099\RFI 91", "04_CA\04_RFIs\RFI's 090-099\RFI 92", "04_CA\04_RFIs\RFI's 090-099\RFI 93", "04_CA\04_RFIs\RFI's 090-099\RFI 94", "04_CA\04_RFIs\RFI's 090-099\RFI 95", "04_CA\04_RFIs\RFI's 090-099\RFI 96", "04_CA\04_RFIs\RFI's 090-099\RFI 97", "04_CA\04_RFIs\RFI's 090-099\RFI 98", "04_CA\04_RFIs\RFI's 090-099\RFI 99", "04_CA\04_RFIs\RFI's 100-109\RFI 100", "04_CA\04_RFIs\RFI's 100-109\RFI 101", "04_CA\04_RFIs\RFI's 100-109\RFI 102", "04_CA\04_RFIs\RFI's 100-109\RFI 103", "04_CA\04_RFIs\RFI's 100-109\RFI 104", "04_CA\04_RFIs\RFI's 100-109\RFI 105", "04_CA\04_RFIs\RFI's 100-109\RFI 106", "04_CA\04_RFIs\RFI's 100-109\RFI 107", "04_CA\04_RFIs\RFI's 100-109\RFI 108", "04_CA\04_RFIs\RFI's 100-109\RFI 109", "04_CA\04_RFIs\RFI's 110-119\RFI 110", "04_CA\04_RFIs\RFI's 110-119\RFI 111", "04_CA\04_RFIs\RFI's 110-119\RFI 112", "04_CA\04_RFIs\RFI's 110-119\RFI 113", "04_CA\04_RFIs\RFI's 110-119\RFI 114", "04_CA\04_RFIs\RFI's 110-119\RFI 115", "04_CA\04_RFIs\RFI's 110-119\RFI 116", "04_CA\04_RFIs\RFI's 110-119\RFI 117", "04_CA\04_RFIs\RFI's 110-119\RFI 118", "04_CA\04_RFIs\RFI's 110-119\RFI 119", "04_CA\04_RFIs\RFI's 120-129\RFI 120", "04_CA\04_RFIs\RFI's 120-129\RFI 121", "04_CA\04_RFIs\RFI's 120-129\RFI 122", "04_CA\04_RFIs\RFI's 120-129\RFI 123", "04_CA\04_RFIs\RFI's 120-129\RFI 124", "04_CA\04_RFIs\RFI's 120-129\RFI 125", "04_CA\04_RFIs\RFI's 120-129\RFI 126", "04_CA\04_RFIs\RFI's 120-129\RFI 127", "04_CA\04_RFIs\RFI's 120-129\RFI 128", "04_CA\04_RFIs\RFI's 120-129\RFI 129", "04_CA\04_RFIs\RFI's 130-139\RFI 130", "04_CA\04_RFIs\RFI's 130-139\RFI 131", "04_CA\04_RFIs\RFI's 130-139\RFI 132", "04_CA\04_RFIs\RFI's 130-139\RFI 133", "04_CA\04_RFIs\RFI's 130-139\RFI 134", "04_CA\04_RFIs\RFI's 130-139\RFI 135", "04_CA\04_RFIs\RFI's 130-139\RFI 136", "04_CA\04_RFIs\RFI's 130-139\RFI 137", "04_CA\04_RFIs\RFI's 130-139\RFI 138", "04_CA\04_RFIs\RFI's 130-139\RFI 139", "04_CA\04_RFIs\RFI's 140-149\RFI 140", "04_CA\04_RFIs\RFI's 140-149\RFI 141", "04_CA\04_RFIs\RFI's 140-149\RFI 142", "04_CA\04_RFIs\RFI's 140-149\RFI 143", "04_CA\04_RFIs\RFI's 140-149\RFI 144", "04_CA\04_RFIs\RFI's 140-149\RFI 145", "04_CA\04_RFIs\RFI's 140-149\RFI 146", "04_CA\04_RFIs\RFI's 140-149\RFI 147", "04_CA\04_RFIs\RFI's 140-149\RFI 148", "04_CA\04_RFIs\RFI's 140-149\RFI 149", "04_CA\04_RFIs\RFI's 150-159\RFI 150", "04_CA\04_RFIs\RFI's 150-159\RFI 151", "04_CA\04_RFIs\RFI's 150-159\RFI 152", "04_CA\04_RFIs\RFI's 150-159\RFI 153", "04_CA\04_RFIs\RFI's 150-159\RFI 154", "04_CA\04_RFIs\RFI's 150-159\RFI 155", "04_CA\04_RFIs\RFI's 150-159\RFI 156", "04_CA\04_RFIs\RFI's 150-159\RFI 157", "04_CA\04_RFIs\RFI's 150-159\RFI 158", "04_CA\04_RFIs\RFI's 150-159\RFI 159", "04_CA\04_RFIs\RFI's 160-169\RFI 160", "04_CA\04_RFIs\RFI's 160-169\RFI 161", "04_CA\04_RFIs\RFI's 160-169\RFI 162", "04_CA\04_RFIs\RFI's 160-169\RFI 163", "04_CA\04_RFIs\RFI's 160-169\RFI 164", "04_CA\04_RFIs\RFI's 160-169\RFI 165", "04_CA\04_RFIs\RFI's 160-169\RFI 166", "04_CA\04_RFIs\RFI's 160-169\RFI 167", "04_CA\04_RFIs\RFI's 160-169\RFI 168", "04_CA\04_RFIs\RFI's 160-169\RFI 169", "04_CA\04_RFIs\RFI's 170-179\RFI 170", "04_CA\04_RFIs\RFI's 170-179\RFI 171", "04_CA\04_RFIs\RFI's 170-179\RFI 172", "04_CA\04_RFIs\RFI's 170-179\RFI 173", "04_CA\04_RFIs\RFI's 170-179\RFI 174", "04_CA\04_RFIs\RFI's 170-179\RFI 175", "04_CA\04_RFIs\RFI's 170-179\RFI 176", "04_CA\04_RFIs\RFI's 170-179\RFI 177", "04_CA\04_RFIs\RFI's 170-179\RFI 178", "04_CA\04_RFIs\RFI's 170-179\RFI 179", "04_CA\04_RFIs\RFI's 180-189\RFI 180", "04_CA\04_RFIs\RFI's 180-189\RFI 181", "04_CA\04_RFIs\RFI's 180-189\RFI 182", "04_CA\04_RFIs\RFI's 180-189\RFI 183", "04_CA\04_RFIs\RFI's 180-189\RFI 184", "04_CA\04_RFIs\RFI's 180-189\RFI 185", "04_CA\04_RFIs\RFI's 180-189\RFI 186", "04_CA\04_RFIs\RFI's 180-189\RFI 187", "04_CA\04_RFIs\RFI's 180-189\RFI 188", "04_CA\04_RFIs\RFI's 180-189\RFI 189", "04_CA\04_RFIs\RFI's 190-199\RFI 190", "04_CA\04_RFIs\RFI's 190-199\RFI 191", "04_CA\04_RFIs\RFI's 190-199\RFI 192", "04_CA\04_RFIs\RFI's 190-199\RFI 193", "04_CA\04_RFIs\RFI's 190-199\RFI 194", "04_CA\04_RFIs\RFI's 190-199\RFI 195", "04_CA\04_RFIs\RFI's 190-199\RFI 196", "04_CA\04_RFIs\RFI's 190-199\RFI 197", "04_CA\04_RFIs\RFI's 190-199\RFI 198", "04_CA\04_RFIs\RFI's 190-199\RFI 199", "04_CA\04_RFIs\RFI's 200-209\RFI 200", "04_CA\04_RFIs\RFI's 200-209\RFI 201", "04_CA\04_RFIs\RFI's 200-209\RFI 202", "04_CA\04_RFIs\RFI's 200-209\RFI 203", "04_CA\04_RFIs\RFI's 200-209\RFI 204", "04_CA\04_RFIs\RFI's 200-209\RFI 205", "04_CA\04_RFIs\RFI's 200-209\RFI 206", "04_CA\04_RFIs\RFI's 200-209\RFI 207", "04_CA\04_RFIs\RFI's 200-209\RFI 208", "04_CA\04_RFIs\RFI's 200-209\RFI 209", "04_CA\04_RFIs\RFI's 210-219\RFI 210", "04_CA\04_RFIs\RFI's 210-219\RFI 211", "04_CA\04_RFIs\RFI's 210-219\RFI 212", "04_CA\04_RFIs\RFI's 210-219\RFI 213", "04_CA\04_RFIs\RFI's 210-219\RFI 214", "04_CA\04_RFIs\RFI's 210-219\RFI 215", "04_CA\04_RFIs\RFI's 210-219\RFI 216", "04_CA\04_RFIs\RFI's 210-219\RFI 217", "04_CA\04_RFIs\RFI's 210-219\RFI 218", "04_CA\04_RFIs\RFI's 210-219\RFI 219", "04_CA\04_RFIs\RFI's 220-229\RFI 220", "04_CA\04_RFIs\RFI's 220-229\RFI 221", "04_CA\04_RFIs\RFI's 220-229\RFI 222", "04_CA\04_RFIs\RFI's 220-229\RFI 223", "04_CA\04_RFIs\RFI's 220-229\RFI 224", "04_CA\04_RFIs\RFI's 220-229\RFI 225", "04_CA\04_RFIs\RFI's 220-229\RFI 226", "04_CA\04_RFIs\RFI's 220-229\RFI 227", "04_CA\04_RFIs\RFI's 220-229\RFI 228", "04_CA\04_RFIs\RFI's 220-229\RFI 229", "04_CA\04_RFIs\RFI's 230-239\RFI 230", "04_CA\04_RFIs\RFI's 230-239\RFI 231", "04_CA\04_RFIs\RFI's 230-239\RFI 232", "04_CA\04_RFIs\RFI's 230-239\RFI 233", "04_CA\04_RFIs\RFI's 230-239\RFI 234", "04_CA\04_RFIs\RFI's 230-239\RFI 235", "04_CA\04_RFIs\RFI's 230-239\RFI 236", "04_CA\04_RFIs\RFI's 230-239\RFI 237", "04_CA\04_RFIs\RFI's 230-239\RFI 238", "04_CA\04_RFIs\RFI's 230-239\RFI 239", "04_CA\04_RFIs\RFI's 240-249\RFI 240", "04_CA\04_RFIs\RFI's 240-249\RFI 241", "04_CA\04_RFIs\RFI's 240-249\RFI 242", "04_CA\04_RFIs\RFI's 240-249\RFI 243", "04_CA\04_RFIs\RFI's 240-249\RFI 244", "04_CA\04_RFIs\RFI's 240-249\RFI 245", "04_CA\04_RFIs\RFI's 240-249\RFI 246", "04_CA\04_RFIs\RFI's 240-249\RFI 247", "04_CA\04_RFIs\RFI's 240-249\RFI 248", "04_CA\04_RFIs\RFI's 240-249\RFI 249", "04_CA\04_RFIs\RFI's 250-259\RFI 250", "04_CA\04_RFIs\RFI's 250-259\RFI 251", "04_CA\04_RFIs\RFI's 250-259\RFI 252", "04_CA\04_RFIs\RFI's 250-259\RFI 253", "04_CA\04_RFIs\RFI's 250-259\RFI 254", "04_CA\04_RFIs\RFI's 250-259\RFI 255", "04_CA\04_RFIs\RFI's 250-259\RFI 256", "04_CA\04_RFIs\RFI's 250-259\RFI 257", "04_CA\04_RFIs\RFI's 250-259\RFI 258", "04_CA\04_RFIs\RFI's 250-259\RFI 259", "04_CA\04_RFIs\RFI's 260-269\RFI 260", "04_CA\04_RFIs\RFI's 260-269\RFI 261", "04_CA\04_RFIs\RFI's 260-269\RFI 262", "04_CA\04_RFIs\RFI's 260-269\RFI 263", "04_CA\04_RFIs\RFI's 260-269\RFI 264", "04_CA\04_RFIs\RFI's 260-269\RFI 265", "04_CA\04_RFIs\RFI's 260-269\RFI 266", "04_CA\04_RFIs\RFI's 260-269\RFI 267", "04_CA\04_RFIs\RFI's 260-269\RFI 268", "04_CA\04_RFIs\RFI's 260-269\RFI 269", "04_CA\04_RFIs\RFI's 270-279\RFI 270", "04_CA\04_RFIs\RFI's 270-279\RFI 271", "04_CA\04_RFIs\RFI's 270-279\RFI 272", "04_CA\04_RFIs\RFI's 270-279\RFI 273", "04_CA\04_RFIs\RFI's 270-279\RFI 274", "04_CA\04_RFIs\RFI's 270-279\RFI 275", "04_CA\04_RFIs\RFI's 270-279\RFI 276", "04_CA\04_RFIs\RFI's 270-279\RFI 277", "04_CA\04_RFIs\RFI's 270-279\RFI 278", "04_CA\04_RFIs\RFI's 270-279\RFI 279", "04_CA\04_RFIs\RFI's 280-289\RFI 280", "04_CA\04_RFIs\RFI's 280-289\RFI 281", "04_CA\04_RFIs\RFI's 280-289\RFI 282", "04_CA\04_RFIs\RFI's 280-289\RFI 283", "04_CA\04_RFIs\RFI's 280-289\RFI 284", "04_CA\04_RFIs\RFI's 280-289\RFI 285", "04_CA\04_RFIs\RFI's 280-289\RFI 286", "04_CA\04_RFIs\RFI's 280-289\RFI 287", "04_CA\04_RFIs\RFI's 280-289\RFI 288", "04_CA\04_RFIs\RFI's 280-289\RFI 289", "04_CA\04_RFIs\RFI's 290-299\RFI 290", "04_CA\04_RFIs\RFI's 290-299\RFI 291", "04_CA\04_RFIs\RFI's 290-299\RFI 292", "04_CA\04_RFIs\RFI's 290-299\RFI 293", "04_CA\04_RFIs\RFI's 290-299\RFI 294", "04_CA\04_RFIs\RFI's 290-299\RFI 295", "04_CA\04_RFIs\RFI's 290-299\RFI 296", "04_CA\04_RFIs\RFI's 290-299\RFI 297", "04_CA\04_RFIs\RFI's 290-299\RFI 298", "04_CA\04_RFIs\RFI's 290-299\RFI 299", "04_CA\04_RFIs\RFI's 300-309\300", "04_CA\04_RFIs\RFI's 300-309\301", "04_CA\04_RFIs\RFI's 300-309\302", "04_CA\04_RFIs\RFI's 300-309\303", "04_CA\04_RFIs\RFI's 300-309\304", "04_CA\04_RFIs\RFI's 300-309\305", "04_CA\04_RFIs\RFI's 300-309\306", "04_CA\04_RFIs\RFI's 300-309\307", "04_CA\04_RFIs\RFI's 300-309\308", "04_CA\04_RFIs\RFI's 300-309\309", "04_CA\04_RFIs\RFI's 310-319\310", "04_CA\04_RFIs\RFI's 310-319\311", "04_CA\04_RFIs\RFI's 310-319\312", "04_CA\04_RFIs\RFI's 310-319\313", "04_CA\04_RFIs\RFI's 310-319\314", "04_CA\04_RFIs\RFI's 310-319\315", "04_CA\04_RFIs\RFI's 310-319\316", "04_CA\04_RFIs\RFI's 310-319\317", "04_CA\04_RFIs\RFI's 310-319\318", "04_CA\04_RFIs\RFI's 310-319\319", "04_CA\04_RFIs\RFI's 320-329\320", "04_CA\04_RFIs\RFI's 320-329\321", "04_CA\04_RFIs\RFI's 320-329\322", "04_CA\04_RFIs\RFI's 320-329\323", "04_CA\04_RFIs\RFI's 320-329\324", "04_CA\04_RFIs\RFI's 320-329\325", "04_CA\04_RFIs\RFI's 320-329\326", "04_CA\04_RFIs\RFI's 320-329\327", "04_CA\04_RFIs\RFI's 320-329\328", "04_CA\04_RFIs\RFI's 320-329\329", "04_CA\04_RFIs\RFI's 330-339\330", "04_CA\04_RFIs\RFI's 330-339\331", "04_CA\04_RFIs\RFI's 330-339\332", "04_CA\04_RFIs\RFI's 330-339\334", "04_CA\04_RFIs\RFI's 330-339\335", "04_CA\04_RFIs\RFI's 330-339\336", "04_CA\04_RFIs\RFI's 330-339\337", "04_CA\04_RFIs\RFI's 330-339\338", "04_CA\04_RFIs\RFI's 330-339\339", "04_CA\04_RFIs\RFI's 340-349\340", "04_CA\04_RFIs\RFI's 340-349\341", "04_CA\04_RFIs\RFI's 340-349\342", "04_CA\04_RFIs\RFI's 340-349\343", "04_CA\04_RFIs\RFI's 340-349\344", "04_CA\04_RFIs\RFI's 340-349\345", "04_CA\04_RFIs\RFI's 340-349\346", "04_CA\04_RFIs\RFI's 340-349\347", "04_CA\04_RFIs\RFI's 340-349\348", "04_CA\04_RFIs\RFI's 340-349\349", "04_CA\04_RFIs\RFI's 350-359\350", "04_CA\04_RFIs\RFI's 350-359\351", "04_CA\04_RFIs\RFI's 350-359\352", "04_CA\04_RFIs\RFI's 350-359\353", "04_CA\04_RFIs\RFI's 350-359\354", "04_CA\04_RFIs\RFI's 350-359\355", "04_CA\04_RFIs\RFI's 350-359\356", "04_CA\04_RFIs\RFI's 350-359\357", "04_CA\04_RFIs\RFI's 350-359\358", "04_CA\04_RFIs\RFI's 350-359\359", "04_CA\04_RFIs\RFI's 360-369\360", "04_CA\04_RFIs\RFI's 360-369\361", "04_CA\04_RFIs\RFI's 360-369\362", "04_CA\04_RFIs\RFI's 360-369\363", "04_CA\04_RFIs\RFI's 360-369\364", "04_CA\04_RFIs\RFI's 360-369\365", "04_CA\04_RFIs\RFI's 360-369\366", "04_CA\04_RFIs\RFI's 360-369\367", "04_CA\04_RFIs\RFI's 360-369\368", "04_CA\04_RFIs\RFI's 360-369\369", "04_CA\04_RFIs\RFI's 370-379\370", "04_CA\04_RFIs\RFI's 370-379\371", "04_CA\04_RFIs\RFI's 370-379\372", "04_CA\04_RFIs\RFI's 370-379\373", "04_CA\04_RFIs\RFI's 370-379\374", "04_CA\04_RFIs\RFI's 370-379\375", "04_CA\04_RFIs\RFI's 370-379\376", "04_CA\04_RFIs\RFI's 370-379\377", "04_CA\04_RFIs\RFI's 370-379\378", "04_CA\04_RFIs\RFI's 370-379\379", "04_CA\04_RFIs\RFI's 380-389\380", "04_CA\04_RFIs\RFI's 380-389\381", "04_CA\04_RFIs\RFI's 380-389\382", "04_CA\04_RFIs\RFI's 380-389\383", "04_CA\04_RFIs\RFI's 380-389\384", "04_CA\04_RFIs\RFI's 380-389\385", "04_CA\04_RFIs\RFI's 380-389\386", "04_CA\04_RFIs\RFI's 380-389\387", "04_CA\04_RFIs\RFI's 380-389\388", "04_CA\04_RFIs\RFI's 380-389\389", "04_CA\04_RFIs\RFI's 390-399\390", "04_CA\04_RFIs\RFI's 390-399\391", "04_CA\04_RFIs\RFI's 390-399\392", "04_CA\04_RFIs\RFI's 390-399\393", "04_CA\04_RFIs\RFI's 390-399\394", "04_CA\04_RFIs\RFI's 390-399\395", "04_CA\04_RFIs\RFI's 390-399\396", "04_CA\04_RFIs\RFI's 390-399\397", "04_CA\04_RFIs\RFI's 390-399\398", "04_CA\04_RFIs\RFI's 390-399\399", "04_CA\04_RFIs\RFI's 400-409\400", "04_CA\04_RFIs\RFI's 400-409\401", "04_CA\04_RFIs\RFI's 400-409\402", "04_CA\04_RFIs\RFI's 400-409\403", "04_CA\04_RFIs\RFI's 400-409\404", "04_CA\04_RFIs\RFI's 400-409\405", "04_CA\04_RFIs\RFI's 400-409\406", "04_CA\04_RFIs\RFI's 400-409\407", "04_CA\04_RFIs\RFI's 400-409\408", "04_CA\04_RFIs\RFI's 400-409\409", "04_CA\04_RFIs\RFI's 410-419\410", "04_CA\04_RFIs\RFI's 410-419\411", "04_CA\04_RFIs\RFI's 410-419\412", "04_CA\04_RFIs\RFI's 410-419\413", "04_CA\04_RFIs\RFI's 410-419\414", "04_CA\04_RFIs\RFI's 410-419\415", "04_CA\04_RFIs\RFI's 410-419\416", "04_CA\04_RFIs\RFI's 410-419\417", "04_CA\04_RFIs\RFI's 410-419\418", "04_CA\04_RFIs\RFI's 410-419\419", "04_CA\04_RFIs\RFI's 420-429\420", "04_CA\04_RFIs\RFI's 420-429\421", "04_CA\04_RFIs\RFI's 420-429\422", "04_CA\04_RFIs\RFI's 420-429\423", "04_CA\04_RFIs\RFI's 420-429\424", "04_CA\04_RFIs\RFI's 420-429\425", "04_CA\04_RFIs\RFI's 420-429\426", "04_CA\04_RFIs\RFI's 420-429\427", "04_CA\04_RFIs\RFI's 420-429\428", "04_CA\04_RFIs\RFI's 420-429\429", "04_CA\04_RFIs\RFI's 430-439\430", "04_CA\04_RFIs\RFI's 430-439\431", "04_CA\04_RFIs\RFI's 430-439\432", "04_CA\04_RFIs\RFI's 430-439\433", "04_CA\04_RFIs\RFI's 430-439\434", "04_CA\04_RFIs\RFI's 430-439\435", "04_CA\04_RFIs\RFI's 430-439\436", "04_CA\04_RFIs\RFI's 430-439\437", "04_CA\04_RFIs\RFI's 430-439\438", "04_CA\04_RFIs\RFI's 430-439\439", "04_CA\04_RFIs\RFI's 440-449\440", "04_CA\04_RFIs\RFI's 440-449\441", "04_CA\04_RFIs\RFI's 440-449\442", "04_CA\04_RFIs\RFI's 440-449\443", "04_CA\04_RFIs\RFI's 440-449\444", "04_CA\04_RFIs\RFI's 440-449\445", "04_CA\04_RFIs\RFI's 440-449\446", "04_CA\04_RFIs\RFI's 440-449\447", "04_CA\04_RFIs\RFI's 440-449\448", "04_CA\04_RFIs\RFI's 440-449\449", "04_CA\04_RFIs\RFI's 450-459\450", "04_CA\04_RFIs\RFI's 450-459\451", "04_CA\04_RFIs\RFI's 450-459\452", "04_CA\04_RFIs\RFI's 450-459\453", "04_CA\04_RFIs\RFI's 450-459\454", "04_CA\04_RFIs\RFI's 450-459\455", "04_CA\04_RFIs\RFI's 450-459\456", "04_CA\04_RFIs\RFI's 450-459\457", "04_CA\04_RFIs\RFI's 450-459\458", "04_CA\04_RFIs\RFI's 450-459\459", "04_CA\04_RFIs\RFI's 460-469\460", "04_CA\04_RFIs\RFI's 460-469\461", "04_CA\04_RFIs\RFI's 460-469\462", "04_CA\04_RFIs\RFI's 460-469\463", "04_CA\04_RFIs\RFI's 460-469\464", "04_CA\04_RFIs\RFI's 460-469\465", "04_CA\04_RFIs\RFI's 460-469\466", "04_CA\04_RFIs\RFI's 460-469\467", "04_CA\04_RFIs\RFI's 460-469\468", "04_CA\04_RFIs\RFI's 460-469\469", "04_CA\04_RFIs\RFI's 470-479\470", "04_CA\04_RFIs\RFI's 470-479\471", "04_CA\04_RFIs\RFI's 470-479\472", "04_CA\04_RFIs\RFI's 470-479\473", "04_CA\04_RFIs\RFI's 470-479\474", "04_CA\04_RFIs\RFI's 470-479\475", "04_CA\04_RFIs\RFI's 470-479\476", "04_CA\04_RFIs\RFI's 470-479\477", "04_CA\04_RFIs\RFI's 470-479\478", "04_CA\04_RFIs\RFI's 470-479\479", "04_CA\04_RFIs\RFI's 480-489\480", "04_CA\04_RFIs\RFI's 480-489\481", "04_CA\04_RFIs\RFI's 480-489\482", "04_CA\04_RFIs\RFI's 480-489\483", "04_CA\04_RFIs\RFI's 480-489\484", "04_CA\04_RFIs\RFI's 480-489\485", "04_CA\04_RFIs\RFI's 480-489\486", "04_CA\04_RFIs\RFI's 480-489\487", "04_CA\04_RFIs\RFI's 480-489\488", "04_CA\04_RFIs\RFI's 480-489\489", "04_CA\04_RFIs\RFI's 490-499\490", "04_CA\04_RFIs\RFI's 490-499\491", "04_CA\04_RFIs\RFI's 490-499\492", "04_CA\04_RFIs\RFI's 490-499\493", "04_CA\04_RFIs\RFI's 490-499\494", "04_CA\04_RFIs\RFI's 490-499\495", "04_CA\04_RFIs\RFI's 490-499\496", "04_CA\04_RFIs\RFI's 490-499\497", "04_CA\04_RFIs\RFI's 490-499\498", "04_CA\04_RFIs\RFI's 490-499\499", "04_CA\05_ASIs\ASI's 1-9", "04_CA\05_ASIs\ASI's 10-19", "04_CA\05_ASIs\ASI's 20-29", "04_CA\05_ASIs\ASI's 30-39", "04_CA\05_ASIs\ASI's 40-49", "04_CA\05_ASIs\ASI's 1-9\ASI 1", "04_CA\05_ASIs\ASI's 1-9\ASI 2", "04_CA\05_ASIs\ASI's 1-9\ASI 3", "04_CA\05_ASIs\ASI's 1-9\ASI 4", "04_CA\05_ASIs\ASI's 1-9\ASI 5", "04_CA\05_ASIs\ASI's 1-9\ASI 6", "04_CA\05_ASIs\ASI's 1-9\ASI 7", "04_CA\05_ASIs\ASI's 1-9\ASI 8", "04_CA\05_ASIs\ASI's 1-9\ASI 9", "04_CA\05_ASIs\ASI's 10-19\ASI 10", "04_CA\05_ASIs\ASI's 10-19\ASI 11", "04_CA\05_ASIs\ASI's 10-19\ASI 12", "04_CA\05_ASIs\ASI's 10-19\ASI 13", "04_CA\05_ASIs\ASI's 10-19\ASI 14", "04_CA\05_ASIs\ASI's 10-19\ASI 15", "04_CA\05_ASIs\ASI's 10-19\ASI 16", "04_CA\05_ASIs\ASI's 10-19\ASI 17", "04_CA\05_ASIs\ASI's 10-19\ASI 18", "04_CA\05_ASIs\ASI's 10-19\ASI 19", "04_CA\05_ASIs\ASI's 20-29\ASI 20", "04_CA\05_ASIs\ASI's 20-29\ASI 21", "04_CA\05_ASIs\ASI's 20-29\ASI 22", "04_CA\05_ASIs\ASI's 20-29\ASI 23", "04_CA\05_ASIs\ASI's 20-29\ASI 24", "04_CA\05_ASIs\ASI's 20-29\ASI 25", "04_CA\05_ASIs\ASI's 20-29\ASI 26", "04_CA\05_ASIs\ASI's 20-29\ASI 27", "04_CA\05_ASIs\ASI's 20-29\ASI 28", "04_CA\05_ASIs\ASI's 20-29\ASI 29", "04_CA\05_ASIs\ASI's 30-39\ASI 30", "04_CA\05_ASIs\ASI's 30-39\ASI 31", "04_CA\05_ASIs\ASI's 30-39\ASI 32", "04_CA\05_ASIs\ASI's 30-39\ASI 33", "04_CA\05_ASIs\ASI's 30-39\ASI 34", "04_CA\05_ASIs\ASI's 30-39\ASI 35", "04_CA\05_ASIs\ASI's 30-39\ASI 36", "04_CA\05_ASIs\ASI's 30-39\ASI 37", "04_CA\05_ASIs\ASI's 30-39\ASI 38", "04_CA\05_ASIs\ASI's 30-39\ASI 39", "04_CA\05_ASIs\ASI's 40-49\ASI 40", "04_CA\05_ASIs\ASI's 40-49\ASI 41", "04_CA\05_ASIs\ASI's 40-49\ASI 42", "04_CA\05_ASIs\ASI's 40-49\ASI 43", "04_CA\05_ASIs\ASI's 40-49\ASI 44", "04_CA\05_ASIs\ASI's 40-49\ASI 45", "04_CA\05_ASIs\ASI's 40-49\ASI 46", "04_CA\05_ASIs\ASI's 40-49\ASI 47", "04_CA\05_ASIs\ASI's 40-49\ASI 48", "04_CA\05_ASIs\ASI's 40-49\ASI 49", "05_Specs\01_BOD PRODUCTS\Appliances", "05_Specs\01_BOD PRODUCTS\Canopies and Awnings", "05_Specs\01_BOD PRODUCTS\Chutes and Compactors", "05_Specs\01_BOD PRODUCTS\Elevators", "05_Specs\01_BOD PRODUCTS\Entrance Doors", "05_Specs\01_BOD PRODUCTS\Expansion Joints", "05_Specs\01_BOD PRODUCTS\Exterior Wall", "05_Specs\01_BOD PRODUCTS\Flooring", "05_Specs\01_BOD PRODUCTS\Hardware", "05_Specs\01_BOD PRODUCTS\Light Fixtures", "05_Specs\01_BOD PRODUCTS\Lockers", "05_Specs\01_BOD PRODUCTS\Louvers", "05_Specs\01_BOD PRODUCTS\Millwork and Cabinetry", "05_Specs\01_BOD PRODUCTS\Other", "05_Specs\01_BOD PRODUCTS\Overhead Doors", "05_Specs\01_BOD PRODUCTS\Plumbing Fixtures", "05_Specs\01_BOD PRODUCTS\Railings", "05_Specs\01_BOD PRODUCTS\Roofing and Waterproofing", "05_Specs\01_BOD PRODUCTS\Skylights", "05_Specs\01_BOD PRODUCTS\Specialty Finishes", "05_Specs\01_BOD PRODUCTS\Toilet Partitions", "05_Specs\01_BOD PRODUCTS\Window Systems", "04_CA\06_RFPs\RFP's 1-9", "04_CA\06_RFPs\RFP's 10-19", "04_CA\06_RFPs\RFP's 20-29", "04_CA\06_RFPs\RFP's 30-39", "04_CA\06_RFPs\RFP's 40-49", "04_CA\06_RFPs\RFP's 50-59", "04_CA\06_RFPs\RFP's 1-9\PR 1", "04_CA\06_RFPs\RFP's 1-9\PR 2", "04_CA\06_RFPs\RFP's 1-9\PR 3", "04_CA\06_RFPs\RFP's 1-9\PR 4", "04_CA\06_RFPs\RFP's 1-9\PR 5", "04_CA\06_RFPs\RFP's 1-9\PR 6", "04_CA\06_RFPs\RFP's 1-9\PR 7", "04_CA\06_RFPs\RFP's 1-9\PR 8", "04_CA\06_RFPs\RFP's 1-9\PR 9", "04_CA\06_RFPs\RFP's 10-19\PR 10", "04_CA\06_RFPs\RFP's 10-19\PR 11", "04_CA\06_RFPs\RFP's 10-19\PR 12", "04_CA\06_RFPs\RFP's 10-19\PR 13", "04_CA\06_RFPs\RFP's 10-19\PR 14", "04_CA\06_RFPs\RFP's 10-19\PR 15", "04_CA\06_RFPs\RFP's 10-19\PR 16", "04_CA\06_RFPs\RFP's 10-19\PR 17", "04_CA\06_RFPs\RFP's 10-19\PR 18", "04_CA\06_RFPs\RFP's 10-19\PR 19", "04_CA\06_RFPs\RFP's 20-29\PR 20", "04_CA\06_RFPs\RFP's 20-29\PR 21", "04_CA\06_RFPs\RFP's 20-29\PR 22", "04_CA\06_RFPs\RFP's 20-29\PR 23", "04_CA\06_RFPs\RFP's 20-29\PR 24", "04_CA\06_RFPs\RFP's 20-29\PR 25", "04_CA\06_RFPs\RFP's 20-29\PR 26", "04_CA\06_RFPs\RFP's 20-29\PR 27", "04_CA\06_RFPs\RFP's 20-29\PR 28", "04_CA\06_RFPs\RFP's 20-29\PR 29", "04_CA\06_RFPs\RFP's 30-39\PR 30", "04_CA\06_RFPs\RFP's 30-39\PR 31", "04_CA\06_RFPs\RFP's 30-39\PR 32", "04_CA\06_RFPs\RFP's 30-39\PR 33", "04_CA\06_RFPs\RFP's 30-39\PR 34", "04_CA\06_RFPs\RFP's 30-39\PR 35", "04_CA\06_RFPs\RFP's 30-39\PR 36", "04_CA\06_RFPs\RFP's 30-39\PR 37", "04_CA\06_RFPs\RFP's 30-39\PR 38", "04_CA\06_RFPs\RFP's 30-39\PR 39", "04_CA\06_RFPs\RFP's 40-49\PR 40", "04_CA\06_RFPs\RFP's 40-49\PR 41", "04_CA\06_RFPs\RFP's 40-49\PR 42", "04_CA\06_RFPs\RFP's 40-49\PR 43", "04_CA\06_RFPs\RFP's 40-49\PR 44", "04_CA\06_RFPs\RFP's 40-49\PR 45", "04_CA\06_RFPs\RFP's 40-49\PR 46", "04_CA\06_RFPs\RFP's 40-49\PR 47", "04_CA\06_RFPs\RFP's 40-49\PR 48", "04_CA\06_RFPs\RFP's 40-49\PR 49", "04_CA\06_RFPs\RFP's 50-59\PR 50", "04_CA\06_RFPs\RFP's 50-59\PR 51", "04_CA\06_RFPs\RFP's 50-59\PR 52", "04_CA\06_RFPs\RFP's 50-59\PR 53", "04_CA\06_RFPs\RFP's 50-59\PR 54", "04_CA\06_RFPs\RFP's 50-59\PR 55", "04_CA\06_RFPs\RFP's 50-59\PR 56", "04_CA\06_RFPs\RFP's 50-59\PR 57", "04_CA\06_RFPs\RFP's 50-59\PR 58", "04_CA\06_RFPs\RFP's 50-59\PR 59", "04_CA\07_CCDs\CCD's 1-9", "04_CA\07_CCDs\CCD's 10-19", "04_CA\07_CCDs\CCD's 1-9\CCD 1", "04_CA\07_CCDs\CCD's 1-9\CCD 2", "04_CA\07_CCDs\CCD's 1-9\CCD 3", "04_CA\07_CCDs\CCD's 1-9\CCD 4", "04_CA\07_CCDs\CCD's 1-9\CCD 5", "04_CA\07_CCDs\CCD's 1-9\CCD 6", "04_CA\07_CCDs\CCD's 1-9\CCD 7", "04_CA\07_CCDs\CCD's 1-9\CCD 8", "04_CA\07_CCDs\CCD's 1-9\CCD 9", "04_CA\07_CCDs\CCD's 10-19\CCD 10", "04_CA\07_CCDs\CCD's 10-19\CCD 11", "04_CA\07_CCDs\CCD's 10-19\CCD 12", "04_CA\07_CCDs\CCD's 10-19\CCD 13", "04_CA\07_CCDs\CCD's 10-19\CCD 14", "04_CA\07_CCDs\CCD's 10-19\CCD 15", "04_CA\07_CCDs\CCD's 10-19\CCD 16", "04_CA\07_CCDs\CCD's 10-19\CCD 17", "04_CA\07_CCDs\CCD's 10-19\CCD 18", "04_CA\07_CCDs\CCD's 10-19\CCD 19", "04_CA\08_PCOs\PCO's 1-9", "04_CA\08_PCOs\PCO's 10-19", "04_CA\08_PCOs\PCO's 20-29", "04_CA\08_PCOs\PCO's 30-39", "04_CA\08_PCOs\PCO's 40-49", "04_CA\08_PCOs\PCO's 50-59", "04_CA\08_PCOs\PCO's 60-69", "04_CA\08_PCOs\PCO's 70-79", "04_CA\08_PCOs\PCO's 80-89", "04_CA\08_PCOs\PCO's 90-99", "04_CA\08_PCOs\PCO's 1-9\PCO 1", "04_CA\08_PCOs\PCO's 1-9\PCO 2", "04_CA\08_PCOs\PCO's 1-9\PCO 3", "04_CA\08_PCOs\PCO's 1-9\PCO 4", "04_CA\08_PCOs\PCO's 1-9\PCO 5", "04_CA\08_PCOs\PCO's 1-9\PCO 6", "04_CA\08_PCOs\PCO's 1-9\PCO 7", "04_CA\08_PCOs\PCO's 1-9\PCO 8", "04_CA\08_PCOs\PCO's 1-9\PCO 9", "04_CA\08_PCOs\PCO's 10-19\PCO 10", "04_CA\08_PCOs\PCO's 10-19\PCO 11", "04_CA\08_PCOs\PCO's 10-19\PCO 12", "04_CA\08_PCOs\PCO's 10-19\PCO 13", "04_CA\08_PCOs\PCO's 10-19\PCO 14", "04_CA\08_PCOs\PCO's 10-19\PCO 15", "04_CA\08_PCOs\PCO's 10-19\PCO 16", "04_CA\08_PCOs\PCO's 10-19\PCO 17", "04_CA\08_PCOs\PCO's 10-19\PCO 18", "04_CA\08_PCOs\PCO's 10-19\PCO 19", "04_CA\08_PCOs\PCO's 20-29\PCO 20", "04_CA\08_PCOs\PCO's 20-29\PCO 21", "04_CA\08_PCOs\PCO's 20-29\PCO 22", "04_CA\08_PCOs\PCO's 20-29\PCO 23", "04_CA\08_PCOs\PCO's 20-29\PCO 24", "04_CA\08_PCOs\PCO's 20-29\PCO 25", "04_CA\08_PCOs\PCO's 20-29\PCO 26", "04_CA\08_PCOs\PCO's 20-29\PCO 27", "04_CA\08_PCOs\PCO's 20-29\PCO 28", "04_CA\08_PCOs\PCO's 20-29\PCO 29", "04_CA\08_PCOs\PCO's 30-39\PCO 30", "04_CA\08_PCOs\PCO's 30-39\PCO 31", "04_CA\08_PCOs\PCO's 30-39\PCO 32", "04_CA\08_PCOs\PCO's 30-39\PCO 33", "04_CA\08_PCOs\PCO's 30-39\PCO 34", "04_CA\08_PCOs\PCO's 30-39\PCO 35", "04_CA\08_PCOs\PCO's 30-39\PCO 36", "04_CA\08_PCOs\PCO's 30-39\PCO 37", "04_CA\08_PCOs\PCO's 30-39\PCO 38", "04_CA\08_PCOs\PCO's 30-39\PCO 39", "04_CA\08_PCOs\PCO's 40-49\PCO 40", "04_CA\08_PCOs\PCO's 40-49\PCO 41", "04_CA\08_PCOs\PCO's 40-49\PCO 42", "04_CA\08_PCOs\PCO's 40-49\PCO 43", "04_CA\08_PCOs\PCO's 40-49\PCO 44", "04_CA\08_PCOs\PCO's 40-49\PCO 45", "04_CA\08_PCOs\PCO's 40-49\PCO 46", "04_CA\08_PCOs\PCO's 40-49\PCO 47", "04_CA\08_PCOs\PCO's 40-49\PCO 48", "04_CA\08_PCOs\PCO's 40-49\PCO 49", "04_CA\08_PCOs\PCO's 50-59\PCO 50", "04_CA\08_PCOs\PCO's 50-59\PCO 51", "04_CA\08_PCOs\PCO's 50-59\PCO 52", "04_CA\08_PCOs\PCO's 50-59\PCO 53", "04_CA\08_PCOs\PCO's 50-59\PCO 54", "04_CA\08_PCOs\PCO's 50-59\PCO 55", "04_CA\08_PCOs\PCO's 50-59\PCO 56", "04_CA\08_PCOs\PCO's 50-59\PCO 57", "04_CA\08_PCOs\PCO's 50-59\PCO 58", "04_CA\08_PCOs\PCO's 50-59\PCO 59", "04_CA\08_PCOs\PCO's 60-69\PCO 60", "04_CA\08_PCOs\PCO's 60-69\PCO 61", "04_CA\08_PCOs\PCO's 60-69\PCO 62", "04_CA\08_PCOs\PCO's 60-69\PCO 63", "04_CA\08_PCOs\PCO's 60-69\PCO 64", "04_CA\08_PCOs\PCO's 60-69\PCO 65", "04_CA\08_PCOs\PCO's 60-69\PCO 66", "04_CA\08_PCOs\PCO's 60-69\PCO 67", "04_CA\08_PCOs\PCO's 60-69\PCO 68", "04_CA\08_PCOs\PCO's 60-69\PCO 69", "04_CA\08_PCOs\PCO's 70-79\PCO 70", "04_CA\08_PCOs\PCO's 70-79\PCO 71", "04_CA\08_PCOs\PCO's 70-79\PCO 72", "04_CA\08_PCOs\PCO's 70-79\PCO 73", "04_CA\08_PCOs\PCO's 70-79\PCO 74", "04_CA\08_PCOs\PCO's 70-79\PCO 75", "04_CA\08_PCOs\PCO's 70-79\PCO 76", "04_CA\08_PCOs\PCO's 70-79\PCO 77", "04_CA\08_PCOs\PCO's 70-79\PCO 78", "04_CA\08_PCOs\PCO's 70-79\PCO 79", "04_CA\08_PCOs\PCO's 80-89\PCO 80", "04_CA\08_PCOs\PCO's 80-89\PCO 81", "04_CA\08_PCOs\PCO's 80-89\PCO 82", "04_CA\08_PCOs\PCO's 80-89\PCO 83", "04_CA\08_PCOs\PCO's 80-89\PCO 84", "04_CA\08_PCOs\PCO's 80-89\PCO 85", "04_CA\08_PCOs\PCO's 80-89\PCO 86", "04_CA\08_PCOs\PCO's 80-89\PCO 87", "04_CA\08_PCOs\PCO's 80-89\PCO 88", "04_CA\08_PCOs\PCO's 80-89\PCO 89", "04_CA\08_PCOs\PCO's 90-99\PCO 90", "04_CA\08_PCOs\PCO's 90-99\PCO 91", "04_CA\08_PCOs\PCO's 90-99\PCO 92", "04_CA\08_PCOs\PCO's 90-99\PCO 93", "04_CA\08_PCOs\PCO's 90-99\PCO 94", "04_CA\08_PCOs\PCO's 90-99\PCO 95", "04_CA\08_PCOs\PCO's 90-99\PCO 96", "04_CA\08_PCOs\PCO's 90-99\PCO 97", "04_CA\08_PCOs\PCO's 90-99\PCO 98", "04_CA\08_PCOs\PCO's 90-99\PCO 99", "04_CA\09_Change Orders\CO #01", "04_CA\09_Change Orders\CO #02", "04_CA\09_Change Orders\CO #03", "04_CA\09_Change Orders\CO #04", "04_CA\09_Change Orders\CO #05", "04_CA\09_Change Orders\CO #06", "04_CA\09_Change Orders\CO #07", "04_CA\09_Change Orders\CO #08", "04_CA\09_Change Orders\CO #09", "04_CA\09_Change Orders\CO #10", "04_CA\10_Pay Apps\Pay App #01", "04_CA\10_Pay Apps\Pay App #02", "04_CA\10_Pay Apps\Pay App #03", "04_CA\10_Pay Apps\Pay App #04", "04_CA\10_Pay Apps\Pay App #05", "04_CA\10_Pay Apps\Pay App #06", "04_CA\10_Pay Apps\Pay App #07", "04_CA\10_Pay Apps\Pay App #08", "04_CA\10_Pay Apps\Pay App #09", "04_CA\10_Pay Apps\Pay App #10", "04_CA\10_Pay Apps\Pay App #11", "04_CA\10_Pay Apps\Pay App #12")
}

# =====================================================================
# FUNCTIONS
# =====================================================================

function Get-ProjectSearchInput {

    Write-Host ""
    # Write-Host -f yellow "---------------------------------------------------------"
    # Write-Host -f cyan "Searching for Existing Projects:"
    # Write-Host -f yellow "---------------------------------------------------------"
    $inputValue = Read-Host "Enter project number or partial project number"

    $fullInput = $inputValue.Trim()

    if ($fullInput -match '^(\d{6})') {
        $searchValue = $matches[1]
    }
    else {
        $searchValue = $fullInput
    }

    return @{
        FullInput   = $fullInput
        SearchValue = $searchValue
    }
}

function Show-ProjectSearchResults {

    param (
        [string]$SearchValue
    )

    Write-Host -ForegroundColor DarkMagenta "---------------- BEGIN SEARCH RESULTS ----------------"

    # -----------------------------------------------------------------
    # NEWJF.TXT MATCHES
    # -----------------------------------------------------------------

    $NewJFMatches = @()

    if (Test-Path $NewJF) {
        $NewJFMatches = Get-Content $NewJF |
        Select-String $SearchValue |
        ForEach-Object { $_.Line }
    }

    if ($NewJFMatches.Count -gt 0) {

        Write-Host -ForegroundColor Cyan "From the NEWJF.TXT file"

        $NewJFMatches
    }

        # -----------------------------------------------------------------
    # ARCHIVE LOGS
    # -----------------------------------------------------------------

    $ArchiveLogs = @()

    if (Test-Path $ArchiveTape) {

        $ArchiveLogs = Get-ChildItem `
            -Path $ArchiveTape `
            -File `
            -ErrorAction SilentlyContinue |

        Select-String $SearchValue
    }

    if ($ArchiveLogs.Count -gt 0) {

        Write-Host -ForegroundColor Cyan "`nFrom the ARCHIVE LOGS ($ArchiveTape)"

        $ArchiveLogs |
        Select-Object Path, LineNumber, Line |
        Format-Table -Wrap -AutoSize
    }

    # -----------------------------------------------------------------
    # ACTIVE PROJECTS (MAIN FOLDERS)
    # -----------------------------------------------------------------

    $ActiveMain = Get-ChildItem `
        -Directory `
        -Path "$ActiveRoot\$SearchValue*" `
        -ErrorAction SilentlyContinue

    if ($ActiveMain.Count -gt 0) {

        Write-Host -ForegroundColor Cyan "`nFrom the ACTIVE PROJECTS (MAIN FOLDERS)"

        $ActiveMain |
        Select-Object Name, LastWriteTime, FullName |
        Sort-Object Name |
        Format-Table -Wrap -AutoSize
    }

    # -----------------------------------------------------------------
    # ACTIVE PROJECTS (SUB FOLDERS)
    # -----------------------------------------------------------------

    $ActiveSub = Get-ChildItem `
        -Directory `
        -Path "$ActiveRoot\$SearchValue*\$SearchValue*" `
        -ErrorAction SilentlyContinue

    if ($ActiveSub.Count -gt 0) {

        Write-Host -ForegroundColor Cyan "`nFrom the ACTIVE PROJECTS (SUB FOLDERS)"

        $ActiveSub |
        Select-Object Name, LastWriteTime, FullName |
        Sort-Object Name |
        Format-Table -Wrap -AutoSize
    }

    # -----------------------------------------------------------------
    # ARCHIVE PROJECTS (MAIN FOLDERS)
    # -----------------------------------------------------------------

    $ArchiveMain = Get-ChildItem `
        -Directory `
        -Path "$ArchiveRoot\$SearchValue*" `
        -ErrorAction SilentlyContinue

    if ($ArchiveMain.Count -gt 0) {

        Write-Host -ForegroundColor Cyan "`nFrom the ARCHIVE PROJECTS (MAIN FOLDERS)"

        $ArchiveMain |
        Select-Object Name, LastWriteTime, FullName |
        Sort-Object Name |
        Format-Table -Wrap -AutoSize
    }

    # -----------------------------------------------------------------
    # ARCHIVE PROJECTS (SUB FOLDERS)
    # -----------------------------------------------------------------

    $ArchiveSub = Get-ChildItem `
        -Directory `
        -Path "$ArchiveRoot\$SearchValue*\$SearchValue*" `
        -ErrorAction SilentlyContinue

    if ($ArchiveSub.Count -gt 0) {

        Write-Host -ForegroundColor Cyan "`nFrom the ARCHIVE PROJECTS (SUB FOLDERS)"

        $ArchiveSub |
        Select-Object Name, LastWriteTime, FullName |
        Sort-Object Name |
        Format-Table -Wrap -AutoSize
    }

    Write-Host -ForegroundColor DarkMagenta "----------------- END SEARCH RESULTS -----------------"
}

function Confirm-Proceed {

    Write-Host "`nProceed with project creation? (" -NoNewline
    Write-Host "Y" -ForegroundColor Green -NoNewline
    Write-Host "/" -NoNewline
    Write-Host "N" -ForegroundColor Red -NoNewline
    Write-Host ")" -NoNewline

    $response = Read-Host

    if ($response -notmatch '^(Y|y)$') {
        Write-Host "`nRoutine cancelled." -ForegroundColor Yellow
        exit
    }
}

function Get-ProjectInfo {

    param (
        [string]$SavedPrimary
    )

    Write-Host -ForegroundColor Yellow "---------------------------------------------------------"
    Write-Host -ForegroundColor Cyan   "Enter project details:"
    Write-Host -ForegroundColor Yellow "---------------------------------------------------------"
    Write-Host "Use saved primary project number [$SavedPrimary]? (" -NoNewline
    Write-Host "Y" -ForegroundColor Green -NoNewline
    Write-Host "/" -NoNewline
    Write-Host "N" -ForegroundColor Red -NoNewline
    Write-Host ")" -NoNewline

    $reuse = Read-Host

    if ($reuse -match '^(Y|y)$') {
        $PrimaryProject = $SavedPrimary
    }
    else {
        $PrimaryProject = Read-Host "Enter primary project number"
    }

    $SecondaryProject = Read-Host "Enter secondary project number or press ENTER to skip"

    $ProjectName = Read-Host "Enter project name"
    $ProjectName = $ProjectName -replace '[\\/:*?"<>|-]', '_'
    $Description = Read-Host "Enter option description or press ENTER for none"
    $PIC = Read-Host "Enter Principal In Charge"
    $PM  = Read-Host "Enter Project Manager"

    return @{
        PrimaryProject   = $PrimaryProject.Trim()
        SecondaryProject = $SecondaryProject.Trim()
        ProjectName      = $ProjectName.Trim()
        Description      = $Description.Trim()
        PIC              = $PIC.Trim()
        PM               = $PM.Trim()
    }
}

function Show-ProjectTypeMenu {

    Write-Host -f yellow "---------------------------------------------------------"
    Write-Host -f cyan "Select project type:"
    Write-Host -f yellow "---------------------------------------------------------"
    Write-Host "1 - Architecture / Masterplanning / Marketing"
    Write-Host "2 - Multi-Tenant Architecture"
    Write-Host "3 - Interiors"
    Write-Host "4 - Branding"
    Write-Host "5 - Branding - Add to existing project"
    Write-Host "6 - Add to Newforma Only (no M drive folders)"

    do {
        $selection = Read-Host "`nSelect project type"
    }
    until ($selection -match '^[1-6]$')

    return [int]$selection
}

function Get-ProjectRoot {

    param (
        [hashtable]$ProjectInfo,
        [int]$ProjectType
    )

    switch ($ProjectType) {

        1 { return (Join-Path $ActiveRoot $ProjectInfo.PrimaryProject) }
        2 { return (Join-Path $ActiveRoot "$($ProjectInfo.PrimaryProject)\$($ProjectInfo.SecondaryProject)") }
        3 { return (Join-Path $ActiveRoot "$($ProjectInfo.PrimaryProject)\$($ProjectInfo.SecondaryProject)") }
        4 { return (Join-Path $ActiveRoot $ProjectInfo.PrimaryProject) }
        5 { return (Join-Path $ActiveRoot "$($ProjectInfo.PrimaryProject)\$($ProjectInfo.SecondaryProject)") }
        6 {
            if (![string]::IsNullOrWhiteSpace($ProjectInfo.SecondaryProject)) {
                return "\\dcs-fs\data-1\jf\$($ProjectInfo.PrimaryProject)\$($ProjectInfo.SecondaryProject)"
            }
            else {
                return "\\dcs-fs\data-1\jf\$($ProjectInfo.PrimaryProject)"
            }
        }
    }
}

function New-BaseFolders {

    param (
        [string]$ProjectRoot,
        [int]$ProjectType
    )

    foreach ($Folder in $BaseFolderSets[$ProjectType]) {

        $FolderPath = Join-Path $ProjectRoot $Folder

        New-Item -ItemType Directory -Path $FolderPath -Force | Out-Null
    }
}


function Set-ProjectSecurity {

    param (
        [string]$ProjectRoot,
        [int]$ProjectType
    )

    $SetACL = "\\dcs-fs\sys\netutils\SetACL.exe"

    $SIDs = @(
        "S-1-5-21-867035598-458510500-1230694881-1129",
        "S-1-5-21-867035598-458510500-1230694881-1398",
        "S-1-5-21-867035598-458510500-1230694881-1456"
    )

    switch ($ProjectType) {

        # ---------------------------------------------------------
        # OPTION 1
        # ---------------------------------------------------------

        1 {

            $SecurityFolders = @(
                "01_Drawings", "02_Docs", "03_Consultants", "04_CA", "05_Specs", "10_Branding", "99_Marketing", "99_Newforma", "99_OneNote")
        }

        # ---------------------------------------------------------
        # OPTION 2
        # ---------------------------------------------------------

        2 {

            $SecurityFolders = @(
                "01_Drawings", "02_Docs", "03_Consultants", "04_CA", "05_Specs", "10_Branding", "99_Marketing", "99_Newforma", "99_OneNote")
        }

        # ---------------------------------------------------------
        # OPTION 3
        # ---------------------------------------------------------

        3 {

            $SecurityFolders = @(
                "01_Base", "02_Leasing", "03_Programming", "04_TestFit", "05_Design", "06_CD", "07_CA", "08_Doc", "09_Consultants", "10_Branding", "99_Marketing", "99_Newforma", "99_OneNote")
        }

        # ---------------------------------------------------------
        # OPTION 4
        # ---------------------------------------------------------

        4 {

            $SecurityFolders = @(
                "10_Branding", "99_Marketing", "99_Newforma", "99_OneNote")
        }
    }

    # ---------------------------------------------------------
    # DISABLE INHERITANCE
    # ---------------------------------------------------------

    & $SetACL `
        -on $ProjectRoot `
        -ot file `
        -actn setprot `
        -op "dacl:p_c;sacl:p_c" `
        -rec cont_obj `
        -silent

    # ---------------------------------------------------------
    # APPLY ACLS
    # ---------------------------------------------------------

    foreach ($Folder in $SecurityFolders) {

        $FolderPath = Join-Path $ProjectRoot $Folder

        if (-not (Test-Path $FolderPath)) {
            continue
        }

        $Arguments = @(
            "-on", $FolderPath,
            "-ot", "file",
            "-actn", "ace"
        )

        foreach ($SID in $SIDs) {

            $Arguments += @(
                "-ace", "n:$SID;p:read_ex,write",
                "-rec", "cont_obj",
                "-ace", "n:$SID;p:delete;i:so,sc,io",
                "-rec", "cont"
            )
        }

        $Arguments += "-silent"

        & $SetACL @Arguments
    }
}


function Copy-AdditionalFiles {

    param (
        [string]$ProjectRoot,
        [int]$ProjectType
    )

    # ---------------------------------------------------------
    # OPTIONS 1,2,3,4
    # ---------------------------------------------------------

    if ($ProjectType -in @(1, 2, 3, 4)) {

        xcopy "$MarketingGuide" "$ProjectRoot\99_Marketing\" /q /d /y *> $null
    }

    # ---------------------------------------------------------
    # OPTIONS 1,2
    # ---------------------------------------------------------

    if ($ProjectType -in @(1, 2)) {

        xcopy "$BEPMasters" "$ProjectRoot\02_Docs\11_BEP\" /q /d /y *> $null

        xcopy "$CentralFileNaming" "$ProjectRoot\01_Drawings\" /q /d /y *> $null
        
        xcopy "$DeliverableNaming" "$ProjectRoot\01_Drawings\01_Design\" /q /d /y *> $null

        xcopy "$DeliverableNaming" "$ProjectRoot\01_Drawings\01_Design\01_Model" /q /d /y *> $null

        xcopy "$PhotosNaming" "$ProjectRoot\01_Drawings\02_Existing\01_Existing Photos\" /q /d /y *> $null

        xcopy "$DrawingNaming" "$ProjectRoot\01_Drawings\02_Existing\02_Existing Drawings\" /q /d /y *> $null

        xcopy "$ProjSchedules" "$ProjectRoot\02_Docs\09_Schedules\" /q /d /y *> $null

        xcopy "$CADFolders" "$ProjectRoot\01_Drawings\05_CAD\" /q /d /y *> $null
        
        Invoke-WebRequest `
            $QAURL `
            -OutFile "$ProjectRoot\02_Docs\10_Quality Assurance\DCS Quality Control Process Forms 2015.xlsx"

        Invoke-WebRequest `
            $MAURL `
            -OutFile "$ProjectRoot\02_Docs\08_Meetings\yyyy-mm-dd - Meeting Agenda.dotx"

        Invoke-WebRequest `
            $MMOFURL `
            -OutFile "$ProjectRoot\02_Docs\08_Meetings\yyyy-mm-dd - Meeting Minutes (Outline Format).dotx"
        
        Invoke-WebRequest `
            $MMTFURL `
            -OutFile "$ProjectRoot\02_Docs\08_Meetings\yyyy-mm-dd - Meeting Minutes (Table Format).dotx"

    }

    # ---------------------------------------------------------
    # OPTION 3
    # ---------------------------------------------------------

    if ($ProjectType -eq 3) {

        xcopy "$BOMAPath" "$ProjectRoot\02_Leasing\01_BOMA\" /q /d /y *> $null

        xcopy "$BEPMasters" "$ProjectRoot\08_Doc\11_BEP\" /q /d /y *> $null

        xcopy "$CentralFileNaming" "$ProjectRoot\01_Base\" /q /d /y *> $null

        xcopy "$TestFitNaming" "$ProjectRoot\04_TestFit\" /q /d /y *> $null

        Invoke-WebRequest `
            $QAURL `
            -OutFile "$ProjectRoot\08_Doc\05_Quality Assurance\DCS Quality Control Process Forms 2015.xlsx"

        Invoke-WebRequest `
            $MAURL `
            -OutFile "$ProjectRoot\08_Doc\03_Meetings\yyyy-mm-dd - Meeting Agenda.dotx"

        Invoke-WebRequest `
            $MMOFURL `
            -OutFile "$ProjectRoot\08_Doc\03_Meetings\yyyy-mm-dd - Meeting Minutes (Outline Format).dotx"
        
        Invoke-WebRequest `
            $MMTFURL `
            -OutFile "$ProjectRoot\08_Doc\03_Meetings\yyyy-mm-dd - Meeting Minutes (Table Format).dotx"

    }

    # ---------------------------------------------------------
    # OPTION 4, 5
    # ---------------------------------------------------------

    if ($ProjectType -eq 4, 5) {

        Invoke-WebRequest `
            $MAURL `
            -OutFile "$ProjectRoot\10_Branding\03_Meeting Minutes\yyyy-mm-dd - Meeting Agenda.dotx"

        Invoke-WebRequest `
            $MMOFURL `
            -OutFile "$ProjectRoot\10_Branding\03_Meeting Minutes\yyyy-mm-dd - Meeting Minutes (Outline Format).dotx"
        
        Invoke-WebRequest `
            $MMTFURL `
            -OutFile "$ProjectRoot\10_Branding\03_Meeting Minutes\yyyy-mm-dd - Meeting Minutes (Table Format).dotx"

    }
}

function New-AdditionalFolders {

    param (
        [string]$ProjectRoot,
        [int]$ProjectType
    )

    foreach ($Folder in $AdditionalFolderSets[$ProjectType]) {

        $FolderPath = Join-Path $ProjectRoot $Folder

        New-Item -ItemType Directory -Path $FolderPath -Force | Out-Null
    }
}


function Get-NewJFProjectNumber {

    param (
        [int]$ProjectType,
        [string]$Primary,
        [string]$Secondary
    )

    switch ($ProjectType) {

        1 { $Value = $Primary }
        2 { $Value = $Secondary }
        3 { $Value = $Secondary }
        4 { $Value = $Primary }
        5 { $Value = $Primary }

        default { $Value = $Primary }
    }

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return ""
    }

    return (Split-Path $Value -Leaf)
}

function Add-NewJFEntry {

    param (
        [hashtable]$ProjectInfo,
        [int]$ProjectType
    )

    $ProjectNumber = Get-NewJFProjectNumber `
        -ProjectType $ProjectType `
        -Primary $ProjectInfo.PrimaryProject `
        -Secondary $ProjectInfo.SecondaryProject

    $DateStamp = Get-Date -Format "MM/dd/yyyy"

    $Line = "{0},{1},{2},{3},{4},{5}" -f `
        $DateStamp,
    $ProjectNumber,
    $ProjectInfo.ProjectName,
    $ProjectInfo.PIC,
    $ProjectInfo.PM,
    $env:USERNAME

    Add-Content -Path $NewJF -Value $Line

}


function Add-IntLogEntry {

    param (
        [hashtable]$ProjectInfo,
        [int]$ProjectType,
        [string]$ProjectRoot
    )

    if ($ProjectType -eq 3) {

        # Filename uses PRIMARY project
        $PrimaryProjectNumber = $ProjectInfo.PrimaryProject

        # Log line uses SECONDARY project
        $SecondaryProjectNumber = $ProjectInfo.SecondaryProject

        $DateStamp = Get-Date -Format "MM/dd/yyyy"

        $Line = "{0} - {1} - {2}" -f `
            $DateStamp,
            $SecondaryProjectNumber,
            $ProjectInfo.ProjectName

        $PrimaryFolder = Split-Path $ProjectRoot -Parent

        $LogPath = Join-Path `
            $PrimaryFolder `
            "_$PrimaryProjectNumber Project List.txt"

        Add-Content `
            -Path $LogPath `
            -Value $Line

        Write-Host "`nInterior Project List.txt updated."
    }
}


function Initialize-NewformaWorkbook {

    param (
        [string]$SavePath
    )

    if (Test-Path $SavePath) {
        Remove-Item $SavePath -Force
    }

    $script:Excel = New-Object -ComObject Excel.Application
    $script:Excel.Visible = $true
    $script:Excel.DisplayAlerts = $false

    $script:Workbook  = $script:Excel.Workbooks.Add()
    $script:Worksheet = $script:Workbook.Worksheets.Item(1)

    $script:Worksheet.Cells.Item(1,1) = "<BatchProjectCreationDataTable>"

    $Headers = @(
        "<project number>",
        "<project name>",
        "<primary folder>",
        "<secondary folder>",
        "<server>",
        "<template project name>",
        "<status>",
        "<description>",
        "<type>",
        "<project manager email address>",
        "<principal in charge email address>",
        "<main contact email address>",
        "<client>",
        "<client project number>",
        "<address line 1>",
        "<address line 2>",
        "<address line 3>",
        "<city>",
        "<state>",
        "<zip>",
        "<country>",
        "<id>"
    )

    $Column = 1

    foreach ($Header in $Headers) {

        $script:Worksheet.Cells.Item(2, $Column) = $Header
        $Column++
    }

    $script:Worksheet.Columns.Item(1).NumberFormat = "@"

    $script:ExcelRow = 3
}


function Get-NewformaProjectNumber {

    param (
        [int]$ProjectType,
        [hashtable]$ProjectInfo
    )

    switch ($ProjectType) {

        1 { return $ProjectInfo.PrimaryProject }

        2 { return $ProjectInfo.SecondaryProject }

        3 { return $ProjectInfo.SecondaryProject }

        4 { return $ProjectInfo.PrimaryProject }

        5 {
            if (![string]::IsNullOrWhiteSpace($ProjectInfo.SecondaryProject)) {
                return $ProjectInfo.SecondaryProject
            }
            else {
                return $ProjectInfo.PrimaryProject
            }
        }

        6 {
            if (![string]::IsNullOrWhiteSpace($ProjectInfo.SecondaryProject)) {
                return $ProjectInfo.SecondaryProject
            }
            else {
                return $ProjectInfo.PrimaryProject
            }
        }
    }
}

function Add-NewformaRow {

    param (
        [hashtable]$ProjectInfo,
        [int]$ProjectType,
        [string]$ProjectRoot
    )

    $ProjectNumber = Get-NewformaProjectNumber `
        -ProjectType $ProjectType `
        -ProjectInfo $ProjectInfo

    if ($ProjectRoot -like "\\dcs-fs\data-1\jf*") {
        $Status = "Active"
    }
    else {
        $Status = "Archive"
    }

    $PMEmail  = "$($ProjectInfo.PM)@dcsdesign.com"
    $PICEmail = "$($ProjectInfo.PIC)@dcsdesign.com"

    $script:Worksheet.Cells.Item($script:ExcelRow, 1)  = $ProjectNumber
    $script:Worksheet.Cells.Item($script:ExcelRow, 2)  = $ProjectInfo.ProjectName
    $script:Worksheet.Cells.Item($script:ExcelRow, 3)  = $ProjectRoot
    $script:Worksheet.Cells.Item($script:ExcelRow, 4)  = ""
    $script:Worksheet.Cells.Item($script:ExcelRow, 5)  = ""
    $script:Worksheet.Cells.Item($script:ExcelRow, 6)  = "Default Project Template"
    $script:Worksheet.Cells.Item($script:ExcelRow, 7)  = $Status
    $script:Worksheet.Cells.Item($script:ExcelRow, 8)  = $ProjectInfo.Description
    $script:Worksheet.Cells.Item($script:ExcelRow, 9)  = ""
    $script:Worksheet.Cells.Item($script:ExcelRow,10)  = $PMEmail
    $script:Worksheet.Cells.Item($script:ExcelRow,11)  = $PICEmail

    $script:ExcelRow++
}


function Save-NewformaWorkbook {

    param (
        [string]$SavePath
    )

    $script:Worksheet.Cells.Item($script:ExcelRow,1) = "</BatchProjectCreationDataTable>"

    $script:Worksheet.Columns.AutoFit() | Out-Null

    $script:Workbook.SaveAs($SavePath)

    $script:Workbook.Close()
    $script:Excel.Quit()

    [System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:Worksheet) | Out-Null
    [System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:Workbook)  | Out-Null
    [System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:Excel)     | Out-Null

    # Write-Host ""
    # Write-Host "Newforma import XLSX created:" -ForegroundColor Green
    # Write-Host $SavePath
}


function Show-Step {

    param (
        [string]$Message,
        [ValidateSet("RUN","DONE","WARN","ERROR")]
        [string]$Type = "RUN"
    )

    $Time = Get-Date -Format "HH:mm:ss"

    switch ($Type) {

        "RUN" {

            Write-Host "[$Time] " -NoNewline -ForegroundColor DarkGray
            Write-Host "> " -NoNewline -ForegroundColor Yellow
            Write-Host $Message -ForegroundColor Gray
        }

        "DONE" {

            Write-Host "[$Time] " -NoNewline -ForegroundColor DarkGray
            Write-Host ([char]0x2713) " " -NoNewline -ForegroundColor Green
            Write-Host $Message`n -ForegroundColor DarkGreen
        }

        "WARN" {

            Write-Host "[$Time] " -NoNewline -ForegroundColor DarkGray
            Write-Host "! " -NoNewline -ForegroundColor Yellow
            Write-Host $Message -ForegroundColor Yellow
        }

        "ERROR" {

            Write-Host "[$Time] " -NoNewline -ForegroundColor DarkGray
            Write-Host "X " -NoNewline -ForegroundColor Red
            Write-Host $Message -ForegroundColor Red
        }
    }
}

$ExcelInitialized = $false

# =====================================================================
# MAIN
# =====================================================================

$ContinueProjects = $true

while ($ContinueProjects) {

    Write-Host ""
    Write-Host -ForegroundColor DarkGray "========================================================="
    Write-Host -ForegroundColor Cyan "[$(Get-Date -Format 'HH:mm:ss')] Starting new project routine"
    Write-Host -ForegroundColor DarkGray "========================================================="

    # Show-Step "Collecting search input..." "Run"

    $SearchData = Get-ProjectSearchInput

    # Show-Step "Collecting search input..." "Done"

    Show-Step "Searching existing project data..." "Run"

    Show-ProjectSearchResults -SearchValue $SearchData.SearchValue

    Show-Step "Searching existing project data..." "Done"

    Confirm-Proceed

    Show-Step "Selecting project type..." "Run"

    $ProjectType = Show-ProjectTypeMenu

    Show-Step "Selecting project type..." "Done"

    Show-Step "Collecting project details..." "Run"

    $ProjectInfo = Get-ProjectInfo -SavedPrimary $SearchData.FullInput

    Confirm-Proceed

    Show-Step "Collecting project details..." "Done"

    Show-Step "Building project root path..." "Run"

    $ProjectRoot = Get-ProjectRoot `
        -ProjectInfo $ProjectInfo `
        -ProjectType $ProjectType

    Show-Step "Building project root path: $ProjectRoot" "Done"

    # Write-Host ""
    # Write-Host -ForegroundColor Yellow "Project Root:"
    # Write-Host -ForegroundColor yellow $ProjectRoot

    if ($ProjectType -ne 6) {

Show-Step "Creating base folders"
New-BaseFolders `
    -ProjectRoot $ProjectRoot `
    -ProjectType $ProjectType
Show-Step "Base folders created" "DONE"

Show-Step "Applying project security"
Set-ProjectSecurity `
    -ProjectRoot $ProjectRoot `
    -ProjectType $ProjectType
Show-Step "Security applied" "DONE"

Show-Step "Creating additional folders"
New-AdditionalFolders `
    -ProjectRoot $ProjectRoot `
    -ProjectType $ProjectType
Show-Step "Additional folders created" "DONE"

Show-Step "Copying template files"
Copy-AdditionalFiles `
    -ProjectRoot $ProjectRoot `
    -ProjectType $ProjectType
Show-Step "Template files copied" "DONE"

Show-Step "Updating NEWJF.TXT"
Add-NewJFEntry `
    -ProjectInfo $ProjectInfo `
    -ProjectType $ProjectType
Show-Step "NEWJF.TXT updated" "DONE"

if ($ProjectType -eq 3) {

    Show-Step "Updating INT log"

    Add-IntLogEntry `
        -ProjectInfo $ProjectInfo `
        -ProjectType $ProjectType `
        -ProjectRoot $ProjectRoot
    Show-Step "INT log updated" "DONE"
}
    }
    else {

        Show-Step "Option 6 selected - skipping folder creation." "Warn"
    }

    if (-not $ExcelInitialized) {

        Show-Step "Initializing Newforma Excelworkbook..." "Run"

        $NewformaSavePath = "\\dcs-fs\sys\netutils\usage\newforma-project-import.xlsx"

        Initialize-NewformaWorkbook -SavePath $NewformaSavePath

        $ExcelInitialized = $true

        Show-Step "Initializing Newforma Excel workbook..." "Done"
    }

    Show-Step "Adding project to Newforma workbook..." "Run"

    Add-NewformaRow `
        -ProjectInfo $ProjectInfo `
        -ProjectType $ProjectType `
        -ProjectRoot $ProjectRoot

    Show-Step "Adding project to Newforma workbook..." "Done"

    Write-Host ""

    Write-Host "Create another project? (" -NoNewline
    Write-Host "Y" -ForegroundColor Green -NoNewline
    Write-Host "/" -NoNewline
    Write-Host "N" -ForegroundColor Red -NoNewline
    Write-Host ")" -NoNewline

    $Again = Read-Host

    if ($Again -notmatch '^(Y|y)$') {

        $ContinueProjects = $false
    }
}

if ($ExcelInitialized) {

    Show-Step "Saving Newforma workbook..." "Run"

    Save-NewformaWorkbook -SavePath $NewformaSavePath

    Show-Step "Saving Newforma workbook..." "Done"
}
    Write-Host ""
    Write-Host -ForegroundColor Yellow "[$(Get-Date -Format 'HH:mm:ss')] Project routine completed`n"
