Received: from smtp124.sbc.mail.sp1.yahoo.com ([69.147.64.97])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5m0C-0005tn-I4
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 18:21:57 +0000
From: David Brownell <david-b@pacbell.net>
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [patch 2.6.26-rc5-git] at91_nand speedup via {read, write}s{b,
	w}()
Date: Mon, 9 Jun 2008 11:21:53 -0700
References: <200806090313.28515.david-b@pacbell.net>
	<200806091007.37494.david-b@pacbell.net>
	<20080609194859.3a9b5fcb@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <20080609194859.3a9b5fcb@hskinnemo-gx745.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200806091121.53579.david-b@pacbell.net>
Cc: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 June 2008, Haavard Skinnemoen wrote:
> > real    0m20.226s
> > user    0m0.010s
> > sys     0m6.000s
>
> Hmm, that's odd. What's the CPU doing during the remaining 14 seconds?
> It can't possibly be sleeping?
>
> Ah, it's I/O wait, isn't it? Because you're going through the block
> layer?

Some of it is surely data copying, but yes /dev/mtdblock0 might
have something to do with it.  I was puzzled by this too, which
is part of why I quoted only elapsed time.


> Yeah...I'm still not sure where to send it though, since it touches
> three different subsystems. I can set up a separate tree for it like
> I've done a couple of times before...though I'm not sure if anyone ever
> pulls it.

Three subsystems ... you mean, ARM, AVR32, MTD?  If MTD patches
merged more promptly, I'd suggest it goes through there.  Else
maybe you should just get acks from the other maintainers and
push the rename+ directly to Linus once 2.6.27-rc0 starts.

- Dave
