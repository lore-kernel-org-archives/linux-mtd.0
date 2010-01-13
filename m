Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NV2vh-0001qY-FL
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 13:06:38 +0000
Received: by bwz4 with SMTP id 4so15510672bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Jan 2010 05:06:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791001130453md91ad46ld84f9d51ccd96e87@mail.gmail.com>
References: <ce9ab5791001130453md91ad46ld84f9d51ccd96e87@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 13 Jan 2010 18:36:12 +0530
Message-ID: <ce9ab5791001130506g28bb330dm79225c688839323d@mail.gmail.com>
Subject: Re: [PATCH 2/2] Creating helper func for block alignment verfication
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

On Wed, Jan 13, 2010 at 6:23 PM, Vimal Singh <vimal.newwork@gmail.com> wrote:
> From cde21be80002b49fb8baeb341e8ae5a1a2394cb6 Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Wed, 13 Jan 2010 18:11:47 +0530
> Subject: [PATCH] Creating helper func for block alignment verfication
>
> These checks are fairly common in 'nand_erase_nand', 'nand_lock'
> and 'nand_unlock' fucntions.
>

I just ran checkpatch.pl and this patch had an error.
Corrected patch is below.

-vimal

>From 310f7faa8f319bd9384512f7d5a7f13dcfbeebc8 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Wed, 13 Jan 2010 18:11:47 +0530
Subject: [PATCH] Creating helper func for block alignment verfication

These checks are fairly common in 'nand_erase_nand', 'nand_lock'
and 'nand_unlock' functions.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_base.c |   97 +++++++++++++++---------------------------
 1 files changed, 34 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4e27426..c80cec5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -108,6 +108,37 @@ static int nand_do_write_oob(struct
  */
 DEFINE_LED_TRIGGER(nand_led_trigger);

+static int block_alignment_verification(struct mtd_info *mtd,
+					loff_t ofs, uint64_t len)
+{
+	struct nand_chip *chip = mtd->priv;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+			__func__, (unsigned long long)ofs, len);
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
+	return 0;
+}
+
 /**
  * nand_release_device - [GENERIC] release chip
  * @mtd:	MTD device structure
@@ -894,28 +925,8 @@ int nand_unlock(struct mtd_info
 	int chipnr;
 	struct nand_chip *chip = mtd->priv;

-	/* Start address must align on block boundary */
-	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	/* Length must align on block boundary */
-	if (len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
-					__func__);
-		ret = -EINVAL;
+	if (block_alignment_verification(mtd, ofs, len))
 		goto out;
-	}
-
-	/* Do not allow past end of device */
-	if (ofs + len > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
-					__func__);
-		ret = -EINVAL;
-		goto out;
-	}

 	/* Align to last block address if size addresses end of the device */
 	if (ofs + len == mtd->size)
@@ -968,31 +979,8 @@ int nand_lock(struct mtd_info
 	int chipnr, status, page;
 	struct nand_chip *chip = mtd->priv;

-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
-			__func__, (unsigned long long)ofs, len);
-
-	/* Start address must align on block boundary */
-	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	/* Length must align on block boundary */
-	if (len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
-					__func__);
-		ret = -EINVAL;
+	if (block_alignment_verification(mtd, ofs, len))
 		goto out;
-	}
-
-	/* Do not allow past end of device */
-	if (ofs + len > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
-					__func__);
-		ret = -EINVAL;
-		goto out;
-	}

 	nand_get_device(chip, mtd, FL_LOCKING);

@@ -2495,25 +2483,8 @@ int nand_erase_nand(struct
 				__func__, (unsigned long long)instr->addr,
 				(unsigned long long)instr->len);

-	/* Start address must align on block boundary */
-	if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
+	if (block_alignment_verification(mtd, instr->addr, instr->len))
 		return -EINVAL;
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
-		return -EINVAL;
-	}

 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;

-- 
1.5.5
