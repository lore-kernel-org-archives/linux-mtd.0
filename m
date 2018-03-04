Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1esZah-0000wC-Tn
 for linux-mtd@lists.infradead.org; Sun, 04 Mar 2018 19:46:42 +0000
Date: Sun, 4 Mar 2018 20:46:25 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com, tharvey@gateworks.com,
 stable@vger.kernel.org
Subject: Re: [PATCH] ubi: Reject MLC NAND
Message-ID: <20180304204625.5f7da30f@bbrezillon>
In-Reply-To: <20180303104554.5958-1-richard@nod.at>
References: <20180303104554.5958-1-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat,  3 Mar 2018 11:45:54 +0100
Richard Weinberger <richard@nod.at> wrote:

> While UBI and UBIFS seem to work at first sight with MLC NAND, you will
> most likely lose all your data upon a power-cut or due to read/write
> disturb.
> In order to protect users from bad surprises, refuse to attach to MLC
> NAND.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Weinberger <richard@nod.at>

Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/ubi/build.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index e941395de3ae..753494e042d5 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -854,6 +854,17 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * Both UBI and UBIFS have been designed for SLC NAND and NOR flashes.
> +	 * MLC NAND is different and needs special care, otherwise UBI or UBIFS
> +	 * will die soon and you will lose all your data.
> +	 */
> +	if (mtd->type == MTD_MLCNANDFLASH) {
> +		pr_err("ubi: refuse attaching mtd%d - MLC NAND is not supported\n",
> +			mtd->index);
> +		return -EINVAL;
> +	}
> +
>  	if (ubi_num == UBI_DEV_NUM_AUTO) {
>  		/* Search for an empty slot in the @ubi_devices array */
>  		for (ubi_num = 0; ubi_num < UBI_MAX_DEVICES; ubi_num++)



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
