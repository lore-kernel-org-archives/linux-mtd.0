Received: from out1.zte.com.cn ([202.103.147.172] helo=zte.com.cn)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY6jc-00072K-52
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 03:32:37 +0000
In-Reply-To: <CAFLxGvxfzHudUMRc7VkgWMO9RJAkyh1iuouRAV-0s-5eaLqfEQ@mail.gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: Re: Re: [PATCH] UBI: fix memory leak when use fastmap
MIME-Version: 1.0
Message-ID: <OFE7F9663A.1F3DE1BE-ON48257B60.00045684-48257B60.001360DF@zte.com.cn>
From: wang.bo116@zte.com.cn
Date: Fri, 3 May 2013 11:31:28 +0800
Content-Type: text/plain; charset="US-ASCII"
Cc: liu.dong3@zte.com.cn, artem.bityutskiy@linux.intel.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

richard -rw- weinberger <richard.weinberger@gmail.com> write 2013-05-03 
03:21:33:

> On Thu, May 2, 2013 at 10:30 AM,  <wang.bo116@zte.com.cn> wrote:
> >> Hi!
> >>
> >> On Tue, Apr 16, 2013 at 10:53 AM,  <wang.bo116@zte.com.cn> wrote:
> >> > Hello,
> >> >         Sorry, there is still something wrong with the previous
> > patch's
> >> > format, try to submit it again. When use ubi fastmap, there is a
> > memory
> >> > leak which will make destroy_ai() fail to free the slab alloced in
> >> > scan_fast(). The following patch fix this problem by use a 
temporary
> >> > "ubi_attach_info" variable in scan_fast().
> >>
> >> Thanks a lot for your patch!
> >>
> >> Did you test it well?
> >> We need to make sure that it does the right thing for the following
> > cases:
> >> 1. fastmap disabled, attaching a non-fastmap volume
> >> 1. fastmap disabled, attaching a fastmap volume
> >> 3. fastmap enabled, attaching a non-fastmap volume
> >> 4. fastmap enablled, attaching a fastmap volume
> >>
> >> --
> >> Thanks,
> >> //richard
> >
> >
> > Thanks for your advice. I consider this problem like this:
> > 1: if fastmap not config, ubi_attach() just call scan_all(ubi, ai, 0),
> > there is nothing changed, so there is all right.
> >
> > 2: if fastmap config, and force_scan is 0, ubi_attach() will call
> > scan_fast(), when scan_fast() return, temp ai used in scan_fast() has 
been
> > free, and there will be two conditions:
> > A: scan_fast() return UBI_NO_FASTMAP(may be flash is empty or 
attaching a
> > non-fastmap volume), all ubi_attach() need is to call scan_all(ubi, 
ai, 0)
> > to scan all blocks.
> > B: scan_fast() return UBI_BAD_FASTMAP, ubi_attach() first free ai used 
in
> > ubi_scan_fastmap(), then alloc a clean ai, at last call scan_all(ubi, 
ai,
> > 0) to scan all blocks.
> >
> > 3: if fastmap config, and force_scan is 1, just call scan_all(ubi, ai, 
0).
> >
> > This patch pass the following cases(include attach and detach):
> > 1. fastmap config, flash is empty,fm_autoconvert is 1.
> > 2. fastmap config, flash is empty,fm_autoconvert is 0.
> > 3. fastmap config, attaching a fastmap volume
> > 4. fastmap config, attaching a bad fastmap volume
> > 5. fastmap config, attaching a non-fastmap volume
> > 6. fastmap not config, attaching a fastmap volume
> > 7. fastmap not config, attaching a non-fastmap volume
> > 8. fastmap not config, flash is empty.
> 
> Good. :)
> 
> > By the way, the problem may cause ubi_attach() fail after ubi detach 
when
> > CONFIG_DEBUG_VM config.
> > The reason is that ubi_attach() will alloc a slab cache, but the
> > kmem_cache_sanity_check() will find the slab cache is already 
exist(not
> > been free after last detach), so slab cache alloc fail, and 
ubi_attach()
> > fail, too.
> 
> Doesn't your patch address this issue too?
> If not, we should fix this.Th

The patch had already fix the above problem mentioned. 
Now, all the slabs belong to the slab-cache named "ubi_aeb_slab_cache" can 
be rightly freed, so the slab-cache can be rightly freed when ubi_attach() 
return.
When ubi attach again after detach, ubi can alloc a slab-cache named "
ubi_aeb_slab_cache" again.
 

Thanks
---wangbo
