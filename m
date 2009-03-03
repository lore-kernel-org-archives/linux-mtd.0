Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LeOFB-0001l4-Uc
	for linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 06:36:48 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KFX00B8A3P2RB@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 15:36:38 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KFX00GW53P25Q@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 15:36:38 +0900 (KST)
Date: Tue, 03 Mar 2009 15:36:31 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 3/3] [MTD] [OneNAND] Add bbt_wait & unlock_all as	replaceable
	for some platform
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-id: <20090303063631.GA30269@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add bbt_wait & unlock_all as replaceable for some platform such as s3c64xx
s3c64xx has its own OneNAND controller and another interface

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |   12 ++++++++++--
 include/linux/mtd/onenand.h        |    5 +++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 7af863a..565599b 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1511,7 +1511,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 
 		onenand_update_bufferram(mtd, from, 0);
 
-		ret = onenand_bbt_wait(mtd, FL_READING);
+		ret = this->bbt_wait(mtd, FL_READING);
 		if (unlikely(ret))
 			ret = onenand_recover_lsb(mtd, from, ret);
 
@@ -2532,6 +2532,10 @@ static void onenand_unlock_all(struct mtd_info *mtd)
 		    & ONENAND_CTRL_ONGO)
 			continue;
 
+		/* Don't check lock status */
+		if (this->options & ONENAND_SKIP_UNLOCK_CHECK)
+			return;
+
 		/* Check lock status */
 		if (onenand_check_lock_status(this))
 			return;
@@ -3407,6 +3411,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 		this->command = onenand_command;
 	if (!this->wait)
 		onenand_setup_wait(mtd);
+	if (!this->bbt_wait)
+		this->bbt_wait = onenand_bbt_wait;
+	if (!this->unlock_all)
+		this->unlock_all = onenand_unlock_all;
 
 	if (!this->read_bufferram)
 		this->read_bufferram = onenand_read_bufferram;
@@ -3524,7 +3532,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	mtd->owner = THIS_MODULE;
 
 	/* Unlock whole block */
-	onenand_unlock_all(mtd);
+	this->unlock_all(mtd);
 
 	ret = this->scan_bbt(mtd);
 	if ((!FLEXONENAND(this)) || ret)
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 1ce6c39..c3aed89 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -97,6 +97,8 @@ struct onenand_bufferram {
  * @command:		[REPLACEABLE] hardware specific function for writing
  *			commands to the chip
  * @wait:		[REPLACEABLE] hardware specific function for wait on ready
+ * @bbt_wait:		[REPLACEABLE] hardware specific function for bbt wait on ready
+ * @unlock_all:		[REPLACEABLE] hardware specific function for unlock all
  * @read_bufferram:	[REPLACEABLE] hardware specific function for BufferRAM Area
  * @write_bufferram:	[REPLACEABLE] hardware specific function for BufferRAM Area
  * @read_word:		[REPLACEABLE] hardware specific function for read
@@ -141,6 +143,8 @@ struct onenand_chip {
 
 	int (*command)(struct mtd_info *mtd, int cmd, loff_t address, size_t len);
 	int (*wait)(struct mtd_info *mtd, int state);
+	int (*bbt_wait)(struct mtd_info *mtd, int state);
+	void (*unlock_all)(struct mtd_info *mtd);
 	int (*read_bufferram)(struct mtd_info *mtd, int area,
 			unsigned char *buffer, int offset, size_t count);
 	int (*write_bufferram)(struct mtd_info *mtd, int area,
@@ -207,6 +211,7 @@ struct onenand_chip {
 #define ONENAND_HAS_CONT_LOCK		(0x0001)
 #define ONENAND_HAS_UNLOCK_ALL		(0x0002)
 #define ONENAND_HAS_2PLANE		(0x0004)
+#define ONENAND_SKIP_UNLOCK_CHECK	(0x0100)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
 
-- 
1.5.3.3
