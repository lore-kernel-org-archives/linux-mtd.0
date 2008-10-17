Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqto3-0001er-OZ
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 18:12:12 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0K8W0060JAKACL50@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 14:12:10 -0400 (EDT)
Date: Fri, 17 Oct 2008 14:12:10 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-reply-to: <6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
Message-id: <alpine.LFD.2.00.0810171411210.26244@xanadu.home>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
	<alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
	<6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Oct 2008, Jared Hulbert wrote:

> > It is possible to setup flash physmap parameters in platform driver. In
> > the case of MainstoneII you just need to specify physmap flash data in mainstone.c
> > like this.
> 
> Right.  Which means you have to tweak the kernel sources when you
> remap things.  I much prefer to let these kinds of options and
> parameters not be hard coded into the kernel sources.

Do you have remapable hardware?  ;-)


Nicolas
