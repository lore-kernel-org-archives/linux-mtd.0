Received: from nwd2mail10.analog.com ([137.71.25.55])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IVkNY-0007lN-NE
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 04:48:56 -0400
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
From: Bryan Wu <bryan.wu@analog.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0709130145u474ab017ocf58b004c5d69dc0@mail.gmail.com>
References: <1188804323.29566.6.camel@roc-laptop>
	<20070913013702.d446739a.akpm@linux-foundation.org>
	<8bd0f97a0709130145u474ab017ocf58b004c5d69dc0@mail.gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Sep 2007 16:45:07 +0800
Message-Id: <1189673107.30686.18.camel@roc-desktop>
Mime-Version: 1.0
Cc: bryan.wu@analog.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Reply-To: bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-13 at 04:45 -0400, Mike Frysinger wrote:
> On 9/13/07, Andrew Morton <akpm@linux-foundation.org> wrote:
> > On Mon, 03 Sep 2007 15:25:23 +0800 Bryan Wu <bryan.wu@analog.com> wrote:
> > > This is the driver for latest Blackfin BF54x nand flash controller
> > >
> > >  - use nand_chip and mtd_info common nand driver interface
> > >  - provide both PIO and dma operation
> > >  - compiled with ezkit bf548 configuration
> > >  - use hardware 1-bit ECC
> > >  - tested with YAFFS2 and can mount YAFFS2 filesystem as rootfs
> > >
> > > ...
> > >
> > > +int hardware_ecc = 0;
> >
> > scripts/checkpatch.pl, please.
> 
> that isnt static so checkpatch.pl wouldnt have caught it ... it should
> be static though of course and then checkpatch.pl would have thrown a
> static init 0 warning :)

Actually, it would caught by checkpatch.pl even without static. 

Andrew, I think I sent out the try#2 version of this patch which fixed
these checkpatch.pl issues. But I will continue do some cleanup as you
point out.

Thanks
-Bryan Wu
