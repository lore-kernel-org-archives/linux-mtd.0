Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6vpN-0002Nr-AQ
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2016 08:44:22 +0000
Received: by mail-wm0-x244.google.com with SMTP id a20so8680630wme.2
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2016 00:44:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1476628518-20450-7-git-send-email-boris.brezillon@free-electrons.com>
References: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
 <1476628518-20450-7-git-send-email-boris.brezillon@free-electrons.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Wed, 16 Nov 2016 16:43:58 +0800
Message-ID: <CAAyFORKEcxUuC61_6ngke5Qmb9U4VaS-fHx6Ly0Mgw1VwzxLEw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] mtd: nand: raw: make BBT code more generic
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

I found a bug during my review. Please see below.

On Sun, Oct 16, 2016 at 10:35 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> BBT support is currently tightly tied to raw NAND, though this is the kind
> of code we could share across all NAND based devices, no matter what
> physical interface is to communicate with the NAND chip.
>
> Make BBT code interface agnostic by replacing all occurrence of
> struct nand_chip by struct nand_device, and move functions that are
> specific to raw NANDs to drivers/mtd/nand/rawnand/nand_base.c.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c |  78 ++++-
>  drivers/mtd/nand/raw/nand_bbt.c  | 609 ++++++++++++++++++---------------------
>  include/linux/mtd/nand.h         |   8 +
>  include/linux/mtd/rawnand.h      |   4 -
>  4 files changed, 361 insertions(+), 338 deletions(-)
>
[...]
>  /**
>   * write_bbt - [GENERIC] (Re)write the bad block table
> - * @mtd: MTD device structure
> + * @this: NAND device
>   * @buf: temporary buffer
>   * @td: descriptor for the bad block table
>   * @md: descriptor for the bad block table mirror
> @@ -708,11 +707,11 @@ static void mark_bbt_block_bad(struct nand_chip *this,
>   *
>   * (Re)write the bad block table.
>   */
> -static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
> +static int write_bbt(struct nand_device *this, uint8_t *buf,
>                      struct nand_bbt_descr *td, struct nand_bbt_descr *md,
>                      int chipsel)
>  {
> -       struct nand_chip *this = mtd_to_nandc(mtd);
> +       struct mtd_info *mtd = nand_to_mtd(this);
>         struct erase_info einfo;
>         int i, res, chip = 0;
>         int bits, page, offs, numblocks, sft, sftmsk;
> @@ -723,7 +722,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>         loff_t to;
>         struct mtd_oob_ops ops;
>
> -       ops.ooblen = mtd->oobsize;
> +       ops.ooblen = nand_per_page_oobsize(this);
>         ops.ooboffs = 0;
>         ops.datbuf = NULL;
>         ops.mode = MTD_OPS_PLACE_OOB;
> @@ -732,16 +731,16 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>                 rcode = 0xff;
>         /* Write bad block table per chip rather than per device? */
>         if (td->options & NAND_BBT_PERCHIP) {
> -               numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
> +               numblocks = nand_eraseblocks_per_die(this);
>                 /* Full device write or specific chip? */
>                 if (chipsel == -1) {
> -                       nrchips = this->numchips;
> +                       nrchips = nand_ndies(this);
>                 } else {
>                         nrchips = chipsel + 1;
>                         chip = chipsel;
>                 }
>         } else {
> -               numblocks = (int)(mtd->size >> this->bbt_erase_shift);
> +               numblocks = nand_neraseblocks(this);
>                 nrchips = 1;
>         }
>
> @@ -760,7 +759,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>                  * get_bbt_block() returns a block number, shift the value to
>                  * get a page number.
>                  */
> -               page = block << (this->bbt_erase_shift - this->page_shift);
> +               nand_eraseblock_to_page(this, block);

Should be page = nand_eraseblock_to_page(this, block);

I will continue to review and test your patch. Hope give you feedback this week.

Thanks,
Peter Pan
