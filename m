Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KqtiS-0001zd-36
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 18:06:24 +0000
Date: Fri, 17 Oct 2008 20:06:23 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
Message-ID: <20081017180623.GB4129@xi.wantstofly.org>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
	<alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
	<6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
Cc: nico@cam.org, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2008 at 10:58:10AM -0700, Jared Hulbert wrote:

> > It is possible to setup flash physmap parameters in platform driver.
> > In the case of MainstoneII you just need to specify physmap flash
> > data in mainstone.c like this.
> 
> Right.  Which means you have to tweak the kernel sources when you
> remap things.

How do you remap your flash chip?
