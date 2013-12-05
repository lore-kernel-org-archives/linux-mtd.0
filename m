Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoUlA-0003St-CY
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 08:58:13 +0000
Received: by mail-pb0-f45.google.com with SMTP id rp16so25361883pbb.4
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 00:57:50 -0800 (PST)
Date: Thu, 5 Dec 2013 00:57:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v4 4/4] mtd: devices: elm: add checks ELM H/W constrains,
 driver code cleanup
Message-ID: <20131205085701.GC4636@norris.computersforpeace.net>
References: <1385374141-10934-1-git-send-email-pekon@ti.com>
 <1385374141-10934-5-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385374141-10934-5-git-send-email-pekon@ti.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 ezequiel.garcia@free-electrons.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 25, 2013 at 03:39:01PM +0530, Pekon Gupta wrote:
> ELM H/W engine is used by BCHx_ECC schemes for detecting and locating bit-flips.
> However, ELM H/W engine has some constrains like:

s/constrains/constraints/

> - ELM can decode errors in chunks of 512 data bytes only
> - ELM can operate max upto 8 such buffers in parallel
> 
> This patch
> - add checks for above constrains
> - fixes ELM register configs based on number of info->eccsteps

You dropped info->eccsteps from v3 -> v4, but this descriptions still
mentions it.

> - cleans-up elm_load_syndrome()

It seems like your list of fixes for this patch can be separated into
separate patches a bit. Particularly, the big middle chunk about
rewriting BCH4 and BCH8 support is much more significant than your
additional checks for if (!dev) and if (!mtd), so it should be in its
own patch, with a better description of what you're really doing.

> Signed-off-by: Pekon Gupta <pekon@ti.com>
> Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/devices/elm.c         | 127 +++++++++++++++++++++++---------------
>  drivers/mtd/nand/omap2.c          |   2 +-
>  include/linux/platform_data/elm.h |   6 +-
>  3 files changed, 83 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
> index d1dd6a3..10026ef 100644
> --- a/drivers/mtd/devices/elm.c
> +++ b/drivers/mtd/devices/elm.c
...
> @@ -152,55 +180,52 @@ static void elm_configure_page_mode(struct elm_info *info, int index,
>   * Load syndrome fragment registers with calculated ecc in reverse order.
>   */
>  static void elm_load_syndrome(struct elm_info *info,
> -		struct elm_errorvec *err_vec, u8 *ecc)
> +		struct elm_errorvec *err_vec, u8 *ecc_calc)
>  {
> +	struct nand_chip *nand_chip	= info->mtd->priv;
> +	unsigned int eccbytes		= nand_chip->ecc.bytes;
> +	unsigned int eccsteps		= nand_chip->ecc.steps;
> +	u8 *ecc = ecc_calc;
>  	int i, offset;
>  	u32 val;
>  
> -	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
> -
> +	for (i = 0; i < eccsteps; i++) {

Here's another work item in this patch: you're replacing a fixed
constant (ERROR_VECTOR_MAX) with a dynamic value (eccsteps). What are
you solving with this? Shouldn't this be its own patch?

>  		/* Check error reported */
>  		if (err_vec[i].error_reported) {
>  			elm_configure_page_mode(info, i, true);
...

Brian
