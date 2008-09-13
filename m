Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeSeH-0002BE-Sc
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 10:46:42 +0000
Date: Sat, 13 Sep 2008 12:46:41 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Zev Weiss <zevweiss@gmail.com>
Subject: Re: [PATCH 2/3] [MTD] physmap.c: Add #endif comments
Message-ID: <20080913104641.GE21603@xi.wantstofly.org>
References: <48CB5E9F.9060109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48CB5E9F.9060109@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 12, 2008 at 11:33:03PM -0700, Zev Weiss wrote:

> Adding comments to a few of the less painfully-obvious #endifs.
> 
> Signed-off-by: Zev Weiss <zevweiss@gmail.com>
> ---
>   drivers/mtd/maps/physmap.c |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 6fba0d4..49e2039 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -244,7 +244,7 @@ static void physmap_flash_shutdown(struct platform_device *dev)
>   #define physmap_flash_suspend NULL
>   #define physmap_flash_resume NULL
>   #define physmap_flash_shutdown NULL
> -#endif
> +#endif /* CONFIG_PM */
> 
>   static struct platform_driver physmap_flash_driver = {
>   	.probe		= physmap_flash_probe,
> @@ -302,8 +302,8 @@ void physmap_set_partitions(struct mtd_partition *parts, int
> num_parts)
>   	physmap_flash_data.nr_parts = num_parts;
>   	physmap_flash_data.parts = parts;
>   }
> -#endif
> -#endif
> +#endif /* CONFIG_MTD_PARTITIONS */
> +#endif /* PHYSMAP_COMPAT */

I thought that this was frowned upon.  (I don't like it myself, and
my editor is perfectly well capable of pointing out to me which ifdef
matches up with which endif.)
