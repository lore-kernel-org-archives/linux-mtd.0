Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EzyQz-0006SH-Ua
	for linux-mtd@lists.infradead.org; Fri, 20 Jan 2006 10:44:31 -0500
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id k0KFvrRw008107
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2006 15:57:59 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2006012018440932379
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2006 18:44:09 +0300
Message-ID: <43D10544.10408@intel.com>
Date: Fri, 20 Jan 2006 18:44:04 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [PATCH] Fixup in NAND bad block management + fix of misspring .
	(nand_base.c)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I faced some issues with bad block marking on some NAND devices which 
have non-default bad block pattern.
For the such devices I was unable to mark Bad blocks.
I made small changes in nand_block_bad function to cover the case of 
devices with non-default bad block pattern.

Also I found a missprint in nand_prepare_oobbuf() function :
-        ofs += mtd->oobavail;
+        ofs += mtd->oobsize;
which could affect if somebody tries to write several pages with oob 
data via nand_write_ecc call.

Please see the patch bellow:
If nobody complains, I would be very much appreciate if somebody put 
this patch into MTD
repository.

Thanks a lot,
Alexey


==================================
--- a/drivers/mtd/nand/nand_base.c    2006-01-20 18:13:49.657859296 +0300
+++ b/drivers/mtd/nand/nand_base.c    2006-01-20 18:38:50.281729792 +0300
@@ -410,6 +410,7 @@
 static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 {
     int page, chipnr, res = 0;
+    int badblockpos;
     struct nand_chip *this = mtd->priv;
     u16 bad;
 
@@ -425,15 +426,22 @@
     } else
         page = (int) ofs;
 
+    /* If pattern is given we must use offset from badblock_pattern 
structure
+       else we should use badblockpos which is filled by default values */
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
-            bad >>= 8;
+            bad >>= 1;
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
@@ -470,8 +478,11 @@
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
 
@@ -1700,7 +1711,7 @@
             len += num;
             fsbuf += num;
         }
-        ofs += mtd->oobavail;
+        ofs += mtd->oobsize;
     }
     return this->oob_buf;
 }
