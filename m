Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsU9V-0006MB-IA
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 20:31:50 -0400
Received: by ug-out-1314.google.com with SMTP id q2so2867497uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Jun 2006 17:31:31 -0700 (PDT)
From: Husam <husamsenussi@gmail.com>
To: tglx@linutronix.de
Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
Date: Tue, 20 Jun 2006 01:31:53 +0100
References: <4488665D.5010908@kalikstein.com>
	<200606132120.51121.husamsenussi@gmail.com>
	<1150232389.5257.378.camel@localhost.localdomain>
In-Reply-To: <1150232389.5257.378.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200606200131.53476.husamsenussi@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Today 01:21:54
  =C2=A0
Hi,

I did small changes to get read to work on MDoC, and=20
manage to do that ...=20

I still have one problem when I use nanddump OOB area seams to have
the wrong data, where the actual page is correct "I have dump of =C2=A0the =
same=20
page using anther tool".

I had look at the read_oob function and it looks like it's only using=20
read_buf,which mean the read will never get terminated.

below is sample of the data I read from block 4 where the boot loader exist.

readbuf of 512 bytes: 03fe ea00 0000 0000 0000 0000 0000 0000
readbuf of 6 bytes: 3e51 c3da 6106
readbuf of 4 bytes: 5555 5555
readbuf of 512 bytes: 0000 0000 0000 0000 0000 0000 0000 0000
readbuf of 6 bytes: 005b 05c8 0891
readbuf of 14 bytes: 4357 3045 3030 3030 ffff ffff ffff

but nanddump shows the wrong data in OOB part

readbuf of 32 bytes: ffff ffff 0000 0000 0000 0000 0000 005b

Anyway I have included patch with changes I made so far .. may someone want=
s=20
to have look.

Thanks
Husam

=2D-- /home/husam/mtd-2.6/drivers/mtd/nand/nand_base.c	2006-06-17=20
22:55:33.000000000 +0100
+++ nand_base.c	2006-06-18 20:32:40.000000000 +0100
@@ -2044,6 +2044,10 @@
 {
 	struct nand_flash_dev *type =3D NULL;
 	int i, dev_id, maf_idx;
+	int interleave;
+
+	/* Check in inerleave used */
+    interleave =3D (chip->options & NAND_INTERLEAVE)? 1: 0;
=20
 	/* Select the device */
 	chip->select_chip(mtd, 0);
@@ -2094,10 +2098,10 @@
 		/*
 		 * Old devices have chip data hardcoded in the device id table
 		 */
=2D		mtd->erasesize =3D type->erasesize;
=2D		mtd->writesize =3D type->pagesize;
+		mtd->erasesize =3D type->erasesize << interleave;
+		mtd->writesize =3D type->pagesize << interleave;
 		mtd->oobsize =3D mtd->writesize / 32;
=2D		busw =3D type->options & NAND_BUSWIDTH_16;
+		busw =3D interleave? NAND_BUSWIDTH_16: nand_flash_ids[i].options &=20
NAND_BUSWIDTH_16;
 	}
=20
 	/* Try to identify manufacturer */
=2D-- /home/husam/mtd-2.6/drivers/mtd/nand/diskonchip.c	2006-06-17=20
22:55:33.000000000 +0100
+++ diskonchip.c	2006-06-19 01:27:06.000000000 +0100
@@ -61,6 +61,8 @@
 	0xff000000,
 #elif defined(CONFIG_MOMENCO_OCELOT_G) || defined (CONFIG_MOMENCO_OCELOT_C)
 	0xff000000,
+#elif defined(CONFIG_MACH_OMAP_H6300)
+        0x00000000,
 #else
 #warning Unknown architecture for DiskOnChip. No default probe locations=20
defined
 #endif
@@ -114,6 +116,9 @@
 static int show_firmware_partition =3D 0;
 module_param(show_firmware_partition, int, 0);
=20
+static int floor =3D 0;
+module_param(floor, int, 0);
+
 #ifdef MTD_NAND_DISKONCHIP_BBTWRITE
 static int inftl_bbt_write =3D 1;
 #else
@@ -1483,6 +1488,146 @@
 	}
 }
=20
+/************************************************************************/
+/***********************   MDoC+ 32MiB interface ************************/
+static void mdocplus32_select_chip(struct mtd_info *mtd, int chip)
+{
+    struct nand_chip *this =3D mtd->priv;
+    struct doc_priv *doc =3D this->priv;
+    void __iomem *docptr =3D doc->virtadr;
+
+    if (debug)
+        printk("select chip (%d)\n", chip);
+
+    if (chip =3D=3D -1) {
+        /* Disable flash internally */
+        WriteDOC(0, docptr, Mplus_FlashSelect);
+        return;
+    }
+
+	/* Select teh device */
+	WriteDOC(doc->curfloor, docptr, Mplus_DeviceSelect);
+
+    /* Assert ChipEnable and deassert WriteProtect */
+    WriteDOC((DOC_FLASH_CE), docptr, Mplus_FlashSelect);
+    this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+}
+
+static void mdocplus32_readbuf(struct mtd_info *mtd,
+                u_char *buf, int len)
+{
+    struct nand_chip *this =3D mtd->priv;
+    struct doc_priv *doc =3D this->priv;
+    void __iomem *docptr =3D doc->virtadr;
+    int i;
+    uint16_t *buff  =3D (uint16_t *) buf;
+    int      size   =3D len >> 1;
+    int      loc    =3D DoC_Mil_CDSN_IO;
+
+    if (debug)printk("readbuf of %d bytes: ", len);
+    for (i=3D0; i < size; i++, loc +=3D 2) {
+        buff[i] =3D ReadWDOC_(docptr ,loc);
+        if (debug && i < 8)
+            printk("%04x ", buff[i]);
+    }
+    if (debug) printk("\n");
+}
+
+static void mdocplus32_writebuf(struct mtd_info *mtd,
+                 const u_char *buf, int len)
+{
+    struct nand_chip *this =3D mtd->priv;
+    struct doc_priv *doc =3D this->priv;
+    void __iomem *docptr =3D doc->virtadr;
+    int i;
+    uint16_t *buff  =3D (uint16_t *) buf;
+    int      size   =3D len >> 1;
+    int      loc    =3D DoC_Mil_CDSN_IO;
+
+    if (debug)printk("writebuf of %d bytes: ", len);
+    for (i=3D0; i < size; i++, loc +=3D 2) {
+        WriteWDOC_(buff[i], docptr ,loc);
+        if (debug && i < 8)
+            printk("%02x ", buf[i]);
+    }
+    if (debug) printk("\n");
+}
+
+static int mdocplus32_read_page(struct mtd_info *mtd, struct nand_chip *ch=
ip,
+                         		uint8_t *buf)
+{
+	struct nand_chip *this =3D mtd->priv;
+    struct doc_priv *doc =3D this->priv;
+    void __iomem *docptr =3D doc->virtadr;
+    uint8_t *p =3D buf;
+    uint8_t *oob =3D chip->oob_poi;
+	int     stat;
+
+	ReadWDOC(docptr, Mplus_ReadPipeInit);
+	ReadWDOC(docptr, Mplus_ReadPipeInit);
+
+	chip->ecc.hwctl(mtd, NAND_ECC_READ);
+    chip->read_buf(mtd, p, 512);
+
+	chip->ecc.hwctl(mtd, NAND_ECC_READSYN);
+    chip->read_buf(mtd, oob, 6);
+    stat =3D chip->ecc.correct(mtd, p, oob, NULL);
+
+	if (stat =3D=3D -1)
+   		mtd->ecc_stats.failed++;
+  	else
+    	mtd->ecc_stats.corrected +=3D stat;
+
+  	oob +=3D 6;
+	chip->read_buf(mtd, oob, 4);
+	oob +=3D 4;
+
+	p +=3D 512;
+	chip->ecc.hwctl(mtd, NAND_ECC_READ);
+    chip->read_buf(mtd, p, 512);
+
+	chip->ecc.hwctl(mtd, NAND_ECC_READSYN);
+    chip->read_buf(mtd, oob, 6);
+    stat =3D chip->ecc.correct(mtd, p, oob, NULL);
+
+    if (stat =3D=3D -1)
+        mtd->ecc_stats.failed++;
+    else
+        mtd->ecc_stats.corrected +=3D stat;
+	oob +=3D 6;
+
+   	chip->read_buf(mtd, oob, 14);
+	oob +=3D 14;
+	*((uint16_t *) oob) =3D ReadWDOC_(docptr,DoC_Mplus_LastDataRead);
+
+    return 0;
+}
+
+static inline int __init mdocplus32_init(struct mtd_info *mtd)
+{
+    struct nand_chip *this =3D mtd->priv;
+    struct doc_priv *doc =3D this->priv;
+
+    this->read_byte   	=3D doc2001plus_read_byte;
+    this->write_buf   	=3D mdocplus32_writebuf;
+    this->read_buf 	  	=3D mdocplus32_readbuf;
+    this->verify_buf  	=3D doc2001plus_verifybuf;
+    this->scan_bbt 	  	=3D inftl_scan_bbt;
+    this->cmd_ctrl 	  	=3D NULL;
+    this->select_chip 	=3D mdocplus32_select_chip;
+    this->cmdfunc 	  	=3D doc2001plus_command;
+    this->ecc.hwctl   	=3D doc2001plus_enable_hwecc;
+	this->ecc.read_page =3D mdocplus32_read_page;
+	this->options      |=3D (NAND_INTERLEAVE | NAND_BUSWIDTH_16);
+
+	doc->curfloor		 =3D floor;
+    doc->chips_per_floor =3D 1;
+    mtd->name =3D "DiskOnChip Millennium Plus";
+
+    return 1;
+}
+/*******************************************************************/
+
 static inline int __init doc2001plus_init(struct mtd_info *mtd)
 {
 	struct nand_chip *this =3D mtd->priv;
@@ -1569,6 +1714,9 @@
 		WriteDOC(~tmp, virtadr, Mplus_CtrlConfirm);
 		mdelay(1);
=20
+		/* Select the device */
+		WriteDOC(floor, virtadr, Mplus_DeviceSelect);
+
 		ChipID =3D ReadDOC(virtadr, ChipID);
=20
 		switch (ChipID) {
@@ -1576,7 +1724,8 @@
 			reg =3D DoC_Mplus_Toggle;
 			break;
 		case DOC_ChipID_DocMilPlus32:
=2D			printk(KERN_ERR "DiskOnChip Millennium Plus 32MB is not supported,=20
ignoring.\n");
+			reg =3D DoC_Mplus_Toggle;
+            break;
 		default:
 			ret =3D -ENODEV;
 			goto notfound;
@@ -1680,6 +1829,8 @@
 		numchips =3D doc2000_init(mtd);
 	else if (ChipID =3D=3D DOC_ChipID_DocMilPlus16)
 		numchips =3D doc2001plus_init(mtd);
+	else if (ChipID =3D=3D DOC_ChipID_DocMilPlus32)
+		numchips =3D mdocplus32_init(mtd);
 	else
 		numchips =3D doc2001_init(mtd);
=20
=2D-- /home/husam/mtd-2.6/include/linux/mtd/nand.h	2006-06-17 22:56:05.0000=
00000=20
+0100
+++ ../../../include/linux/mtd/nand.h	2006-06-18 18:57:01.000000000 +0100
@@ -490,6 +490,13 @@
 /* Search good / bad pattern on the first and the second page */
 #define NAND_BBT_SCAN2NDPAGE	0x00004000
=20
+/* Interleave architecture allows 16bits internal access
+ * instead of 8bit internal access to arrauy of daul NAND flash,
+ * which means array of two 8bit NAND flash will be seen as one
+ * large 16bit NAND flash.
+ */
+#define NAND_INTERLEAVE     0x00100000
+
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
=20
=2D-- /home/husam/mtd-2.6/include/linux/mtd/doc2000.h	2006-06-17=20
22:56:05.000000000 +0100
+++ ../../../include/linux/mtd/doc2000.h	2006-06-18 22:34:33.000000000 +0100
@@ -73,6 +73,7 @@
 #define DoC_Mplus_Toggle		0x1046
 #define DoC_Mplus_DownloadStatus	0x1074
 #define DoC_Mplus_CtrlConfirm		0x1076
+#define DoC_Mplus_NprotectionStatus   0x1078
 #define DoC_Mplus_Power			0x1fff
=20
 /* How to access the device?
@@ -80,7 +81,7 @@
  * On PPC, it's mmap'd and 16-bit wide.
  * Others use readb/writeb
  */
=2D#if defined(__arm__)
+#if defined(__arm__) && !defined(CONFIG_MACH_OMAP_H6300)
 #define ReadDOC_(adr, reg)      ((unsigned char)(*(volatile __u32 *)
(((unsigned long)adr)+((reg)<<2))))
 #define WriteDOC_(d, adr, reg)  do{ *(volatile __u32 *)(((unsigned=20
long)adr)+((reg)<<2)) =3D (__u32)d; wmb();} while(0)
 #define DOC_IOREMAP_LEN 0x8000
@@ -91,6 +92,8 @@
 #else
 #define ReadDOC_(adr, reg)      readb((void __iomem *)(adr) + (reg))
 #define WriteDOC_(d, adr, reg)  writeb(d, (void __iomem *)(adr) + (reg))
+#define ReadWDOC_(adr, reg)      readw((void __iomem *)(adr) + (reg))
+#define WriteWDOC_(d, adr, reg)  writew(d, (void __iomem *)(adr) + (reg))
 #define DOC_IOREMAP_LEN 0x2000
=20
 #endif
@@ -103,6 +106,9 @@
 #define ReadDOC(adr, reg)      ReadDOC_(adr,DoC_##reg)
 #define WriteDOC(d, adr, reg)  WriteDOC_(d,adr,DoC_##reg)
=20
+#define ReadWDOC(adr, reg)      ReadWDOC_(adr,DoC_##reg)
+#define WriteWDOC(d, adr, reg)  WriteWDOC_(d,adr,DoC_##reg)
+
 #define DOC_MODE_RESET 		0
 #define DOC_MODE_NORMAL 	1
 #define DOC_MODE_RESERVED1 	2




On Tuesday 13 June 2006 21:59, Thomas Gleixner wrote:
> On Tue, 2006-06-13 at 21:20 +0100, Husam wrote:
> > On Tuesday 13 June 2006 20:56, David Woodhouse wrote:
> > > On Tue, 2006-06-13 at 20:42 +0100, Husam wrote:
> > > > Yes it's not single 16-bit, could we add anther flag to NAND say
> > > > "NAND_INTERLEAVE" .. or maybe pass number  of chips from device lay=
er
> > > > to NAND layer.
> > > >
> > > > All we need to do I guess is to pass the right information so the
> > > > NAND layer can calculate the right size for page and to block.
> > >
> > > Can we do this by providing our own command function?
> >
> > I guess we can ... but I thought the scan function is not replaceable
>
> We can add this to scan. Its not intrusive.
>
> 	tglx
