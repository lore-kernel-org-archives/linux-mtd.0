Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bab4t-0007bM-Lk
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2004 10:07:49 -0400
Message-ID: <073c01c453ac$de849e10$0100a8c0@superfortress>
From: "Dan Brown" <dan_brown@ieee.org>
To: "Thomas Gleixner" <tglx@linutronix.de>
Date: Wed, 16 Jun 2004 10:19:00 -0400
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0739_01C4538B.57698830"
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] Towards DiskOnChip support as a NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0739_01C4538B.57698830
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

For review and testing, here is a patch which brings us a step closer to
proper support for DiskOnChip devices.  This is against the 20040615
snapshot.

This patch includes the following:

drivers/mtd/nand/diskonchip.c:
    - Fix pipeline problems for DOC2000 and Millenium/2000TSOP (only tested
on 2000TSOP)
    - Add bad block table (read-only) support for INFTL-based devices (only
2000TSOP for the moment)
    - Add hardware ECC support for DOC2000 and Millenium/2000TSOP (only
tested on 2000TSOP and needs more testing!)
    - Add auto-partitioning for INFTL-based devices (should be made
optional?)

drivers/mtd/nand/nand_base.c:
    - Add support for DiskOnChip hardware ECC
    - Fix a null-pointer ref that occurs if a NAND driver supplies a primary
but not a mirror BBT descriptor

include/linux/mtd/nand.h:
    - Add a return value to calculate_ecc.  This is used by nand_base to
skip the call to correct_data if we know there are no errors.  (This saves a
6-byte comparison-against-zero when using DOC.  Is it worth changing the API
for it?  You tell me.)

-----------------------------------------------------------

Please realize that this needs a lot more testing.  I still haven't gotten
JFFS2 to run properly with this (though I suspect that may reflect my
inexperience with JFFS2).  Also, the change to nand.h may break other nand
drivers (though the fix is trivial).

Things that aren't done yet:
    - BBT support for NFTL-based devices (coming soon!)
    - BBT updating (not important when using (I)NFTL filesystem, but matters
for JFFS2)
    - Auto-partitioning for NFTL-based devices?
    - DOC Millenium Plus support
    - Proper BBT handling for multi-floor INFTL devices (don't try it with
the current code!)
    - Modifying (I)NFTL to use the nand-based DiskOnChip driver
    - Modifying JFFS2 to use autooob layout?  (Not sure about this)
    - Modifying flash_eraseall to use autooob layout?  (Should work OK on
DOC by coincidence)
    - Adding the nand/diskonchip driver into the kernel build system instead
of the old one

    - More testing.

Enjoy!

    -Dan Brown

------=_NextPart_000_0739_01C4538B.57698830
Content-Type: application/octet-stream;
	name="docnand.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="docnand.diff"

diff -u --recursive mtd-20040615/drivers/mtd/nand/diskonchip.c =
mtd/drivers/mtd/nand/diskonchip.c=0A=
--- mtd-20040615/drivers/mtd/nand/diskonchip.c	2004-03-27 =
18:00:08.000000000 -0500=0A=
+++ mtd/drivers/mtd/nand/diskonchip.c	2004-06-16 07:09:34.000000000 -0400=0A=
@@ -20,6 +20,8 @@=0A=
 #include <linux/mtd/nand.h>=0A=
 #include <linux/mtd/doc2000.h>=0A=
 #include <linux/mtd/compatmac.h>=0A=
+#include <linux/mtd/partitions.h>=0A=
+#include <linux/mtd/inftl.h>=0A=
 =0A=
 struct doc_priv {=0A=
 	unsigned long virtadr;=0A=
@@ -31,6 +33,16 @@=0A=
 	int curchip;=0A=
 };=0A=
 =0A=
+static char inftl_bbt_pattern[] =3D "MSYS_BBT";=0A=
+=0A=
+static struct nand_bbt_descr inftl_bbt_descr =3D {=0A=
+        .options =3DNAND_BBT_LASTBLOCK | NAND_BBT_8BIT,=0A=
+        .offs =3D8,=0A=
+        .len =3D 8,=0A=
+        .maxblocks =3D 4,=0A=
+        .pattern =3D inftl_bbt_pattern=0A=
+};=0A=
+=0A=
 #define DoC_is_Millennium(doc) ((doc)->ChipID =3D=3D DOC_ChipID_DocMil)=0A=
 #define DoC_is_2000(doc) ((doc)->ChipID =3D=3D DOC_ChipID_Doc2k)=0A=
 =0A=
@@ -110,10 +122,12 @@=0A=
 	unsigned long docptr =3D doc->virtadr;=0A=
 =0A=
 	ReadDOC(docptr, CDSNSlowIO);=0A=
+	DoC_Delay(doc, 2);=0A=
 	u_char ret =3D ReadDOC(docptr, 2k_CDSN_IO);=0A=
 	if (debug) printk("read_byte returns %02x\n", ret);=0A=
 	return ret;=0A=
 }=0A=
+=0A=
 static void doc2000_writebuf(struct mtd_info *mtd, =0A=
 			     const u_char *buf, int len)=0A=
 {=0A=
@@ -180,7 +194,7 @@=0A=
 	return 0;=0A=
 }=0A=
 =0A=
-static uint16_t doc200x_ident_chip(struct mtd_info *mtd, int nr)=0A=
+static uint16_t __init doc200x_ident_chip(struct mtd_info *mtd, int nr)=0A=
 {=0A=
 	struct nand_chip *this =3D mtd->priv;=0A=
 	struct doc_priv *doc =3D (void *)this->priv;=0A=
@@ -224,7 +238,7 @@=0A=
 	return ret;=0A=
 }=0A=
 =0A=
-static void doc2000_count_chips(struct mtd_info *mtd)=0A=
+static void __init doc2000_count_chips(struct mtd_info *mtd)=0A=
 {=0A=
 	struct nand_chip *this =3D mtd->priv;=0A=
 	struct doc_priv *doc =3D (void *)this->priv;=0A=
@@ -276,11 +290,12 @@=0A=
 	struct doc_priv *doc =3D (void *)this->priv;=0A=
 	unsigned long docptr =3D doc->virtadr;=0A=
 =0A=
-	ReadDOC(docptr, CDSNSlowIO);=0A=
+	//ReadDOC(docptr, CDSNSlowIO);=0A=
 	/* 11.4.5 -- delay twice to allow extended length cycle */=0A=
 	DoC_Delay(doc, 2);=0A=
 	ReadDOC(docptr, ReadPipeInit);=0A=
-	return ReadDOC(docptr, Mil_CDSN_IO);=0A=
+	//return ReadDOC(docptr, Mil_CDSN_IO);=0A=
+	return ReadDOC(docptr, LastDataRead);=0A=
 }=0A=
 =0A=
 static void doc2001_writebuf(struct mtd_info *mtd, =0A=
@@ -314,6 +329,7 @@=0A=
 	/* Terminate read pipeline */=0A=
 	buf[i] =3D ReadDOC(docptr, LastDataRead);=0A=
 }=0A=
+=0A=
 static int doc2001_verifybuf(struct mtd_info *mtd, =0A=
 			     const u_char *buf, int len)=0A=
 {=0A=
@@ -425,30 +441,250 @@=0A=
 	return 0;=0A=
 }=0A=
 =0A=
-struct doc_priv mydoc =3D {=0A=
-	.physadr =3D 0xd4000,=0A=
+static int doc200x_enable_hwecc(struct mtd_info *mtd, int mode)=0A=
+{=0A=
+	struct nand_chip *this =3D mtd->priv;=0A=
+	struct doc_priv *doc =3D (void *)this->priv;=0A=
+	unsigned long docptr =3D doc->virtadr;=0A=
+=0A=
+	/* Prime the ECC engine */=0A=
+	WriteDOC(DOC_ECC_RESET, docptr, ECCConf);=0A=
+	if (mode =3D=3D NAND_ECC_READ)=0A=
+		WriteDOC(DOC_ECC_EN, docptr, ECCConf);=0A=
+	else=0A=
+		WriteDOC(DOC_ECC_EN | DOC_ECC_RW, docptr, ECCConf);=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int doc2000_calculate_ecc(struct mtd_info *mtd, const u_char =
*dat,=0A=
+				 unsigned char *ecc_code)=0A=
+{=0A=
+	struct nand_chip *this =3D mtd->priv;=0A=
+	struct doc_priv *doc =3D (void *)this->priv;=0A=
+	unsigned long docptr =3D doc->virtadr;=0A=
+	volatile char dummy;=0A=
+	int stat;=0A=
+	int i;=0A=
+	// DBB : check for NULL ecc_code here?=0A=
+=0A=
+	// DBB note: I'm using the presence of dat as a read/write indicator.  =
FIX ME!=0A=
+	if (dat) {=0A=
+		// DBB: this is assumed to be a read=0A=
+		// flush the pipeline:=0A=
+		dummy =3D ReadDOC(docptr, 2k_ECCStatus);=0A=
+		dummy =3D ReadDOC(docptr, 2k_ECCStatus);=0A=
+		dummy =3D ReadDOC(docptr, 2k_ECCStatus);=0A=
+		stat =3D dummy & 0x80;=0A=
+	} else {=0A=
+		// DBB: this is assumed to be a write=0A=
+		WriteDOC(doc->CDSNControl & ~CDSN_CTRL_FLASH_IO, docptr, CDSNControl);=0A=
+		WriteDOC(0, docptr, 2k_CDSN_IO);=0A=
+		WriteDOC(0, docptr, 2k_CDSN_IO);=0A=
+		WriteDOC(0, docptr, 2k_CDSN_IO);=0A=
+		WriteDOC(doc->CDSNControl, docptr, CDSNControl);=0A=
+		stat =3D 1;=0A=
+	}=0A=
+	if (stat) {=0A=
+		for (i =3D 0; i < 6; i++)=0A=
+			ecc_code[i] =3D ReadDOC_(docptr, DoC_ECCSyndrome0 + i);=0A=
+	} else {=0A=
+		/* On read, if there were no ECC errors, the syndrome is by=0A=
+		   definition zero.  We can skip actually reading it. */=0A=
+		memset(ecc_code, 0, 6);=0A=
+	}=0A=
+	WriteDOC(DOC_ECC_DIS, docptr, ECCConf);=0A=
+	return stat;=0A=
+}=0A=
+=0A=
+static int doc2001_calculate_ecc(struct mtd_info *mtd, const u_char =
*dat,=0A=
+				 unsigned char *ecc_code)=0A=
+{=0A=
+	struct nand_chip *this =3D mtd->priv;=0A=
+	struct doc_priv *doc =3D (void *)this->priv;=0A=
+	unsigned long docptr =3D doc->virtadr;=0A=
+	volatile char dummy;=0A=
+	int stat;=0A=
+	int i;=0A=
+	// DBB : check for NULL ecc_code here?=0A=
+=0A=
+	// DBB note: I'm using the presence of dat as a read/write indicator.  =
FIX ME!=0A=
+	if (dat) {=0A=
+		// DBB: this is assumed to be a read=0A=
+		// flush the pipeline:=0A=
+		dummy =3D ReadDOC(docptr, ECCConf);=0A=
+		dummy =3D ReadDOC(docptr, ECCConf);=0A=
+		dummy =3D ReadDOC(docptr, ECCConf);=0A=
+		stat =3D dummy & 0x80;=0A=
+	} else {=0A=
+		// DBB: this is assumed to be a write=0A=
+		WriteDOC(0, docptr, NOP);=0A=
+		WriteDOC(0, docptr, NOP);=0A=
+		WriteDOC(0, docptr, NOP);=0A=
+		stat =3D 1;=0A=
+	}=0A=
+	if (stat) {=0A=
+		for (i =3D 0; i < 6; i++)=0A=
+			ecc_code[i] =3D ReadDOC_(docptr, DoC_ECCSyndrome0 + i);=0A=
+	} else {=0A=
+		/* On read, if there were no ECC errors, the syndrome is by=0A=
+		   definition zero.  We can skip actually reading it. */=0A=
+		memset(ecc_code, 0, 6);=0A=
+	}=0A=
+	WriteDOC(DOC_ECC_DIS, docptr, ECCConf);=0A=
+	return stat;=0A=
+}=0A=
+=0A=
+static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat, =
u_char *read_ecc, u_char *calc_ecc)=0A=
+{=0A=
+	int ret =3D doc_decode_ecc(dat, calc_ecc);=0A=
+	printk(KERN_ERR "doc200x_correct_data corrected %d errors\n", ret);=0A=
+	return ret;=0A=
+}=0A=
+		=0A=
+static struct doc_priv mydoc =3D {=0A=
+	.physadr =3D 0xd0000,=0A=
 	.curfloor =3D -1,=0A=
 	.curchip =3D -1,=0A=
 };=0A=
 =0A=
-u_char mydatabuf[528];=0A=
+//u_char mydatabuf[528];=0A=
 =0A=
-struct nand_chip mynand =3D {=0A=
+static struct nand_oobinfo doc200x_oobinfo =3D {=0A=
+        .useecc =3D MTD_NANDECC_AUTOPLACE,=0A=
+        .eccbytes =3D 6,=0A=
+        .eccpos =3D {0, 1, 2, 3, 4, 5},=0A=
+        .oobfree =3D { {8, 8} }=0A=
+};=0A=
+ =0A=
+static struct nand_chip mynand =3D {=0A=
 	.priv =3D (void *)&mydoc,=0A=
 	.select_chip =3D doc200x_select_chip,=0A=
 	.hwcontrol =3D doc200x_hwcontrol,=0A=
 	.dev_ready =3D doc200x_dev_ready,=0A=
 	.waitfunc =3D doc200x_wait,=0A=
 	.block_bad =3D doc200x_block_bad,=0A=
-	.eccmode =3D NAND_ECC_SOFT,=0A=
-	.data_buf =3D mydatabuf,=0A=
+	.eccmode =3D NAND_ECC_DISKONCHIP,=0A=
+	//.data_buf =3D mydatabuf,=0A=
+	.options =3D NAND_USE_FLASH_BBT,=0A=
+	.autooob =3D &doc200x_oobinfo,=0A=
+	.correct_data =3D doc200x_correct_data,=0A=
+	.enable_hwecc =3D doc200x_enable_hwecc=0A=
 };=0A=
 =0A=
-struct mtd_info mymtd =3D {=0A=
+static struct mtd_info mymtd =3D {=0A=
 	.priv =3D (void *)&mynand,=0A=
 	.owner =3D THIS_MODULE,=0A=
 };=0A=
 =0A=
+/* This is a stripped-down copy of the code in inftlmount.c */=0A=
+static int __init inftl_partscan(struct mtd_info *mtd)=0A=
+{=0A=
+	u_char buf[SECTORSIZE];=0A=
+	struct INFTLMediaHeader *mh =3D (struct INFTLMediaHeader *) &buf;=0A=
+	int offs;=0A=
+	for (offs =3D 0; offs < mtd->size; offs +=3D mtd->erasesize) {=0A=
+		int ret, retlen;=0A=
+                if ((ret =3D MTD_READ(mtd, offs, SECTORSIZE, &retlen, =
buf)))=0A=
+			continue;=0A=
+		if (retlen < sizeof(struct INFTLMediaHeader)) continue;=0A=
+//printk(KERN_ERR "Read %d bytes at %d, string is %s\n", retlen, offs, =
buf);=0A=
+		if (!memcmp(mh->bootRecordID, "BNAND", 6)) break;=0A=
+	}=0A=
+	if (offs >=3D mtd->size) {=0A=
+		printk(KERN_WARNING "INFTL Media Header not found.\n");=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	mh->NoOfBootImageBlocks =3D le32_to_cpu(mh->NoOfBootImageBlocks);=0A=
+	mh->NoOfBinaryPartitions =3D le32_to_cpu(mh->NoOfBinaryPartitions);=0A=
+	mh->NoOfBDTLPartitions =3D le32_to_cpu(mh->NoOfBDTLPartitions);=0A=
+	mh->BlockMultiplierBits =3D le32_to_cpu(mh->BlockMultiplierBits);=0A=
+	mh->FormatFlags =3D le32_to_cpu(mh->FormatFlags);=0A=
+	mh->PercentUsed =3D le32_to_cpu(mh->PercentUsed);=0A=
+ =0A=
+#ifdef CONFIG_MTD_DEBUG_VERBOSE=0A=
+	if (CONFIG_MTD_DEBUG_VERBOSE >=3D 2)=0A=
+	printk(KERN_ERR "Found INFTL Media Header at 0x%x:\n"=0A=
+			"    bootRecordID          =3D %s\n"=0A=
+			"    NoOfBootImageBlocks   =3D %d\n"=0A=
+			"    NoOfBinaryPartitions  =3D %d\n"=0A=
+			"    NoOfBDTLPartitions    =3D %d\n"=0A=
+			"    BlockMultiplerBits    =3D %d\n"=0A=
+			"    FormatFlgs            =3D %d\n"=0A=
+			"    OsakVersion           =3D 0x%x\n"=0A=
+			"    PercentUsed           =3D %d\n",=0A=
+		offs,=0A=
+		mh->bootRecordID, mh->NoOfBootImageBlocks,=0A=
+		mh->NoOfBinaryPartitions,=0A=
+		mh->NoOfBDTLPartitions,=0A=
+		mh->BlockMultiplierBits, mh->FormatFlags,=0A=
+		mh->OsakVersion, mh->PercentUsed);=0A=
+#endif=0A=
+=0A=
+	if (mh->BlockMultiplierBits !=3D 0) {=0A=
+		printk(KERN_ERR "Currently only BlockMultiplierBits=3D0 is =
supported.\n");=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	struct mtd_partition parts[6];=0A=
+	memset((char *) parts, 0, sizeof(parts));=0A=
+	int numparts =3D 0;=0A=
+	int lastblock =3D 0;=0A=
+=0A=
+	/* Scan the partitions */=0A=
+	int i;=0A=
+	struct INFTLPartition *ip;=0A=
+	for (i =3D 0; (i < 4); i++) {=0A=
+		ip =3D &(mh->Partitions[i]);=0A=
+		ip->virtualUnits =3D le32_to_cpu(ip->virtualUnits);=0A=
+		ip->firstUnit =3D le32_to_cpu(ip->firstUnit);=0A=
+		ip->lastUnit =3D le32_to_cpu(ip->lastUnit);=0A=
+		ip->flags =3D le32_to_cpu(ip->flags);=0A=
+		ip->spareUnits =3D le32_to_cpu(ip->spareUnits);=0A=
+		ip->Reserved0 =3D le32_to_cpu(ip->Reserved0);=0A=
+=0A=
+#ifdef CONFIG_MTD_DEBUG_VERBOSE=0A=
+		if (CONFIG_MTD_DEBUG_VERBOSE >=3D 2)=0A=
+		printk(	"    PARTITION[%d] ->\n"=0A=
+			"        virtualUnits    =3D %d\n"=0A=
+			"        firstUnit       =3D %d\n"=0A=
+			"        lastUnit        =3D %d\n"=0A=
+			"        flags	         =3D 0x%x\n"=0A=
+			"        spareUnits      =3D %d\n",=0A=
+			i, ip->virtualUnits, ip->firstUnit,=0A=
+			ip->lastUnit, ip->flags,=0A=
+			ip->spareUnits);=0A=
+#endif=0A=
+=0A=
+		if ((i =3D=3D 0) && (ip->firstUnit > 0)) {=0A=
+			parts[0].name =3D "DiskOnChip IPL / Media Header partition";=0A=
+			parts[0].offset =3D 0;=0A=
+			parts[0].size =3D mtd->erasesize * ip->firstUnit;=0A=
+			numparts =3D 1;=0A=
+		}=0A=
+=0A=
+		if (ip->flags & INFTL_BINARY)=0A=
+			parts[numparts].name =3D "DiskOnChip BDK partition";=0A=
+		else=0A=
+			parts[numparts].name =3D "DiskOnChip BDTL partition";=0A=
+		parts[numparts].offset =3D mtd->erasesize * ip->firstUnit;=0A=
+		parts[numparts].size =3D mtd->erasesize * (1 + ip->lastUnit - =
ip->firstUnit);=0A=
+		numparts++;=0A=
+		if (ip->lastUnit > lastblock) lastblock =3D ip->lastUnit;=0A=
+		if (ip->flags & INFTL_LAST) break;=0A=
+	}=0A=
+	lastblock++;=0A=
+	if ((mtd->erasesize * lastblock) < mtd->size) {=0A=
+		parts[numparts].name =3D "DiskOnChip Remainder partition";=0A=
+		parts[numparts].offset =3D mtd->erasesize * lastblock;=0A=
+		parts[numparts].size =3D mtd->size - parts[numparts].offset;=0A=
+		numparts++;=0A=
+	}=0A=
+	add_mtd_partitions(mtd, parts, numparts);=0A=
+	return 1;=0A=
+}=0A=
+=0A=
+=0A=
 int __init init_nanddoc(void)=0A=
 {=0A=
 	mydoc.virtadr =3D (unsigned long)ioremap(mydoc.physadr, =
DOC_IOREMAP_LEN);=0A=
@@ -474,6 +710,9 @@=0A=
 		mynand.write_buf =3D doc2001_writebuf;=0A=
 		mynand.read_buf =3D doc2001_readbuf;=0A=
 		mynand.verify_buf =3D doc2001_verifybuf;=0A=
+                mynand.bbt_td =3D &inftl_bbt_descr;=0A=
+		mynand.calculate_ecc =3D doc2001_calculate_ecc;=0A=
+		//mynand.scan_bbt =3D nftl_scan_bbt;=0A=
 =0A=
 		ReadDOC(mydoc.virtadr, ChipID);=0A=
 		ReadDOC(mydoc.virtadr, ChipID);=0A=
@@ -499,11 +738,12 @@=0A=
 		mynand.write_buf =3D doc2000_writebuf;=0A=
 		mynand.read_buf =3D doc2000_readbuf;=0A=
 		mynand.verify_buf =3D doc2000_verifybuf;=0A=
+		mynand.calculate_ecc =3D doc2000_calculate_ecc;=0A=
 =0A=
 		doc2000_count_chips(&mymtd);=0A=
 		nrchips =3D 4 * mydoc.chips_per_floor;=0A=
 		name =3D "DiskOnChip 2000 (NFTL Model)";=0A=
-		mydoc.CDSNControl |=3D CDSN_CTRL_FLASH_IO;=0A=
+		mydoc.CDSNControl |=3D CDSN_CTRL_FLASH_IO|CDSN_CTRL_ECC_IO;=0A=
 =0A=
 		break;=0A=
 =0A=
@@ -516,12 +756,14 @@=0A=
 	}=0A=
 	mymtd.name =3D name;=0A=
 	add_mtd_device(&mymtd);=0A=
+	if (DoC_is_Millennium(&mydoc)) inftl_partscan(&mymtd);=0A=
 =0A=
 	return 0;=0A=
 }=0A=
 =0A=
 void __exit cleanup_nanddoc(void)=0A=
 {=0A=
+	del_mtd_partitions(&mymtd);=0A=
 	del_mtd_device(&mymtd);=0A=
 	iounmap((void *)mydoc.virtadr);=0A=
 }=0A=
diff -u --recursive mtd-20040615/drivers/mtd/nand/nand_base.c =
mtd/drivers/mtd/nand/nand_base.c=0A=
--- mtd-20040615/drivers/mtd/nand/nand_base.c	2004-06-07 =
18:00:15.000000000 -0400=0A=
+++ mtd/drivers/mtd/nand/nand_base.c	2004-06-16 07:37:48.000000000 -0400=0A=
@@ -830,6 +830,7 @@=0A=
 	case NAND_ECC_HW8_512:	=0A=
 		eccbytes +=3D 2;=0A=
 	/* Hardware ecc 6 byte / 512 byte data */	=0A=
+	case NAND_ECC_DISKONCHIP:=0A=
 	case NAND_ECC_HW6_512:	=0A=
 		eccbytes +=3D 3;=0A=
 	/* Hardware ecc 3 byte / 256 data */	=0A=
@@ -1013,6 +1014,7 @@=0A=
 	int	*oob_config, datidx;=0A=
 	int	blockcheck =3D (mtd->erasesize >> this->page_shift) - 1;=0A=
 	int	eccbytes =3D 3;=0A=
+	int	do_correct_data;=0A=
 =0A=
 =0A=
 	DEBUG (MTD_DEBUG_LEVEL3, "nand_read_ecc: from =3D 0x%08x, len =3D =
%i\n", (unsigned int) from, (int) len);=0A=
@@ -1053,6 +1055,7 @@=0A=
 	ecc =3D this->eccsize;=0A=
 	switch (eccmode) {=0A=
 	case NAND_ECC_HW6_512: /* Hardware ECC 6 byte / 512 byte data  */=0A=
+	case NAND_ECC_DISKONCHIP:=0A=
 		eccbytes =3D 6;=0A=
 		break;						=0A=
 	case NAND_ECC_HW8_512: /* Hardware ECC 8 byte / 512 byte data  */=0A=
@@ -1096,6 +1099,8 @@=0A=
 			oob_data =3D &this->data_buf[end];=0A=
 =0A=
 		eccsteps =3D this->eccsteps;=0A=
+		do_correct_data =3D 1;=0A=
+		ecc_status =3D 0;=0A=
 		=0A=
 		switch (eccmode) {=0A=
 		case NAND_ECC_NONE: {	/* No ECC, Read in a page */=0A=
@@ -1125,13 +1130,29 @@=0A=
 			}=0A=
 			break;						=0A=
 =0A=
+		case NAND_ECC_DISKONCHIP:=0A=
+			/* On DOC, we have to read data + OOB-stored syndrome,=0A=
+			   then read the hw-computed syndrome, then the rest=0A=
+			   of the OOB data. */=0A=
+			this->enable_hwecc(mtd, NAND_ECC_READ);	=0A=
+			this->read_buf(mtd, data_poi, ecc);=0A=
+			this->read_buf(mtd, oob_data, eccbytes);=0A=
+			/* On DOC (at least), we have a ECC error register bit=0A=
+			   that allows us to skip the tedious process of reading=0A=
+			   the hw-computed syndrome, checking for and correcting=0A=
+			   errors, etc. */=0A=
+			do_correct_data =3D this->calculate_ecc(mtd, data_poi, ecc_calc);=0A=
+			break;=0A=
 		default:=0A=
 			printk (KERN_WARNING "Invalid NAND_ECC_MODE %d\n", this->eccmode);=0A=
 			BUG();	=0A=
 		}=0A=
 =0A=
 		/* read oobdata */=0A=
-		this->read_buf(mtd, oob_data, mtd->oobsize);=0A=
+		if (eccmode =3D=3D NAND_ECC_DISKONCHIP)=0A=
+			this->read_buf(mtd, oob_data + eccbytes, mtd->oobsize - eccbytes);=0A=
+		else=0A=
+			this->read_buf(mtd, oob_data, mtd->oobsize);=0A=
 		=0A=
 		/* Skip ECC, if not active */=0A=
 		if (eccmode =3D=3D NAND_ECC_NONE)=0A=
@@ -1143,7 +1164,8 @@=0A=
 =0A=
 		/* correct data, if neccecary */=0A=
 		for (i =3D 0, j =3D 0, datidx =3D 0; i < this->eccsteps; i++, datidx =
+=3D ecc) {=0A=
-			ecc_status =3D this->correct_data(mtd, &data_poi[datidx], =
&ecc_code[j], &ecc_calc[j]);=0A=
+			if (do_correct_data)=0A=
+				ecc_status =3D this->correct_data(mtd, &data_poi[datidx], =
&ecc_code[j], &ecc_calc[j]);=0A=
 			=0A=
 			/* Get next chunk of ecc bytes */=0A=
 			j +=3D eccbytes;=0A=
@@ -2384,6 +2406,7 @@=0A=
 	case NAND_ECC_HW3_512: =0A=
 	case NAND_ECC_HW6_512: =0A=
 	case NAND_ECC_HW8_512: =0A=
+	case NAND_ECC_DISKONCHIP:=0A=
 		if (mtd->oobblock =3D=3D 256) {=0A=
 			printk (KERN_WARNING "512 byte HW ECC not possible on 256 Byte =
pagesize, fallback to SW ECC \n");=0A=
 			this->eccmode =3D NAND_ECC_SOFT;=0A=
diff -u --recursive mtd-20040615/drivers/mtd/nand/nand_bbt.c =
mtd/drivers/mtd/nand/nand_bbt.c=0A=
--- mtd-20040615/drivers/mtd/nand/nand_bbt.c	2004-06-04 =
18:00:12.000000000 -0400=0A=
+++ mtd/drivers/mtd/nand/nand_bbt.c	2004-06-16 07:40:34.000000000 -0400=0A=
@@ -794,7 +794,7 @@=0A=
 	=0A=
 	/* Prevent the bbt regions from erasing / writing */=0A=
 	mark_bbt_region (mtd, td);=0A=
-	mark_bbt_region (mtd, md);=0A=
+	if (md) mark_bbt_region (mtd, md);=0A=
 	=0A=
 	kfree (buf);=0A=
 	return res;=0A=
diff -u --recursive mtd-20040615/include/linux/mtd/nand.h =
mtd/include/linux/mtd/nand.h=0A=
--- mtd-20040615/include/linux/mtd/nand.h	2004-06-04 18:00:13.000000000 =
-0400=0A=
+++ mtd/include/linux/mtd/nand.h	2004-06-16 07:49:07.000000000 -0400=0A=
@@ -281,7 +281,7 @@=0A=
 	int  		(*dev_ready)(struct mtd_info *mtd);=0A=
 	void 		(*cmdfunc)(struct mtd_info *mtd, unsigned command, int column, =
int page_addr);=0A=
 	int 		(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this, int =
state);=0A=
-	void		(*calculate_ecc)(struct mtd_info *mtd, const u_char *dat, u_char =
*ecc_code);=0A=
+	int 		(*calculate_ecc)(struct mtd_info *mtd, const u_char *dat, u_char =
*ecc_code);=0A=
 	int 		(*correct_data)(struct mtd_info *mtd, u_char *dat, u_char =
*read_ecc, u_char *calc_ecc);=0A=
 	void		(*enable_hwecc)(struct mtd_info *mtd, int mode);=0A=
 	void		(*erase_cmd)(struct mtd_info *mtd, int page);=0A=

------=_NextPart_000_0739_01C4538B.57698830--
