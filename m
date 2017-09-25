Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dwPxp-0003om-PK
 for linux-mtd@lists.infradead.org; Mon, 25 Sep 2017 09:46:12 +0000
Date: Mon, 25 Sep 2017 11:45:36 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mathias Thore <Mathias.Thore@infinera.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Regression for NOR flash with multiple erase block regions
Message-ID: <20170925114536.16ed16aa@bbrezillon>
In-Reply-To: <e30ea1c1d62348bb80cb7eb5d4c8d71a@sv-ex13-prd1.infinera.com>
References: <4762f230bbd3437990b9f5baa61ab095@sv-ex13-prd1.infinera.com>
 <74af973f5ae542c3b53240c95949628c@svr-chch-ex1.atlnz.lc>
 <20170922220455.04f89f08@bbrezillon>
 <a1416ffa136946f4bc6006324315ffb1@sv-ex13-prd1.infinera.com>
 <20170925093004.0e0af91e@bbrezillon>
 <f00b3228ec334c1baaff72c6dec25728@sv-ex13-prd1.infinera.com>
 <20170925101425.4389f713@bbrezillon>
 <e30ea1c1d62348bb80cb7eb5d4c8d71a@sv-ex13-prd1.infinera.com>
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

On Mon, 25 Sep 2017 08:57:24 +0000
Mathias Thore <Mathias.Thore@infinera.com> wrote:

> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> > Sent: den 25 september 2017 10:14
> > 
> > On Mon, 25 Sep 2017 08:05:03 +0000
> > Mathias Thore <Mathias.Thore@infinera.com> wrote:
> >   
> > > > -----Original Message-----
> > > > From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> > > > Sent: den 25 september 2017 09:30
> > > >
> > > > On Mon, 25 Sep 2017 06:28:18 +0000
> > > > Mathias Thore <Mathias.Thore@infinera.com> wrote:
> > > >  
> > > > > > From: Boris Brezillon
> > > > > > [mailto:boris.brezillon@free-electrons.com]
> > > > > > Sent: den 22 september 2017 22:05
> > > > > >
> > > > > > On Fri, 22 Sep 2017 18:27:42 +0000 Chris Packham
> > > > > > <Chris.Packham@alliedtelesis.co.nz> wrote:
> > > > > >  
> > > > > > > Hi Mathias,
> > > > > > >
> > > > > > > On 23/09/17 01:12, Mathias Thore wrote:  
> > > > > > > > Hello,
> > > > > > > >
> > > > > > > > Commit 1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc549 included  
> > in  
> > > > > > > > Linux  
> > > > > > 4.13 (  
> > > > > > > >  
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g
> > > > > > it/c
> > > > > > ommit/d
> > > > > >  
> > > >  
> > rivers/mtd/mtdpart.c?h=v4.13&id=1eeef2d7483a7e3f8d2dd2a5b9939b3b814  
> > > > > > dc549  
> > > > > > > > ) introduces a regression for NOR flash with multiple erase
> > > > > > > > block regions of different sizes.
> > > > > > > >
> > > > > > > > Only the largest erase block size seems to be considered
> > > > > > > > when determining if partitions are aligned. Partitions in
> > > > > > > > smaller regions will be mounted as read-only. With Linux
> > > > > > > > 4.12 and earlier, read/write access was available for these  
> > partitions.  
> > > > > >
> > > > > > I don't understand how this could work before this patch? I
> > > > > > mean, we were previously using mtd_mod_by_eb() to check part
> > > > > > alignment and this functions is just returning the remainder of
> > > > > > the off / erasesize division. So, assuming the erasesize of your
> > > > > > NOR did not change between 4.12 and 4.13, I don't see how this
> > > > > > commit could cause the regression you're describing here.  
> > > > >
> > > > > Looking at the earlier code, in the call to mtd_mod_by_eb, the
> > > > > parameter  
> > > > is slave->mtd. The slave mtd struct holds the correct erase size.
> > > > The new code uses wr_alignment for all alignment tests, which comes
> > > > from master/parent, and seems to always hold the largest possible erase  
> > size.  
> > > >
> > > > Oh indeed! I didn't notice that the initial mtd_mod_by_eb() test was
> > > > done against the slave dev and not the master one.
> > > >
> > > > Can you test the following patch and let me know it it solves your  
> > problem?  
> > >
> > > The patch does not compile in my 4.13 tree. However,
> > >
> > > 	if (!(slave->mtd.flags & MTD_NO_ERASE))
> > > 		wr_alignment = slave->mtd.erasesize; or
> > > 	if (!(master->flags & MTD_NO_ERASE))
> > > 		wr_alignment = slave->mtd.erasesize;
> > >
> > > do, and both work equally well to solve my problem.  
> > 
> > Oops. I'll fix that and send a new version.
> > 
> > Thanks,
> > 
> > Boris
> >   
> 
> Thank you for solving this problem!

No problem. Actually you're the one who found the bug and reported it
(and almost fixed it), so you're the one we should thank.

BTW, can you add your Tested-by/Reviewed-by on the last version? I'll
queue it for the next -rc.

Thanks,

Boris
