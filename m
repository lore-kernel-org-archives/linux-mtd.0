Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dvUCO-0008Ek-AM
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 20:05:22 +0000
Date: Fri, 22 Sep 2017 22:04:55 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Mathias Thore <Mathias.Thore@infinera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Regression for NOR flash with multiple erase block regions
Message-ID: <20170922220455.04f89f08@bbrezillon>
In-Reply-To: <74af973f5ae542c3b53240c95949628c@svr-chch-ex1.atlnz.lc>
References: <4762f230bbd3437990b9f5baa61ab095@sv-ex13-prd1.infinera.com>
 <74af973f5ae542c3b53240c95949628c@svr-chch-ex1.atlnz.lc>
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

On Fri, 22 Sep 2017 18:27:42 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi Mathias,
> 
> On 23/09/17 01:12, Mathias Thore wrote:
> > Hello,
> > 
> > Commit 1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc549 included in Linux 4.13 ( 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mtd/mtdpart.c?h=v4.13&id=1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc549 
> > ) introduces a regression for NOR flash with multiple erase block 
> > regions of different sizes.
> > 
> > Only the largest erase block size seems to be considered when 
> > determining if partitions are aligned. Partitions in smaller regions 
> > will be mounted as read-only. With Linux 4.12 and earlier, read/write 
> > access was available for these partitions.

I don't understand how this could work before this patch? I mean, we
were previously using mtd_mod_by_eb() to check part alignment and
this functions is just returning the remainder of the off / erasesize
division. So, assuming the erasesize of your NOR did not change
between 4.12 and 4.13, I don't see how this commit could cause the
regression you're describing here.

Maybe MTD_NO_ERASE is set on your NOR, and ->writesize is used in place
of ->erasesize to check the alignment, but ->writesize is normally set
to 1 on NOR devices, so again, no real reasons for this failure.

> 
> Sorry about that. I think a fix would be to re-calculate the 
> wr_alignment as we're looking at each erase block. Unfortunately I'm 
> about to get on a plane for 13 hours so I'm pretty much a write off for 
> the next couple of days.
> 
> I'll take a look when I get back on-line unless Boris beats me to it.
