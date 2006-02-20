Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FB8fz-0005Wi-U1
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 05:54:04 -0500
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id k1KB8CL5021914
	for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2006 11:08:21 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2006022013535303654
	for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2006 13:53:53 +0300
Message-ID: <43F99FBA.8060704@intel.com>
Date: Mon, 20 Feb 2006 13:53:46 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <43EC3824.2040805@ru.mvista.com>
In-Reply-To: <43EC3824.2040805@ru.mvista.com>
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

Vitaly Wool wrote:

> Hi Alexey,
>
> > You wrote
> > >> +    /* If pattern is given we must use offset from badblock_pattern
> > >> structure
> > >> +       else we should use badblockpos which is filled by default
> > >> values */
> > >> +    if (this->badblock_pattern)
> > >> +        badblockpos=this->badblock_pattern->offs;
> > >> +    else
> > >> +        badblockpos=this->badblockpos;
> > >> +
> >
> > > I'm not sure this is right. If badblock_pattern is set, we shouldn't
> > > ever be here.
> >
> > We definetely get here and badblock_pattern is given for the case of
> > ST Nand. This patch should fix bad block marking issues found on ST
> > Nand. Why we shouldn't be here if bad block pattern is given?
> >
> Because if bad block pattern is used, we should use bad block table.
> This is how I see it, though I can be wrong.
>
Please take a look at page 29 (we use x16 device) Here is specification
of NAND device.
http://www.st.com/stonline/products/literature/ds/10058/nand512r3a.pdf

According to this specification :
Size of oobblock is 512b and  bad block position should be 0.

According to the nand_base.c code
There are only two cases for bad block positions:
a) If oobblock size is greater than 512b this case bad block position
offset should be 0
b) If oobblock size is lower or equal than 512b this case offset
pointing to the bad block should be 5

It contradicts to the specification.

To avoid contradictions I added bad block pattern to the low level
driver for ST NAND device.
Then I faced issue: nand_block_bad and block_markbad doesn't parse case
when bad block pattern is given. So I added parsing too.

I want to use memory based BBT (not flash based).
I wonder if there any way to have correct Bad block management and
memory based BBT for NAND with non default bad block positions.
The problem in the current implementation that it's impossible to save
information about bad block marking if you are going to use memory based
BBT and you have NAND without default bad block positioning.

Please take a look at the bad block marking code:
If NAND_USE_FLASH_BBT option is not given we have to write BB data at
the mtd->oobsize + (this->badblockpos & ~0x01) offset.
For some NAND devices this is incorrect.

static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
{
    struct nand_chip *this = mtd->priv;
    u_char buf[2] = {0, 0};
    size_t    retlen;
    int block;

    /* Get block number */
    block = ((int) ofs) >> this->bbt_erase_shift;
    if (this->bbt)
        this->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);

    /* Do we have a flash based bad block table ? */
    if (this->options & NAND_USE_FLASH_BBT)
        return nand_update_bbt (mtd, ofs);

    /* We write two bytes, so we dont have to mess with 16 bit access */
    ofs += mtd->oobsize + (this->badblockpos & ~0x01);
    return nand_write_oob (mtd, ofs , 2, &retlen, buf);
}

The patch I sent modifies offset according to the bad block pattern
information.

======================================================

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
