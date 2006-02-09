Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F7G07-0001SI-H7
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2006 12:54:41 -0500
Message-ID: <43EB81CF.1000400@intel.com>
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <43EA5056.2070300@ru.mvista.com>
In-Reply-To: <43EA5056.2070300@ru.mvista.com>
Content-Type: multipart/mixed; boundary="------------020600090703000908090405"
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org, jwboyer@gmail.com
Subject: Re: [PATCH] Fixup in NAND bad block management + fix of misspring
 .(nand_base.c)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 09 Feb 2006 17:54:43 -0000

This is a multi-part message in MIME format.
--------------020600090703000908090405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vitaly,

Thanks a lot for feedback.
I agree for most of your comments. I missed some lines when I was 
merging the patch to the latest snapshot. I corrected it. Here is the 
second version at the end of the letter. Your comments are welcome.

You wrote
 >> +    /* If pattern is given we must use offset from badblock_pattern
 >> structure
 >> +       else we should use badblockpos which is filled by default
 >> values */
 >> +    if (this->badblock_pattern)
 >> +        badblockpos=this->badblock_pattern->offs;
 >> +    else
 >> +        badblockpos=this->badblockpos;
 >> +

 > I'm not sure this is right. If badblock_pattern is set, we shouldn't
 > ever be here.

We definetely get here and badblock_pattern is given for the case of ST 
Nand. This patch should fix bad block marking issues found on ST Nand.
Why we shouldn't be here if bad block pattern is given?

Please see patch below. I believe there shouldn't be tab issues. For 
just a case I attached diff file to the letter.

Thanks
Alexey
=======================
diff -aur b/drivers/mtd/nand/nand_base.c c/drivers/mtd/nand/nand_base.c
--- b/drivers/mtd/nand/nand_base.c    2006-02-09 20:05:28.447558688 +0300
+++ c/drivers/mtd/nand/nand_base.c    2006-02-09 20:14:58.182945744 +0300
@@ -409,7 +409,7 @@
  */
 static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 {
-    int page, chipnr, res = 0;
+    int page, badblockpos, chipnr, res = 0;
     struct nand_chip *this = mtd->priv;
     u16 bad;
 
@@ -425,15 +425,22 @@
     } else
         page = (int) ofs;
 
+    /* If pattern is given use offset from badblock_pattern structure
+       else use badblockpos which take default values */
+    if (this->badblock_pattern)
+        badblockpos=this->badblock_pattern->offs;
+    else
+        badblockpos=this->badblockpos;
+
     if (this->options & NAND_BUSWIDTH_16) {
-        this->cmdfunc (mtd, NAND_CMD_READOOB, this->badblockpos & 0xFE, 
page & this->pagemask);
+        this->cmdfunc (mtd, NAND_CMD_READOOB, badblockpos & 0xFE, page 
& this->pagemask);
         bad = cpu_to_le16(this->read_word(mtd));
         if (this->badblockpos & 0x1)
             bad >>= 8;
         if ((bad & 0xFF) != 0xff)
             res = 1;
     } else {
-        this->cmdfunc (mtd, NAND_CMD_READOOB, this->badblockpos, page & 
this->pagemask);
+        this->cmdfunc (mtd, NAND_CMD_READOOB, badblockpos, page & 
this->pagemask);
         if (this->read_byte(mtd) != 0xff)
             res = 1;
     }
@@ -470,8 +477,11 @@
     if (this->options & NAND_USE_FLASH_BBT)
         return nand_update_bbt (mtd, ofs);
 
-    /* We write two bytes, so we dont have to mess with 16 bit access */
-    ofs += mtd->oobsize + (this->badblockpos & ~0x01);
+    if (this->badblock_pattern)
+        ofs += (this->badblock_pattern->offs & ~0x01);
+    else
+        ofs += (this->badblockpos & ~0x01);
+
     return nand_write_oob (mtd, ofs , 2, &retlen, buf);
 }
 
@@ -1700,7 +1710,7 @@
             len += num;
             fsbuf += num;
         }
-        ofs += mtd->oobavail;
+        ofs += mtd->oobsize;
     }
     return this->oob_buf;
 }
=======================

--------------020600090703000908090405
Content-Type: text/plain;
 name="badblock_pattern.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="badblock_pattern.diff"

diff -aur b/drivers/mtd/nand/nand_base.c c/drivers/mtd/nand/nand_base.c
--- b/drivers/mtd/nand/nand_base.c	2006-02-09 20:05:28.447558688 +0300
+++ c/drivers/mtd/nand/nand_base.c	2006-02-09 20:14:58.182945744 +0300
@@ -409,7 +409,7 @@
  */
 static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 {
-	int page, chipnr, res = 0;
+	int page, badblockpos, chipnr, res = 0;
 	struct nand_chip *this = mtd->priv;
 	u16 bad;
 
@@ -425,15 +425,22 @@
 	} else
 		page = (int) ofs;
 
+	/* If pattern is given use offset from badblock_pattern structure
+	   else use badblockpos which take default values */
+	if (this->badblock_pattern)
+		badblockpos=this->badblock_pattern->offs;
+	else
+		badblockpos=this->badblockpos;
+
 	if (this->options & NAND_BUSWIDTH_16) {
-		this->cmdfunc (mtd, NAND_CMD_READOOB, this->badblockpos & 0xFE, page & this->pagemask);
+		this->cmdfunc (mtd, NAND_CMD_READOOB, badblockpos & 0xFE, page & this->pagemask);
 		bad = cpu_to_le16(this->read_word(mtd));
 		if (this->badblockpos & 0x1)
 			bad >>= 8;
 		if ((bad & 0xFF) != 0xff)
 			res = 1;
 	} else {
-		this->cmdfunc (mtd, NAND_CMD_READOOB, this->badblockpos, page & this->pagemask);
+		this->cmdfunc (mtd, NAND_CMD_READOOB, badblockpos, page & this->pagemask);
 		if (this->read_byte(mtd) != 0xff)
 			res = 1;
 	}
@@ -470,8 +477,11 @@
 	if (this->options & NAND_USE_FLASH_BBT)
 		return nand_update_bbt (mtd, ofs);
 
-	/* We write two bytes, so we dont have to mess with 16 bit access */
-	ofs += mtd->oobsize + (this->badblockpos & ~0x01);
+	if (this->badblock_pattern)
+		ofs += (this->badblock_pattern->offs & ~0x01);
+	else
+		ofs += (this->badblockpos & ~0x01);
+
 	return nand_write_oob (mtd, ofs , 2, &retlen, buf);
 }
 
@@ -1700,7 +1710,7 @@
 			len += num;
 			fsbuf += num;
 		}
-		ofs += mtd->oobavail;
+		ofs += mtd->oobsize;
 	}
 	return this->oob_buf;
 }

--------------020600090703000908090405--
