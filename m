Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecCDb-0003kO-ML
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 15:35:13 +0000
Date: Thu, 18 Jan 2018 16:34:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH -next] mtd: ubi: wl: Fix error return code in ubi_wl_init()
Message-ID: <20180118163445.5e465f90@bbrezillon>
In-Reply-To: <20180118151132.255e0173@bbrezillon>
References: <1516284305-82544-1-git-send-email-weiyongjun1@huawei.com>
 <20180118150801.714ecc34@bbrezillon>
 <20180118151132.255e0173@bbrezillon>
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

On Thu, 18 Jan 2018 15:11:32 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Thu, 18 Jan 2018 15:08:01 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > On Thu, 18 Jan 2018 14:05:05 +0000
> > Wei Yongjun <weiyongjun1@huawei.com> wrote:
> >   
> > > Fix to return error code -ENOMEM from the kmem_cache_alloc() error
> > > handling case instead of 0, as done elsewhere in this function.    
> > 
> > I guess you've used a static analysis code to detect this problem, can
> > you name it in the commit message, and paste the error/warning message
> > it reported next time you submit this kind of patch.
> >   
> > > 
> > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>    
> > 
> > NAck. I you read the code you'll see that err is initialized to -ENOMEM
> > here [1], so these changes are actually not needed.  
> 
> Sorry, just realized I was wrong. It seems that err can be overridden by
> [2]. So this patch is indeed fixing a real problem.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Oh, and you can add:

Fixes: f78e5623f45b ("ubi: fastmap: Erase outdated anchor PEBs during attach")

> 
> >   
> > > ---
> > >  drivers/mtd/ubi/wl.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> > > index 77ab49f..2052a64 100644
> > > --- a/drivers/mtd/ubi/wl.c
> > > +++ b/drivers/mtd/ubi/wl.c
> > > @@ -1617,8 +1617,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
> > >  		cond_resched();
> > >  
> > >  		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> > > -		if (!e)
> > > +		if (!e) {
> > > +			err = -ENOMEM;
> > >  			goto out_free;
> > > +		}
> > >  
> > >  		e->pnum = aeb->pnum;
> > >  		e->ec = aeb->ec;
> > > @@ -1637,8 +1639,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
> > >  			cond_resched();
> > >  
> > >  			e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> > > -			if (!e)
> > > +			if (!e) {
> > > +				err = -ENOMEM;
> > >  				goto out_free;
> > > +			}
> > >  
> > >  			e->pnum = aeb->pnum;
> > >  			e->ec = aeb->ec;
> > >     
> > 
> > [1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mtd/ubi/wl.c?h=next-20180118#n1596  
> 
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mtd/ubi/wl.c?h=next-20180118#n1609
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
