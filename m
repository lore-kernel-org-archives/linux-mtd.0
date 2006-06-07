Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FnvoH-0006xR-Q5
	for linux-mtd@lists.infradead.org; Wed, 07 Jun 2006 07:02:59 -0400
Received: from ep_mmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J0H000SELCIX7@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 07 Jun 2006 20:02:42 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0J0H00JVGLCHZZ@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 07 Jun 2006 20:02:42 +0900 (KST)
Date: Wed, 07 Jun 2006 20:02:41 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] fix OneNAND probe whether Sync. burst read mode or not
To: linux-mtd@lists.infradead.org
Message-id: <011401c68a21$e5d197b0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-version: 1.0
Content-type: text/plain; charset=ks_c_5601-1987
Content-transfer-encoding: 7BIT
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Fix OneNAND probe whether Sync. burst read mode or not
	- Bootloader can set OneNAND Sync. burst read settings.
Fix OneNAND reset waiting problem

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 84ec40d..a08d468 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1628,6 +1628,11 @@ static int onenand_probe(struct mtd_info
 	int bram_maf_id, bram_dev_id, maf_id, dev_id;
 	int version_id;
 	int density;
+	int syscfg;
+
+	/* Save system configuration 1 */
+	syscfg = this->read_word(this->base + ONENAND_REG_SYS_CFG1);
+	this->write_word((syscfg & ~ONENAND_SYS_CFG1_SYNC_READ), this->base
+ ONENAND_REG_SYS_CFG1);
 
 	/* Send the command for reading device ID from BootRAM */
 	this->write_word(ONENAND_CMD_READID, this->base + ONENAND_BOOTRAM);
@@ -1636,13 +1641,17 @@ static int onenand_probe(struct mtd_info
 	bram_maf_id = this->read_word(this->base + ONENAND_BOOTRAM + 0x0);
 	bram_dev_id = this->read_word(this->base + ONENAND_BOOTRAM + 0x2);
 
+	/* Reset OneNAND to read default register values */
+	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_BOOTRAM);
+	this->wait(mtd, FL_RESETING);
+
+	/* Restore system configuration 1 */
+	this->write_word(syscfg, this->base + ONENAND_REG_SYS_CFG1);
+
 	/* Check manufacturer ID */
 	if (onenand_check_maf(bram_maf_id))
 		return -ENXIO;
 
-	/* Reset OneNAND to read default register values */
-	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_BOOTRAM);
-
 	/* Read manufacturer and device IDs from Register */
 	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
 	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
