Received: from smtp4.pp.htv.fi ([213.243.153.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KPQbe-0003Hb-WA
	for linux-mtd@lists.infradead.org; Sat, 02 Aug 2008 23:33:51 +0000
Date: Sun, 3 Aug 2008 02:32:40 +0300
From: Adrian Bunk <bunk@kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH] drivers/mtd/mtdsuper.c: fix build error
Message-ID: <20080802233240.GA4385@cs181140183.pp.htv.fi>
References: <20080802225304.GD4856@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080802225304.GD4856@orion>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 03, 2008 at 02:53:04AM +0400, Alexander Beregalov wrote:
> From: Alexander Beregalov <a.beregalov@gmail.com>
> 
> drivers/mtd/mtdsuper.c: fix build error
> 
> drivers/mtd/mtdsuper.c:184: error: implicit declaration of
> 	function 'lookup_bdev'
> drivers/mtd/mtdsuper.c:197: error: implicit declaration of
> 	function 'bdput'


It already gets fs.h indirectly through linux/mtd/super.h, so while 
your patch might be correct it cannot fix a compile error.

If that's with CONFIG_BLOCK=n then it's
  http://bugzilla.kernel.org/show_bug.cgi?id=11225

Otherwise please send your .config .


> Introduced by commit d5686b444ff3f72808d2b3fbd58672a86cdf38e7
> 
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> ---
> 
>  drivers/mtd/mtdsuper.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
> index 9b6af7e..ec950cd 100644
> --- a/drivers/mtd/mtdsuper.c
> +++ b/drivers/mtd/mtdsuper.c
> @@ -13,6 +13,7 @@
>  #include <linux/mtd/super.h>
>  #include <linux/namei.h>
>  #include <linux/ctype.h>
> +#include <linux/fs.h>
>  
>  /*
>   * compare superblocks to see if they're equivalent

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
