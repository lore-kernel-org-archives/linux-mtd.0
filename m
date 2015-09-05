Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYDjO-0003OK-R7
 for linux-mtd@lists.infradead.org; Sat, 05 Sep 2015 13:42:11 +0000
Received: by pacfv12 with SMTP id fv12so51813870pac.2
 for <linux-mtd@lists.infradead.org>; Sat, 05 Sep 2015 06:41:49 -0700 (PDT)
Date: Sat, 5 Sep 2015 21:42:27 +0800
From: Peng Fan <van.freenix@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: blktrans: fix integer overflow
Message-ID: <20150905134224.GB17774@linux-4gyl.site>
References: <1440169051-13891-1-git-send-email-van.freenix@gmail.com>
 <20150902170249.GQ81844@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150902170249.GQ81844@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 02, 2015 at 10:02:49AM -0700, Brian Norris wrote:
> On Fri, Aug 21, 2015 at 10:57:31PM +0800, Peng Fan wrote:
> > In drivers/mtd/mtd_blkdevs.c:
> > 406	set_capacity(gd, (new->size * tr->blksize) >> 9);
> > The type of new->size is unsigned long and the type of tr->blksize is int,
> > the result of 'new->size * tr->blksize' may exceed ULONG_MAX on 32bit
> > machines.
> > 
> > I use nand chip MT29F32G08CBADBWP which is 4GB and the parameters passed
> > to kernel is 'mtdparts=gpmi-nand:-(user)', the whole nand chip will be
> > treated as a 4GB mtd partition. new->size is 0x800000 and tr->blksize is
> > 0x200, 'new->size * tr->blksize' however is 0. This is what we do not want
> > to see.
> > 
> > Change the type of entry size of mtd_blktrans_dev to unsigned long long
> > to fix the overflow issue.
> > 
> > Signed-off-by: Peng Fan <van.freenix@gmail.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  include/linux/mtd/blktrans.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
> > index e93837f..3853d74 100644
> > --- a/include/linux/mtd/blktrans.h
> > +++ b/include/linux/mtd/blktrans.h
> > @@ -38,7 +38,7 @@ struct mtd_blktrans_dev {
> >  	struct mutex lock;
> >  	int devnum;
> >  	bool bg_stop;
> > -	unsigned long size;
> > +	unsigned long long size;
> 
> Sorry, you can't just do that. Some builds won't have right arithmetic
> instructions (or compiler helpers) to do certain 64-bit operations, so you
> either need to go and fix all the blktrans users to be more careful (e.g., do
> bit shifts instead of division/modulo), or else find another solution. See, on
> an ARM32 build:
> 
>   LD      init/built-in.o
> drivers/built-in.o: In function `nftl_add_mtd':
> :(.text+0x1369dc): undefined reference to `__aeabi_uldivmod'
> :(.text+0x1369f4): undefined reference to `__aeabi_uldivmod'
> :(.text+0x136a70): undefined reference to `__aeabi_uldivmod'
> drivers/built-in.o: In function `inftl_add_mtd':
> :(.text+0x137eb0): undefined reference to `__aeabi_uldivmod'
> :(.text+0x137ec8): undefined reference to `__aeabi_uldivmod'
> drivers/built-in.o::(.text+0x137f4c): more undefined references to `__aeabi_uldivmod' follow
> 

My bad. I only tested this patch on i.mx6 platform, but not take other platforms into consideration.

> >  	int readonly;
> >  	int open;
> >  	struct kref ref;
> 
> One possibility, since you only point to a single computation that
> overflows, is to just fix the overflow locally. It's not like the 'size'
> (which represents number of sectors) is actually ever overflowing a
> 32-bit integer. It's just the multiplication that overflows. So you
> could cast to 64-bit arithmetic just for the multiplication. e.g.:
> 
> 	set_capcity(gd, ((u64)new->size * tr->blksize) >> 9);

Yeah. It is the multiplication overflowing a 32-bit interger. My frist implementation is this way, using u64 to do type cast.
But I guess one day the number of sectors can be larger than UINT_MAX, so I change it to 'unsigned long long' from 'unsigned long', which is
not the right way, thanks for correcting me.
> 
> Or some other creative solution.

I think this should be a bug fix. If you need a quick fix, I can send out the simple patch that just do (u64) cast. If not, I can take
some time to "fix all the blktrans users".

Regards,
Peng.

> 
> Then, we don't have to address this problem till we start seeing 2TB
> MTDs!
> 
> Brian
