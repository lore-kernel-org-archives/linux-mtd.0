Received: from mta076c.interbusiness.it ([85.37.17.76])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GGcEk-0006Oi-Pe
	for linux-mtd@lists.infradead.org; Fri, 25 Aug 2006 15:00:45 +0100
Message-ID: <44EF0001.3000803@eptar.com>
From: Claudio Lanconelli <lanconelli.claudio@eptar.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH][NAND] Add ssfdc read-only translation layer
References: <449AA7E2.5020609@eptar.com>
	<1151417243.17609.151.camel@hades.cambridge.redhat.com>
In-Reply-To: <1151417243.17609.151.camel@hades.cambridge.redhat.com>
Content-Type: multipart/mixed; boundary="------------040809060708080802040806"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Fri, 25 Aug 2006 14:00:48 -0000

This is a multi-part message in MIME format.
--------------040809060708080802040806
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

>   
>> One question, I use major number 44 (since it's the number used by old 
>> ssfdc.c) but I don't know if it's the correct number.
>>     
>
> It isn't. Please send mail to device@lanana.org requesting a new major
> number.
>   
It takes some time but finally I got a new major number:

257 block	SSFDC Flash Translation Layer filesystem
		  0 = /dev/ssfdca	First SSFDC layer
		  8 = /dev/ssfdcb	Second SSFDC layer
		 16 = /dev/ssfdcc	Third SSFDC layer
		 24 = /dev/ssfdcd	4th SSFDC layer
		 32 = /dev/ssfdce	5th SSFDC layer
		 40 = /dev/ssfdcf	6th SSFDC layer
		 48 = /dev/ssfdcg	7th SSFDC layer
		 56 = /dev/ssfdch	8th SSFDC layer


> Also, why is the GETGEO stuff conditional? Why not just build it in
> always? And do we need the table? Can't we just calculate it? There's
> code to do similar calculations in NFTL already.
>
>   
and also I removed GETGETO conditional stuffs.
New version in the attachment

Cheers,
Claudio Lanconelli

--------------040809060708080802040806
Content-Type: text/x-patch;
 name="ssfdc_ro.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ssfdc_ro.patch"

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 3db77ee..e66226f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -31,6 +31,14 @@ config MTD_NAND_ECC_SMC
 	  Software ECC according to the Smart Media Specification.
 	  The original Linux implementation had byte 0 and 1 swapped.
 
+config MTD_NAND_SSFDC_READONLY
+	bool "NAND SSFDC (SmartMedia) read only translation layer"
+	depends on MTD_NAND
+	default n
+	help
+	  This enable read only access to SmartMedia formatted Nand
+	  flash. You can mount it with FAT file system.
+
 config MTD_NAND_AUTCPU12
 	tristate "SmartMediaCard on autronix autcpu12 board"
 	depends on MTD_NAND && ARCH_AUTCPU12
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f747593..adee70e 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -22,5 +22,6 @@ obj-$(CONFIG_MTD_NAND_TS7250)		+= ts7250
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
+obj-$(CONFIG_MTD_NAND_SSFDC_READONLY)	+= ssfdc_ro.o
 
 nand-objs = nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/ssfdc_ro.c b/drivers/mtd/nand/ssfdc_ro.c
old mode 100755
new mode 100644
index 30a16ea..d2e7643
--- a/drivers/mtd/nand/ssfdc_ro.c
+++ b/drivers/mtd/nand/ssfdc_ro.c
@@ -20,16 +20,12 @@ #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/blktrans.h>
 
-/* #undef CONFIG_MTD_NAND_SSFDC_GETGEO */
-
 struct ssfdcr_record {
 	struct mtd_blktrans_dev mbd;
 	int usecount;
-#ifdef CONFIG_MTD_NAND_SSFDC_GETGEO
 	unsigned char heads;
 	unsigned char sectors;
 	unsigned short cylinders;
-#endif
 	int cis_block;			/* block n. containing CIS/IDI */
 	int erase_size;			/* phys_block_size */
 	unsigned short *logic_block_map; /* all zones (max 8192 phys blocks on
@@ -37,8 +33,7 @@ #endif
 	int map_len;			/* n. phys_blocks on the card */
 };
 
-
-#define SSFDCR_MAJOR		44
+#define SSFDCR_MAJOR		257
 #define SSFDCR_PARTN_BITS	3
 
 #define SECTOR_SIZE		512
@@ -60,8 +55,6 @@ SumSector	2,000	4,000	8,000	16,000	32,00
 SectorSize	512	512	512	512	512	512	512	512
 **/
 
-#ifdef CONFIG_MTD_NAND_SSFDC_GETGEO
-
 typedef struct {
 	unsigned long size;
 	unsigned short cyl;
@@ -104,14 +97,12 @@ static int get_chs(unsigned long size, u
 
 	return found;
 }
-#endif
 
 /* These bytes are the signature for the CIS/IDI sector */
 static const uint8_t cis_numbers[] = {
 	0x01, 0x03, 0xD9, 0x01, 0xFF, 0x18, 0x02, 0xDF, 0x01, 0x20
 };
 
-
 /* Read and check for a valid CIS sector */
 static int get_valid_cis_sector(struct mtd_info *mtd)
 {
@@ -140,7 +131,7 @@ static int get_valid_cis_sector(struct m
 				/* Found */
 				cis_sector = (int)(offset >> SECTOR_SHIFT);
 			} else {
-				DEBUG(MTD_DEBUG_LEVEL0,
+				DEBUG(MTD_DEBUG_LEVEL1,
 					"SSFDC_RO: CIS/IDI sector not found"
 					" on %s (mtd%d)\n", mtd->name,
 					mtd->index);
@@ -245,7 +236,6 @@ static int get_logical_address(uint8_t *
 	return block_address;
 }
 
-
 /* Build the logic block map */
 static int build_logical_block_map(struct ssfdcr_record *ssfdc)
 {
@@ -330,8 +320,9 @@ static void ssfdcr_add_mtd(struct mtd_bl
 		(ssfdc->map_len + MAX_PHYS_BLK_PER_ZONE - 1) /
 		MAX_PHYS_BLK_PER_ZONE);
 
-#ifdef CONFIG_MTD_NAND_SSFDC_GETGEO
 	/* Set geometry */
+	ssfdc->heads = 16;
+	ssfdc->sectors = 32;
 	get_chs( mtd->size, NULL, &ssfdc->heads, &ssfdc->sectors);
 	ssfdc->cylinders = (unsigned short)((mtd->size >> SECTOR_SHIFT) /
 			((long)ssfdc->sectors * (long)ssfdc->heads));
@@ -343,9 +334,6 @@ #ifdef CONFIG_MTD_NAND_SSFDC_GETGEO
 
 	ssfdc->mbd.size = (long)ssfdc->heads * (long)ssfdc->cylinders *
 				(long)ssfdc->sectors;
-#else
-	ssfdc->mbd.size  = ssfdc->map_len * (ssfdc->erase_size >> SECTOR_SHIFT);
-#endif
 
 	/* Allocate logical block map */
 	ssfdc->logic_block_map = kmalloc( sizeof(ssfdc->logic_block_map[0]) *
@@ -429,7 +417,6 @@ static int ssfdcr_readsect(struct mtd_bl
 	return 0;
 }
 
-#ifdef CONFIG_MTD_NAND_SSFDC_GETGEO
 static int ssfdcr_getgeo(struct mtd_blktrans_dev *dev,  struct hd_geometry *geo)
 {
 	struct ssfdcr_record *ssfdc = (struct ssfdcr_record *)dev;
@@ -443,7 +430,6 @@ static int ssfdcr_getgeo(struct mtd_blkt
 
 	return 0;
 }
-#endif
 
 /****************************************************************************
  *
@@ -455,9 +441,7 @@ static struct mtd_blktrans_ops ssfdcr_tr
 	.name		= "ssfdc",
 	.major		= SSFDCR_MAJOR,
 	.part_bits	= SSFDCR_PARTN_BITS,
-#ifdef CONFIG_MTD_NAND_SSFDC_GETGEO
 	.getgeo		= ssfdcr_getgeo,
-#endif
 	.readsect	= ssfdcr_readsect,
 	.add_mtd	= ssfdcr_add_mtd,
 	.remove_dev	= ssfdcr_remove_dev,

--------------040809060708080802040806--
