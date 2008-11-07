Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KyKLJ-0001Gh-SF
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 05:57:14 +0000
Date: Fri, 7 Nov 2008 05:57:08 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Trent Piepho <tpiepho@freescale.com>
Subject: Re: flash read performance
Message-ID: <20081107055708.GG17593@shareable.org>
References: <gea0sh$j97$1@ger.gmane.org> <49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org> <49098716.1010404@thomson.net>
	<490F096D.5060208@imms.de> <20081104114229.GA1673@shareable.org>
	<49105CAB.3000706@imms.de>
	<Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
	<20081107040200.GB17593@shareable.org>
	<Pine.LNX.4.64.0811062121130.3864@t2.domain.actdsltmp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0811062121130.3864@t2.domain.actdsltmp>
Cc: Arnaud Mouiche <arnaud.mouiche@thomson.net>,
	Andre Puschman <andre.puschmann@imms.de>,
	MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trent Piepho wrote:
> On Fri, 7 Nov 2008, Jamie Lokier wrote:
> > Based on Andre's observation, I will soon try enabling cache for my
> > NOR, and see if it makes a difference to cold-cache read performance.
> > I don't expect it, but it's worth a try.
> 
> It possible it could help by efficiently doing the reads back-to-back with
> no wasted cycles between them.  I think it's necessary if you want to
> benefit from page mode, but that's something I haven't tried yet.
> 
> > You might also find the write operation to be unreliable, if the
> > caching mode is write-back rather than write-through.
> 
> Proper use of "sync" instructions, or whatever the arch uses to insure that
> writel() is strictly ordered should fix that.

I think that won't work because strongly ordered writes don't
translate directly to bus transactions when the region is mapped with
ioremap_cached().  The flash wants exact bus transactions.

-- Jamie
