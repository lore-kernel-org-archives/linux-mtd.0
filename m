Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ml4Sh-0006hn-9H
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 17:26:39 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KPN0023JXRWYG21@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 13:26:21 -0400 (EDT)
Date: Tue, 08 Sep 2009 13:26:20 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [RFC] extending nand_ecclayout.eccpos once again
In-reply-to: <20090908152813.GC5579@shareable.org>
Message-id: <alpine.LFD.2.00.0909081321170.6044@xanadu.home>
References: <20090902093045.GB7377@prithivi.gnumonks.org>
	<1252390415.5060.38.camel@localhost>
	<20090908152813.GC5579@shareable.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	Jin-Sung Yang <jsgood.yang@samsung.com>,
	Ilho Lee <ilho215.lee@samsung.com>, Marc Zyngier <marc.zyngier@tomtom.com>,
	linux-mtd@lists.infradead.org, Harald Welte <laforge@gnumonks.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 Sep 2009, Jamie Lokier wrote:

> Artem Bityutskiy wrote:
> > Can we instead assume that exposing ECC layout to user-space is jut bad
> > idea, deprecate current layout ABI, and do not do this anymore.
> > 
> > I mean, really, ECC layout is generally not user's concern. Just do not
> > expose it and problem is solved.
> > 
> > Is it absolutely necessary to have expose this stuff to user-space?

I admit having the same question from time to time.

> Let's rephrase that question.
> What tools use this information?

Right.  And whether or not that tool is useful enough to warrant the 
cost of maintening an interface to communicate that stuff from/to user 
space.  I don't remember ever having to rely on that.


Nicolas
