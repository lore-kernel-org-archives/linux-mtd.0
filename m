Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cezqL-00058y-4Q
 for linux-mtd@lists.infradead.org; Sat, 18 Feb 2017 07:54:11 +0000
Date: Sat, 18 Feb 2017 08:53:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Lepton Wu <ytht.net@gmail.com>
Cc: dwmw2@infradead.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@atmel.com, computersforpeace@gmail.com
Subject: Re: [PATCH] Make mtdblock can handle partition bigger than 4G.
Message-ID: <20170218085343.6e8ab57f@bbrezillon>
In-Reply-To: <20170217233733.31363-1-ytht.net@gmail.com>
References: <20170217233733.31363-1-ytht.net@gmail.com>
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

Hi Lepton,

On Fri, 17 Feb 2017 15:37:33 -0800
Lepton Wu <ytht.net@gmail.com> wrote:

Can you please add a commit message and prefix the subject with 'mtd: '.
Something like 'mtd: Fix mtdblock for >4GB MTD devices'.

> Signed-off-by: Lepton Wu <ytht.net@gmail.com>
> ---
>  drivers/mtd/mtdblock.c    | 33 +++++++++++++++++----------------
>  drivers/mtd/mtdblock_ro.c |  4 ++--
>  2 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> index bb4c14f83c75..3d2da76287a7 100644
> --- a/drivers/mtd/mtdblock.c
> +++ b/drivers/mtd/mtdblock.c
> @@ -61,8 +61,8 @@ static void erase_callback(struct erase_info *done)
>  	wake_up(wait_q);
>  }
>  
> -static int erase_write (struct mtd_info *mtd, unsigned long pos,
> -			int len, const char *buf)
> +static int erase_write(struct mtd_info *mtd, loff_t pos, int len,
> +		       const char *buf)
>  {
>  	struct erase_info erase;
>  	DECLARE_WAITQUEUE(wait, current);
> @@ -88,8 +88,7 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
>  	if (ret) {
>  		set_current_state(TASK_RUNNING);
>  		remove_wait_queue(&wait_q, &wait);
> -		printk (KERN_WARNING "mtdblock: erase of region [0x%lx, 0x%x] "
> -				     "on \"%s\" failed\n",
> +		pr_warn("mtdblock: erase of region [0x%llx, 0x%x] on \"%s\" failed\n",
>  			pos, len, mtd->name);
>  		return ret;
>  	}
> @@ -139,23 +138,24 @@ static int write_cached_data (struct mtdblk_dev *mtdblk)
>  }
>  
>  
> -static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
> -			    int len, const char *buf)
> +static int do_cached_write(struct mtdblk_dev *mtdblk, loff_t pos,
> +			   int len, const char *buf)
>  {
>  	struct mtd_info *mtd = mtdblk->mbd.mtd;
>  	unsigned int sect_size = mtdblk->cache_size;
>  	size_t retlen;
>  	int ret;
>  
> -	pr_debug("mtdblock: write on \"%s\" at 0x%lx, size 0x%x\n",
> +	pr_debug("mtdblock: write on \"%s\" at 0x%llx, size 0x%x\n",
>  		mtd->name, pos, len);
>  
>  	if (!sect_size)
>  		return mtd_write(mtd, pos, len, &retlen, buf);
>  
>  	while (len > 0) {
> -		unsigned long sect_start = (pos/sect_size)*sect_size;
> -		unsigned int offset = pos - sect_start;
> +		unsigned int offset;
> +		loff_t sect_start =
> +			div_u64_rem(pos, sect_size, &offset) * sect_size;
>  		unsigned int size = sect_size - offset;
>  		if( size > len )
>  			size = len;
> @@ -209,23 +209,24 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
>  }
>  
>  
> -static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
> -			   int len, char *buf)
> +static int do_cached_read(struct mtdblk_dev *mtdblk, loff_t pos,
> +			  int len, char *buf)
>  {
>  	struct mtd_info *mtd = mtdblk->mbd.mtd;
>  	unsigned int sect_size = mtdblk->cache_size;
>  	size_t retlen;
>  	int ret;
>  
> -	pr_debug("mtdblock: read on \"%s\" at 0x%lx, size 0x%x\n",
> +	pr_debug("mtdblock: read on \"%s\" at 0x%llx, size 0x%x\n",
>  			mtd->name, pos, len);

Align the parameters on the open parenthesis.

>  
>  	if (!sect_size)
>  		return mtd_read(mtd, pos, len, &retlen, buf);
>  
>  	while (len > 0) {
> -		unsigned long sect_start = (pos/sect_size)*sect_size;
> -		unsigned int offset = pos - sect_start;
> +		unsigned int offset;
> +		loff_t sect_start =
> +			div_u64_rem(pos, sect_size, &offset) * sect_size;
>  		unsigned int size = sect_size - offset;
>  		if (size > len)
>  			size = len;
> @@ -259,7 +260,7 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
>  			      unsigned long block, char *buf)
>  {
>  	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
> -	return do_cached_read(mtdblk, block<<9, 512, buf);
> +	return do_cached_read(mtdblk, (loff_t)block<<9, 512, buf);

					      ^ block << 9
>  }
>  
>  static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
> @@ -275,7 +276,7 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
>  		 * return -EAGAIN sometimes, but why bother?
>  		 */
>  	}
> -	return do_cached_write(mtdblk, block<<9, 512, buf);
> +	return do_cached_write(mtdblk, (loff_t)block<<9, 512, buf);

Ditto.

>  }
>  
>  static int mtdblock_open(struct mtd_blktrans_dev *mbd)
> diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
> index fb5dc89369de..92829e3fb3b7 100644
> --- a/drivers/mtd/mtdblock_ro.c
> +++ b/drivers/mtd/mtdblock_ro.c
> @@ -31,7 +31,7 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
>  {
>  	size_t retlen;
>  
> -	if (mtd_read(dev->mtd, (block * 512), 512, &retlen, buf))
> +	if (mtd_read(dev->mtd, (loff_t)block << 9, 512, &retlen, buf))
>  		return 1;
>  	return 0;
>  }
> @@ -41,7 +41,7 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
>  {
>  	size_t retlen;
>  
> -	if (mtd_write(dev->mtd, (block * 512), 512, &retlen, buf))
> +	if (mtd_write(dev->mtd, (loff_t)block << 9, 512, &retlen, buf))
>  		return 1;
>  	return 0;
>  }
