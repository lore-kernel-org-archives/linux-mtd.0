Received: from mail-vc0-f174.google.com ([209.85.220.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UU8Ne-0005WW-Fs
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 04:29:31 +0000
Received: by mail-vc0-f174.google.com with SMTP id kw10so5600548vcb.19
 for <linux-mtd@lists.infradead.org>; Sun, 21 Apr 2013 21:29:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363605534-24776-6-git-send-email-b32955@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
 <1363605534-24776-6-git-send-email-b32955@freescale.com>
Date: Sun, 21 Apr 2013 21:29:29 -0700
Message-ID: <CAN8TOE8RWRUtuAf05dOu+1KZg86HFrLOMPWt0VAeUAKtsXFTQA@mail.gmail.com>
Subject: Re: [PATCH 05/11] mtd: add a helper to get the supported features for
 ONFI nand
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 18, 2013 at 4:18 AM, Huang Shijie <b32955@freescale.com> wrote:
> From: Huang Shijie <shijie8@gmail.com>
>
> add a helper to get the supported features for ONFI nand.
> Also add the neccessary macros.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  include/linux/mtd/nand.h |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 94ae957..2c5a2e0 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -195,6 +195,11 @@ typedef enum {
>  /* Keep gcc happy */
>  struct nand_chip;
>
> +/* ONFI features */
> +#define ONFI_FEATURE_16_BIT_BUS                (1 << 0)
> +#define ONFI_FEATURE_EXT_PARAM_PAGE    (1 << 7)
> +#define ONFI_FEATURE_UNKNOWN           (1 << 15)
> +
>  /* ONFI timing mode, used in both asynchronous and synchronous mode */
>  #define ONFI_TIMING_MODE_0             (1 << 0)
>  #define ONFI_TIMING_MODE_1             (1 << 1)
> @@ -743,6 +748,14 @@ struct platform_nand_chip *get_platform_nandchip(struct mtd_info *mtd)
>         return chip->priv;
>  }
>
> +/* return the supported features. */
> +static inline int onfi_get_feature(struct nand_chip *chip)

This function naming seems too close to the chip->onfi_get_features
function pointer. They serve totally different purposes (I think) and
should clearly be shown to be different in some way--preferably by
naming.

> +{
> +       if (!chip->onfi_version)
> +               return ONFI_FEATURE_UNKNOWN;
> +       return le16_to_cpu(chip->onfi_params.features);
> +}
> +
>  /* return the supported asynchronous timing mode. */
>  static inline int onfi_get_async_timing_mode(struct nand_chip *chip)
>  {

Brian
