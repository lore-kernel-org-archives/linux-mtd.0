Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FDY2Z-0007uQ-4b
	for linux-mtd@lists.infradead.org; Sun, 26 Feb 2006 21:23:17 -0500
Received: by zproxy.gmail.com with SMTP id o1so853164nzf
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Feb 2006 18:23:04 -0800 (PST)
From: Husam <husamsenussi@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 27 Feb 2006 02:22:07 +0000
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602270222.07192.husamsenussi@gmail.com>
Subject: Adding MDoC+32/64M support to diskonchip new driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to add 32/64M support to diskonchip new driver, 
I made few changes and I manage to read partition information.

However I'm still having some problems, for example  
when I read page offset 0x18000 I get data by reading first 528 bytes but 
after that I get 0xff and ECC fails.

below is my log file

Jan  1 00:03:02 h6300 user.notice kernel: DiskOnChip found at 0x0
Jan  1 00:03:02 h6300 user.info kernel: NAND device: Manufacturer ID: 0x98, 
Chip ID: 0x75 (Toshiba NAND 32MiB 3,3V 8-bit)
Jan  1 00:03:02 h6300 user.info kernel: 2 NAND chips detected
Jan  1 00:03:02 h6300 user.info kernel: nand_read_ecc: from = 0x00000800, len 
= 512
Jan  1 00:03:02 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:02 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:02 h6300 user.info kernel: nand_do_read_ecc: reading 4 free oob 
bytes
Jan  1 00:03:02 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:02 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:02 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000002 on chip 0
Jan  1 00:03:02 h6300 user.info kernel: nand_do_read_ecc: reading 16 free oob 
bytes
Jan  1 00:03:02 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:03 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000002 on chip 0
Jan  1 00:03:03 h6300 user.warn kernel: nand_bbt: ECC error while reading bad 
block table
Jan  1 00:03:03 h6300 user.debug kernel: nand_read_bbt: Bad block at 
0x03fc0000
Jan  1 00:03:04 h6300 user.debug kernel: nand_read_bbt: Bad block at 
0x03fc8000
Jan  1 00:03:04 h6300 user.debug kernel: nand_read_bbt: Bad block at 
0x03fd0000
Jan  1 00:03:06 h6300 user.debug kernel: nand_read_bbt: Bad block at 
0x03fd8000
Jan  1 00:03:06 h6300 user.debug kernel: nand_read_bbt: Bad block at 
0x03fe0000
Jan  1 00:03:07 h6300 user.debug kernel: nand_read_bbt: Bad block at 
0x03fe8000
Jan  1 00:03:07 h6300 user.debug kernel: nand_read_bbt: Bad block at 
0x03ff8000
Jan  1 00:03:07 h6300 user.info kernel: nand_read_ecc: from = 0x00000000, len 
= 1024
Jan  1 00:03:07 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 4 free oob 
bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000000 on chip 0
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 16 free oob 
bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000000 on chip 0
Jan  1 00:03:08 h6300 user.warn kernel: ECC error scanning DOC at 0x0
Jan  1 00:03:08 h6300 user.info kernel: nand_read_ecc: from = 0x00008000, len 
= 1024
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000020 on chip 0
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 4 free oob 
bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000020 on chip 0
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 16 free oob 
bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:08 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000020 on chip 0
Jan  1 00:03:08 h6300 user.warn kernel: ECC error scanning DOC at 0x8000
Jan  1 00:03:08 h6300 user.info kernel: nand_read_ecc: from = 0x00010000, len 
= 1024
Jan  1 00:03:08 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000040 on chip 0
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 4 free oob 
bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000040 on chip 0
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 16 free oob 
bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000040 on chip 0
Jan  1 00:03:09 h6300 user.warn kernel: ECC error scanning DOC at 0x10000
Jan  1 00:03:09 h6300 user.info kernel: nand_read_ecc: from = 0x00018000, len 
= 1024
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 4 free oob 
bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 512 bytes of 
data
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000060 on chip 0
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 16 free oob 
bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_do_read_ecc: reading 6 ecc bytes
Jan  1 00:03:09 h6300 user.info kernel: nand_read_ecc: Failed ECC read, page 
0x00000060 on chip 0
Jan  1 00:03:09 h6300 user.warn kernel: ECC error scanning DOC at 0x18000
Jan  1 00:03:09 h6300 user.info kernel: Found DiskOnChip BNAND Media Header at 
0x18000
Jan  1 00:03:09 h6300 user.info kernel:     bootRecordID          = BNAND
Jan  1 00:03:09 h6300 user.warn kernel:     NoOfBootImageBlocks   = 0
Jan  1 00:03:09 h6300 user.warn kernel:     NoOfBinaryPartitions  = 1
Jan  1 00:03:09 h6300 user.warn kernel:     NoOfBDTLPartitions    = 3
Jan  1 00:03:09 h6300 user.warn kernel:     BlockMultiplerBits    = 0
Jan  1 00:03:09 h6300 user.warn kernel:     FormatFlgs            = 1
Jan  1 00:03:10 h6300 user.warn kernel:     OsakVersion           = 5.1.4.0
Jan  1 00:03:10 h6300 user.warn kernel:     PercentUsed           = 98
Jan  1 00:03:10 h6300 user.info kernel:     PARTITION[0] ->
Jan  1 00:03:10 h6300 user.warn kernel:         virtualUnits    = 12
Jan  1 00:03:10 h6300 user.warn kernel:         firstUnit       = 4
Jan  1 00:03:10 h6300 user.warn kernel:         lastUnit        = 15
Jan  1 00:03:10 h6300 user.warn kernel:         flags           = 0x2000004d
Jan  1 00:03:10 h6300 user.warn kernel:         spareUnits      = 0
Jan  1 00:03:10 h6300 user.info kernel:     PARTITION[1] ->
Jan  1 00:03:10 h6300 user.warn kernel:         virtualUnits    = 1184
Jan  1 00:03:10 h6300 user.warn kernel:         firstUnit       = 17
Jan  1 00:03:10 h6300 user.warn kernel:         lastUnit        = 0
Jan  1 00:03:10 h6300 user.warn kernel:         flags           = 0x4000000d
Jan  1 00:03:10 h6300 user.warn kernel:         spareUnits      = 2
Jan  1 00:03:10 h6300 user.info kernel:     PARTITION[2] ->
Jan  1 00:03:10 h6300 user.warn kernel:         virtualUnits    = 128
Jan  1 00:03:10 h6300 user.warn kernel:         firstUnit       = 0
Jan  1 00:03:10 h6300 user.warn kernel:         lastUnit        = 0
Jan  1 00:03:10 h6300 user.warn kernel:         flags           = 0x4000000d
Jan  1 00:03:10 h6300 user.warn kernel:         spareUnits      = 2
Jan  1 00:03:10 h6300 user.info kernel:     PARTITION[3] ->
Jan  1 00:03:10 h6300 user.warn kernel: 1
Jan  1 00:03:10 h6300 user.warn kernel:         firstUnit       = 0
Jan  1 00:03:10 h6300 user.warn kernel:         lastUnit        = 2047
Jan  1 00:03:11 h6300 user.warn kernel:         flags           = 0xc0000000
Jan  1 00:03:11 h6300 user.warn kernel:         spareUnits      = 2
Jan  1 00:03:11 h6300 user.notice kernel: Creating 4 MTD partitions on 
"DiskOnChip Millennium Plus":
Jan  1 00:03:11 h6300 user.notice kernel: 0x00020000-0x00080000 : " DiskOnChip 
BDK partition"
Jan  1 00:03:11 h6300 user.notice kernel: 0x00088000-0x00008000 : " DiskOnChip 
BDTL partition"
Jan  1 00:03:11 h6300 user.notice kernel: 0x00000000-0x00008000 : " DiskOnChip 
BDTL partition"
Jan  1 00:03:11 h6300 user.notice kernel: 0x00000000-0x04000000 : " DiskOnChip 
BDTL partition"

Could  that be because my device still using M-System Trueffs and flashed with 
wince!!! I have MDoC+ 64M.

I'm also sending patch I made against latest version in CVS with the changes I 
made so far.

Index: drivers/mtd/nand/diskonchip.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/diskonchip.c,v
retrieving revision 1.55
diff -u -a -r1.55 diskonchip.c
--- drivers/mtd/nand/diskonchip.c	7 Nov 2005 11:14:30 -0000	1.55
+++ drivers/mtd/nand/diskonchip.c	27 Feb 2006 02:03:07 -0000
@@ -61,7 +61,9 @@
         0xff000000,
 #elif defined(CONFIG_MOMENCO_OCELOT_G) || defined (CONFIG_MOMENCO_OCELOT_C)
         0xff000000,
-##else
+#elif defined(CONFIG_MACH_OMAP_H6300)
+        0x00000000,
+#else
 #warning Unknown architecture for DiskOnChip. No default probe locations 
defined
 #endif
 	0xffffffff };
@@ -96,6 +98,7 @@
 
 static void doc200x_hwcontrol(struct mtd_info *mtd, int cmd);
 static void doc200x_select_chip(struct mtd_info *mtd, int chip);
+static int doc2001plus_reset(struct mtd_info *mtd, int chip);
 
 static int debug=0;
 module_param(debug, int, 0);
@@ -617,6 +620,37 @@
 	if (debug) printk("\n");
 }
 
+static void doc2001plus_16bits_readbuf(struct mtd_info *mtd,
+                u_char *buf, int len)
+{
+    struct nand_chip *this = mtd->priv;
+    struct doc_priv *doc = this->priv;
+    void __iomem *docptr = doc->virtadr;
+    int i;
+    uint16_t *buff  = (uint16_t *) buf;
+    int      size   = len >> 1;
+    int      loc    = DoC_Mil_CDSN_IO;
+
+    if (debug)printk("readbuf of %d bytes: ", len);
+
+    /* Start read pipeline */
+    readw(docptr + DoC_Mplus_ReadPipeInit);
+    readw(docptr + DoC_Mplus_ReadPipeInit);
+
+    for (i=0; i < size-1; i++, loc += 2) {
+        buff[i] = readw(docptr + loc);
+        if (debug && i < 16)
+            printk("%04x ", buff[i]);
+    }
+
+    /* Terminate read pipeline */
+    buff[len-1] = readw(docptr +  DoC_Mplus_LastDataRead);
+    if (debug && i < 16)
+        printk("%04x ", buff[len-1]);
+    if (debug) printk("\n");
+}
+
+
 static int doc2001plus_verifybuf(struct mtd_info *mtd,
 			     const u_char *buf, int len)
 {
@@ -659,12 +693,19 @@
 		return;
 	}
 
-	floor = chip / doc->chips_per_floor;
-	chip -= (floor *  doc->chips_per_floor);
+	if(doc->ChipID == DOC_ChipID_DocMilPlus32){
+        /* We should allow driver to select Device
+         * when we use 64M
+         */
+        WriteDOC((chip & 0x3), docptr, Mplus_DeviceSelect);
+    }else {
+        floor = chip / doc->chips_per_floor;
+        chip -= (floor *  doc->chips_per_floor);
+    }
 
 	/* Assert ChipEnable and deassert WriteProtect */
-	WriteDOC((DOC_FLASH_CE), docptr, Mplus_FlashSelect);
-	this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+	WriteDOC((DOC_FLASH_CE|DOC_FLASH_SETRWP), docptr, Mplus_FlashSelect);
+	doc2001plus_reset(mtd, chip);
 
 	doc->curchip = chip;
 	doc->curfloor = floor;
@@ -777,7 +818,7 @@
 		/* Serially input address */
 		if (column != -1) {
 			/* Adjust columns for 16 bit buswidth */
-			if (this->options & NAND_BUSWIDTH_16)
+			if ((this->options & NAND_BUSWIDTH_16) && !(this->options & 
NAND_INTERLEAVE))
 				column >>= 1;
 			WriteDOC(column, docptr, Mplus_FlashAddress);
 		}
@@ -1063,7 +1104,52 @@
         .useecc = MTD_NANDECC_AUTOPLACE,
         .eccbytes = 6,
         .eccpos = {0, 1, 2, 3, 4, 5},
-        .oobfree = { {8, 8}, {6, 2} }
+        .oobfree = { {6, 2}, {8, 8} }
+};
+
+#if 0
+static struct nand_oobinfo doc2001plus_oobinfo = {
+        .useecc = MTD_NANDECC_AUTOPLACE,
+        .eccbytes = 6,
+        .eccpos = {0, 1, 2, 3, 4, 5},
+        .oobfree = { {6, 2}, {8, 8} }
+};
+#endif
+
+/**
+ * This layout will be used by MDoC+ with interleave
+ *
+ *  
+-----------+-------+-------+-------+--------------+---------+-----------+
+ *  | 0 --- 511 |512-517|518-519|520-521| 522 --- 1033 |1034-1039|1040 - 
1055|
+ *  
+-----------+-------+-------+-------+--------------+---------+-----------+
+ *  | Data 0    | ECC 0 |Flags0 |Flags1 | Data 1       |ECC 1    | OOB 1 + 2 
|
+ *  
+-----------+-------+-------+-------+--------------+---------+-----------+
+ */
+struct page_layout_item doc2001plus_layout[] = {
+	{
+		.length = 512,
+		.type	= ITEM_TYPE_DATA
+	},
+	{
+		.length = 6,
+		.type	= ITEM_TYPE_ECC
+	},
+	{
+		.length = 4,
+		.type	= ITEM_TYPE_OOB
+	},
+	{
+		.length = 512,
+		.type	= ITEM_TYPE_DATA
+	},
+	{
+		.length = 6,
+		.type	= ITEM_TYPE_ECC
+	},
+	{
+		.length = 16,
+		.type	= ITEM_TYPE_OOB
+	}	
 };
 
 /* Find the (I)NFTL Media Header, and optionally also the mirror media 
header.
@@ -1484,10 +1570,86 @@
 	}
 }
 
+static int doc2001plus_reset(struct mtd_info *mtd, int chip)
+{
+    struct nand_chip *this = mtd->priv;
+    struct doc_priv *doc = this->priv;
+    void __iomem *virtadr = doc->virtadr;
+    uint8_t tmp = 0;
+
+    /* select chip */
+    WriteDOC(chip, virtadr, Mplus_DeviceSelect);
+
+    /* Wait for release power  down */
+    for (tmp = 0; (tmp < 4); tmp++)
+            ReadDOC(virtadr, Mplus_Power);
+
+    /* Enable the Millennium Plus ASIC */
+    tmp = DOC_MODE_NORMAL | DOC_MODE_MDWREN | DOC_MODE_RST_LAT |
+          DOC_MODE_BDECT;
+    WriteDOC(tmp, virtadr, Mplus_DOCControl);
+    WriteDOC(~tmp, virtadr, Mplus_CtrlConfirm);
+    mdelay(1);
+
+    tmp = ReadDOC(virtadr, Mplus_DOCControl);
+    if(!(tmp & DOC_MODE_NORMAL))
+        return 0;
+
+    tmp = ReadDOC(virtadr, Mplus_NprotectionStatus);
+    if(tmp & DOC_PROTECT_STAT_ACCERR){
+        /* Lets try and rset flash */
+        doc2001plus_command(mtd, NAND_CMD_RESET, -1, -1);
+    }
+
+    tmp = ReadDOC(virtadr, Mplus_NprotectionStatus);
+    return (tmp != DOC_PROTECT_STAT_ACCERR);
+}
+
+static int doc2001plus_count_chipts(struct mtd_info *mtd)
+{
+    struct nand_chip *this = mtd->priv;
+    struct doc_priv *doc = this->priv;
+    void __iomem *virtadr = doc->virtadr;
+    uint8_t tmp = 0;
+    int     chip= 0;
+
+    for(chip = 0; chip < 4; ++chip){
+        WriteDOC(chip,virtadr,Mplus_DeviceSelect);
+        WriteDOC(0xe0,virtadr,Mplus_FlashSelect);
+        WriteDOC(0xff,virtadr,Mplus_FlashCmd);
+        WriteDOC(0xff,virtadr,Mplus_WritePipeTerm);
+        WriteDOC(0xff,virtadr,Mplus_WritePipeTerm);
+    }
+
+    for(chip = 0; chip < 4; ++chip){
+        /* Select chip */
+        WriteDOC(chip, virtadr, Mplus_DeviceSelect);
+
+        tmp = ReadDOC(virtadr, ChipID);
+        if(tmp != 0x40 && tmp != 0x41)
+            break;
+
+        tmp = ReadDOC(virtadr, Mplus_Toggle);
+        tmp = ReadDOC(virtadr, Mplus_Toggle) ^ tmp;
+        if(!(tmp & 0x4))
+            break;
+
+        if(!doc2001plus_reset(mtd, chip))
+            return 0;
+
+        WriteDOC(0x60, virtadr, Mplus_FlashSelect);
+    }
+	WriteDOC(0, virtadr, Mplus_DeviceSelect);
+	WriteDOC(0x60, virtadr, Mplus_FlashSelect);
+
+	return chip;
+}
+
 static inline int __init doc2001plus_init(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
 	struct doc_priv *doc = this->priv;
+	void __iomem *virtadr = doc->virtadr;
 
 	this->write_byte = NULL;
 	this->read_byte = doc2001plus_read_byte;
@@ -1500,10 +1662,19 @@
 	this->cmdfunc = doc2001plus_command;
 	this->enable_hwecc = doc2001plus_enable_hwecc;
 
-	doc->chips_per_floor = 1;
+	if(ReadDOC(virtadr, Mplus_Configuration) & 0x80){
+		this->layout		 = doc2001plus_layout;
+		this->options		|= (NAND_INTERLEAVE | NAND_BUSWIDTH_16);
+		this->read_buf       = doc2001plus_16bits_readbuf;
+	}
+
+	if(doc->ChipID == DOC_ChipID_DocMilPlus32)
+        doc->chips_per_floor = doc2001plus_count_chipts(mtd);
+    else
+        doc->chips_per_floor = 1;
 	mtd->name = "DiskOnChip Millennium Plus";
 
-	return 1;
+	return doc->chips_per_floor;
 }
 
 static inline int __init doc_probe(unsigned long physadr)
@@ -1581,10 +1752,9 @@
 
 		switch (ChipID) {
 		case DOC_ChipID_DocMilPlus16:
+		case DOC_ChipID_DocMilPlus32:
 			reg = DoC_Mplus_Toggle;
 			break;
-		case DOC_ChipID_DocMilPlus32:
-			printk(KERN_ERR "DiskOnChip Millennium Plus 32MB is not supported, 
ignoring.\n");
 		default:
 			ret = -ENODEV;
 			goto notfound;
@@ -1686,7 +1856,7 @@
 
 	if (ChipID == DOC_ChipID_Doc2k)
 		numchips = doc2000_init(mtd);
-	else if (ChipID == DOC_ChipID_DocMilPlus16)
+	else if (ChipID == DOC_ChipID_DocMilPlus16 || ChipID == 
DOC_ChipID_DocMilPlus32)
 		numchips = doc2001plus_init(mtd);
 	else
 		numchips = doc2001_init(mtd);
Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.165
diff -u -a -r1.165 nand_base.c
--- drivers/mtd/nand/nand_base.c	16 Dec 2005 15:41:31 -0000	1.165
+++ drivers/mtd/nand/nand_base.c	27 Feb 2006 02:03:10 -0000
@@ -2543,6 +2543,7 @@
 	int i = 1, res = 0;
 	int eccpos = 0, eccbytes = 0, cur = 0, oobcur = 0;
 
+
 	this->layout = kmalloc(HW_AUTOOOB_LAYOUT_SIZE * sizeof (struct 
page_layout_item), GFP_KERNEL);
 
 	if (this->layout == NULL)
@@ -2552,7 +2553,6 @@
 
 	memset(this->layout, 0, HW_AUTOOOB_LAYOUT_SIZE * sizeof (struct 
page_layout_item));
 
-
 	this->layout[0].type = ITEM_TYPE_DATA;
 	this->layout[0].length = mtd->oobblock;
 	DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: data type, length %d\n", 
this->layout[0].length);
@@ -2629,8 +2629,12 @@
 int nand_scan (struct mtd_info *mtd, int maxchips)
 {
 	int i, nand_maf_id, nand_dev_id, busw, maf_id;
+	int interleave;
 	struct nand_chip *this = mtd->priv;
 
+	/* Check in inerleave used */
+	interleave = (this->options & NAND_INTERLEAVE)? 1: 0;
+
 	/* Get buswidth to select the correct functions*/
 	busw = this->options & NAND_BUSWIDTH_16;
 
@@ -2713,10 +2717,10 @@
 		} else {
 			/* Old devices have this data hardcoded in the
 			 * device id table */
-			mtd->erasesize = nand_flash_ids[i].erasesize;
-			mtd->oobblock = nand_flash_ids[i].pagesize;
+			mtd->erasesize = nand_flash_ids[i].erasesize << interleave;
+			mtd->oobblock = nand_flash_ids[i].pagesize << interleave;
 			mtd->oobsize = mtd->oobblock / 32;
-			busw = nand_flash_ids[i].options & NAND_BUSWIDTH_16;
+			busw = interleave? NAND_BUSWIDTH_16: nand_flash_ids[i].options & 
NAND_BUSWIDTH_16;
 		}
 
 		/* Try to identify manufacturer */
Index: include/linux/mtd/nand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/nand.h,v
retrieving revision 1.77
diff -u -a -r1.77 nand.h
--- include/linux/mtd/nand.h	16 Dec 2005 15:41:33 -0000	1.77
+++ include/linux/mtd/nand.h	27 Feb 2006 02:03:10 -0000
@@ -215,6 +215,12 @@
  * bits from adjacent blocks from 'leaking' in altering data.
  * This happens with the Renesas AG-AND chips, possibly others.  */
 #define BBT_AUTO_REFRESH	0x00000080
+/* Interleave architecture allows 16bits internal access 
+ * instead of 8bit internal access to arrauy of daul NAND flash,
+ * which means array of two 8bit NAND flash will be seen as one
+ * large 16bit NAND flash.
+ */
+#define NAND_INTERLEAVE		0x00000100
 
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS \


BTY: Is there anybody working on adding 32/64M support !!!!!

Thanks 
