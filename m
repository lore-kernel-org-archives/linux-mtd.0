Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZovt-0007IA-BE
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2015 23:37:42 +0000
Received: by pacex6 with SMTP id ex6so23887083pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2015 16:37:20 -0700 (PDT)
Date: Wed, 9 Sep 2015 16:37:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Peng Fan <van.freenix@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: blktrans: fix integer overflow
Message-ID: <20150909233718.GA11487@google.com>
References: <1440169051-13891-1-git-send-email-van.freenix@gmail.com>
 <20150902170249.GQ81844@google.com>
 <20150905134224.GB17774@linux-4gyl.site>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150905134224.GB17774@linux-4gyl.site>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 05, 2015 at 09:42:27PM +0800, Peng Fan wrote:
> On Wed, Sep 02, 2015 at 10:02:49AM -0700, Brian Norris wrote:
> > One possibility, since you only point to a single computation that
> > overflows, is to just fix the overflow locally. It's not like the 'size'
> > (which represents number of sectors) is actually ever overflowing a
> > 32-bit integer. It's just the multiplication that overflows. So you
> > could cast to 64-bit arithmetic just for the multiplication. e.g.:
> > 
> > 	set_capcity(gd, ((u64)new->size * tr->blksize) >> 9);
> 
> Yeah. It is the multiplication overflowing a 32-bit interger. My frist
> implementation is this way, using u64 to do type cast. But I guess one
> day the number of sectors can be larger than UINT_MAX, so I change it
> to 'unsigned long long' from 'unsigned long', which is
> not the right way, thanks for correcting me.
> > 
> > Or some other creative solution.
> 
> I think this should be a bug fix. If you need a quick fix, I can send
> out the simple patch that just do (u64) cast. If not, I can take some
> time to "fix all the blktrans users".

I think since you've identified (and tested) a fix, we might as well
include it. So I suppose the cast approach. The larger change would be
more invasive and may take a while.

> > 
> > Then, we don't have to address this problem till we start seeing 2TB
> > MTDs!

Brian
