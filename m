Received: from code-monkey.de ([88.198.45.137])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Om8is-0007vF-0P
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2010 17:16:15 +0000
Date: Thu, 19 Aug 2010 19:16:11 +0200
From: Tilman Sauerbeck <tilman@code-monkey.de>
To: Brian Norris <norris@broadcom.com>
Subject: Re: Bad assumption about ID field definition for Samsung NAND?
Message-ID: <20100819171558.GA8536@code-monkey.de>
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C6C6BFC.9020408@broadcom.com>
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris [2010-08-18 16:25]:

Hi,

> I have similar problems on similar chips, however, I cannot
> determine that for sure; can you print out the full ID string (8
> bytes) from nand_base?

ID: ec dc 10 95 54 ec ec dc

> This may be an issue with an unfortunate wraparound of the ID where
> it *should* give a 5-byte string, then wraparound to give the same
> ID again, but instead it gives a 6-byte string, then wraps around
> again. This would incorrectly classify this ID string under the

I think I might have found the real problem.
Kevin's commit message says:

>   This patch uses the new 6-byte scheme if the following conditions are
>   all true:
>   [...]
>   3) 6th byte is zero

... but what the code does is use new scheme if id_data[5] is _not_
zero.

The following diff works for me, but I cannot test with any other flash
chip but the K9F4G08U0B:

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4a7b864..abc71cd 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2847,12 +2847,12 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
                 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
                 * New style   (6 byte ID): Samsung K9GAG08U0D (p.40)
                 *
-                * Check for wraparound + Samsung ID + nonzero 6th byte
+                * Check for wraparound + Samsung ID + zero 6th byte
                 * to decide what to do.
                 */
                if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
                                id_data[0] == NAND_MFR_SAMSUNG &&
-                               id_data[5] != 0x00) {
+                               id_data[5] == 0x00) {
                        /* Calc pagesize */
                        mtd->writesize = 2048 << (extid & 0x03);
                        extid >>= 2;

Thanks,
Tilman

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?
