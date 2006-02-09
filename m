Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F7G8h-0001Wr-SO
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2006 13:03:35 -0500
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id k19IHZEc009900
	for <linux-mtd@lists.infradead.org>; Thu, 9 Feb 2006 18:17:42 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2006020921032926660
	for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2006 21:03:29 +0300
Message-ID: <43EB83EC.5040701@intel.com>
Date: Thu, 09 Feb 2006 21:03:24 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
References: <43EA16CC.6060401@intel.com>
In-Reply-To: <43EA16CC.6060401@intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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

Please see patch below. I believe there shouldn't be tab issues.

Thanks
Alexey
=======================
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
====================
