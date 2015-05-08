Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqW8K-0008TT-4Y
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 00:27:16 +0000
Received: by pdbqd1 with SMTP id qd1so55284753pdb.2
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 17:26:54 -0700 (PDT)
Date: Thu, 7 May 2015 17:26:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>
Subject: Re: [PATCH] mtd: fix: avoid race condition when accessing
 mtd->usecount
Message-ID: <20150508002649.GX32500@ld-irv-0074>
References: <1429611622-2652-1-git-send-email-giuseppe.cantavenera.ext@nokia.com>
 <20150508001012.GV32500@ld-irv-0074>
 <20150508001745.GW32500@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150508001745.GW32500@ld-irv-0074>
Cc: lorenzo.restelli.ext@nokia.com, zhangxingcai <zhangxingcai@huawei.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, fengfuqiu@huawei.com,
 alexander.sverdlin@nokia.com, tanhaijun@huawei.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 07, 2015 at 05:17:45PM -0700, Brian Norris wrote:
> On Thu, May 07, 2015 at 05:10:12PM -0700, Brian Norris wrote:
> > On Tue, Apr 21, 2015 at 12:20:22PM +0200, Giuseppe Cantavenera wrote:
> > > @@ -484,7 +486,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
> > >  	if (old->open) {
> > >  		if (old->tr->release)
> > >  			old->tr->release(old);
> > > -		__put_mtd_device(old->mtd);
> > > +		put_mtd_device(old->mtd);
> > 
> > This looks wrong. See:
> [...]
> > deregister_mtd_blktrans()
> > |_ mutex_lock(&mtd_table_mutex)
> > |_ tr->remove_dev() -> inftl_remove_dev()
> >    |_ del_mtd_blktrans_dev()
> >       |_ put_mtd_device()
> >          |_ mutex_lock(&mtd_table_mutex) <--- AA deadlock
> 
> What's more, this code in del_mtd_blktrans_dev() makes it obvious that
> this hunk is wrong:
> 
> int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
> {
>         unsigned long flags;
> 
>         if (mutex_trylock(&mtd_table_mutex)) {
>                 mutex_unlock(&mtd_table_mutex);
>                 BUG();
>         }
> 	...
> 
> So rather than a comment, the code is showing that it's a BUG() to not
> be holding mtd_table_mutex already.

As an alternative to your patch, how about the following?

BTW, this does still leave a usecount race in
drivers/mtd/maps/vmu-flash.c. But that driver should really be using
mtd->_get_device(), if it actually wants its own refcount.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 2b0c52870999..df7c6c70757a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -197,6 +197,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
 
 	mutex_lock(&dev->lock);
+	mutex_lock(&mtd_table_mutex);
 
 	if (dev->open)
 		goto unlock;
@@ -220,6 +221,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 
 unlock:
 	dev->open++;
+	mutex_unlock(&mtd_table_mutex);
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
@@ -230,6 +232,7 @@ error_release:
 error_put:
 	module_put(dev->tr->owner);
 	kref_put(&dev->ref, blktrans_dev_release);
+	mutex_unlock(&mtd_table_mutex);
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
@@ -243,6 +246,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 		return;
 
 	mutex_lock(&dev->lock);
+	mutex_lock(&mtd_table_mutex);
 
 	if (--dev->open)
 		goto unlock;
@@ -256,6 +260,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 		__put_mtd_device(dev->mtd);
 	}
 unlock:
+	mutex_unlock(&mtd_table_mutex);
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 }
