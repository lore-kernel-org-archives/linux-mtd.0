Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FuooV-0005z4-PU
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 06:59:37 -0400
Date: Mon, 26 Jun 2006 12:59:21 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: off-by-one error in physmap.c
Message-ID: <20060626105921.GA14120@xi.wantstofly.org>
References: <20060626103455.GA5167@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060626103455.GA5167@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 26, 2006 at 12:34:55PM +0200, Sascha Hauer wrote:

> This patch fixes a simple off-by-one error in the mtd physmap driver.

Looks good.


> Signed-Off-By: Sascha Hauer <s.hauer@pengutronix.de>

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>


> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 433c3ca..d6301f0 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -182,7 +182,7 @@ static struct physmap_flash_data physmap
>  
>  static struct resource physmap_flash_resource = {
>  	.start		= CONFIG_MTD_PHYSMAP_START,
> -	.end		= CONFIG_MTD_PHYSMAP_START + CONFIG_MTD_PHYSMAP_LEN,
> +	.end		= CONFIG_MTD_PHYSMAP_START + CONFIG_MTD_PHYSMAP_LEN - 1,
>  	.flags		= IORESOURCE_MEM,
>  };
