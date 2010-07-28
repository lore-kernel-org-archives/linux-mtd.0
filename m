Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oe27m-0006KV-Mv
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 08:36:28 +0000
Message-ID: <4C4FEC02.9050300@parrot.com>
Date: Wed, 28 Jul 2010 10:36:18 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Brian Norris <norris@broadcom.com>
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
References: <4C4DEA3D.5070208@broadcom.com> <4C4F3691.9020505@broadcom.com>
In-Reply-To: <4C4F3691.9020505@broadcom.com>
Content-Type: multipart/mixed; boundary="------------060106090002010505080706"
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------060106090002010505080706
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Brian Norris a écrit :
> I found some newer Micron parts that introduce an 8K page size, and so
> need a modification on the algorithm. Here's the updated list and a
> revision to my patch.
> 
Doesn't these micron nands support onfi ?
The micron nands we have support it.

I have started to add onfi support to mtd, but ATM it is ugly/incomplete.

I attach what I have (it is against 2.6.27, but could easily ported to 
new kernel).


Matthieu

PS : onfi support is also interesting for nand driver. They could get 
which speed support the nand (ie mtd could export some info for them).
BTW some drivers like denali one, added onfi support in their driver 
instead of the generic layer...

> Part			ID String		Block	Page	OOB
> MT29F16G08ABABA		2C 48 00 26 89 00 00	512K	4K	224
> MT29F16G08CBABA		2C 48 04 46 85 00 00	1024K	4K	224
> MT29F16G08MAA		2C D5 94 3E 74 00 00	512K	4K	218
> MT29F32G08CBACA		2C 68 04 4A A9 00 00	1024K	4K	224
> MT29F64G08CBAAA		2C 88 04 4B A9 00 00	2048K	8K	448
> MT29F256G08CJAAA	2C A8 05 CB A9 00 00	2048K	8K	448
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>
> ---
>  drivers/mtd/nand/nand_base.c |   37 ++++++++++++++++++++++++++++---------
>  drivers/mtd/nand/nand_ids.c  |   10 ++++++++++
>  2 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4a7b864..a9216af 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2846,6 +2846,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  		 * Field definitions are in the following datasheets:
>  		 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
>  		 * New style   (6 byte ID): Samsung K9GAG08U0D (p.40)
> +		 * Micron      (5 byte ID): Micron MT29F16G08MAA (p.24)
> +		 *      Note: Micron rule is based on heuristics for
> +		 *            newer chips
>  		 *
>  		 * Check for wraparound + Samsung ID + nonzero 6th byte
>  		 * to decide what to do.
> @@ -2867,15 +2870,31 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  			/* Calc pagesize */
>  			mtd->writesize = 1024 << (extid & 0x03);
>  			extid >>= 2;
> -			/* Calc oobsize */
> -			mtd->oobsize = (8 << (extid & 0x01)) *
> -				(mtd->writesize >> 9);
> -			extid >>= 2;
> -			/* Calc blocksize. Blocksize is multiples of 64KiB */
> -			mtd->erasesize = (64 * 1024) << (extid & 0x03);
> -			extid >>= 2;
> -			/* Get buswidth information */
> -			busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
> +			/* Check for 5 byte ID + Micron + read more 0x00 */
> +			if (id_data[0] == NAND_MFR_MICRON && id_data[4] != 0x00
> +					&& mtd->writesize >= 4096
> +					&& id_data[5] == 0x00
> +					&& id_data[6] == 0x00) {
> +				/* OOB is 218B/224B per 4KiB pagesize */
> +				mtd->oobsize = ((extid & 0x03) == 0x03 ? 218 :
> +						224) << (mtd->writesize >> 13);
> +				extid >>= 3;
> +				/* Blocksize is multiple of 64KiB */
> +				mtd->erasesize = mtd->writesize <<
> +					(extid & 0x03) << 6;
> +				/* All Micron have busw x8? */
> +				busw = 0;
> +			} else {
> +				/* Calc oobsize */
> +				mtd->oobsize = (8 << (extid & 0x01)) *
> +					(mtd->writesize >> 9);
> +				extid >>= 2;
> +				/* Calc blocksize (multiples of 64KiB) */
> +				mtd->erasesize = (64 * 1024) << (extid & 0x03);
> +				extid >>= 2;
> +				/* Get buswidth information */
> +				busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
> +			}
>  		}
>  	} else {
>  		/*
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index 89907ed..4f6e59a 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -107,9 +107,19 @@ struct nand_flash_dev nand_flash_ids[] = {
>  	/* 16 Gigabit */
>  	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
>  	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
> +	{"NAND 2GiB 3,3V 8-bit",	0x48, 0, 2048, 0, LP_OPTIONS},
>  	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
>  	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
>  
> +	/* 32 Gigabit */
> +	{"NAND 4GiB 3,3V 8-bit",	0x68, 0, 4096, 0, LP_OPTIONS},
> +
> +	/* 64 Gigabit */
> +	{"NAND 8GiB 3,3V 8-bit",	0x88, 0, 8192, 0, LP_OPTIONS},
> +
> +	/* 256 Gigabit */
> +	{"NAND 32GiB 3,3V 8-bit",	0xA8, 0, 32768, 0, LP_OPTIONS},
> +
>  	/*
>  	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
>  	 * have a strange page/block layout !  The chosen minimum erasesize is

--------------060106090002010505080706
Content-Type: text/x-diff; name="onfi.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="onfi.diff"

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c6bea32..1cde3e9 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2318,15 +2318,25 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 
 }
 
+static u16 onfi_crc(u16 crc, unsigned char const *p, size_t len)
+{
+    int i;
+    while (len--) {
+        crc ^= *p++ << 8;
+        for (i = 0; i < 8; i++)
+            crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
+    }
+    return crc;
+}
 /*
  * Get the flash and manufacturer id and lookup if the type is supported
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 						  struct nand_chip *chip,
-						  int busw, int *maf_id)
+						  int busw, int *maf_id, int *dev_id)
 {
 	struct nand_flash_dev *type = NULL;
-	int i, dev_id, maf_idx;
+	int i, maf_idx;
 	int tmp_id, tmp_manf;
 
 	/* Select the device */
@@ -2343,7 +2353,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	/* Read manufacturer and device IDs */
 	*maf_id = chip->read_byte(mtd);
-	dev_id = chip->read_byte(mtd);
+	*dev_id = chip->read_byte(mtd);
 
 	/* Try again to make sure, as some systems the bus-hold or other
 	 * interface concerns can cause random data which looks like a
@@ -2358,20 +2368,67 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	tmp_manf = chip->read_byte(mtd);
 	tmp_id = chip->read_byte(mtd);
 
-	if (tmp_manf != *maf_id || tmp_id != dev_id) {
+	if (tmp_manf != *maf_id || tmp_id != *dev_id) {
 		printk(KERN_INFO "%s: second ID read did not match "
 		       "%02x,%02x against %02x,%02x\n", __func__,
-		       *maf_id, dev_id, tmp_manf, tmp_id);
+		       *maf_id, *dev_id, tmp_manf, tmp_id);
 		return ERR_PTR(-ENODEV);
 	}
 
 	/* Lookup the flash id */
 	for (i = 0; nand_flash_ids[i].name != NULL; i++) {
-		if (dev_id == nand_flash_ids[i].id) {
+		if (*dev_id == nand_flash_ids[i].id) {
 			type =  &nand_flash_ids[i];
 			break;
 		}
 	}
+#if 1
+	if (!type || !type->pagesize) {
+		/* try ONFI for unknow chip or LP */
+		chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
+		if (chip->read_byte(mtd) == 'O' &&
+			chip->read_byte(mtd) == 'N' &&
+			chip->read_byte(mtd) == 'F' &&
+			chip->read_byte(mtd) == 'I') {
+
+			int param[256/4];
+			char *paramb = param;
+			int i;
+
+			printk(KERN_INFO "ONFI flash detected\n");
+			chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
+			for (i = 0; i < 3; i++) {
+				/* XXX this that ok to use read_buf at this stage ? */
+				chip->read_buf(mtd, paramb, 256);
+				if (onfi_crc(0x4F4E, paramb, 254) == le16_to_cpup(paramb+254))
+				{
+					 printk(KERN_INFO "ONFI param page %d valid\n", i);
+				}
+			}
+			if (i < 3) {
+				/* TODO */
+				if (!mtd->name)
+					mtd->name = "onfi flash";
+				mtd->writesize = le32_to_cpup(paramb+80);
+				mtd->erasesize = le32_to_cpup(paramb+92)*mtd->writesize;
+				mtd->oobsize = le16_to_cpup(paramb+84);
+				chip->chipsize = le32_to_cpup(paramb+96) * mtd->erasesize;
+				busw = 0;
+				if (le16_to_cpup(paramb+6) & 1)
+					busw = NAND_BUSWIDTH_16;
+
+				chip->options &= ~NAND_CHIPOPTIONS_MSK;
+				chip->options |= (NAND_NO_READRDY | NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
+				goto ident_done;
+
+			}
+		}
+	}
+#endif
+	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
+	/* Read manufacturer and device IDs */
+	tmp_manf = chip->read_byte(mtd);
+	tmp_id = chip->read_byte(mtd);
 
 	if (!type)
 		return ERR_PTR(-ENODEV);
@@ -2409,6 +2466,21 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		mtd->oobsize = mtd->writesize / 32;
 		busw = type->options & NAND_BUSWIDTH_16;
 	}
+	/* Get chip options, preserve non chip based options */
+	chip->options &= ~NAND_CHIPOPTIONS_MSK;
+	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
+
+	/* Check if chip is a not a samsung device. Do not clear the
+	 * options for chips which are not having an extended id.
+	 */
+	if (*maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
+		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
+ident_done:
+
+	/*
+	 * Set chip as a default. Board drivers can override it, if necessary
+	 */
+	chip->options |= NAND_NO_AUTOINCR;
 
 	/* Try to identify manufacturer */
 	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
@@ -2423,7 +2495,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
 		printk(KERN_INFO "NAND device: Manufacturer ID:"
 		       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
-		       dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
+		       *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
 		printk(KERN_WARNING "NAND bus width %d instead %d bit\n",
 		       (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
 		       busw ? 16 : 8);
@@ -2443,21 +2515,6 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	chip->badblockpos = mtd->writesize > 512 ?
 		NAND_LARGE_BADBLOCK_POS : NAND_SMALL_BADBLOCK_POS;
 
-	/* Get chip options, preserve non chip based options */
-	chip->options &= ~NAND_CHIPOPTIONS_MSK;
-	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
-
-	/*
-	 * Set chip as a default. Board drivers can override it, if necessary
-	 */
-	chip->options |= NAND_NO_AUTOINCR;
-
-	/* Check if chip is a not a samsung device. Do not clear the
-	 * options for chips which are not having an extended id.
-	 */
-	if (*maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
-		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
-
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
 		chip->erase_cmd = multi_erase_cmd;
@@ -2468,9 +2525,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	/* TODO onfi flash name */
 	printk(KERN_INFO "NAND device: Manufacturer ID:"
-	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
-	       nand_manuf_ids[maf_idx].name, type->name);
+	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
+	       nand_manuf_ids[maf_idx].name, type?type->name:mtd->name);
 
 	return type;
 }
@@ -2487,7 +2545,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
  */
 int nand_scan_ident(struct mtd_info *mtd, int maxchips)
 {
-	int i, busw, nand_maf_id;
+	int i, busw, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
 
@@ -2497,7 +2555,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips)
 	nand_set_defaults(chip, busw);
 
 	/* Read the flash type */
-	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id);
+	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id, &nand_dev_id);
 
 	if (IS_ERR(type)) {
 		printk(KERN_WARNING "No NAND device found!!!\n");
@@ -2514,7 +2572,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips)
 		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 		/* Read manufacturer and device IDs */
 		if (nand_maf_id != chip->read_byte(mtd) ||
-		    type->id != chip->read_byte(mtd))
+		    nand_dev_id != chip->read_byte(mtd))
 			break;
 	}
 	if (i > 1)
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 81774e5..edf3d27 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -78,6 +78,7 @@ extern void nand_wait_ready(struct mtd_info *mtd);
 #define NAND_CMD_RNDIN		0x85
 #define NAND_CMD_READID		0x90
 #define NAND_CMD_ERASE2		0xd0
+#define NAND_CMD_PARAM		0xec
 #define NAND_CMD_RESET		0xff
 
 /* Extended commands for large page devices */

--------------060106090002010505080706--
