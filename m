Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ6k5-00076r-It
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 20:33:24 +0000
From: David Brownell <david-b@pacbell.net>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Date: Mon, 4 Aug 2008 13:26:38 -0700
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<200808041302.46323.david-b@pacbell.net>
	<20080804201715.GD31974@xi.wantstofly.org>
In-Reply-To: <20080804201715.GD31974@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808041326.38840.david-b@pacbell.net>
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

On Monday 04 August 2008, Lennert Buytenhek wrote:
> On Mon, Aug 04, 2008 at 01:02:46PM -0700, David Brownell wrote:
> 
> > > Looks like this driver does not exist outside linux-omap tree,
> > > care to send the whole driver to MTD list?
> > 
> > Unless someone created a big-endian OMAP,
> 
> Don't they use standard ARM ARM cores, which can all be used in both
> LE and BE modes?

And when those cores turn into silicon, the choice is usually
hard-wired.  Regardless, all OMAP cores I've worked with are
set up for LE mode ... and then there's still the point that
byteswapping to/from the NAND chip seems to add no value.
