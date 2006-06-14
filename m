Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FqVAd-0002nY-RE
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 09:12:46 -0400
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=localhost)
	by postikukk.artecdesign.ee with smtp (Exim 4.50) id 1FqVAZ-00034K-Sb
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 16:12:38 +0300
Date: Wed, 14 Jun 2006 16:13:00 +0300
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] cs553x_nand driver PIO mode support, cs553x_cleanup() fix
Message-Id: <20060614161300.35c48903.indrek.kruusa@artecdesign.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Attatched patch for drivers/mtd/nand/cs553x_nand.c (in linux-2.6.17-rc6-mm1):
- add PIO mode support
- fix bug in cs553x_cleanup: 'for' loop shouldn't be broked if device is
missing
- added some informative printk's

Signed-off-by: Indrek Kruusa <indrek.kruusa@artecdesign.ee>


Indrek


--- cs553x_nand.c	2006-06-13 10:19:19.000000000 +0300
+++ cs553x_nand_mix_working.c	2006-06-13 11:29:40.000000000 +0300
@@ -30,6 +30,11 @@
 #include <asm/io.h>
 
 #define NR_CS553X_CONTROLLERS	4
+#define DEVICE_NAME "cs553x_nand"
+#define IO_REG_CNT 16
+
+/* I/O base address will be fetched from controller's MSR's  */
+static unsigned long io_base[NR_CS553X_CONTROLLERS];
 
 #define MSR_DIVIL_GLD_CAP	0x51400000	/* DIVIL capabilitiies */
 #define CAP_CS5535		0x2df000ULL
@@ -93,6 +98,109 @@
 #define CS_NAND_ECC_CLRECC	(1<<1)
 #define CS_NAND_ECC_ENECC	(1<<0)
 
+/*
+ * 
+ * functions for PIO mode
+ * 
+ * Currently all I/O is 1 byte at a time.
+ * If your hardware can do more: you could get more
+ * performance by changing read/write functions here
+ * 
+ */
+
+static void cs553x_write_byte_pio(struct mtd_info *mtd, u_char byte);
+
+static void cs553x_read_buf_pio(struct mtd_info *mtd, u_char *buf, int len)
+{
+	struct nand_chip *this = mtd->priv;
+	ioread8_rep(this->IO_ADDR_R, buf, len);
+}
+
+
+static void cs553x_write_buf_pio(struct mtd_info *mtd, const u_char *buf, int len)
+{
+	int i;
+	for (i = 0; i < len; i++)
+	    cs553x_write_byte_pio(mtd, buf[i]);
+}
+
+
+static unsigned char cs553x_read_byte_pio(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+	return ioread8(this->IO_ADDR_R);
+}
+
+
+static void cs553x_write_byte_pio(struct mtd_info *mtd, u_char byte)
+{
+	struct nand_chip *this = mtd->priv;
+	int i = 100000;
+
+	while (i && ioread8(this->IO_ADDR_R + IO_NAND_STS) & CS_NAND_CTLR_BUSY) {
+		udelay(1);
+		i--;
+	}
+	iowrite8(byte, this->IO_ADDR_W + IO_NAND_IO);
+}
+
+
+static void cs553x_hwcontrol_pio(struct mtd_info *mtd, int cmd,
+			     unsigned int ctrl)
+{
+	struct nand_chip *this = mtd->priv;
+	void __iomem *mmio_base = this->IO_ADDR_R;
+	if (ctrl & NAND_CTRL_CHANGE) {
+		unsigned char ctl = (ctrl & ~NAND_CTRL_CHANGE ) ^ 0x01;
+		iowrite8(ctl, mmio_base + IO_NAND_CTL);
+	}
+	if (cmd != NAND_CMD_NONE)
+		cs553x_write_byte_pio(mtd, cmd);
+}
+
+
+static int cs553x_device_ready_pio(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+	void __iomem *mmio_base = this->IO_ADDR_R;
+	unsigned char foo = ioread8(mmio_base + IO_NAND_STS);
+
+	return (foo & CS_NAND_STS_FLASH_RDY) && !(foo & CS_NAND_CTLR_BUSY);
+}
+
+
+static void cs_enable_hwecc_pio(struct mtd_info *mtd, int mode)
+{
+	struct nand_chip *this = mtd->priv;
+	void __iomem *mmio_base = this->IO_ADDR_R;
+
+	iowrite8(0x07, mmio_base + IO_NAND_ECC_CTL);
+}
+
+
+static int cs_calculate_ecc_pio(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
+{
+	uint32_t ecc;
+	struct nand_chip *this = mtd->priv;
+	void __iomem *mmio_base = this->IO_ADDR_R;
+
+	ecc = ioread16(mmio_base + IO_NAND_STS);
+
+	ecc_code[1] = ecc >> 8;
+	ecc_code[0] = ecc >> 16;
+	ecc_code[2] = ecc >> 24;
+	return 0;
+}
+
+
+/*
+ * 
+ * functions for MMIO mode
+ * 
+ * 
+ */
+
+
 static void cs553x_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
@@ -187,12 +295,7 @@
 	struct nand_chip *this;
 	struct mtd_info *new_mtd;
 
-	printk(KERN_NOTICE "Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n", cs, mmio?"MM":"P", adr);
-
-	if (mmio) {
-		printk(KERN_NOTICE "PIO mode not yet implemented for CS553X NAND controller\n");
-		return -ENXIO;
-	}
+	printk(KERN_NOTICE "Probing CS553x NAND controller CS%d# at %sIO 0x%08lx\n", cs, mmio?"MM":"P", adr);
 
 	/* Allocate memory for MTD device structure and private data */
 	new_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
@@ -214,27 +317,54 @@
 	new_mtd->owner = THIS_MODULE;
 
 	/* map physical address */
-	this->IO_ADDR_R = this->IO_ADDR_W = ioremap(adr, 4096);
+	if (mmio) {
+		this->IO_ADDR_R = this->IO_ADDR_W = ioremap(adr, 4096);
+		io_base[cs] = 0;
+	} else {
+		io_base[cs] = adr;
+
+		if (!request_region(io_base[cs], IO_REG_CNT, DEVICE_NAME)) {
+			printk(KERN_ERR "%s: requested I/O region %#lx:%#lx is "
+		       "in use\n", DEVICE_NAME, io_base[cs], io_base[cs] + IO_REG_CNT - 1);
+			return -ENODEV;
+		} else {
+			printk(KERN_INFO "I/O region %#lx:%#lx for %s\n", io_base[cs], io_base[cs] + IO_REG_CNT - 1, DEVICE_NAME);
+		}
+
+		this->IO_ADDR_R = this->IO_ADDR_W = ioport_map(io_base[cs], IO_REG_CNT);
+	}
+
 	if (!this->IO_ADDR_R) {
-		printk(KERN_WARNING "ioremap cs553x NAND @0x%08lx failed\n", adr);
+		printk(KERN_WARNING "%s cs553x NAND @0x%08lx failed\n", mmio? "ioremap" : "ioport_map",adr);
 		err = -EIO;
 		goto out_mtd;
 	}
 
-	this->cmd_ctrl = cs553x_hwcontrol;
-	this->dev_ready = cs553x_device_ready;
-	this->read_byte = cs553x_read_byte;
-	this->read_buf = cs553x_read_buf;
-	this->write_buf = cs553x_write_buf;
+	this->ecc.correct  = nand_correct_data;
 
 	this->chip_delay = 0;
 
 	this->ecc.mode = NAND_ECC_HW;
 	this->ecc.size = 256;
 	this->ecc.bytes = 3;
-	this->ecc.hwctl  = cs_enable_hwecc;
-	this->ecc.calculate = cs_calculate_ecc;
-	this->ecc.correct  = nand_correct_data;
+
+	if (mmio) {
+		this->cmd_ctrl = cs553x_hwcontrol;
+		this->dev_ready = cs553x_device_ready;
+		this->read_byte = cs553x_read_byte;
+		this->read_buf = cs553x_read_buf;
+		this->write_buf = cs553x_write_buf;
+		this->ecc.hwctl  = cs_enable_hwecc;
+		this->ecc.calculate = cs_calculate_ecc;
+	} else {
+		this->cmd_ctrl = cs553x_hwcontrol_pio;
+		this->dev_ready = cs553x_device_ready_pio;
+		this->read_byte = cs553x_read_byte_pio;
+		this->read_buf = cs553x_read_buf_pio;
+		this->write_buf = cs553x_write_buf_pio;
+		this->ecc.hwctl  = cs_enable_hwecc_pio;
+		this->ecc.calculate = cs_calculate_ecc_pio;
+	}
 
 	/* Enable the following for a flash based bad block table */
 	this->options = NAND_USE_FLASH_BBT | NAND_NO_AUTOINCR;
@@ -249,9 +379,16 @@
 	goto out;
 
 out_ior:
-	iounmap((void *)this->IO_ADDR_R);
+	if (mmio)
+		iounmap((void *)this->IO_ADDR_R);
+	else {
+		ioport_unmap((void *)this->IO_ADDR_R);
+		release_region(io_base[cs], IO_REG_CNT);
+	}
 out_mtd:
 	kfree(new_mtd);
+	if (!mmio)
+		release_region(io_base[cs], IO_REG_CNT);
 out:
 	return err;
 }
@@ -329,7 +466,7 @@
 		void __iomem *mmio_base;
 
 		if (!mtd)
-			break;
+			continue;
 
 		this = cs553x_mtd[i]->priv;
 		mmio_base = this->IO_ADDR_R;
@@ -339,7 +476,14 @@
 		cs553x_mtd[i] = NULL;
 
 		/* unmap physical adress */
-		iounmap(mmio_base);
+		if (!io_base[i]) {
+			iounmap(mmio_base);
+		} else {
+			ioport_unmap(mmio_base);
+			release_region(io_base[i], IO_REG_CNT);
+		}
+
+		printk(KERN_INFO "CS553x NAND driver: resources released for device at CS%d# \n", i);
 
 		/* Free the MTD device structure */
 		kfree(mtd);
