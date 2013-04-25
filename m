Received: from mail-vb0-x22e.google.com ([2607:f8b0:400c:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVG80-0001uM-0B
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2013 06:58:01 +0000
Received: by mail-vb0-f46.google.com with SMTP id 11so2356729vbe.5
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 23:57:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366707297-31309-7-git-send-email-b32955@freescale.com>
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>
 <1366707297-31309-7-git-send-email-b32955@freescale.com>
Date: Wed, 24 Apr 2013 23:57:57 -0700
Message-ID: <CAN8TOE_5CeJfGpgJtKBXmb5ai3w9dZ8juk5GdQhRTZQ7MPKbZw@mail.gmail.com>
Subject: Re: [PATCH V3 6/9] mtd: add a new field for ecc info in the
 nand_flash_dev{}
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

Last nitpicks for v3 :)

On Tue, Apr 23, 2013 at 1:54 AM, Huang Shijie <b32955@freescale.com> wrote:
> Add the @ecc_info in the nand_flash_dev{}.
> The lower 16 bits are used to store the ECC bits, while the upper 16 bits
> are used to store the ECC data chunk size.

A bit late on this one, but is there a good reason this wasn't just 2
separate 16-bit fields? We already have a few, and I don't see why
this couldn't be the same.

> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  include/linux/mtd/nand.h |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 063e517..f4c7777 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -624,6 +624,10 @@ struct nand_chip {
>         { .name = (nm), {{ .dev_id = (devid) }}, .chipsize = (chipsz), \
>           .options = (opts) }
>
> +#define NAND_ECC_INFO(strength, size)  (((strength) << 16) | (size))

We could redefine this:

#define NAND_ECC_INFO(strength, size) .ecc_strength = (strength),
.ecc_size = (size)

> +#define NAND_ECC_STRENGTH(x)           (((x) >> 16) & 0xffff)
> +#define NAND_ECC_SIZE(x)               ((x) & 0xffff)

Then we could just drop these unpacking macros.

>  /**
>   * struct nand_flash_dev - NAND Flash Device ID Structure
>   * @name: a human-readable name of the NAND chip
> @@ -641,6 +645,11 @@ struct nand_chip {
>   * @options: stores various chip bit options
>   * @id_len: The valid length of the @id.
>   * @oobsize: OOB size
> + * @ecc_info: The ECC information.
> + *            lower 16 bits: store the ECC bits.
> + *            upper 16 bits: store the ECC data chunk size.
> + *            For example, the "4bit ECC for each 512Byte" can be set with
> + *            NAND_ECC_INFO(4, 512) macro.
>   */
>  struct nand_flash_dev {
>         char *name;
> @@ -657,6 +666,7 @@ struct nand_flash_dev {
>         unsigned int options;
>         uint16_t id_len;
>         uint16_t oobsize;
> +       uint32_t ecc_info;

This could be split to:

uint16_t ecc_strength;
uint16_t ecc_size;

>  };
>
>  /**

Brian
