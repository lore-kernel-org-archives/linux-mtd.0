Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqzeT-0004jD-V1
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 09:02:58 +0000
Date: Fri, 15 Apr 2016 11:02:36 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 alex@nextthing.co, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: [RFC] ubihealthd
Message-ID: <20160415110236.751cb28e@bbrezillon>
In-Reply-To: <20160415062604.GA31101@pengutronix.de>
References: <1446764403-22742-1-git-send-email-richard@nod.at>
 <20160415062604.GA31101@pengutronix.de>
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

On Fri, 15 Apr 2016 08:26:04 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Hi Richard, Daniel,
> 
> On Thu, Nov 05, 2015 at 11:59:59PM +0100, Richard Weinberger wrote:
> > ubihealthd is a tiny C program which takes care of your NAND.
> > It will trigger re-reads and scrubbing such that read-disturb and
> > data retention will be addressed before data is lost.
> > Currently the policy is rather trivial. It re-reads every PEB within
> > a given time frame, same for scrubbing and if a PEB's read counter exceeds
> > a given threshold it will also trigger a re-read.
> > 
> > At ELCE some people asked why this is done in userspace.
> > The reason is that this is a classical example of kernel offers mechanism
> > and userspace the policy. Also ubihealthd is not mandatory.
> > Depending on your NAND it can help you increasing its lifetime.
> > But you won't lose data immediately if it does not run for a while.
> > It is something like smartd is for hard disks.
> > I did this also in kernel space and it was messy.
> 
> I gave ubihealthd a try and it basically works as expected. I let it run
> on a UBI device with a ton of (artificial) bitflips and the demon crawls
> over them moving the data away.
> 
> Do you have plans to further work on this and to integrate it into the
> kernel and mtd-utils?
> 
> One thing I noticed is that ubihealthd always scrubs blocks, even when
> there are no bitflips in that block. Why is that done? I would assume
> that rewriting a block when there are more bitflips than we can accept
> is enough, no?

Yep, that's my opinion too: we should not scrub the block if we're
below the bitflip_threshold. If one wants to be conservative, and
scrub as soon as there's a single bitflip, he can always manually set
bitflips_threshold to something really low.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
