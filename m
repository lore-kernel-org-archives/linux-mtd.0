Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CkksF-0000DM-60
	for linux-mtd@lists.infradead.org; Sat, 01 Jan 2005 10:09:01 -0500
Message-ID: <41D6BCF7.4090809@setabox.com>
Date: Sat, 01 Jan 2005 23:08:39 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41C1896F.9000107@setabox.com>	
	<1103530184.27708.102.camel@tglx.tec.linutronix.de>	
	<41C7F8C7.8050607@setabox.com>	
	<1103642836.27708.234.camel@tglx.tec.linutronix.de>	
	<41D4D228.7060903@setabox.com>	
	<1104484693.4258.14.camel@tglx.tec.linutronix.de>	
	<41D6806C.8030409@setabox.com>
	<1104577162.4258.23.camel@tglx.tec.linutronix.de>
In-Reply-To: <1104577162.4258.23.camel@tglx.tec.linutronix.de>
Content-Type: multipart/mixed; boundary="------------010208040508040400010105"
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] command function for nand flash through IDE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010208040508040400010105
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thomas Gleixner wrote:

>On Sat, 2005-01-01 at 18:50 +0800, William J Beksi wrote:
>
>  
>
>>>I still have a question. Did you modify nand_base.c ? 
>>>
>>>      
>>>
>>No, I only add a compile time switch as you recommended because I want 
>>to use outb/inb.
>>    
>>
>
>Can you please provide a patch for this too ?
>  
>
Hi Thomas,
This patch allows you to select the i/o instruction you want to use 
(writeb/readb or outb/inb) at compile time.

-- 
William

--------------010208040508040400010105
Content-Type: text/x-patch;
 name="nand_base.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nand_base.c.patch"

--- /opt/mtd/drivers/mtd/nand/nand_base.c	2004-12-14 07:00:18.000000000 +0800
+++ nand_base.c	2005-01-01 21:58:19.000000000 +0800
@@ -66,6 +66,8 @@
 #include <linux/mtd/partitions.h>
 #endif
 
+#define NAND_USE_IO_INSTR	1
+
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_oobinfo nand_oob_8 = {
 	.useecc = MTD_NANDECC_AUTOPLACE,
@@ -171,7 +173,13 @@
 static u_char nand_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	return readb(this->IO_ADDR_R);
+
+	switch(NAND_USE_IO_INSTR) {
+	case 0:
+		return readb(this->IO_ADDR_R);
+	case 1:
+		return inb((unsigned int) this->IO_ADDR_R);
+	}
 }
 
 /**
@@ -184,7 +192,15 @@
 static void nand_write_byte(struct mtd_info *mtd, u_char byte)
 {
 	struct nand_chip *this = mtd->priv;
-	writeb(byte, this->IO_ADDR_W);
+
+	switch(NAND_USE_IO_INSTR) {
+	case 0:
+		writeb(byte, this->IO_ADDR_W);
+		break;
+	case 1:
+		outb(byte, (unsigned int) this->IO_ADDR_W);
+		break;
+	}
 }
 
 /**
@@ -277,8 +293,16 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		writeb(buf[i], this->IO_ADDR_W);
+	switch(NAND_USE_IO_INSTR) {
+	case 0:
+		for (i=0; i<len; i++)
+			writeb(buf[i], this->IO_ADDR_W);
+		break;
+	case 1:
+		for (i=0; i<len; i++)
+			outb(buf[i], (unsigned int) this->IO_ADDR_W);
+		break;
+	}
 }
 
 /**
@@ -294,8 +318,16 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		buf[i] = readb(this->IO_ADDR_R);
+	switch(NAND_USE_IO_INSTR) {
+	case 0:
+		for (i=0; i<len; i++)
+			buf[i] = readb(this->IO_ADDR_R);
+		break;
+	case 1:
+		for (i=0; i<len; i++)
+			buf[i] = inb((unsigned int) this->IO_ADDR_R);
+		break;
+	}
 }
 
 /**
@@ -311,10 +343,18 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		if (buf[i] != readb(this->IO_ADDR_R))
-			return -EFAULT;
-
+	switch(NAND_USE_IO_INSTR) {
+	case 0:
+		for (i=0; i<len; i++)
+			if (buf[i] != readb(this->IO_ADDR_R))
+				return -EFAULT;
+		break;
+	case 1:
+		for (i=0; i<len; i++)
+			if (buf[i] != inb((unsigned int) this->IO_ADDR_R))
+				return -EFAULT;
+		break;
+	}
 	return 0;
 }
 

--------------010208040508040400010105--
