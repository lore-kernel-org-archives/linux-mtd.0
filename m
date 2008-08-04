From: "Woodruff, Richard" <r-woodruff2@ti.com>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Date: Mon, 4 Aug 2008 17:10:21 -0500
Subject: RE: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <13B9B4C6EF24D648824FF11BE89671620361EE18FF@dlee02.ent.ti.com>
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<200808041302.46323.david-b@pacbell.net>
	<20080804201715.GD31974@xi.wantstofly.org>
	<200808041326.38840.david-b@pacbell.net>
	<13B9B4C6EF24D648824FF11BE89671620361EE1833@dlee02.ent.ti.com>
	<20080804213200.GH31974@xi.wantstofly.org>
	<13B9B4C6EF24D648824FF11BE89671620361EE18A2@dlee02.ent.ti.com>
	<20080804214910.GJ31974@xi.wantstofly.org>
In-Reply-To: <20080804214910.GJ31974@xi.wantstofly.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Kyungmin Park <kmpark@infradead.org>, Tony Lindgren <tony@atomide.com>,
	"Kamat, Nishant" <nskamat@ti.com>, David Brownell <david-b@pacbell.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hmmm.  So bit [7] of the system control register is ignored entirely,
> and if you write a 1 to it, nothing at all happens and the system
> boots as usual?  (To test, add a line "OBJS +=3D big-endian.o" to the
> top of arch/arm/boot/compressed/Makefile.)
>
> Does it also mean that the ARMv6 based OMAPs have the SETEND
> instruction behave as NOPs?

Last time I explicitly tried was back on OMAP1.  I then dug into doc's it w=
as said that the bit was hardwired at the integration point.  I don't recal=
l signal name.

Now, Peeking into OMAP2 (armv6) MPU integration docs I see that BIGENDINIT =
is pulled low.  This forces the behavior as I indicated.  OMAP3 (armv7) doe=
s something similar at cpu-to-bus bridge.

Doing a quick desktop search in documents I see the armv6 behavior is defin=
ed as part of BIGENDINIT in ARM TRMs.  I'll guess SETEND instruction follow=
s what ever that dictates.  I don't know as I've never tried.

Regards,
Richard W.
