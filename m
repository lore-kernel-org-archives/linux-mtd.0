Received: from setabox.com.tw ([220.135.128.161] helo=mail.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGzom-0004fE-FF
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 08:34:42 -0500
Message-ID: <424BFC76.8020101@setabox.com>
Date: Thu, 31 Mar 2005 21:34:46 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/mixed; boundary="------------050304010409040703010706"
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]  NAND I/O instruction support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050304010409040703010706
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

This patch is to implement reading and writing nand flash by I/O 
instructions. I have only been able to test on the x86 architecture.

Questions, comments, criticisms are welcome.

-- 
William J Beksi                          <wjbeksi@users.sourceforge.net>
GPG Key Fingerprint = ED4B 32C3 69E6 C2B7 705C  263F CB2F 3253 E7E1 DB3B

--------------050304010409040703010706
Content-Type: text/x-patch;
 name="nand_io_instr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nand_io_instr.patch"

Index: drivers/mtd/nand/Kconfig
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/Kconfig,v
retrieving revision 1.26
diff -u -r1.26 Kconfig
--- drivers/mtd/nand/Kconfig	5 Jan 2005 12:42:24 -0000	1.26
+++ drivers/mtd/nand/Kconfig	31 Mar 2005 13:17:18 -0000
@@ -203,5 +203,20 @@
 	help
 	  The simulator may simulate verious NAND flash chips for the
 	  MTD nand layer.
+
+config MTD_NAND_USE_IO_INSTR
+       bool "Support for NAND Flash through the I/0 ports"
+       depends on MTD_NAND && MTD_PARTITIONS
+       help
+         Enables the driver for accessing NAND Flash through the I/O
+         ports. This can allow NAND Flash to be accessed from the IDE interface 
+         of a PC. If you say Y, you will be asked to select your architecture 
+         below. 
+
+config MTD_NAND_X86_IO_INSTR
+	bool "Support for x86 architecture I/O instructions"
+	depends on MTD_NAND_USE_IO_INSTR
+        help
+         Port numbers are of type unsigned int.
  
 endmenu
Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.137
diff -u -r1.137 nand_base.c
--- drivers/mtd/nand/nand_base.c	24 Mar 2005 14:33:22 -0000	1.137
+++ drivers/mtd/nand/nand_base.c	31 Mar 2005 13:17:26 -0000
@@ -84,6 +84,16 @@
 #include <linux/mtd/partitions.h>
 #endif
 
+#ifdef CONFIG_MTD_NAND_USE_IO_INSTR
+static int nand_use_io_instr = 1;
+#else
+static int nand_use_io_instr = 0;
+#endif
+
+#ifdef CONFIG_MTD_NAND_X86_IO_INSTR
+static int nand_x86_io_instr = 1;
+#endif
+
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_oobinfo nand_oob_8 = {
 	.useecc = MTD_NANDECC_AUTOPLACE,
@@ -189,7 +199,14 @@
 static u_char nand_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	return readb(this->IO_ADDR_R);
+
+	switch(nand_use_io_instr) {
+		case 0:
+			return readb(this->IO_ADDR_R);
+		case 1:
+			if (nand_x86_io_instr)
+				return inb((unsigned int) this->IO_ADDR_R);
+	}
 }
 
 /**
@@ -202,7 +219,16 @@
 static void nand_write_byte(struct mtd_info *mtd, u_char byte)
 {
 	struct nand_chip *this = mtd->priv;
-	writeb(byte, this->IO_ADDR_W);
+
+	switch(nand_use_io_instr) {
+		case 0:
+			writeb(byte, this->IO_ADDR_W);
+			break;
+		case 1:
+			if (nand_x86_io_instr)
+				outb(byte, (unsigned int) this->IO_ADDR_W);
+			break;
+	}
 }
 
 /**
@@ -295,8 +321,17 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		writeb(buf[i], this->IO_ADDR_W);
+	switch(nand_use_io_instr) {
+		case 0:
+			for (i=0; i<len; i++)
+				writeb(buf[i], this->IO_ADDR_W);
+			break;
+		case 1:
+			for (i=0; i<len; i++)
+				if (nand_x86_io_instr)
+					outb(buf[i], (unsigned int) this->IO_ADDR_W);
+			break;
+	}
 }
 
 /**
@@ -312,8 +347,17 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		buf[i] = readb(this->IO_ADDR_R);
+	switch(nand_use_io_instr) {
+		case 0:
+			for (i=0; i<len; i++)
+				buf[i] = readb(this->IO_ADDR_R);
+			break;
+		case 1:
+			for (i=0; i<len; i++)
+				if (nand_x86_io_instr)
+					buf[i] = inb((unsigned int) this->IO_ADDR_R);
+			break;
+	}
 }
 
 /**
@@ -329,10 +373,19 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		if (buf[i] != readb(this->IO_ADDR_R))
-			return -EFAULT;
-
+	switch(nand_use_io_instr) {
+		case 0:
+			for (i=0; i<len; i++)
+				if (buf[i] != readb(this->IO_ADDR_R))
+					return -EFAULT;
+			break;
+		case 1:
+			for (i=0; i<len; i++)
+				if (nand_x86_io_instr) 
+					if (buf[i] != inb((unsigned int) this->IO_ADDR_R))
+						return -EFAULT;
+			break;
+	}
 	return 0;
 }
 

--------------050304010409040703010706--
