Received: from smtp2.linux-foundation.org ([207.189.120.14])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVkPk-0007xJ-8x
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 04:51:23 -0400
Date: Thu, 13 Sep 2007 01:49:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
Message-Id: <20070913014955.91f4602e.akpm@linux-foundation.org>
In-Reply-To: <8bd0f97a0709130145u474ab017ocf58b004c5d69dc0@mail.gmail.com>
References: <1188804323.29566.6.camel@roc-laptop>
	<20070913013702.d446739a.akpm@linux-foundation.org>
	<8bd0f97a0709130145u474ab017ocf58b004c5d69dc0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: bryan.wu@analog.com, linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Sep 2007 04:45:13 -0400 "Mike Frysinger" <vapier.adi@gmail.com> wrote:

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
> that isnt static so checkpatch.pl wouldnt have caught it ...

box:/usr/src/25> perl scripts/checkpatch.pl ~/x
ERROR: do not initialise externals to 0 or NULL
#186: FILE: drivers/mtd/nand/bf54x_nand.c:73:
+int hardware_ecc = 0;

> it should be static though of course

good point.

> and then checkpatch.pl would have thrown a
> static init 0 warning :)
> -mike
