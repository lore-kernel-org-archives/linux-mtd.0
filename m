Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SK46K-0003mG-J5
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 08:49:32 +0000
Date: Tue, 17 Apr 2012 10:48:30 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
Message-ID: <20120417084830.GA4421@parrot.com>
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
 <1332239983.11468.14.camel@sauron.fi.intel.com>
 <loom.20120329T173823-262@post.gmane.org>
 <1334330445.2544.83.camel@sauron.fi.intel.com>
 <20120414121105.GB6207@parrot.com> <1334406762.2263.35.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1334406762.2263.35.camel@koala>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matteo Mattei <matteo.mattei@gmail.com>,
 Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 14, 2012 at 01:32:40PM +0100, Artem Bityutskiy wrote:
> On Sat, 2012-04-14 at 14:11 +0200, Ivan Djelic wrote:
> > On Fri, Apr 13, 2012 at 04:20:45PM +0100, Artem Bityutskiy wrote:
> > > > > On Fri, 2012-03-16 at 17:14 +0100, Matteo Mattei wrote:
> > > > > > Hi guys,
> > > > > > 
> > > > > > I am working hard on UBIFS to make it works on 2.6.32 and OMAP3530.
> > > > > > 
> > > > > > I already posted some requests to TI forum but I have no answers up to now:
> > > > > > http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx#627875
> > 
> > Hello Matteo,
> > 
> > I have been using a very similar setup (2.6.32 + OMAP3630), and I added BCH support
> > (8-bit correction) to the mtd omap2 driver, using the BCH library (not TI implementation).
> > My patch corrects bitflips on empty space (erased pages), so that UBIFS does not choke on corrupted empty space.
> > 
> > I posted a patch a while ago, albeit for a more recent kernel version:
> > http://lists.infradead.org/pipermail/linux-mtd/2011-October/038207.html
> > bit I did not get much feedback from TI maintainers.
> > 
> > If you have some trouble backporting this patch to your kernel, let me know, I may
> > have an old 2.6.32 version of the patch somewhere on my hdd :).
> 
> If we have a "tested-by" - we can make them go in via the MTD tree. It
> looks like Matthieu successfully tested them?

Yes; I guess I'll need to submit a patch to linux-omap first, because OMAP GPMC related code
(needed for ecc) has been moved from the mtd driver to arch/arm/mach-omap2.
Also, I wrote the patch for 2.6.35, and I don't have much resources to run it on a recent
kernel. If Matteo or anybody interested could test it, that would be great.

BR,
--
Ivan
