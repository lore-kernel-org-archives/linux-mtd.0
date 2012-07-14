Received: from mail-qa0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SprgL-0006CB-GY
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2012 02:02:10 +0000
Received: by qabj40 with SMTP id j40so656531qab.15
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 19:02:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
References: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
Date: Fri, 13 Jul 2012 22:02:00 -0400
Message-ID: <CAMiH66HEw2SrTOp4zCxLapFMj7AH5dh4sZGMdtb6SSMc0e1FcA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from
 driver
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 13, 2012 at 12:28 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs. It
> silently masks off at least one flag that might be set by the driver
> (NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and possibly
> others.
>
> Really, as long as driver writers exercise a small amount of care with
> NAND_* options, this mask is not necessary at all; it was only here to
> prevent certain options from accidentally being set by the driver. But the
> original thought turns out to be a bad idea occasionally. Thus, kill it.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Huang Shijie <shijie8@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
> Huang, please test this with your driver.
>
I tested this patch on imx6q-arm2 board with Micron MT29F32G08QAA.
it works fine, thanks.

Tested-by: Huang Shijie <shijie8@gmail.com>


> Artem,
>
> If this is acceptable, should it go to -stable, since it fixes some major
> gpmi-nand breakage? It probably won't apply directly, since I've touched some
> code around it recently.
>
>  drivers/mtd/nand/nand_base.c | 7 ++-----
>  include/linux/mtd/nand.h     | 3 ---
>  2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 98ba46e..6652d1f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2909,8 +2909,6 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>         if (le16_to_cpu(p->features) & 1)
>                 *busw = NAND_BUSWIDTH_16;
>
> -       chip->options &= ~NAND_CHIPOPTIONS_MSK;
> -
>         pr_info("ONFI flash detected\n");
>         return 1;
>  }
> @@ -3074,9 +3072,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>                         mtd->erasesize <<= ((id_data[3] & 0x03) << 1);
>                 }
>         }
> -       /* Get chip options, preserve non chip based options */
> -       chip->options &= ~NAND_CHIPOPTIONS_MSK;
> -       chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
> +       /* Get chip options */
> +       chip->options |= type->options;
>
>         /*
>          * Check if chip is not a Samsung device. Do not clear the
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 6dce5a7..eeb7015 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -206,9 +206,6 @@ typedef enum {
>  #define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT) \
>                                         && (chip->page_shift > 9))
>
> -/* Mask to zero out the chip options, which come from the id table */
> -#define NAND_CHIPOPTIONS_MSK   0x0000ffff
> -
>  /* Non chip related options */
>  /* This option skips the bbt scan during initialization. */
>  #define NAND_SKIP_BBTSCAN      0x00010000
> --
> 1.7.11.1
>
