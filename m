Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LbxnX-0007Hk-3L
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2009 13:58:17 +0000
Date: Tue, 24 Feb 2009 14:35:05 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
Message-ID: <20090224133505.GJ21900@pengutronix.de>
References: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Sorry to reply to such an old thread, but...

On Wed, Nov 12, 2008 at 11:57:33PM +0900, Atsushi Nemoto wrote:
> The mtd partition parser returns an allocated pointer array of
> mtd_partition.  The caller must free it.  The array is used only for
> add_mtd_partitions(), so free it just after the call.

This patch breaks command line parsing support. With command line
partition parsing the struct mtd_partition array is allocated, but only
once. On my board with NAND and NOR (both with command line partition
parsing) It fails badly in parse_cmdline_partitions() when the second
device gets parsed.

The following patch fixes it, but I don't know if this is
the correct solution. Does anybody have more insights on this?

Sascha

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 50a3403..14c00dd 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -335,7 +335,13 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 				}
 				offset += part->parts[i].size;
 			}
-			*pparts = part->parts;
+
+			*pparts = kmalloc(sizeof (struct mtd_partition) * part->num_parts, GFP_KERNEL);
+			if (!*pparts)
+				return -ENOMEM;
+
+			memcpy(*pparts, part->parts, sizeof (struct mtd_partition) * part->num_parts);
+
 			return part->num_parts;
 		}
 	}

> 
> Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> ---
>  drivers/mtd/maps/physmap.c |   17 ++++++++---------
>  1 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 7ca048d..cc26b41 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -29,7 +29,6 @@ struct physmap_flash_info {
>  	struct map_info		map[MAX_RESOURCES];
>  #ifdef CONFIG_MTD_PARTITIONS
>  	int			nr_parts;
> -	struct mtd_partition	*parts;
>  #endif
>  };
>  
> @@ -56,14 +55,10 @@ static int physmap_flash_remove(struct platform_device *dev)
>  	for (i = 0; i < MAX_RESOURCES; i++) {
>  		if (info->mtd[i] != NULL) {
>  #ifdef CONFIG_MTD_PARTITIONS
> -			if (info->nr_parts) {
> +			if (info->nr_parts || physmap_data->nr_parts)
>  				del_mtd_partitions(info->mtd[i]);
> -				kfree(info->parts);
> -			} else if (physmap_data->nr_parts) {
> -				del_mtd_partitions(info->mtd[i]);
> -			} else {
> +			else
>  				del_mtd_device(info->mtd[i]);
> -			}
>  #else
>  			del_mtd_device(info->mtd[i]);
>  #endif
> @@ -86,6 +81,9 @@ static int physmap_flash_probe(struct platform_device *dev)
>  	int err = 0;
>  	int i;
>  	int devices_found = 0;
> +#ifdef CONFIG_MTD_PARTITIONS
> +	struct mtd_partition *parts;
> +#endif
>  
>  	physmap_data = dev->dev.platform_data;
>  	if (physmap_data == NULL)
> @@ -166,9 +164,10 @@ static int physmap_flash_probe(struct platform_device *dev)
>  		goto err_out;
>  
>  #ifdef CONFIG_MTD_PARTITIONS
> -	err = parse_mtd_partitions(info->cmtd, part_probe_types, &info->parts, 0);
> +	err = parse_mtd_partitions(info->cmtd, part_probe_types, &parts, 0);
>  	if (err > 0) {
> -		add_mtd_partitions(info->cmtd, info->parts, err);
> +		add_mtd_partitions(info->cmtd, parts, err);
> +		kfree(parts);
>  		return 0;
>  	}
>  
> -- 
> 1.5.6.3
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
