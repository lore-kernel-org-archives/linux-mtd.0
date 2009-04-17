Subject: Re: mtd: remove driver-core BUS_ID_SIZE
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kay Sievers <kay.sievers@vrfy.org>
In-Reply-To: <1239899196.17211.11.camel@poy>
References: <1239899196.17211.11.camel@poy>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Apr 2009 10:25:48 +0300
Message-Id: <1239953148.3390.240.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Greg Kroah-Hartman <gregkh@suse.de>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
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

Pushed, to l2-mtd-2.6.git. This does not guarantee anything,
it just mean I'll ping dwmw2 to pull from that tree.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
