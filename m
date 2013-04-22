Received: from mail-vb0-x231.google.com ([2607:f8b0:400c:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUOCS-0002IW-07
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 21:23:00 +0000
Received: by mail-vb0-f49.google.com with SMTP id 11so6289957vbf.22
 for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2013 14:22:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366616878-29481-4-git-send-email-b32955@freescale.com>
References: <1366616878-29481-1-git-send-email-b32955@freescale.com>
 <1366616878-29481-4-git-send-email-b32955@freescale.com>
Date: Mon, 22 Apr 2013 14:22:57 -0700
Message-ID: <CAN8TOE_xOBTv7weAqYinFMmTStXgY93KanV-jDAqFnY=CEfkdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mtd: get the ECC info from the Extended Parameter
 Page
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 22, 2013 at 12:47 AM, Huang Shijie <b32955@freescale.com> wrote:
> Since the ONFI 2.1, the onfi spec adds the Extended Parameter Page
> to store the ECC info.
>
> The onfi spec tells us that if the nand chip's recommended ECC codeword
> size is not 512 bytes, then the @ecc_bits is 0xff. The host _SHOULD_ then
> read the Extended ECC information that is part of the extended parameter
> page to retrieve the ECC requirements for this device.
>
> This patch implement the reading of the Extended Parameter Page, and parses
> the sections for ECC type, and get the ECC info from the ECC section.
>
> Tested this patch with Micron MT29F64G08CBABAWP.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |   54 ++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 54 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index beff911..48ff097 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2846,6 +2846,56 @@ static u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
>         return crc;
>  }
>
> +/* Parse the Extended Parameter Page. */
> +static void nand_flash_detect_ext_param_page(struct mtd_info *mtd,
> +               struct nand_chip *chip, struct nand_onfi_params *p, int last)
> +{

I think we want a return code (int) for this function. It obviously
can fail, and the caller needs to know this.

The "last" parameter is not very obvious until you read the whole
function, where you see that this function assumes a lot about the
caller. Please address the comments below and/or fully document the
parameters and calling context for this function.

> +       struct onfi_ext_param_page *ep;
> +       struct onfi_ext_section *s;
> +       struct onfi_ext_ecc_info *ecc;
> +       uint8_t *cursor;
> +       int len;
> +       int i;
> +
> +       len = le16_to_cpu(p->ext_param_page_length) * 16;
> +       ep = kcalloc(1, max_t(int, len, sizeof(*p)), GFP_KERNEL);
> +       if (!ep)
> +               goto ext_out;
> +
> +       /*
> +        * Skip the ONFI Parameter Pages.
> +        * The Change Read Columm command may does not works here.

Why not?

> +        */
> +       for (i = last + 1; i < p->num_of_param_pages; i++)
> +               chip->read_buf(mtd, (uint8_t *)ep, sizeof(*p));

You never sent a command to the chip. How can you expect to read from it?

It seems that you are writing this function with the assumption of a
particular calling context (a context in which the last command was
CMD_PARAM). IMO, it would make a lot more sense that this function
actually send its own CMD_PARAM followed by either X bytes of skipped
read_buf() or a change read column command. Then it doesn't need the
"last" argument, and its usage makes much more sense.

> +
> +       /* Read out the Extended Parameter Page. */
> +       chip->read_buf(mtd, (uint8_t *)ep, len);
> +       if ((onfi_crc16(ONFI_CRC_BASE, ((uint8_t *)ep) + 2, len - 2)
> +               != le16_to_cpu(ep->crc)) || strncmp(ep->sig, "EPPS", 4))
> +               goto ext_out;
> +
> +       /* find the ECC section. */
> +       cursor = (uint8_t *)(ep + 1);
> +       for (i = 0; i < ONFI_EXT_SECTION_MAX; i++) {
> +               s = ep->sections + i;
> +               if (s->type == ONFI_SECTION_TYPE_2)
> +                       break;
> +               cursor += s->length * 16;
> +       }
> +       if (i == ONFI_EXT_SECTION_MAX)
> +               goto ext_out;
> +
> +       /* get the info we want. */
> +       ecc = (struct onfi_ext_ecc_info *)cursor;
> +       chip->ecc_strength = ecc->ecc_bits;
> +       chip->ecc_size = 1 << ecc->codeword_size;
> +
> +       pr_info("ONFI extended param page detected.\n");
> +ext_out:
> +       kfree(ep);
> +}
> +
>  /*
>   * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
>   */
> @@ -2914,6 +2964,10 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>         if (p->ecc_bits != 0xff) {
>                 chip->ecc_strength = p->ecc_bits;
>                 chip->ecc_size = 512;
> +       } else if (chip->onfi_version >= 21 &&
> +               (onfi_feature(chip) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
> +               /* The Extended Parameter Page is supported since ONFI 2.1. */
> +               nand_flash_detect_ext_param_page(mtd, chip, p, i);
>         }
>
>         pr_info("ONFI flash detected\n");
> --
> 1.7.1
>
>
