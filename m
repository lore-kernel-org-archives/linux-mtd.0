Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16BJGw-00016g-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2001 17:22:23 +0000
Received: from [192.168.1.53] (helo=MONSTROSITY)
	by osdsun1.nrl.navy.mil with smtp (Exim 3.32 #1 (Debian))
	id 16BJKc-0008Rh-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2001 12:26:10 -0500
Message-ID: <004501c17ce9$b6077210$3501a8c0@MONSTROSITY>
From: "Dan Brown" <brown@osdsun1.nrl.navy.mil>
To: <linux-mtd@lists.infradead.org>
References: <E16Av0k-00087F-00@pentafluge.infradead.org>
Subject: 2nd try: [PATCH] jffs2 on DOC
Date: Tue, 4 Dec 2001 12:32:56 -0500
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0042_01C17CBF.CD2C8810"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------=_NextPart_000_0042_01C17CBF.CD2C8810
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I think my first patch got mangled by my mail utility, so I'm sending it as
an attachment.  Sorry for the duplication.

    Dan Brown

------=_NextPart_000_0042_01C17CBF.CD2C8810
Content-Type: text/plain;
	name="mtddiff.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtddiff.txt"

diff -u -r mtd-20011126/drivers/mtd/devices/Config.in =
mtd/drivers/mtd/devices/Config.in
--- mtd-20011126/drivers/mtd/devices/Config.in	Sun Sep 23 18:00:03 2001
+++ mtd/drivers/mtd/devices/Config.in	Mon Dec  3 08:28:27 2001
@@ -27,6 +27,11 @@
 comment 'Disk-On-Chip Device Drivers'
    dep_tristate '  M-Systems Disk-On-Chip 1000' CONFIG_MTD_DOC1000 =
$CONFIG_MTD
    dep_tristate '  M-Systems Disk-On-Chip 2000 and Millennium' =
CONFIG_MTD_DOC2000 $CONFIG_MTD
+   dep_mbool '    Fake partition support for DOC2000' =
CONFIG_MTD_DOC2K_FAKEPART $CONFIG_MTD_DOC2000 $CONFIG_MTD_PARTITIONS
+   if [ "$CONFIG_MTD_DOC2K_FAKEPART" =3D "y" ]; then
+      hex '      Size of first partition' CONFIG_MTD_DOC2K_PARTLEN =
0x10a000
+      bool '      Create full (unpartitioned) device also' =
CONFIG_MTD_DOC2K_FULLDEV
+   fi
    dep_tristate '  M-Systems Disk-On-Chip Millennium-only alternative =
driver (see help)' CONFIG_MTD_DOC2001 $CONFIG_MTD
    if [ "$CONFIG_MTD_DOC2001" =3D "y" -o "$CONFIG_MTD_DOC2000" =3D "y" =
]; then
       define_bool CONFIG_MTD_DOCPROBE y
diff -u -r mtd-20011126/drivers/mtd/devices/doc2000.c =
mtd/drivers/mtd/devices/doc2000.c
--- mtd-20011126/drivers/mtd/devices/doc2000.c	Tue Oct  2 18:00:19 2001
+++ mtd/drivers/mtd/devices/doc2000.c	Mon Dec  3 08:37:56 2001
@@ -24,6 +24,9 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ids.h>
 #include <linux/mtd/doc2000.h>
+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+#include <linux/mtd/partitions.h>
+#endif
=20
 #define DOC_SUPPORT_2000
 #define DOC_SUPPORT_MILLENNIUM
@@ -503,6 +506,24 @@
 	return retval;
 }
=20
+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+static struct mtd_partition doc_partitions[] =3D
+{
+	{
+		name: "boot",
+		offset: 0,
+		size: CONFIG_MTD_DOC2K_PARTLEN,
+		mask_flags: 0
+	},
+	{
+		name: "data",
+		offset: MTDPART_OFS_NXTBLK,
+		size: MTDPART_SIZ_FULL,
+		mask_flags: 0
+	}
+};
+#endif
+
 static const char im_name[] =3D "DoC2k_init";
=20
 /* This routine is made available to other mtd code via
@@ -580,7 +601,11 @@
 	/* Ident all the chips present. */
 	DoC_ScanChips(this);
=20
+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+	if (!this->totlen || (CONFIG_MTD_DOC2K_PARTLEN >=3D this->totlen)) {
+#else
 	if (!this->totlen) {
+#endif
 		kfree(mtd);
 		iounmap((void *) this->virtadr);
 	} else {
@@ -588,7 +613,12 @@
 		doc2klist =3D mtd;
 		mtd->size =3D this->totlen;
 		mtd->erasesize =3D this->erasesize;
+#if (!defined(CONFIG_MTD_DOC2K_FAKEPART) || =
defined(CONFIG_MTD_DOC2K_FULLDEV))
 		add_mtd_device(mtd);
+#endif
+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+		add_mtd_partitions(mtd, doc_partitions, 2);
+#endif
 		return;
 	}
 }
@@ -609,6 +639,7 @@
 	unsigned char syndrome[6];
 	volatile char dummy;
 	int i, len256 =3D 0, ret=3D0;
+	size_t left =3D len;
=20
 	docptr =3D this->virtadr;
=20
@@ -618,122 +649,131 @@
=20
 	down(&this->lock);
=20
-	/* Don't allow a single read to cross a 512-byte block boundary */
-	if (from + len > ((from | 0x1ff) + 1))
-		len =3D ((from | 0x1ff) + 1) - from;
-
-	/* The ECC will not be calculated correctly if less than 512 is read =
*/
-	if (len !=3D 0x200 && eccbuf)
-		printk(KERN_WARNING
-		       "ECC needs a full sector read (adr: %lx size %lx)\n",
-		       (long) from, (long) len);
+	*retlen =3D 0;
+	while (left) {
+		len =3D left;
+
+		/* Don't allow a single read to cross a 512-byte block boundary */
+		if (from + len > ((from | 0x1ff) + 1))
+			len =3D ((from | 0x1ff) + 1) - from;
=20
-	/* printk("DoC_Read (adr: %lx size %lx)\n", (long) from, (long) len); =
*/
+		/* The ECC will not be calculated correctly if less than 512 is read =
*/
+		if (len !=3D 0x200 && eccbuf)
+			printk(KERN_WARNING
+			       "ECC needs a full sector read (adr: %lx size %lx)\n",
+			       (long) from, (long) len);
=20
+		/* printk("DoC_Read (adr: %lx size %lx)\n", (long) from, (long) len); =
*/
=20
-	/* Find the chip which is to be used and select it */
-	mychip =3D &this->chips[from >> (this->chipshift)];
=20
-	if (this->curfloor !=3D mychip->floor) {
-		DoC_SelectFloor(this, mychip->floor);
-		DoC_SelectChip(this, mychip->chip);
-	} else if (this->curchip !=3D mychip->chip) {
-		DoC_SelectChip(this, mychip->chip);
-	}
+		/* Find the chip which is to be used and select it */
+		mychip =3D &this->chips[from >> (this->chipshift)];
=20
-	this->curfloor =3D mychip->floor;
-	this->curchip =3D mychip->chip;
+		if (this->curfloor !=3D mychip->floor) {
+			DoC_SelectFloor(this, mychip->floor);
+			DoC_SelectChip(this, mychip->chip);
+		} else if (this->curchip !=3D mychip->chip) {
+			DoC_SelectChip(this, mychip->chip);
+		}
=20
-	DoC_Command(this,
-		    (!this->page256
-		     && (from & 0x100)) ? NAND_CMD_READ1 : NAND_CMD_READ0,
-		    CDSN_CTRL_WP);
-	DoC_Address(this, ADDR_COLUMN_PAGE, from, CDSN_CTRL_WP,
-		    CDSN_CTRL_ECC_IO);
-
-	if (eccbuf) {
-		/* Prime the ECC engine */
-		WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
-		WriteDOC(DOC_ECC_EN, docptr, ECCConf);
-	} else {
-		/* disable the ECC engine */
-		WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
-		WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
-	}
+		this->curfloor =3D mychip->floor;
+		this->curchip =3D mychip->chip;
=20
-	/* treat crossing 256-byte sector for 2M x 8bits devices */
-	if (this->page256 && from + len > (from | 0xff) + 1) {
-		len256 =3D (from | 0xff) + 1 - from;
-		DoC_ReadBuf(this, buf, len256);
+		DoC_Command(this,
+			    (!this->page256
+			     && (from & 0x100)) ? NAND_CMD_READ1 : NAND_CMD_READ0,
+			    CDSN_CTRL_WP);
+		DoC_Address(this, ADDR_COLUMN_PAGE, from, CDSN_CTRL_WP,
+			    CDSN_CTRL_ECC_IO);
=20
-		DoC_Command(this, NAND_CMD_READ0, CDSN_CTRL_WP);
-		DoC_Address(this, ADDR_COLUMN_PAGE, from + len256,
-			    CDSN_CTRL_WP, CDSN_CTRL_ECC_IO);
-	}
+		if (eccbuf) {
+			/* Prime the ECC engine */
+			WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
+			WriteDOC(DOC_ECC_EN, docptr, ECCConf);
+		} else {
+			/* disable the ECC engine */
+			WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
+			WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
+		}
=20
-	DoC_ReadBuf(this, &buf[len256], len - len256);
+		/* treat crossing 256-byte sector for 2M x 8bits devices */
+		if (this->page256 && from + len > (from | 0xff) + 1) {
+			len256 =3D (from | 0xff) + 1 - from;
+			DoC_ReadBuf(this, buf, len256);
+
+			DoC_Command(this, NAND_CMD_READ0, CDSN_CTRL_WP);
+			DoC_Address(this, ADDR_COLUMN_PAGE, from + len256,
+				    CDSN_CTRL_WP, CDSN_CTRL_ECC_IO);
+		}
=20
-	/* Let the caller know we completed it */
-	*retlen =3D len;
+		DoC_ReadBuf(this, &buf[len256], len - len256);
=20
-	if (eccbuf) {
-		/* Read the ECC data through the DiskOnChip ECC logic */
-		/* Note: this will work even with 2M x 8bit devices as   */
-		/*       they have 8 bytes of OOB per 256 page. mf.      */
-		DoC_ReadBuf(this, eccbuf, 6);
-
-		/* Flush the pipeline */
-		if (DoC_is_Millennium(this)) {
-			dummy =3D ReadDOC(docptr, ECCConf);
-			dummy =3D ReadDOC(docptr, ECCConf);
-			i =3D ReadDOC(docptr, ECCConf);
-		} else {
-			dummy =3D ReadDOC(docptr, 2k_ECCStatus);
-			dummy =3D ReadDOC(docptr, 2k_ECCStatus);
-			i =3D ReadDOC(docptr, 2k_ECCStatus);
-		}
+		/* Let the caller know we completed it */
+		*retlen +=3D len;
+
+		if (eccbuf) {
+			/* Read the ECC data through the DiskOnChip ECC logic */
+			/* Note: this will work even with 2M x 8bit devices as   */
+			/*       they have 8 bytes of OOB per 256 page. mf.      */
+			DoC_ReadBuf(this, eccbuf, 6);
+
+			/* Flush the pipeline */
+			if (DoC_is_Millennium(this)) {
+				dummy =3D ReadDOC(docptr, ECCConf);
+				dummy =3D ReadDOC(docptr, ECCConf);
+				i =3D ReadDOC(docptr, ECCConf);
+			} else {
+				dummy =3D ReadDOC(docptr, 2k_ECCStatus);
+				dummy =3D ReadDOC(docptr, 2k_ECCStatus);
+				i =3D ReadDOC(docptr, 2k_ECCStatus);
+			}
=20
-		/* Check the ECC Status */
-		if (i & 0x80) {
-			int nb_errors;
-			/* There was an ECC error */
+			/* Check the ECC Status */
+			if (i & 0x80) {
+				int nb_errors;
+				/* There was an ECC error */
 #ifdef ECC_DEBUG
-			printk(KERN_ERR "DiskOnChip ECC Error: Read at %lx\n", (long)from);
+				printk(KERN_ERR "DiskOnChip ECC Error: Read at %lx\n", (long)from);
 #endif
-			/* Read the ECC syndrom through the DiskOnChip ECC logic.
-			   These syndrome will be all ZERO when there is no error */
-			for (i =3D 0; i < 6; i++) {
-				syndrome[i] =3D
-				    ReadDOC(docptr, ECCSyndrome0 + i);
-			}
-                        nb_errors =3D doc_decode_ecc(buf, syndrome);
+				/* Read the ECC syndrom through the DiskOnChip ECC logic.
+				   These syndrome will be all ZERO when there is no error */
+				for (i =3D 0; i < 6; i++) {
+					syndrome[i] =3D
+					    ReadDOC(docptr, ECCSyndrome0 + i);
+				}
+	                        nb_errors =3D doc_decode_ecc(buf, syndrome);
=20
 #ifdef ECC_DEBUG
-			printk(KERN_ERR "Errors corrected: %x\n", nb_errors);
+				printk(KERN_ERR "Errors corrected: %x\n", nb_errors);
 #endif
-                        if (nb_errors < 0) {
-				/* We return error, but have actually done the read. Not that
-				   this can be told to user-space, via sys_read(), but at least
-				   MTD-aware stuff can know about it by checking *retlen */
-				ret =3D -EIO;
-                        }
-		}
+	                        if (nb_errors < 0) {
+					/* We return error, but have actually done the read. Not that
+					   this can be told to user-space, via sys_read(), but at least
+					   MTD-aware stuff can know about it by checking *retlen */
+					ret =3D -EIO;
+	                        }
+			}
=20
 #ifdef PSYCHO_DEBUG
-		printk(KERN_DEBUG "ECC DATA at %lxB: %2.2X %2.2X %2.2X %2.2X %2.2X =
%2.2X\n",
-			     (long)from, eccbuf[0], eccbuf[1], eccbuf[2],
-			     eccbuf[3], eccbuf[4], eccbuf[5]);
+			printk(KERN_DEBUG "ECC DATA at %lxB: %2.2X %2.2X %2.2X %2.2X %2.2X =
%2.2X\n",
+				     (long)from, eccbuf[0], eccbuf[1], eccbuf[2],
+				     eccbuf[3], eccbuf[4], eccbuf[5]);
 #endif
 	=09
-		/* disable the ECC engine */
-		WriteDOC(DOC_ECC_DIS, docptr , ECCConf);
-	}
+			/* disable the ECC engine */
+			WriteDOC(DOC_ECC_DIS, docptr , ECCConf);
+		}
=20
-	/* according to 11.4.1, we need to wait for the busy line=20
-         * drop if we read to the end of the page.  */
-	if(0 =3D=3D ((from + *retlen) & 0x1ff))
-	{
-	    DoC_WaitReady(this);
+		/* according to 11.4.1, we need to wait for the busy line=20
+	         * drop if we read to the end of the page.  */
+		if(0 =3D=3D ((from + len) & 0x1ff))
+		{
+		    DoC_WaitReady(this);
+		}
+
+		from +=3D len;
+		left -=3D len;
+		buf +=3D len;
 	}
=20
 	up(&this->lock);
@@ -758,6 +798,7 @@
 	volatile char dummy;
 	int len256 =3D 0;
 	struct Nand *mychip;
+	size_t left =3D len;
=20
 	docptr =3D this->virtadr;
=20
@@ -767,55 +808,114 @@
=20
 	down(&this->lock);
=20
-	/* Don't allow a single write to cross a 512-byte block boundary */
-	if (to + len > ((to | 0x1ff) + 1))
-		len =3D ((to | 0x1ff) + 1) - to;
-
-	/* The ECC will not be calculated correctly if less than 512 is =
written */
-	if (len !=3D 0x200 && eccbuf)
-		printk(KERN_WARNING
-		       "ECC needs a full sector write (adr: %lx size %lx)\n",
-		       (long) to, (long) len);
+	*retlen =3D 0;
+	while (left) {
+		len =3D left;
+
+		/* Don't allow a single write to cross a 512-byte block boundary */
+		if (to + len > ((to | 0x1ff) + 1))
+			len =3D ((to | 0x1ff) + 1) - to;
+
+		/* The ECC will not be calculated correctly if less than 512 is =
written */
+/* DBB-
+		if (len !=3D 0x200 && eccbuf)
+			printk(KERN_WARNING
+			       "ECC needs a full sector write (adr: %lx size %lx)\n",
+			       (long) to, (long) len);
+   -DBB */
=20
-	/* printk("DoC_Write (adr: %lx size %lx)\n", (long) to, (long) len); =
*/
+		/* printk("DoC_Write (adr: %lx size %lx)\n", (long) to, (long) len); =
*/
=20
-	/* Find the chip which is to be used and select it */
-	mychip =3D &this->chips[to >> (this->chipshift)];
+		/* Find the chip which is to be used and select it */
+		mychip =3D &this->chips[to >> (this->chipshift)];
=20
-	if (this->curfloor !=3D mychip->floor) {
-		DoC_SelectFloor(this, mychip->floor);
-		DoC_SelectChip(this, mychip->chip);
-	} else if (this->curchip !=3D mychip->chip) {
-		DoC_SelectChip(this, mychip->chip);
-	}
+		if (this->curfloor !=3D mychip->floor) {
+			DoC_SelectFloor(this, mychip->floor);
+			DoC_SelectChip(this, mychip->chip);
+		} else if (this->curchip !=3D mychip->chip) {
+			DoC_SelectChip(this, mychip->chip);
+		}
=20
-	this->curfloor =3D mychip->floor;
-	this->curchip =3D mychip->chip;
+		this->curfloor =3D mychip->floor;
+		this->curchip =3D mychip->chip;
=20
-	/* Set device to main plane of flash */
-	DoC_Command(this, NAND_CMD_RESET, CDSN_CTRL_WP);
-	DoC_Command(this,
-		    (!this->page256
-		     && (to & 0x100)) ? NAND_CMD_READ1 : NAND_CMD_READ0,
-		    CDSN_CTRL_WP);
+		/* Set device to main plane of flash */
+		DoC_Command(this, NAND_CMD_RESET, CDSN_CTRL_WP);
+		DoC_Command(this,
+			    (!this->page256
+			     && (to & 0x100)) ? NAND_CMD_READ1 : NAND_CMD_READ0,
+			    CDSN_CTRL_WP);
=20
-	DoC_Command(this, NAND_CMD_SEQIN, 0);
-	DoC_Address(this, ADDR_COLUMN_PAGE, to, 0, CDSN_CTRL_ECC_IO);
+		DoC_Command(this, NAND_CMD_SEQIN, 0);
+		DoC_Address(this, ADDR_COLUMN_PAGE, to, 0, CDSN_CTRL_ECC_IO);
=20
-	if (eccbuf) {
-		/* Prime the ECC engine */
-		WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
-		WriteDOC(DOC_ECC_EN | DOC_ECC_RW, docptr, ECCConf);
-	} else {
-		/* disable the ECC engine */
-		WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
-		WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
-	}
+		if (eccbuf) {
+			/* Prime the ECC engine */
+			WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
+			WriteDOC(DOC_ECC_EN | DOC_ECC_RW, docptr, ECCConf);
+		} else {
+			/* disable the ECC engine */
+			WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
+			WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
+		}
=20
-	/* treat crossing 256-byte sector for 2M x 8bits devices */
-	if (this->page256 && to + len > (to | 0xff) + 1) {
-		len256 =3D (to | 0xff) + 1 - to;
-		DoC_WriteBuf(this, buf, len256);
+		/* treat crossing 256-byte sector for 2M x 8bits devices */
+		if (this->page256 && to + len > (to | 0xff) + 1) {
+			len256 =3D (to | 0xff) + 1 - to;
+			DoC_WriteBuf(this, buf, len256);
+
+			DoC_Command(this, NAND_CMD_PAGEPROG, 0);
+
+			DoC_Command(this, NAND_CMD_STATUS, CDSN_CTRL_WP);
+			/* There's an implicit DoC_WaitReady() in DoC_Command */
+
+			dummy =3D ReadDOC(docptr, CDSNSlowIO);
+			DoC_Delay(this, 2);
+
+			if (ReadDOC_(docptr, this->ioreg) & 1) {
+				printk(KERN_ERR "Error programming flash\n");
+				/* Error in programming */
+				*retlen =3D 0;
+				up(&this->lock);
+				return -EIO;
+			}
+
+			DoC_Command(this, NAND_CMD_SEQIN, 0);
+			DoC_Address(this, ADDR_COLUMN_PAGE, to + len256, 0,
+				    CDSN_CTRL_ECC_IO);
+		}
+
+		DoC_WriteBuf(this, &buf[len256], len - len256);
+
+		if (eccbuf) {
+			WriteDOC(CDSN_CTRL_ECC_IO | CDSN_CTRL_CE, docptr,
+				 CDSNControl);
+
+			if (DoC_is_Millennium(this)) {
+				WriteDOC(0, docptr, NOP);
+				WriteDOC(0, docptr, NOP);
+				WriteDOC(0, docptr, NOP);
+			} else {
+				WriteDOC_(0, docptr, this->ioreg);
+				WriteDOC_(0, docptr, this->ioreg);
+				WriteDOC_(0, docptr, this->ioreg);
+			}
+
+			/* Read the ECC data through the DiskOnChip ECC logic */
+			for (di =3D 0; di < 6; di++) {
+				eccbuf[di] =3D ReadDOC(docptr, ECCSyndrome0 + di);
+			}
+
+			/* Reset the ECC engine */
+			WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
+
+#ifdef PSYCHO_DEBUG
+			printk
+			    ("OOB data at %lx is %2.2X %2.2X %2.2X %2.2X %2.2X %2.2X\n",
+			     (long) to, eccbuf[0], eccbuf[1], eccbuf[2], eccbuf[3],
+			     eccbuf[4], eccbuf[5]);
+#endif
+		}
=20
 		DoC_Command(this, NAND_CMD_PAGEPROG, 0);
=20
@@ -833,78 +933,33 @@
 			return -EIO;
 		}
=20
-		DoC_Command(this, NAND_CMD_SEQIN, 0);
-		DoC_Address(this, ADDR_COLUMN_PAGE, to + len256, 0,
-			    CDSN_CTRL_ECC_IO);
-	}
-
-	DoC_WriteBuf(this, &buf[len256], len - len256);
-
-	if (eccbuf) {
-		WriteDOC(CDSN_CTRL_ECC_IO | CDSN_CTRL_CE, docptr,
-			 CDSNControl);
-
-		if (DoC_is_Millennium(this)) {
-			WriteDOC(0, docptr, NOP);
-			WriteDOC(0, docptr, NOP);
-			WriteDOC(0, docptr, NOP);
-		} else {
-			WriteDOC_(0, docptr, this->ioreg);
-			WriteDOC_(0, docptr, this->ioreg);
-			WriteDOC_(0, docptr, this->ioreg);
-		}
-
-		/* Read the ECC data through the DiskOnChip ECC logic */
-		for (di =3D 0; di < 6; di++) {
-			eccbuf[di] =3D ReadDOC(docptr, ECCSyndrome0 + di);
-		}
-
-		/* Reset the ECC engine */
-		WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
-
-#ifdef PSYCHO_DEBUG
-		printk
-		    ("OOB data at %lx is %2.2X %2.2X %2.2X %2.2X %2.2X %2.2X\n",
-		     (long) to, eccbuf[0], eccbuf[1], eccbuf[2], eccbuf[3],
-		     eccbuf[4], eccbuf[5]);
-#endif
-	}
-
-	DoC_Command(this, NAND_CMD_PAGEPROG, 0);
-
-	DoC_Command(this, NAND_CMD_STATUS, CDSN_CTRL_WP);
-	/* There's an implicit DoC_WaitReady() in DoC_Command */
-
-	dummy =3D ReadDOC(docptr, CDSNSlowIO);
-	DoC_Delay(this, 2);
-
-	if (ReadDOC_(docptr, this->ioreg) & 1) {
-		printk(KERN_ERR "Error programming flash\n");
-		/* Error in programming */
-		*retlen =3D 0;
-		up(&this->lock);
-		return -EIO;
-	}
-
-	/* Let the caller know we completed it */
-	*retlen =3D len;
+		/* Let the caller know we completed it */
+		*retlen +=3D len;
 	=09
-	if (eccbuf) {
-		unsigned char x[8];
-		size_t dummy;
-		int ret;
-
-		/* Write the ECC data to flash */
-		for (di=3D0; di<6; di++)
-			x[di] =3D eccbuf[di];
+		if (eccbuf) {
+			unsigned char x[8];
+			size_t dummy;
+			int ret;
+
+			/* Write the ECC data to flash */
+			for (di=3D0; di<6; di++)
+				x[di] =3D eccbuf[di];
 	=09
-		x[6]=3D0x55;
-		x[7]=3D0x55;
+			x[6]=3D0x55;
+			x[7]=3D0x55;
 	=09
-		ret =3D doc_write_oob_nolock(mtd, to, 8, &dummy, x);
-		up(&this->lock);
-		return ret;
+			ret =3D doc_write_oob_nolock(mtd, to, 8, &dummy, x);
+			if (ret) {
+				up(&this->lock);
+				return ret;
+			}
+		}
+
+		to +=3D len;
+		left -=3D len;
+		buf +=3D len;
 	}
+
 	up(&this->lock);
 	return 0;
 }
@@ -1156,7 +1211,12 @@
 		this =3D (struct DiskOnChip *) mtd->priv;
 		doc2klist =3D this->nextdoc;
=20
+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+		del_mtd_partitions(mtd);
+#endif
+#if (!defined(CONFIG_MTD_DOC2K_FAKEPART) || =
defined(CONFIG_MTD_DOC2K_FULLDEV))
 		del_mtd_device(mtd);
+#endif
=20
 		iounmap((void *) this->virtadr);
 		kfree(this->chips);
diff -u -r mtd-20011126/drivers/mtd/mtdpart.c mtd/drivers/mtd/mtdpart.c
--- mtd-20011126/drivers/mtd/mtdpart.c	Wed Nov  7 18:00:21 2001
+++ mtd/drivers/mtd/mtdpart.c	Mon Dec  3 08:39:50 2001
@@ -86,6 +86,58 @@
 					from + part->offset, retlen);
 }
=20
+static int part_read_oob (struct mtd_info *mtd, loff_t from, size_t =
len,=20
+			size_t *retlen, u_char *buf)
+{
+	struct mtd_part *part =3D PART(mtd);
+	if (from >=3D mtd->size)
+		len =3D 0;
+	else if (from + len > mtd->size)
+		len =3D mtd->size - from;
+	return part->master->read_oob (part->master, from + part->offset,=20
+					len, retlen, buf);
+}
+
+static int part_write_oob (struct mtd_info *mtd, loff_t to, size_t len,
+			size_t *retlen, const u_char *buf)
+{
+	struct mtd_part *part =3D PART(mtd);
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+	if (to >=3D mtd->size)
+		len =3D 0;
+	else if (to + len > mtd->size)
+		len =3D mtd->size - to;
+	return part->master->write_oob (part->master, to + part->offset,=20
+					len, retlen, buf);
+}
+
+static int part_read_ecc (struct mtd_info *mtd, loff_t from, size_t =
len,=20
+			size_t *retlen, u_char *buf, u_char *eccbuf)
+{
+	struct mtd_part *part =3D PART(mtd);
+	if (from >=3D mtd->size)
+		len =3D 0;
+	else if (from + len > mtd->size)
+		len =3D mtd->size - from;
+	return part->master->read_ecc (part->master, from + part->offset,=20
+					len, retlen, buf, eccbuf);
+}
+
+static int part_write_ecc (struct mtd_info *mtd, loff_t to, size_t len,
+			size_t *retlen, const u_char *buf, u_char *eccbuf)
+{
+	struct mtd_part *part =3D PART(mtd);
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+	if (to >=3D mtd->size)
+		len =3D 0;
+	else if (to + len > mtd->size)
+		len =3D mtd->size - to;
+	return part->master->write_ecc (part->master, to + part->offset,=20
+					len, retlen, buf, eccbuf);
+}
+
 static int part_erase (struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct mtd_part *part =3D PART(mtd);
@@ -209,6 +261,14 @@
 				slave->mtd.suspend =3D part_suspend;
 				slave->mtd.resume =3D part_resume;
 		}
+		if (master->read_oob)
+			slave->mtd.read_oob =3D part_read_oob;
+		if (master->write_oob)
+			slave->mtd.write_oob =3D part_write_oob;
+		if (master->read_ecc)
+			slave->mtd.read_ecc =3D part_read_ecc;
+		if (master->write_ecc)
+			slave->mtd.write_ecc =3D part_write_ecc;
=20
 		if (master->writev)
 			slave->mtd.writev =3D part_writev;
diff -u -r mtd-20011126/util/eraseall.c mtd/util/eraseall.c
--- mtd-20011126/util/eraseall.c	Fri Apr 27 18:00:06 2001
+++ mtd/util/eraseall.c	Mon Dec  3 08:43:04 2001
@@ -37,6 +37,8 @@
 static const char *exe_name;
 static const char *mtd_device;
 static int quiet; /* true -- don't output progress */
+static int do_oob;
+#define OOBVAL 0xff
=20
 static void process_options( int argc, char *argv[] );
 static void display_help();
@@ -47,6 +49,8 @@
     mtd_info_t meminfo;
     int fd;
     erase_info_t erase;
+    struct mtd_oob_buf oob;
+    unsigned char *oobbuf;
   =20
     process_options( argc, argv );
   =20
@@ -85,6 +89,35 @@
        printf( "\rErased %ld Kibyte @ %lx -- 100%% complete.       \n",
 	       meminfo.size/1024, 0L );
    }
+
+   if (!do_oob) return 0;
+
+   if (!(oobbuf =3D (unsigned char *) malloc(meminfo.oobsize))) {
+       fprintf( stderr, "%s: unable to malloc oob buffer\n", exe_name);
+       exit( 1 );
+   }
+   oob.length =3D meminfo.oobsize;
+   oob.ptr =3D oobbuf;
+   memset(oobbuf, OOBVAL, meminfo.oobsize);
+
+   for (oob.start =3D 0; oob.start < meminfo.size;
+        oob.start +=3D meminfo.oobblock) {
+       if( !quiet ) {
+	   printf( "\rSetting %d bytes of oob @ %lx to %02X -- %2ld %% =
complete.",
+	           meminfo.oobsize, oob.start, OOBVAL,
+		   oob.start*100/meminfo.size );
+       }
+       fflush( stdout );
+
+       if(ioctl( fd, MEMWRITEOOB, &oob) !=3D 0)
+       {
+	       fprintf( stderr, "\n%s: %s: OOB write failure: %s\n", exe_name,
+			mtd_device, strerror( errno) );
+       }
+   }
+   if( !quiet ) {
+       printf( "\nDone.\n" );
+   }
   =20
    return 0;
 }
@@ -98,13 +131,13 @@
=20
     for(;;) {
         int option_index =3D 0;
-        static const char* short_options=3D"q";
+        static const char* short_options=3D"oq";
         static const struct option long_options[] =3D {
             {"help", no_argument, 0, 0},
             {"version", no_argument, 0, 0},
 	    {"quiet", no_argument, 0, 'q'},
 	    {"silent", no_argument, 0, 'q'},
-
+	    {"oob", no_argument, 0, 'o'},
             {0, 0, 0, 0},
         };
=20
@@ -128,6 +161,9 @@
 	case 'q' :
 	    quiet=3D1;
 	    break;
+	case 'o' :
+	    do_oob=3D1;
+	    break;
         case '?' :
             error=3D1;
             break;
@@ -152,10 +188,11 @@
             "Erases all of the specified MTD device.\n"
             "\n"
             "  -q, --quiet    don't display progress messages\n"
+	    "  -o, --oob      set all oob data to %02X\n"
 	    "      --silent   same as --quiet\n"
             "      --help     display this help and exit\n"
             "      --version  output version information and exit\n"
-            , exe_name);
+            , exe_name, OOBVAL);
     exit( 0 );
 }
    =20

------=_NextPart_000_0042_01C17CBF.CD2C8810--
