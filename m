Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5wQQ-0007mR-4O
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:47:50 +0000
Message-ID: <1331286547.22872.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: Fix memory leak triggered by removal
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fubo Chen <fubo.chen@gmail.com>
Date: Fri, 09 Mar 2012 11:49:07 +0200
In-Reply-To: <4462354.EgehQQfXY4@asus>
References: <4462354.EgehQQfXY4@asus>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2012-02-25 at 16:57 +0000, Fubo Chen wrote:
>  	dev = rq->queuedata;
>  
> -	if (!dev)
> +	if (unlikely(blk_queue_dead(rq)))
>  		while ((req = blk_fetch_request(rq)) != NULL)
>  			__blk_end_request_all(req, -ENODEV);

I think this should be a separate patch with own commit message and
explanation. I guess you can kill 'dev' as well then?

>  	else {
> @@ -469,8 +469,6 @@ error1:
>  
>  int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
>  {
> -	unsigned long flags;
> -
>  	if (mutex_trylock(&mtd_table_mutex)) {
>  		mutex_unlock(&mtd_table_mutex);
>  		BUG();
> @@ -488,10 +486,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
>  	kthread_stop(old->thread);
>  
>  	/* Kill current requests */
> -	spin_lock_irqsave(&old->queue_lock, flags);
> -	old->rq->queuedata = NULL;
> -	blk_start_queue(old->rq);
> -	spin_unlock_irqrestore(&old->queue_lock, flags);
> +	blk_cleanup_queue(old->rq);

Please, provide better explanation in the commit message about which
problem you solve, why you do this, and how you tested this.
blktrans_dev_release() also calls blk_cleanup_queue() - why we need to
do it 2 times?

-- 
Best Regards,
Artem Bityutskiy
