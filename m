Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HF69Y-0008PW-QI
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 05:05:23 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l18A1MYX001725
	for <linux-mtd@lists.infradead.org>; Thu, 8 Feb 2007 12:01:45 +0200
Message-ID: <45CAF583.8000709@nokia.com>
Date: Thu, 08 Feb 2007 12:03:47 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] OneNAND: Invalidate bufferRAM after erase
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

>From df9f430fa8198c7d60acdcf0c237a34916b5ac5b Mon Sep 17 00:00:00 2001
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Wed, 7 Feb 2007 13:55:19 +0200
Subject: [MTD] OneNAND: Invalidate bufferRAM after erase

OneNAND has internal bufferRAMs.  The driver keeps track of
what is in the bufferRAM to save having to load from the
NAND core.  After an erase operation, the driver must
mark bufferRAM invalid if it refers to the erased block.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index f690c19..cf66c93 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -628,6 +628,29 @@ static void onenand_update_bufferram(str
 }
 
 /**
+ * onenand_invalidate_bufferram_range - [GENERIC] Invalidate BufferRAM information
+ * @param mtd		MTD data structure
+ * @param addr		start address to invalidate
+ * @param len		length to invalidate
+ *
+ * Invalidate BufferRAM information
+ */
+static void onenand_invalidate_bufferram_range(struct mtd_info *mtd, loff_t addr,
+		unsigned int len)
+{
+	struct onenand_chip *this = mtd->priv;
+	int i;
+	loff_t end_addr = addr + len;
+
+	/* Invalidate BufferRAM */
+	for (i = 0; i < MAX_BUFFERRAM; i++) {
+		loff_t buf_addr = this->bufferram[i].blockpage << this->page_shift;
+		if (buf_addr >= addr && buf_addr < end_addr)
+			this->bufferram[i].blockpage = -1;
+	}
+}
+
+/**
  * onenand_get_device - [GENERIC] Get chip for selected access
  * @param mtd		MTD device structure
  * @param new_state	the state which is requested
@@ -1466,6 +1489,8 @@ static int onenand_erase(struct mtd_info
 			goto erase_exit;
 		}
 
+		onenand_invalidate_bufferram_range(mtd, addr, block_size);
+
 		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);
 
 		ret = this->wait(mtd, FL_ERASING);
-- 
1.4.3
