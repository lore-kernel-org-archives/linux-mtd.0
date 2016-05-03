Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axSYK-0004n0-Sp
 for linux-mtd@lists.infradead.org; Tue, 03 May 2016 05:07:22 +0000
Message-ID: <1462252005.16584.34.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Tom Rini
 <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 u-boot@lists.denx.de, "linux-sunxi@googlegroups.com"
 <linux-sunxi@googlegroups.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Alexander Kaplan <alex@nextthing.co>,
 Brian Norris <computersforpeace@gmail.com>
Date: Tue, 03 May 2016 00:06:45 -0500
In-Reply-To: <20160425225357.7bb6338d@bbrezillon>
References: <20160425164314.15c3fc94@bbrezillon>
 <20160425173646.GM3732@bill-the-cat> <20160425225357.7bb6338d@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [U-Boot] Porting Linux's MTD/NAND changes into U-Boot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-04-25 at 22:53 +0200, Boris Brezillon wrote:
> On Mon, 25 Apr 2016 13:36:46 -0400
> Tom Rini <trini@konsulko.com> wrote:
> 
> > On Mon, Apr 25, 2016 at 04:43:14PM +0200, Boris Brezillon wrote:
> > 
> > > Hi Scott,
> > > 
> > > I've recently contributed a lot of MTD/NAND related patches (and intend
> > > to continue doing so). Some of them are transversal changes touching the
> > > MTD and NAND framework internals, which implies patching all NAND
> > > drivers along with the core changes.
> > > 
> > > All those changes are required to properly handle modern NANDs (MLC/TLC
> > > NANDs), and I need them to add proper NAND support to the sunxi
> > > platform (and more particularly to the C.H.I.P from NextThing Co.).
> > > 
> > > So my question is, how should I port those changes to U-Boot? I see
> > > that your doing "synchronization commits", but in my case this mean
> > > including a bunch of driver specific changes into this "sync commit".
> > > 
> > > I think it's also worth mentioning that I plan to heavily rework the
> > > Linux NAND framework to improve NAND performances on modern NAND
> > > controllers and clarify the NAND chip / NAND controller concepts, and
> > > other people are also working on merging the BBT code of the NAND and
> > > OneNAND framework. Which unfortunately means that we're not done porting
> > > invasive changes to U-Boot :-/.
> > > 
> > > Any advice is welcome.  
> > 
> > I suppose my first suggestion would be to sync the kernel back into
> > U-Boot more frequently.  With our bi-monthly release cycle it shouldn't
> > be too hard to pick a window to grab the current kernel release and
> > bring it over.  I think the more stuff we let build up prior to syncing
> > the harder it will be.
> > 
> 
> Okay, so this means I should be the one back-porting Linux changes into
> U-Boot? I was planning on porting my current work on the sunxi NAND
> driver (including all the core dependencies) and submitting it to
> U-Boot, but honestly, I don't see how I can keep things in sync in the
> long run. From my experience, porting things to U-Boot is never as
> easy at it seems, and I don't think I'll have the time to maintain that
> by myself. Scott, what's your policy regarding Linux -> U-Boot syncs?
> Can I expect some help from your side?

I usually do syncs when someone complains about needing a sync.  Every release
seems a bit much.  I'll try to do one soon.

-Scott
