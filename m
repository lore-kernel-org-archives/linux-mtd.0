Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkWlZ-0006ja-80
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 08:41:26 +0000
Message-ID: <4FED6A2E.9010603@parrot.com>
Date: Fri, 29 Jun 2012 10:41:18 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
 <20120628213146.7d929204@halley>
In-Reply-To: <20120628213146.7d929204@halley>
Content-Type: multipart/mixed; boundary="------------010801030206020106080402"
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------010801030206020106080402
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

Hi,

Shmulik Ladkani a écrit :
> Hi Matthieu,
> 
> On Thu, 28 Jun 2012 17:47:22 +0200 Matthieu CASTET <matthieu.castet@parrot.com> wrote:
>>  	for (i = startblock; i < numblocks;) {
>>  		int ret;
>>  
>>  		BUG_ON(bd->options & NAND_BBT_NO_OOB);
>>  
>> -		if (bd->options & NAND_BBT_SCANALLPAGES)
>> -			ret = scan_block_full(mtd, bd, from, buf, readlen,
>> -					      scanlen, len);
>> -		else
>> -			ret = scan_block_fast(mtd, bd, from, buf, len);
>> -
>> +		ret = this->block_bad(mtd, from, 1);
>>  		if (ret < 0)
>>  			return ret;
>>  
> 
> Hmm, seems elegant, nand_bbt is not supposed to be elegant, what are we
> missing here? ;-))
> 
> - I think nand_chip ops are not supposed to be called directly from
>   outside nand driver (nand_base et al); instead the mtd interfaces
>   should be used.
>   OTOH, one might consider nand_bbt to be part of nand_base driver...
Yes but the current driver already used privare nand_base stuff like
"this->bbt_options". There is duplicate stuff like NAND_BBT_SCAN2NDPAGE that are
in this->bbt_options and bd->options
We can't call mtd interface, because it will calling nand_isbad_bbt and not
chip->block_bad. [1]

> 
> - The new scheme lacks the potential error correction offered by the
>   mtd_read_oob call (invoked from the original scan functions).
>   OTOH, currently, AFAIK, it is only offered by an out-of-tree driver.
Could you explain more here ?
The current scheme doesn't handle bitflip in bad block. We don't care about
error correction : bad block are not protected by ecc !

With the new scheme, we can be robust to bad block corruption : all we need to
do is "chip->badblockbits = 4;"

> 
> - The original scheme allows validating against an arbitrary
>   nand_bbt_descr, whereas 'block_bad' reads the 'badblockpos' byte.
>   Don't know if this is a real issue (need to look at the descriptors
>   used); and probably, 'block_bad' can be augmented to use a given
>   descriptor.
I will be interrested to know why we need to support that.
Are there flash where bad block are not in a fixed position ?

> 
> - To preserve all functionality, we need to augment 'block_bad'
>   implementors to support NAND_BBT_SCANALLPAGES (e.g. nand_block_bad
>   lacks this).
We already support NAND_BBT_SCANLASTPAGE, NAND_BBT_SCAN2NDPAGE.
NAND_BBT_SCANALLPAGES can be added. See the attached patch.


Matthieu


[1]
static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
                   int allowbbt)
{
    struct nand_chip *chip = mtd->priv;

    if (!chip->bbt)
        return chip->block_bad(mtd, ofs, getchip);

    /* Return info from the table */
    return nand_isbad_bbt(mtd, ofs, allowbbt);
}

--------------010801030206020106080402
Content-Type: text/x-diff;
	name="0001-add-NAND_BBT_SCANALLPAGES-support-to-block_bad.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="0001-add-NAND_BBT_SCANALLPAGES-support-to-block_bad.patch"

>From 03acf40c6bcb5231795d2bd5cf6838cfeaaf1c56 Mon Sep 17 00:00:00 2001
From: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Fri, 29 Jun 2012 10:36:32 +0200
Subject: [PATCH] add NAND_BBT_SCANALLPAGES support to block_bad

---
 drivers/mtd/nand/nand_base.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a11253a..5ed0a9b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -335,6 +335,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 	int page, chipnr, res = 0, i = 0;
 	struct nand_chip *chip = mtd->priv;
 	u16 bad;
+	int max;
 
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
@@ -350,6 +351,13 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 		chip->select_chip(mtd, chipnr);
 	}
 
+	if (chip->bbt_options & NAND_BBT_SCAN2NDPAGE)
+		max = 2;
+	else if (chip->bbt_options & NAND_BBT_SCANALLPAGES)
+		max = 1 << (chip->bbt_erase_shift - chip->page_shift);
+	else
+		max = 1;
+
 	do {
 		if (chip->options & NAND_BUSWIDTH_16) {
 			chip->cmdfunc(mtd, NAND_CMD_READOOB,
@@ -372,7 +380,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 		ofs += mtd->writesize;
 		page = (int)(ofs >> chip->page_shift) & chip->pagemask;
 		i++;
-	} while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
+	} while (!res && i < max);
 
 	if (getchip)
 		nand_release_device(mtd);
-- 
1.7.10.4


--------------010801030206020106080402--
