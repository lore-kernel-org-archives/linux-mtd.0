Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTpWM-0005BF-Ct
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 12:39:24 +0000
Subject: Re: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness swap
 is enabled
To: Sebastien Decourriere <sebtx452@gmail.com>, linux-mtd@lists.infradead.org
References: <1484741452-27141-1-git-send-email-sebtx452@gmail.com>
Cc: linux-mips@linux-mips.org
From: John Crispin <john@phrozen.org>
Message-ID: <e5bb2245-a0d0-5b66-2c75-9af26c6ea846@phrozen.org>
Date: Wed, 18 Jan 2017 13:38:58 +0100
MIME-Version: 1.0
In-Reply-To: <1484741452-27141-1-git-send-email-sebtx452@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sebastien,

thanks, comments inline

On 18/01/2017 13:10, Sebastien Decourriere wrote:
> The purpose of this patch is to enable the software address endianness
> swapping only when the in SoC EBU endianness swapping is disabled.
> To perform this check, I look at Bit 30 of the EBU_CON_0 register.
> Actually, the driver expects that the in SoC swapping is disabled.
> This is the case with current bootloaders shuch as U-boot. But,
> 
> I have a router which uses a proprietary bootloader which keeps
> the in SoC swapping enabled. The SoC in this router is a vrx200 v1.2.
> In this SoC version, I can keep the in SoC swapping without any problem.
> 
> Signed-off-by: Sebastien Decourriere <sebtx452@gmail.com>
> ---
>  drivers/mtd/maps/lantiq-flash.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
> index c8febb3..a091efa 100644
> --- a/drivers/mtd/maps/lantiq-flash.c
> +++ b/drivers/mtd/maps/lantiq-flash.c
> @@ -151,6 +151,11 @@ ltq_mtd_probe(struct platform_device *pdev)
>  	ltq_mtd->map->copy_to = ltq_copy_to;
>  
>  	ltq_mtd->map->map_priv_1 = LTQ_NOR_PROBING;

this line should be dropped

> +	/* We swap the addresses only if the EBU endianness swap is disabled */
> +	if (ltq_ebu_r32(LTQ_EBU_BUSCON0) & BIT(30))

add a define for BIT(30) please and we should really check if this a
v1.2 or newer. if my memory is correct this was a silicon bug inside
v1.0 and v1.1

	John

> +		ltq_mtd->map[i].map_priv_1 = LTQ_NOR_NORMAL;
> +	else
> +		ltq_mtd->map[i].map_priv_1 = LTQ_NOR_PROBING;
>  	ltq_mtd->mtd = do_map_probe("cfi_probe", ltq_mtd->map);
>  	ltq_mtd->map->map_priv_1 = LTQ_NOR_NORMAL;
>  
> @@ -163,8 +168,11 @@ ltq_mtd_probe(struct platform_device *pdev)
>  	mtd_set_of_node(ltq_mtd->mtd, pdev->dev.of_node);
>  
>  	cfi = ltq_mtd->map->fldrv_priv;
> -	cfi->addr_unlock1 ^= 1;
> -	cfi->addr_unlock2 ^= 1;
> +	/* We swap the addresses only if the EBU endianness swap is disabled */
> +	if (!(ltq_ebu_r32(LTQ_EBU_BUSCON0) & BIT(30))) {
> +		cfi->addr_unlock1 ^= 1;
> +		cfi->addr_unlock2 ^= 1;
> +	}
>  
>  	err = mtd_device_register(ltq_mtd->mtd, NULL, 0);
>  	if (err) {
> 
