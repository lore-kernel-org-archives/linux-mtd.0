Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9gFx-0007xR-4J
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 15:11:26 +0000
Date: Wed, 5 May 2010 08:11:11 -0700
From: Tony Lindgren <tony@atomide.com>
To: Mike Rapoport <mike@compulab.co.il>
Subject: Re: Upcoming merge window and omap NAND patches
Message-ID: <20100505151111.GT29604@atomide.com>
References: <20100504220803.GN29604@atomide.com>
	<1273034943.3702.19.camel@localhost>
	<l2wce9ab5791005042311lf1c1a15fu891457f4e0863d6@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030D7DEB6B@dbde02.ent.ti.com>
	<4BE16AB8.7010308@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4BE16AB8.7010308@compulab.co.il>
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	Steve Sakoman <sakoman@gmail.com>,
	Vimal Singh <vimal.newwork@gmail.com>, "Ghorai, Sukumar" <s-ghorai@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Mike Rapoport <mike@compulab.co.il> [100505 05:51]:
> Ghorai,
> 
> Ghorai, Sukumar wrote:
> >Tony,
> >I understand your comment/input. And I will work on it.

Great, good to hear.

> >All existing omap3 boards are using same old fashion. So let me see how many board I can test before post the patch. I will update this next week.
> 
> I'd be glad to test the patches on CM-T35 if you'd like to.

For this merge window how about just getting rid of OMAP34XX_GPMC_VIRT
in the board-*.c files and move that to gpmc-nand.c?

This may allow adding more board-*.c NAND files without
having to patch all of them later on again.

However, if there are more changes needed to all the board-*.c
files for the NAND platform data, then let's just fix the existing
ones first before adding new ones.

After that, looks like most of the work is to move some of the
GPMC functions from omap2.c to gpmc.c.

Or should they rather be in gpmc-nand.c if they are only used
with NAND connected to GPMC?

Regards,

Tony
