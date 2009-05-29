Subject: Re: mtd: remove driver-core BUS_ID_SIZE
From: David Woodhouse <dwmw2@infradead.org>
To: Kay Sievers <kay.sievers@vrfy.org>
In-Reply-To: <1239899196.17211.11.camel@poy>
References: <1239899196.17211.11.camel@poy>
Content-Type: text/plain
Date: Fri, 29 May 2009 14:11:35 +0100
Message-Id: <1243602695.19886.146.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Greg Kroah-Hartman <gregkh@suse.de>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-16 at 18:26 +0200, Kay Sievers wrote:
> From: Kay Sievers <kay.sievers@vrfy.org>
> Subject: mtd: remove driver-core BUS_ID_SIZE
> 
> The name size limit is gone from the driver-core, the BUS_ID_SIZE
> value will be removed.
> 
> Cc: dwmw2@infradead.org
> Cc: linux-mtd@lists.infradead.org
> Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
> Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
> ---
>  drivers/mtd/nand/txx9ndfmc.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/mtd/nand/txx9ndfmc.c
> +++ b/drivers/mtd/nand/txx9ndfmc.c
> @@ -64,7 +64,7 @@ struct txx9ndfmc_priv {
>  	struct nand_chip chip;
>  	struct mtd_info mtd;
>  	int cs;
> -	char mtdname[BUS_ID_SIZE + 2];
> +	char mtdname[20 + 2];
>  };
>  
>  #define MAX_TXX9NDFMC_DEV	4

Not so cunning. You're explicitly noting that the limit on the input
string size is gone, and yet you do nothing about the code which uses
it...

		if (plat->ch_mask != 1) {
			txx9_priv->cs = i;
			sprintf(txx9_priv->mtdname, "%s.%u",
				dev_name(&dev->dev), i);
		} else {
			txx9_priv->cs = -1;
			strcpy(txx9_priv->mtdname, dev_name(&dev->dev));
		}

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
