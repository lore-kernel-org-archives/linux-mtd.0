Received: from mail-bw0-f221.google.com ([209.85.218.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NchVB-00008v-Bj
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 15:50:54 +0000
Received: by bwz21 with SMTP id 21so1147942bwz.4
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Feb 2010 07:50:42 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 3 Feb 2010 21:18:46 +0530
Message-ID: <ce9ab5791002030748j64401674u76285aade0f6365d@mail.gmail.com>
Subject: [PATCH v2 1/2] Creating helper func for 'ofs' and 'len' verification
	for 'nand_erase_nand'
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 288857587cc64c6d223cce6a4f49826ccf9ff0a9 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Wed, 3 Feb 2010 14:12:24 +0530
Subject: [PATCH 1/2] Creating helper func for 'ofs' and 'len'
verification for 'nand_erase_nand'

These checks are expected to be used by 'nand_lock' and 'nand_unlock'
routines too. As all these three are block aligned operations.
So, creating a helper function for this makes sense.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_base.c |   48 ++++++++++++++++++++++++++---------------
 1 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8f2958f..2dfeb4b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -108,6 +108,35 @@ static int nand_do_write_oob(struct
  */
 DEFINE_LED_TRIGGER(nand_led_trigger);

+static int check_offs_len(struct mtd_info *mtd,
+					loff_t ofs, uint64_t len)
+{
+	struct nand_chip *chip = mtd->priv;
+	int ret = 0;
+
+	/* Start address must align on block boundary */
+	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
+		ret = -EINVAL;
+	}
+
+	/* Length must align on block boundary */
+	if (len & ((1 << chip->phys_erase_shift) - 1)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
+					__func__);
+		ret = -EINVAL;
+	}
+
+	/* Do not allow past end of device */
+	if (ofs + len > mtd->size) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
+					__func__);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 /**
  * nand_release_device - [GENERIC] release chip
  * @mtd:	MTD device structure
@@ -2293,25 +2322,8 @@ int nand_erase_nand(struct
 				__func__, (unsigned long long)instr->addr,
 				(unsigned long long)instr->len);

-	/* Start address must align on block boundary */
-	if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
-		return -EINVAL;
-	}
-
-	/* Length must align on block boundary */
-	if (instr->len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
-					__func__);
-		return -EINVAL;
-	}
-
-	/* Do not allow erase past end of device */
-	if ((instr->len + instr->addr) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Erase past end of device\n",
-					__func__);
+	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
-	}

 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;

-- 
1.6.3.3
