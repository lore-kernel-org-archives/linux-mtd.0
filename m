Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeSeb-0002Cx-Ly
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 10:47:01 +0000
Date: Sat, 13 Sep 2008 12:47:01 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Zev Weiss <zevweiss@gmail.com>
Subject: Re: [PATCH 3/3] [MTD] physmap.c: Add a dummy release function
Message-ID: <20080913104701.GF21603@xi.wantstofly.org>
References: <48CB5EA4.10907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48CB5EA4.10907@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 12, 2008 at 11:33:08PM -0700, Zev Weiss wrote:

> Adding a dummy release function to the physmap device so as to silence a log
> warning on initialization.
> 
> Signed-off-by: Zev Weiss <zevweiss@gmail.com>
> ---
>   drivers/mtd/maps/physmap.c |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 49e2039..73a8d3c 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -277,11 +277,16 @@ static struct resource physmap_flash_resource = {
>   	.flags		= IORESOURCE_MEM,
>   };
> 
> +static void physmap_dummy_release(struct device *dev)
> +{
> +}
> +
>   static struct platform_device physmap_flash = {
>   	.name		= "physmap-flash",
>   	.id		= 0,
>   	.dev		= {
>   		.platform_data	= &physmap_flash_data,
> +		.release	= &physmap_dummy_release,
>   	},
>   	.num_resources	= 1,
>   	.resource	= &physmap_flash_resource,

Isn't that just papering over the issue?
