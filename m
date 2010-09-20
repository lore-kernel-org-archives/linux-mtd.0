Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxblX-0006IU-ON
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 08:30:24 +0000
Received: by bwz19 with SMTP id 19so5944417bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 01:30:21 -0700 (PDT)
Subject: Re: [PATCH 1/3] MTD: blktrans: Final version of hotplug support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1284851558-1154-2-git-send-email-maximlevitsky@gmail.com>
References: <1284851558-1154-1-git-send-email-maximlevitsky@gmail.com>
	<1284851558-1154-2-git-send-email-maximlevitsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 11:28:29 +0300
Message-ID: <1284971309.2286.44.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In one of your e-mails you said this patch is minimalistic. Here are
some suggestions.

On Sun, 2010-09-19 at 01:12 +0200, Maxim Levitsky wrote:
> Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
> ---
>  drivers/mtd/mtd_blkdevs.c |   67 +++++++++++++++++++-------------------------
>  1 files changed, 29 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 62e6870..d773a40 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -47,7 +47,6 @@ void blktrans_dev_release(struct kref *kref)
>  		container_of(kref, struct mtd_blktrans_dev, ref);
>  
>  	dev->disk->private_data = NULL;
> -	blk_cleanup_queue(dev->rq);

Them can be a separate patch.
>  	put_disk(dev->disk);
>  	list_del(&dev->list);
>  	kfree(dev);
> @@ -133,6 +132,10 @@ static int mtd_blktrans_thread(void *arg)
>  
>  		if (!req && !(req = blk_fetch_request(rq))) {
>  			set_current_state(TASK_INTERRUPTIBLE);
> +
> +			if (kthread_should_stop())
> +				break;

This could be a separate patch.

> +
>  			spin_unlock_irq(rq->queue_lock);
>  			schedule();
>  			spin_lock_irq(rq->queue_lock);
> @@ -176,54 +179,51 @@ static void mtd_blktrans_request(struct request_queue *rq)
>  static int blktrans_open(struct block_device *bdev, fmode_t mode)
>  {
>  	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
> -	int ret;
> +	int ret = 0;
>  
>  	if (!dev)
> -		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
> +		return -EIO;

Hmm, why EIO? ENODEV is better. And this can be a separate patch, may
be?

> -	lock_kernel();
>  	mutex_lock(&dev->lock);
>  
> -	if (!dev->mtd) {
> -		ret = -ENXIO;
> +	if (dev->open++)
>  		goto unlock;
> -	}
>  
> -	ret = !dev->open++ && dev->tr->open ? dev->tr->open(dev) : 0;
> +	kref_get(&dev->ref);
> +
> +	if (dev->mtd) {
> +		ret = dev->tr->open ? dev->tr->open(dev) : 0;
> +		__get_mtd_device(dev->mtd);
> +	}
>  
> -	/* Take another reference on the device so it won't go away till
> -		last release */
> -	if (!ret)
> -		kref_get(&dev->ref);
>  unlock:
>  	mutex_unlock(&dev->lock);
>  	blktrans_dev_put(dev);
> -	unlock_kernel();

So you kill BKL in the same patch? No, make it separately, please.

Did not look further.

Please, make a nice set of independent minimalistic patches. This is
very important for patches which will go to 2.6.36 to be minimal and
just fix the problem. Then the rest of the patches can do more things
and they will go to 2.6.37.
 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
