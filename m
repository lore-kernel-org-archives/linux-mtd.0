Received: from ganesha.gnumonks.org ([2001:780:45:1d:2e0:81ff:fe28:898a])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MimBm-0005hn-Mj
	for linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 09:31:43 +0000
Date: Wed, 2 Sep 2009 18:30:45 +0900
From: Harald Welte <laforge@gnumonks.org>
To: linux-mtd@lists.infradead.org
Subject: [RFC] extending nand_ecclayout.eccpos once again
Message-ID: <20090902093045.GB7377@prithivi.gnumonks.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Jin-Sung Yang <jsgood.yang@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>, Ilho Lee <ilho215.lee@samsung.com>,
	Marc Zyngier <marc.zyngier@tomtom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

There are large page size (4k) NAND chips + corresponding controller that use
quite a lot of ECC, more than the traditional 48 bytes.

Specifically, at a 4kB page size and a 8bit ECC, there is a ECC layout
that uses 104 bytes ECC

Now the problem is that nand_ecclayout uses a static array of 64 entries,
and it is part of the MTD ABI to userspace.  simply changing 64 to a bigger
number will not do.

I am proposing something along the lines of the following patch, i.e.  add a
new 'nand_ecclayout2' structure (plus corresponding ioctl).  Unfortunately
this means that all the drivers also need to rename that structure now.

However, we cannot simply keep the old name and modify, since that again
breaks the ABI.

I'm increasing the size to 1024 bytes, hopefully that will be enough for
a long time.

Please provide some feedback on what you think, or ideas for different
approahces to implement this.

[pleaes note that this patch is not tested, it's simply to be used for
 discussion how to proceed. Once there is a decision, I'll provide
 the final/tested patch together with a ecclayout structure that actually
 usese this]


diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 5b081cb..0736343 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -772,13 +772,37 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 	}
 #endif
 
+	/* Legacy interface */
+	/* (better than MEMGETOOBSEL but superseded by ECCGETLAYOUT2 */
 	case ECCGETLAYOUT:
 	{
-		if (!mtd->ecclayout)
+		struct nand_ecclayout el_compat;
+		struct nand_ecclayout2 *el = mtd->ecclayout;
+		int ecc_count;
+
+		if (!el)
 			return -EOPNOTSUPP;
 
-		if (copy_to_user(argp, mtd->ecclayout,
-				 sizeof(struct nand_ecclayout)))
+		ecc_count = ARRAY_SIZE(el->eccpos);
+		for (i = 0; i < ARRAY_SIZE(el->eccpos); i++) {
+			if (el->eccpos[i] == 0) {
+				ecc_count = i;
+				break;
+			}
+		}
+
+		if (ecc_count > ARRAY_SIZE(el_compat.eccpos))
+			return -E2BIG;
+
+		memset(&el_compat, 0, sizeof(el_compat));
+		el_compat.eccbytes = el->eccbytes;
+		el_compat.oobavail = el->oobavail;
+		memcpy(&el_comapt.oobfree, el->oobfree,
+		       sizeof(el_compat.oobfree));
+		memcpy(&el_compat.eccpos, el->eccpos,
+		       ecc_count * sizeof(__u32));
+
+		if (copy_to_user(argp, &el_compat, sizeof(el_compat)))
 			return -EFAULT;
 		break;
 	}
@@ -815,6 +839,17 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 		break;
 	}
 
+	case ECCGETLAYOUT2:
+	{
+		if (!mtd->ecclayout)
+			return -EOPNOTSUPP;
+
+		if (copy_to_user(argp, mtd->ecclayout,
+				 sizeof(struct nand_ecclayout2)))
+			return -EFAULT;
+		break;
+	}
+
 	default:
 		ret = -ENOTTY;
 	}
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 20c828b..a2bd92f 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -64,7 +64,7 @@ module_param(on_flash_bbt, int, 0);
  * the bytes have to be consecutives to avoid
  * several NAND_CMD_RNDOUT during read
  */
-static struct nand_ecclayout atmel_oobinfo_large = {
+static struct nand_ecclayout2 atmel_oobinfo_large = {
 	.eccbytes = 4,
 	.eccpos = {60, 61, 62, 63},
 	.oobfree = {
@@ -77,7 +77,7 @@ static struct nand_ecclayout atmel_oobinfo_large = {
  * the bytes have to be consecutives to avoid
  * several NAND_CMD_RNDOUT during read
  */
-static struct nand_ecclayout atmel_oobinfo_small = {
+static struct nand_ecclayout2 atmel_oobinfo_small = {
 	.eccbytes = 4,
 	.eccpos = {0, 1, 2, 3},
 	.oobfree = {
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 8506e7e..a7e10bc 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -101,7 +101,7 @@ static struct nand_bbt_descr bootrom_bbt = {
 	.pattern = bbt_pattern,
 };
 
-static struct nand_ecclayout bootrom_ecclayout = {
+static struct nand_ecclayout2 bootrom_ecclayout = {
 	.eccbytes = 24,
 	.eccpos = {
 		0x8 * 0, 0x8 * 0 + 1, 0x8 * 0 + 2,
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 29acd06..dcbe190 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -456,7 +456,7 @@ static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
-static struct nand_ecclayout cafe_oobinfo_2048 = {
+static struct nand_ecclayout2 cafe_oobinfo_2048 = {
 	.eccbytes = 14,
 	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
 	.oobfree = {{14, 50}}
@@ -491,7 +491,7 @@ static struct nand_bbt_descr cafe_bbt_mirror_descr_2048 = {
 	.pattern = cafe_mirror_pattern_2048
 };
 
-static struct nand_ecclayout cafe_oobinfo_512 = {
+static struct nand_ecclayout2 cafe_oobinfo_512 = {
 	.eccbytes = 14,
 	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
 	.oobfree = {{14, 2}}
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 0fad648..6af600b 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -54,7 +54,7 @@
 struct davinci_nand_info {
 	struct mtd_info		mtd;
 	struct nand_chip	chip;
-	struct nand_ecclayout	ecclayout;
+	struct nand_ecclayout2	ecclayout;
 
 	struct device		*dev;
 	struct clk		*clk;
@@ -488,7 +488,7 @@ static void __init nand_dm6446evm_flash_init(struct davinci_nand_info *info)
  * ten ECC bytes plus the manufacturer's bad block marker byte, and
  * and not overlapping the default BBT markers.
  */
-static struct nand_ecclayout hwecc4_small __initconst = {
+static struct nand_ecclayout2 hwecc4_small __initconst = {
 	.eccbytes = 10,
 	.eccpos = { 0, 1, 2, 3, 4,
 		/* offset 5 holds the badblock marker */
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index e51c1ed..e7af775 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1049,7 +1049,7 @@ static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat,
  * safer.  The only problem with it is that any code that parses oobfree must
  * be able to handle out-of-order segments.
  */
-static struct nand_ecclayout doc200x_oobinfo = {
+static struct nand_ecclayout2 doc200x_oobinfo = {
 	.eccbytes = 6,
 	.eccpos = {0, 1, 2, 3, 4, 5},
 	.oobfree = {{8, 8}, {6, 2}}
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 1f6eb25..b74c093 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -85,28 +85,28 @@ struct fsl_elbc_ctrl {
 /* These map to the positions used by the FCM hardware ECC generator */
 
 /* Small Page FLASH with FMR[ECCM] = 0 */
-static struct nand_ecclayout fsl_elbc_oob_sp_eccm0 = {
+static struct nand_ecclayout2 fsl_elbc_oob_sp_eccm0 = {
 	.eccbytes = 3,
 	.eccpos = {6, 7, 8},
 	.oobfree = { {0, 5}, {9, 7} },
 };
 
 /* Small Page FLASH with FMR[ECCM] = 1 */
-static struct nand_ecclayout fsl_elbc_oob_sp_eccm1 = {
+static struct nand_ecclayout2 fsl_elbc_oob_sp_eccm1 = {
 	.eccbytes = 3,
 	.eccpos = {8, 9, 10},
 	.oobfree = { {0, 5}, {6, 2}, {11, 5} },
 };
 
 /* Large Page FLASH with FMR[ECCM] = 0 */
-static struct nand_ecclayout fsl_elbc_oob_lp_eccm0 = {
+static struct nand_ecclayout2 fsl_elbc_oob_lp_eccm0 = {
 	.eccbytes = 12,
 	.eccpos = {6, 7, 8, 22, 23, 24, 38, 39, 40, 54, 55, 56},
 	.oobfree = { {1, 5}, {9, 13}, {25, 13}, {41, 13}, {57, 7} },
 };
 
 /* Large Page FLASH with FMR[ECCM] = 1 */
-static struct nand_ecclayout fsl_elbc_oob_lp_eccm1 = {
+static struct nand_ecclayout2 fsl_elbc_oob_lp_eccm1 = {
 	.eccbytes = 12,
 	.eccpos = {8, 9, 10, 24, 25, 26, 40, 41, 42, 56, 57, 58},
 	.oobfree = { {1, 7}, {11, 13}, {27, 13}, {43, 13}, {59, 5} },
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 76beea4..53b2bee 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -129,19 +129,19 @@ struct mxc_nand_host {
 #define SPARE_SINGLEBIT_ERROR 0x1
 
 /* OOB placement block for use with hardware ecc generation */
-static struct nand_ecclayout nand_hw_eccoob_8 = {
+static struct nand_ecclayout2 nand_hw_eccoob_8 = {
 	.eccbytes = 5,
 	.eccpos = {6, 7, 8, 9, 10},
 	.oobfree = {{0, 5}, {11, 5}, }
 };
 
-static struct nand_ecclayout nand_hw_eccoob_16 = {
+static struct nand_ecclayout2 nand_hw_eccoob_16 = {
 	.eccbytes = 5,
 	.eccpos = {6, 7, 8, 9, 10},
 	.oobfree = {{0, 5}, {11, 5}, }
 };
 
-static struct nand_ecclayout nand_hw_eccoob_64 = {
+static struct nand_ecclayout2 nand_hw_eccoob_64 = {
 	.eccbytes = 20,
 	.eccpos = {6, 7, 8, 9, 10, 22, 23, 24, 25, 26,
 		   38, 39, 40, 41, 42, 54, 55, 56, 57, 58},
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8c21b89..a586836 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -53,7 +53,7 @@
 #endif
 
 /* Define default oob placement schemes for large and small page devices */
-static struct nand_ecclayout nand_oob_8 = {
+static struct nand_ecclayout2 nand_oob_8 = {
 	.eccbytes = 3,
 	.eccpos = {0, 1, 2},
 	.oobfree = {
@@ -63,7 +63,7 @@ static struct nand_ecclayout nand_oob_8 = {
 		 .length = 2}}
 };
 
-static struct nand_ecclayout nand_oob_16 = {
+static struct nand_ecclayout2 nand_oob_16 = {
 	.eccbytes = 6,
 	.eccpos = {0, 1, 2, 3, 6, 7},
 	.oobfree = {
@@ -71,7 +71,7 @@ static struct nand_ecclayout nand_oob_16 = {
 		 . length = 8}}
 };
 
-static struct nand_ecclayout nand_oob_64 = {
+static struct nand_ecclayout2 nand_oob_64 = {
 	.eccbytes = 24,
 	.eccpos = {
 		   40, 41, 42, 43, 44, 45, 46, 47,
@@ -82,7 +82,7 @@ static struct nand_ecclayout nand_oob_64 = {
 		 .length = 38}}
 };
 
-static struct nand_ecclayout nand_oob_128 = {
+static struct nand_ecclayout2 nand_oob_128 = {
 	.eccbytes = 48,
 	.eccpos = {
 		   80, 81, 82, 83, 84, 85, 86, 87,
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 11dc7e6..6648a87 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -64,7 +64,7 @@ static const int clock_stop = 0;
 /* new oob placement block for use with hardware ecc generation
  */
 
-static struct nand_ecclayout nand_hw_eccoob = {
+static struct nand_ecclayout2 nand_hw_eccoob = {
 	.eccbytes = 3,
 	.eccpos = {0, 1, 2},
 	.oobfree = {{8, 8}}
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 2bc8966..f1a85fe 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -32,7 +32,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sh_flctl.h>
 
-static struct nand_ecclayout flctl_4secc_oob_16 = {
+static struct nand_ecclayout2 flctl_4secc_oob_16 = {
 	.eccbytes = 10,
 	.eccpos = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 	.oobfree = {
@@ -40,7 +40,7 @@ static struct nand_ecclayout flctl_4secc_oob_16 = {
 		. length = 4} },
 };
 
-static struct nand_ecclayout flctl_4secc_oob_64 = {
+static struct nand_ecclayout2 flctl_4secc_oob_64 = {
 	.eccbytes = 10,
 	.eccpos = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57},
 	.oobfree = {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0f32a9b..a0e6e8d 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -138,7 +138,7 @@ struct mtd_info {
 	int index;
 
 	/* ecc layout structure pointer - read only ! */
-	struct nand_ecclayout *ecclayout;
+	struct nand_ecclayout2 *ecclayout;
 
 	/* Data for variable erase regions. If numeraseregions is zero,
 	 * it means that the whole device has erasesize as given above.
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 4030eba..88fc02e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -261,7 +261,7 @@ struct nand_ecc_ctrl {
 	int			total;
 	int			prepad;
 	int			postpad;
-	struct nand_ecclayout	*layout;
+	struct nand_ecclayout2	*layout;
 	void			(*hwctl)(struct mtd_info *mtd, int mode);
 	int			(*calculate)(struct mtd_info *mtd,
 					     const uint8_t *dat,
@@ -405,7 +405,7 @@ struct nand_chip {
 
 	uint8_t		*oob_poi;
 	struct nand_hw_control  *controller;
-	struct nand_ecclayout	*ecclayout;
+	struct nand_ecclayout2	*ecclayout;
 
 	struct nand_ecc_ctrl ecc;
 	struct nand_buffers *buffers;
@@ -571,7 +571,7 @@ struct platform_nand_chip {
 	int			chip_offset;
 	int			nr_partitions;
 	struct mtd_partition	*partitions;
-	struct nand_ecclayout	*ecclayout;
+	struct nand_ecclayout2	*ecclayout;
 	int			chip_delay;
 	unsigned int		options;
 	const char		**part_probe_types;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index be51ae2..a449d30 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -110,6 +110,7 @@ struct otp_info {
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define ECCGETLAYOUT2		_IOR('M', 23, struct nand_ecclayout2)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
@@ -139,6 +140,16 @@ struct nand_ecclayout {
 	struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
 };
 
+/* ECC layount control structure, later version, this time with
+ * way more space in the eccpos array, hopefully no need to change
+ * it again in the future */
+struct nand_ecclayout2 {
+	__u32 eccbytes;
+	__u32 eccpos[1024];
+	__u32 oobavail;
+	struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
+};
+
 /**
  * struct mtd_ecc_stats - error correction stats
  *
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
