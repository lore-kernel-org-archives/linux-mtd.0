Message-ID: <55522C30.3060002@nokia.com>
Date: Tue, 12 May 2015 18:37:04 +0200
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
MIME-Version: 1.0
To: ext Brian Norris <computersforpeace@gmail.com>,
 Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>
Subject: Re: [PATCH] mtd: fix: avoid race condition when accessing
 mtd->usecount
References: <1429611622-2652-1-git-send-email-giuseppe.cantavenera.ext@nokia.com>
 <20150508001012.GV32500@ld-irv-0074> <20150508001745.GW32500@ld-irv-0074>
 <20150508002649.GX32500@ld-irv-0074>
In-Reply-To: <20150508002649.GX32500@ld-irv-0074>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: lorenzo.restelli.ext@nokia.com, zhangxingcai <zhangxingcai@huawei.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, fengfuqiu@huawei.com,
 linux-mtd@lists.infradead.org, tanhaijun@huawei.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/05/15 02:26, ext Brian Norris wrote:
> As an alternative to your patch, how about the following?
> 
> BTW, this does still leave a usecount race in
> drivers/mtd/maps/vmu-flash.c. But that driver should really be using
> mtd->_get_device(), if it actually wants its own refcount.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Acked-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> ---
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 2b0c52870999..df7c6c70757a 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -197,6 +197,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
>  		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
>  
>  	mutex_lock(&dev->lock);
> +	mutex_lock(&mtd_table_mutex);
>  
>  	if (dev->open)
>  		goto unlock;
> @@ -220,6 +221,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
>  
>  unlock:
>  	dev->open++;
> +	mutex_unlock(&mtd_table_mutex);
>  	mutex_unlock(&dev->lock);
>  	blktrans_dev_put(dev);
>  	return ret;
> @@ -230,6 +232,7 @@ error_release:
>  error_put:
>  	module_put(dev->tr->owner);
>  	kref_put(&dev->ref, blktrans_dev_release);
> +	mutex_unlock(&mtd_table_mutex);
>  	mutex_unlock(&dev->lock);
>  	blktrans_dev_put(dev);
>  	return ret;
> @@ -243,6 +246,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
>  		return;
>  
>  	mutex_lock(&dev->lock);
> +	mutex_lock(&mtd_table_mutex);
>  
>  	if (--dev->open)
>  		goto unlock;
> @@ -256,6 +260,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
>  		__put_mtd_device(dev->mtd);
>  	}
>  unlock:
> +	mutex_unlock(&mtd_table_mutex);
>  	mutex_unlock(&dev->lock);
>  	blktrans_dev_put(dev);
>  }
