Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7c44-0000Iz-Im
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2015 04:45:50 +0000
Subject: Re: [PATCH for-4.4] mtd: fix cmdlinepart parser, early naming for
 auto-filled MTD
To: Brian Norris <computersforpeace@gmail.com>
References: <1449878281-94986-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Heiko Schocher <hs@denx.de>, Frans Klaver <fransklaver@gmail.com>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <566BA661.9000407@denx.de>
Date: Sat, 12 Dec 2015 05:45:21 +0100
MIME-Version: 1.0
In-Reply-To: <1449878281-94986-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

Am 12.12.2015 um 00:58 schrieb Brian Norris:
> Commit 807f16d4db95 ("mtd: core: set some defaults when dev.parent is
> set") attempted to provide some default settings for MTDs that
>   (a) assign the parent device and
>   (b) don't provide their own name or owner
>
> However, this isn't a perfect drop-in replacement for the boilerplate
> found in some drivers, because the MTD name is used by partition
> parsers like cmdlinepart, but the name isn't set until add_mtd_device(),
> after the parsing is completed. This means cmdlinepart sees a NULL name
> and therefore will not work properly.
>
> Fix this by moving the default name and owner assignment to be first in
> the MTD registration process.
>
> Fixes: 807f16d4db95 ("mtd: core: set some defaults when dev.parent is set")
> Reported-by: Heiko Schocher <hs@denx.de>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Heiko Schocher <hs@denx.de>
> Cc: Frans Klaver <fransklaver@gmail.com>
> ---
> Heiko, can you provide testing feedback (e.g., 'Tested-by: ...')?

Sorry, does not work for me:

Based on:
pollux:linux hs [20151212] $ git describe master
v4.4-rc4-135-gb9d8545

and this patch, shows the same problem,

Adding:
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 93f664c..28dcf66 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1685,6 +1685,7 @@ static int omap_nand_probe(struct platform_device *pdev)
         info->ecc_opt           = pdata->ecc_opt;
         mtd                     = &info->mtd;
         mtd->priv               = &info->nand;
+       mtd->name               = dev_name(&pdev->dev);
         mtd->dev.parent         = &pdev->dev;
         nand_chip               = &info->nand;
         nand_chip->ecc.priv     = NULL;

and it works again ...

bye,
Heiko
>
> In testing this myself, it looks like cmdlinepart.c can actually work OK with a
> single-MTD system, even when mtd->name isn't set. See this snippet:
>
>          /*
>           * Search for the partition definition matching master->name.
>           * If master->name is not set, stop at first partition definition.
>           */
>          for (part = partitions; part; part = part->next) {
>                  if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
>                          break;
>          }
>
> But, I don't know *why* it does that...
>
>   drivers/mtd/mtdcore.c | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 95c13b2ffa79..ffa288474820 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -426,15 +426,6 @@ int add_mtd_device(struct mtd_info *mtd)
>   	mtd->erasesize_mask = (1 << mtd->erasesize_shift) - 1;
>   	mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;
>
> -	if (mtd->dev.parent) {
> -		if (!mtd->owner && mtd->dev.parent->driver)
> -			mtd->owner = mtd->dev.parent->driver->owner;
> -		if (!mtd->name)
> -			mtd->name = dev_name(mtd->dev.parent);
> -	} else {
> -		pr_debug("mtd device won't show a device symlink in sysfs\n");
> -	}
> -
>   	/* Some chips always power up locked. Unlock them now */
>   	if ((mtd->flags & MTD_WRITEABLE) && (mtd->flags & MTD_POWERUP_LOCK)) {
>   		error = mtd_unlock(mtd, 0, mtd->size);
> @@ -549,6 +540,21 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
>   	return 0;
>   }
>
> +/*
> + * Set a few defaults based on the parent devices, if not provided by the
> + * driver
> + */
> +static void mtd_set_dev_defaults(struct mtd_info *mtd)
> +{
> +	if (mtd->dev.parent) {
> +		if (!mtd->owner && mtd->dev.parent->driver)
> +			mtd->owner = mtd->dev.parent->driver->owner;
> +		if (!mtd->name)
> +			mtd->name = dev_name(mtd->dev.parent);
> +	} else {
> +		pr_debug("mtd device won't show a device symlink in sysfs\n");
> +	}
> +}
>
>   /**
>    * mtd_device_parse_register - parse partitions and register an MTD device.
> @@ -587,6 +593,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>   	int ret;
>   	struct mtd_partition *real_parts = NULL;
>
> +	mtd_set_dev_defaults(mtd);
> +
>   	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
>   	if (ret <= 0 && nr_parts && parts) {
>   		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
>

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
		
