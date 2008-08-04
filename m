From: "Woodruff, Richard" <r-woodruff2@ti.com>
To: David Brownell <david-b@pacbell.net>, Lennert Buytenhek
	<buytenh@wantstofly.org>
Date: Mon, 4 Aug 2008 16:23:35 -0500
Subject: RE: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <13B9B4C6EF24D648824FF11BE89671620361EE1833@dlee02.ent.ti.com>
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<200808041302.46323.david-b@pacbell.net>
	<20080804201715.GD31974@xi.wantstofly.org>
	<200808041326.38840.david-b@pacbell.net>
In-Reply-To: <200808041326.38840.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>, "Kamat, Nishant" <nskamat@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Kyungmin Park <kmpark@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Monday 04 August 2008, Lennert Buytenhek wrote:
> > On Mon, Aug 04, 2008 at 01:02:46PM -0700, David Brownell wrote:
> >
> > > > Looks like this driver does not exist outside linux-omap tree,
> > > > care to send the whole driver to MTD list?
> > >
> > > Unless someone created a big-endian OMAP,
> >
> > Don't they use standard ARM ARM cores, which can all be used in both
> > LE and BE modes?
>
> And when those cores turn into silicon, the choice is usually
> hard-wired.  Regardless, all OMAP cores I've worked with are
> set up for LE mode ... and then there's still the point that
> byteswapping to/from the NAND chip seems to add no value.

Yes all OMAP-ARM's have been LE.

I've only used a couple ARMs in the past where it was run time configurable=
.  Most hardware hard wire it as Dave asserts.

As trivia you might find a BE-DSP in the OMAP1 SOC and LE-ARM.  So, interna=
l bridge chips usually allow hardware swapping.  OMAP3-DSP is LE.

The most visible BE-ARM seems to be Intel's IXP network processors.  Matchi=
ng network byte order apparently saves some cycles.  Earlier BE ones I reca=
ll were trying to pick up Mot-68K-BE sockets which had BE friendly peripher=
als.

Regards,
Richard W.
