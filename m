Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kg2Dp-0001z8-Gf
	for linux-mtd@lists.infradead.org; Wed, 17 Sep 2008 18:57:53 +0000
Date: Wed, 17 Sep 2008 11:57:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zev Weiss <zevweiss@gmail.com>
Subject: Re: [PATCH 1/3] [MTD] physmap.c: Check return of
	platform_device_register()
Message-Id: <20080917115746.e36cacc6.akpm@linux-foundation.org>
In-Reply-To: <48CB5E9A.4010000@gmail.com>
References: <48CB5E9A.4010000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 Sep 2008 23:32:58 -0700
Zev Weiss <zevweiss@gmail.com> wrote:

> The PHYSMAP_COMPAT code had been ignoring the return value of
> platform_device_register() in the physmap_init() function.
> 
> Signed-off-by: Zev Weiss <zevweiss@gmail.com>
> ---
>   drivers/mtd/maps/physmap.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 42d844f..6fba0d4 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -312,7 +312,7 @@ static int __init physmap_init(void)
>   	err = platform_driver_register(&physmap_flash_driver);
>   #ifdef PHYSMAP_COMPAT
>   	if (err == 0)
> -		platform_device_register(&physmap_flash);
> +		err = platform_device_register(&physmap_flash);
>   #endif
> 
>   	return err;

Your email client is performing space-stuffing, thus making the patches
unapplyable.

Presumably we should run platform_driver_unregister() if the
platform_device_register() failed.
