Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F6rph-00069u-Jc
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2006 11:06:20 -0500
Message-ID: <43EA16CC.6060401@intel.com>
Date: Wed, 08 Feb 2006 19:05:32 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: tglx@linutronix.de, jwboyer@gmail.com
References: <43D10544.10408@intel.com>
In-Reply-To: <43D10544.10408@intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
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

Thomas,

Couple of week ago, I sent this patch to list serever.
There weren't any feedback on this code. I don't know acceptable it or not.
I would be very much appreciate if you review this patch.

Here is some notes to the patch:
At present time we have some issues with bad block management on ST NAND 
devices on Linux.
It is impossible to mark Bad block. The reason of  it  code doesn't work 
properly if bad block pattern is given.
I made small fix  in nand_block_bad function to cover the case of
devices with non-default bad block pattern.

Also there is a missprint in nand_prepare_oobbuf() function :

-        ofs += mtd->oobavail;
+        ofs += mtd->oobsize;
which could affect if somebody tries to write several pages with oob
data via nand_write_ecc call.

Please see the patch bellow:

Thanks,
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

===================================================
