Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqdnh-0001OB-Jp
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 01:06:46 +0000
Date: Fri, 17 Oct 2008 03:06:43 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
Message-ID: <20081017010643.GE14569@xi.wantstofly.org>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, nico@cam.org,
	David Woodhouse <dwmw2@infradead.org>,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 16, 2008 at 05:30:27PM -0700, Jared Hulbert wrote:

> > I'd rather not extend the MTD_PHYSMAP_xxx options; in fact I'd prefer to
> > phase them out completely. The platform device and the device tree
> > should be perfectly sufficient.
> 
> Can you explain your plan here?  I like physmap.  The more powerful it
> is the fewer devices need to be described.

IMHO it's fine if physmap gets additional options, but those extra
options should be configured via platform data, and not via the legacy
CONFIG_MTD_PHYSMAP_xxx kernel config options.
