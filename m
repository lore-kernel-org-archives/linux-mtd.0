Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmYit-00010D-Dy
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 21:02:00 +0000
Message-ID: <4C6EED3B.4000001@broadcom.com>
Date: Fri, 20 Aug 2010 14:01:47 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: Bad assumption about ID field definition for Samsung NAND?
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com> <20100819171558.GA8536@code-monkey.de>
	<AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
	<4C6DAFFD.4040602@broadcom.com>
	<AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
	<20100820134316.GA437@code-monkey.de> <4C6EBE90.2090604@broadcom.com>
	<1282334008.25239.91.camel@localhost>
In-Reply-To: <1282334008.25239.91.camel@localhost>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "r64343@freescale.com" <r64343@freescale.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	Tilman Sauerbeck <tilman@code-monkey.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Can I have a signed-off-by for it?

I don't know what's "legal" here. I'm appending the patch with a
sign-off for me and Tilman (since Tilman authored it). Hopefully that's
ok.

> Brian, I have a distinct impression that there's at least one more patch
> from you that I really ought to be sending to Linus for 2.6.36, but I
> can't find it right now. Other than this and what's already in
> mtd-2.6.git, is there anything else?

I'm really no expert on how inclusion for different versions goes; I
just send 'em to you! Anyway, this patch is *very* important:
	* [PATCH] mtd: nand: Fix regression in BBM detection
	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031594.html
It addresses issues I overlooked with a lot of Hynix small-page NAND
(and others).

Other patches - they are ready, but not as important:
	* Spansion ORNAND
	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031603.html
	* New Samsung MLC OOB sizes
	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031621.html

No one has decided between these two (it's a "choose one or the other"
situation). They may or may not be ready:
	mtd: nand: Expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT
	Cover page: http://lists.infradead.org/pipermail/linux-mtd/2010-August/031591.html
	Choice 1: http://lists.infradead.org/pipermail/linux-mtd/2010-August/031593.html
	Choice 2: http://lists.infradead.org/pipermail/linux-mtd/2010-August/031598.html
	Explanation: http://lists.infradead.org/pipermail/linux-mtd/2010-August/031619.html

And since you asked, the trivial...
	Indentation errors :)
	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031588.html

You already got this one, I believe:
	Fixing a typo in on a buswidth option
	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031518.html

Thanks for looking out for me :)

Brian

----------------------------------------------------------------

Apparently, the check for a 6-byte ID string is NOT sufficient to
determine whether or not a Samsung chip uses their new MLC detection
scheme or the old, standard scheme. This adds a condition to check cell
type.

Signed-off-by: Tilman Sauerbeck <tilman@code-monkey.de>
Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7473..172a299 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2866,6 +2866,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		 */
 		if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
 				id_data[0] == NAND_MFR_SAMSUNG &&
+				(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 				id_data[5] != 0x00) {
 			/* Calc pagesize */
 			mtd->writesize = 2048 << (extid & 0x03);
-- 
1.7.0.4
