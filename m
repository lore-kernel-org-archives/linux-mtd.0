Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HF6AF-0008Sh-Mg
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 05:06:57 -0500
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l18A3RNk021635
	for <linux-mtd@lists.infradead.org>; Thu, 8 Feb 2007 12:03:35 +0200
Message-ID: <45CAF5C6.9020105@nokia.com>
Date: Thu, 08 Feb 2007 12:04:54 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] OneNAND: Select correct chip's bufferRAM for DDP
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 9cb655eddb756a18a7deadc08fed9abbf934c13c Mon Sep 17 00:00:00 2001
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Thu, 8 Feb 2007 10:28:08 +0200
Subject: [MTD] OneNAND: Select correct chip's bufferRAM for DDP

OneNAND double-density package (DDP) has two chips, each with
their own bufferRAM.  The driver will skip loading data from
the NAND core if the data can be found in a bufferRAM, however
in that case, the correct chip's bufferRAM must be selected
before reading from bufferRAM.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   24 ++++++++++++++++--------
 1 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index cf66c93..162a373 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -577,7 +577,7 @@ static int onenand_write_bufferram(struc
 static int onenand_check_bufferram(struct mtd_info *mtd, loff_t addr)
 {
 	struct onenand_chip *this = mtd->priv;
-	int blockpage;
+	int blockpage, found = 0;
 	unsigned int i;
 
 	blockpage = (int) (addr >> this->page_shift);
@@ -585,16 +585,24 @@ static int onenand_check_bufferram(struc
 	/* Is there valid data? */
 	i = ONENAND_CURRENT_BUFFERRAM(this);
 	if (this->bufferram[i].blockpage == blockpage)
-		return 1;
+		found = 1;
+	else {
+		/* Check another BufferRAM */
+		i = ONENAND_NEXT_BUFFERRAM(this);
+		if (this->bufferram[i].blockpage == blockpage) {
+			ONENAND_SET_NEXT_BUFFERRAM(this);
+			found = 1;
+		}
+	}
 
-	/* Check another BufferRAM */
-	i = ONENAND_NEXT_BUFFERRAM(this);
-	if (this->bufferram[i].blockpage == blockpage) {
-		ONENAND_SET_NEXT_BUFFERRAM(this);
-		return 1;
+	if (found && ONENAND_IS_DDP(this)) {
+		/* Select DataRAM for DDP */
+		int block = (int) (addr >> this->erase_shift);
+		int value = onenand_bufferram_address(this, block);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 	}
 
-	return 0;
+	return found;
 }
 
 /**
-- 
1.4.3
