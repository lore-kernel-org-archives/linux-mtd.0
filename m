Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5Xfy-0005hY-Jx
	for linux-mtd@lists.infradead.org; Sat, 24 Apr 2010 05:13:12 +0000
Message-ID: <4BD27DDC.8070903@free.fr>
Date: Sat, 24 Apr 2010 07:13:00 +0200
From: Chris Moore <moore@free.fr>
MIME-Version: 1.0
To: Guillaume LECERF <glecerf@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 1/2] [MTD] remove bogus warning about missing boot
	bank	location
References: <20100423133347.27001.99171.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100423133347.27001.99171.stgit@shiryu.yomgui.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 23/04/2010 15:33, Guillaume LECERF a écrit :
> From: Uwe Kleine-König<Uwe.Kleine-Koenigi@digi.com>
>
> After the deleted block bootloc is only used once as follows:
>
> 	if (bootloc == 3&&  something_else) {
> 		...
>
> So setting bootloc = 2 doesn't change anything.  Taking that the warning is
> wrong and missleading.
>
> Signed-off-by: Uwe Kleine-König<Uwe.Kleine-Koenig@digi.com>
> ---
>   drivers/mtd/chips/cfi_cmdset_0002.c |    5 -----
>   1 files changed, 0 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index ea2a7f6..8da8655 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -391,11 +391,6 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
>   #endif
>
>   		bootloc = extp->TopBottom;
> -		if ((bootloc != 2)&&  (bootloc != 3)) {
> -			printk(KERN_WARNING "%s: CFI does not contain boot "
> -			       "bank location. Assuming top.\n", map->name);
> -			bootloc = 2;
> -		}
>
>   		if (bootloc == 3&&  cfi->cfiq->NumEraseRegions>  1) {
>   			printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n", map->name);
>
>    

FWIW:-
Acked-by Christopher Moore <moore@free.fr>
