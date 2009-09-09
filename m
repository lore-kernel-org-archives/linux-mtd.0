Received: from ganesha.gnumonks.org ([2001:780:45:1d:2e0:81ff:fe28:898a])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MlLDh-0001KB-OT
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 11:20:14 +0000
Date: Wed, 9 Sep 2009 20:13:18 +0900
From: Harald Welte <laforge@gnumonks.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [RFC] extending nand_ecclayout.eccpos once again
Message-ID: <20090909111318.GD4771@prithivi.gnumonks.org>
References: <20090902093045.GB7377@prithivi.gnumonks.org>
	<1252390415.5060.38.camel@localhost>
	<20090908152813.GC5579@shareable.org>
	<alpine.LFD.2.00.0909081321170.6044@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0909081321170.6044@xanadu.home>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	Jin-Sung Yang <jsgood.yang@samsung.com>,
	Jamie Lokier <jamie@shareable.org>, Ilho Lee <ilho215.lee@samsung.com>,
	Marc Zyngier <marc.zyngier@tomtom.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 08, 2009 at 01:26:20PM -0400, Nicolas Pitre wrote:
> On Tue, 8 Sep 2009, Jamie Lokier wrote:
> 
> > Artem Bityutskiy wrote:
> > > Can we instead assume that exposing ECC layout to user-space is jut bad
> > > idea, deprecate current layout ABI, and do not do this anymore.
> > > 
> > > I mean, really, ECC layout is generally not user's concern. Just do not
> > > expose it and problem is solved.
> > > 
> > > Is it absolutely necessary to have expose this stuff to user-space?
> 
> I admit having the same question from time to time.
> 
> > Let's rephrase that question.
> > What tools use this information?
> 
> Right.  And whether or not that tool is useful enough to warrant the 
> cost of maintening an interface to communicate that stuff from/to user 
> space.  I don't remember ever having to rely on that.

I have to agree with Artem, Jamie and you:  I personally don't think I've ever
used a tool that needs this interface, but I'll check.  The kernel source
actually contained a hint why it was exposed to userspace.

"ECC layout control structure. Exported to userspace for diagnosis and to allow
 creation of raw images"

I think the diagnosis is not really all that important (you can, after all,
look at the kernel source to determine the oob layout that is used)

Creating raw images?  I'm also not sure how often that is being done.  Why
would you precompute an image with ECC and then write that to NAND rather than
having the NAND layer generate the ECC while writing the image (like writing
any other data)?

-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
