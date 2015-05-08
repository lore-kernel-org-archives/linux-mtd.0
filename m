Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqVsF-0007pM-Ma
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 00:10:41 +0000
Received: by pabtp1 with SMTP id tp1so53593134pab.2
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 17:10:18 -0700 (PDT)
Date: Thu, 7 May 2015 17:10:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>
Subject: Re: [PATCH] mtd: fix: avoid race condition when accessing
 mtd->usecount
Message-ID: <20150508001012.GV32500@ld-irv-0074>
References: <1429611622-2652-1-git-send-email-giuseppe.cantavenera.ext@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429611622-2652-1-git-send-email-giuseppe.cantavenera.ext@nokia.com>
Cc: lorenzo.restelli.ext@nokia.com, zhangxingcai <zhangxingcai@huawei.com>,
 stable@vger.kernel.org, fengfuqiu@huawei.com, alexander.sverdlin@nokia.com,
 tanhaijun@huawei.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 21, 2015 at 12:20:22PM +0200, Giuseppe Cantavenera wrote:
> On A MIPS 32-cores machine a BUG_ON was triggered because some acesses to
> mtd->usecount were done without taking mtd_table_mutex.
> kernel: Call Trace:
> kernel: [<ffffffff80401818>] __put_mtd_device+0x20/0x50
> kernel: [<ffffffff804086f4>] blktrans_release+0x8c/0xd8
> kernel: [<ffffffff802577e0>] __blkdev_put+0x1a8/0x200
> kernel: [<ffffffff802579a4>] blkdev_close+0x1c/0x30
> kernel: [<ffffffff8022006c>] __fput+0xac/0x250
> kernel: [<ffffffff80171208>] task_work_run+0xd8/0x120
> kernel: [<ffffffff8012c23c>] work_notifysig+0x10/0x18
> kernel:
> kernel:
>         Code: 2442ffff  ac8202d8  000217fe <00020336> dc820128  10400003
>                00000000  0040f809  00000000
> kernel: ---[ end trace 080fbb4579b47a73 ]---
> 
> Fixed by taking the mutex in blktrans_open and by using the protected
> version of put_mtd_device in blktrans_release and del_mtd_blktrans_dev

FYI, I think there's a similar report here:

http://patchwork.ozlabs.org/patch/415125/

But the patch had other flaws. I think you're more along the right track
here.

> Cc: stable@vger.kernel.org
> Cc: alexander.sverdlin@nokia.com
> Signed-off-by: Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>
> Acked-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/mtd_blkdevs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 2b0c5287..3a9f138 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -213,7 +213,9 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
>  			goto error_put;
>  	}
>  
> +	mutex_lock(&mtd_table_mutex);
>  	ret = __get_mtd_device(dev->mtd);
> +	mutex_unlock(&mtd_table_mutex);

I think this is a start, but it's not enough. See below [*].

>  	if (ret)
>  		goto error_release;
>  	dev->file_mode = mode;
> @@ -253,7 +255,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
>  	if (dev->mtd) {
>  		if (dev->tr->release)
>  			dev->tr->release(dev);
> -		__put_mtd_device(dev->mtd);
> +		put_mtd_device(dev->mtd);

Same, see [*].

>  	}
>  unlock:
>  	mutex_unlock(&dev->lock);
> @@ -484,7 +486,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
>  	if (old->open) {
>  		if (old->tr->release)
>  			old->tr->release(old);
> -		__put_mtd_device(old->mtd);
> +		put_mtd_device(old->mtd);

This looks wrong. See:

int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)                                       
{                                                                                              
        struct mtd_blktrans_dev *dev, *next;                                                   
                                                                                               
        mutex_lock(&mtd_table_mutex);                                                          
                                                                                               
        /* Remove it from the list of active majors */                                         
        list_del(&tr->list);                                                                   
                                                                                               
        list_for_each_entry_safe(dev, next, &tr->devs, list)                                   
                tr->remove_dev(dev);                                                           
                                                                                               
        unregister_blkdev(tr->major, tr->name);                                                
        mutex_unlock(&mtd_table_mutex);                                                        
                                                                                               
        BUG_ON(!list_empty(&tr->devs));                                                        
        return 0;                       
}

Now, many mtd_blkdev implementations call del_mtd_blktrans_dev() in
their tr->remove_dev() functions (e.g., see inftl_remove_dev()). This
means you will have:

deregister_mtd_blktrans()
|_ mutex_lock(&mtd_table_mutex)
|_ tr->remove_dev() -> inftl_remove_dev()
   |_ del_mtd_blktrans_dev()
      |_ put_mtd_device()
         |_ mutex_lock(&mtd_table_mutex) <--- AA deadlock

>  	}
>  
>  	old->mtd = NULL;

Note that I haven't actually tested this, so you may have introduced
other bad locking issues too. I'd expect a little more rigor out of a
patch marked for -stable, especially.

To that end, it looks like maybe we could use some better comments to
describe the expected locking. Patches are welcome, if you learn some
things in trying to verify your patch!

Speaking of that...

[*] I poked through the locking a bit more, and I see that such a
comment exists in mtd/blktrans.h:

struct mtd_blktrans_ops {
...
        /* Called with mtd_table_mutex held; no race with add/remove */
        int (*open)(struct mtd_blktrans_dev *dev);
        void (*release)(struct mtd_blktrans_dev *dev);
...
};

However, that is currently *not* the case. See blktrans_open() and
blktrans_release(), which you are modifying. They are calling tr->open()
and tr->release() *without* holding mtd_table_mutex. So the correct fix
might be to hold the table mutex for those entire functions.

Brian
