Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsY3p-0005iE-Cv
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 15:27:17 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 09/11] mtd: drop unnecessary partition parser data
Date: Sat, 31 Oct 2015 16:26:32 +0100
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446262410-45754-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1446262410-45754-10-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201510311626.32863.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, October 31, 2015 at 04:33:28 AM, Brian Norris wrote:
> We should assign the MTD dev.of_node instead of the parser data field.
> This gets us the equivalent partition parser behavior with fewer special
> fields and parameter passing.
> 
> Also convert several of these to mtd_device_register(), since we don't
> need the 2nd and 3rd parameters anymore.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

[...]

> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index e46b4e983666..b78265688075 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -166,7 +166,6 @@ static int of_flash_probe(struct platform_device *dev)
>  	int reg_tuple_size;
>  	struct mtd_info **mtd_list = NULL;
>  	resource_size_t res_size;
> -	struct mtd_part_parser_data ppdata;
>  	bool map_indirect;
>  	const char *mtd_name = NULL;
> 
> @@ -310,13 +309,13 @@ static int of_flash_probe(struct platform_device
> *dev) if (err)
>  		goto err_out;
> 
> -	ppdata.of_node = dp;
> +	mtd_set_of_node(info->cmtd, dp);
>  	part_probe_types = of_get_probes(dp);
>  	if (!part_probe_types) {
>  		err = -ENOMEM;
>  		goto err_out;
>  	}
> -	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
> +	mtd_device_parse_register(info->cmtd, part_probe_types, NULL,

Did you miss this one ?

>  			NULL, 0);
>  	of_free_probes(part_probe_types);
> 


This is really good, I like to see the ppdata nonsense finally going away.

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
