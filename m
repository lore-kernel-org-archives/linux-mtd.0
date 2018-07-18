Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffrE4-0007he-CM
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 18:31:01 +0000
Date: Wed, 18 Jul 2018 20:30:38 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jann Horn <jannh@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtdchar: fix overflows in adjustment of `count`
Message-ID: <20180718203038.2ba07097@bbrezillon>
In-Reply-To: <20180707033722.219468-1-jannh@google.com>
References: <20180707033722.219468-1-jannh@google.com>
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

On Sat,  7 Jul 2018 05:37:22 +0200
Jann Horn <jannh@google.com> wrote:

> The first checks in mtdchar_read() and mtdchar_write() attempt to limit
> `count` such that `*ppos + count <= mtd->size`. However, they ignore the
> possibility of `*ppos > mtd->size`, allowing the calculation of `count` to
> wrap around. `mtdchar_lseek()` prevents seeking beyond mtd->size, but the
> pread/pwrite syscalls bypass this.
> 
> I haven't found any codepath on which this actually causes dangerous
> behavior, but it seems like a sensible change anyway.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Jann Horn <jannh@google.com>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/mtdchar.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index cd67c85cc87d..02389528f622 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -160,8 +160,12 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
>  
>  	pr_debug("MTD_read\n");
>  
> -	if (*ppos + count > mtd->size)
> -		count = mtd->size - *ppos;
> +	if (*ppos + count > mtd->size) {
> +		if (*ppos < mtd->size)
> +			count = mtd->size - *ppos;
> +		else
> +			count = 0;
> +	}
>  
>  	if (!count)
>  		return 0;
> @@ -246,7 +250,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
>  
>  	pr_debug("MTD_write\n");
>  
> -	if (*ppos == mtd->size)
> +	if (*ppos >= mtd->size)
>  		return -ENOSPC;
>  
>  	if (*ppos + count > mtd->size)
