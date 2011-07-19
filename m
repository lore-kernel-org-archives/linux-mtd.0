Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjIz0-0000vn-D4
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 22:41:45 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 04/10] nand-data: remove asterisks
Date: Tue, 19 Jul 2011 15:40:41 -0700
Message-ID: <1311115247-20636-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
References: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Asterisks (*) were added to indicate that support for certain NAND parts
was not yet integrated into the mainline kernel. Fixes have been merged
now, so remove the notes.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nand-data/header.tmpl  |    5 +----
 nand-data/nanddata.csv |   44 ++++++++++++++++++++++----------------------
 2 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/nand-data/header.tmpl b/nand-data/header.tmpl
index 47b9be2..239e9db 100644
--- a/nand-data/header.tmpl
+++ b/nand-data/header.tmpl
@@ -59,8 +59,5 @@ in the future.
 are detected properly except for their total size (perhaps because they are
 multi-die chips that should be detected by their sub-chipsize)</span> and
 <span class="exception">rows in red represent chips that are not detected
-properly</span>. Note in the columns with boolean values (i.e., TRUE or FALSE),
-a TRUE with an asterisk (*) represents a value that is TRUE only with support from
-patches which have not yet been accepted into the mainline kernel (e.g., support
-for detection of new Toshiba or Samsung ID decoding methods).
+properly</span>.
 </p>
diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 9743a15..c7539ac 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -65,12 +65,12 @@
 "Samsung","K9GAG08U0D","0xEC","0xD5","0xECD594293441",2048,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9LBG08U1D","0xEC","0xD5","0xECD594293441",4096,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 2 K9GAG08U0D"
 "Samsung","K9HCG08U5D","0xEC","0xD5","0xECD594293441",8192,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 4 K9GAG08U0D"
-"Spansion","S30ML512P","0x01","0x76","0x0176010110",64,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML512P","0x01","0x56","0x0156010110",64,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML256P","0x01","0x75","0x0175010110",32,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML256P","0x01","0x55","0x0155010110",32,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML128P","0x01","0x73","0x0173010110",16,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML128P","0x01","0x53","0x0153030110",16,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x04"
+"Spansion","S30ML512P","0x01","0x76","0x0176010101",64,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML512P","0x01","0x56","0x0156010101",64,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML256P","0x01","0x75","0x0175010101",32,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML256P","0x01","0x55","0x0155010101",32,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML128P","0x01","0x73","0x0173010101",16,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML128P","0x01","0x53","0x0153030101",16,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x04"
 "Samsung","K9K8G08U0A","0xEC","0xD3","0xECD3519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Samsung","K9WAG08U1A","0xEC","0xD3","0xECD3519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Samsung","K9NBG08U5A","0xEC","0xD3","0xECD3519558",4096,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
@@ -167,27 +167,27 @@
 "Samsung","K9LBG08U0M","0xEC","0xD7","0xECD755B678",4096,4096,128,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9HCG08U1M","0xEC","0xD7","0xECD755B678",8192,4096,128,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 2 K9LBG08U0M"
 "Samsung","K9MDG08U5M","0xEC","0xD7","0xECD755B678",16384,4096,128,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 4 K9LBG08U0M"
-"Toshiba","TC58TxG4S2FBAxx","0x98","0xD5","0x98D5...",2048,8192,576,"512 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"TBD/1096-byte",1,6,"Extended ID decode",FALSE,FALSE,"TRUE*",TRUE,FALSE,TRUE,TRUE,"TRUE*","Datasheet doesn't list full ID, only shows ID decoder table"
-"Toshiba","TH58TxG7S2FBAxx","0x98","0xD7","0x98D7...",16384,8192,576,"512 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"TBD/1096-byte",1,6,"Extended ID decode",FALSE,FALSE,"TRUE*",TRUE,FALSE,TRUE,TRUE,"TRUE*","Datasheet doesn't list full ID, only shows ID decoder table"
+"Toshiba","TC58TxG4S2FBAxx","0x98","0xD5","0x98D5...",2048,8192,576,"512 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"TBD/1096-byte",1,6,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
+"Toshiba","TH58TxG7S2FBAxx","0x98","0xD7","0x98D7...",16384,8192,576,"512 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"TBD/1096-byte",1,6,"Extended ID decode",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
 "Hynix","HY27UF082G2B","0xAD","0xDA","0xADDA109544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Hynix","HY27UF162G2B","0xAD","0xCA","0xADCA10D544",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Hynix","HY27US081G1M","0xAD","0x79","0xAD79A500",128,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"4-bit/528-byte",1,4,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",
-"Hynix","HY27US161G1M","0xAD","0x74","0xAD74A500",128,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,4,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",
-"Hynix","HY27US08561A","0xAD","0x75","0xAD75",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*","remains in Read ID mode"
-"Hynix","HY27US16561A","0xAD","0x55","0xAD55",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*","remains in Read ID mode"
-"Hynix","HY27SS08561A","0xAD","0x35","0xAD35",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*","remains in Read ID mode"
-"Hynix","HY27SS16561A","0xAD","0x45","0xAD45",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*","remains in Read ID mode"
-"Hynix","HY27US0812(1/2)B","0xAD","0x76","0xAD76",64,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,4,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"TRUE*",
+"Hynix","HY27US081G1M","0xAD","0x79","0xAD79A500",128,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"4-bit/528-byte",1,4,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Hynix","HY27US161G1M","0xAD","0x74","0xAD74A500",128,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,4,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Hynix","HY27US08561A","0xAD","0x75","0xAD75",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
+"Hynix","HY27US16561A","0xAD","0x55","0xAD55",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
+"Hynix","HY27SS08561A","0xAD","0x35","0xAD35",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/512-byte",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
+"Hynix","HY27SS16561A","0xAD","0x45","0xAD45",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
+"Hynix","HY27US0812(1/2)B","0xAD","0x76","0xAD76",64,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,4,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Hynix","HY27US1612(1/2)B","0xAD","0x56","0xAD56",64,512,16,"16 KB","x16","N/A","1st or 2nd page (3rd word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,4,"ID Table",FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"This is the ONLY x16 chip that uses byte 6 (""word 3"") for BBM"
 "Samsung","K9F1G08U0D","0xEC","0xF1","0xECF1001540",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9G8G08B0M","0xEC","0xD3","0xECD3142564",1024,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9G8G08U0M","0xEC","0xD3","0xECD3142564",1024,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9LAG08U1M","0xEC","0xD3","0xECD3142564",2048,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 2 K9G8G08U0M"
-"Samsung","K9GBG08U0M","0xEC","0xD7","0xECD794725442",4096,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,TRUE,"TRUE*",TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
-"Samsung","K9LCG08U1M","0xEC","0xD7","0xECD794725442",8192,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,"TRUE*",TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
-"Samsung","K9HDG08U5M","0xEC","0xD7","0xECD794725442",16384,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,"TRUE*",TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
+"Samsung","K9GBG08U0M","0xEC","0xD7","0xECD794725442",4096,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
+"Samsung","K9LCG08U1M","0xEC","0xD7","0xECD794725442",8192,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
+"Samsung","K9HDG08U5M","0xEC","0xD7","0xECD794725442",16384,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
 "Toshiba","TC58DVG02A5","0x98","0x79","0x9879",128,512,16,"16 KB","x8","N/A","All OOB bytes",,,,,"TBD/512-byte","1?",2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,,"Preliminary sheet"
-"Toshiba","TC58DVG3S0E","0x98","0xD3","0x98D3...",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"TBD/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,"TRUE*","Datasheet doesn't list full ID, only shows ID decoder table; Preliminary sheet"
-"Toshiba","TC58NVG0S3E","0x98","0xD1","0x98D1...",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,"TRUE*","similar part, different manufacturer (Numonyx NAND512-A2D); further cycles ignored"
-"Toshiba","TC58NVG1S3E","0x98","0xDA","0x98DA...",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,"TRUE*","Datasheet doesn't list full ID, only shows ID decoder table"
-"Toshiba","TC58NVG2S3E","0x98","0xDC","0x98DC...",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,"TRUE*","Datasheet doesn't list full ID, only shows ID decoder table"
+"Toshiba","TC58DVG3S0E","0x98","0xD3","0x98D3...",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"TBD/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table; Preliminary sheet"
+"Toshiba","TC58NVG0S3E","0x98","0xD1","0x98D1...",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
+"Toshiba","TC58NVG1S3E","0x98","0xDA","0x98DA...",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
+"Toshiba","TC58NVG2S3E","0x98","0xDC","0x98DC...",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
-- 
1.7.0.4
