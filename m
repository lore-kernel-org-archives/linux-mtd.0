MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Date: Wed, 06 Jan 2010 14:01:45 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Sending UTF-8 patches (was: [PATCH 2/2] Remove now-defunct ts7250
	nand driver)
In-reply-to: <1262803010.3181.8484.camel@macbook.infradead.org>
Message-id: <alpine.LFD.2.00.1001061357280.21025@xanadu.home>
References: <201001051459.58621.hartleys@visionengravers.com>
	<1262784693.3181.8034.camel@macbook.infradead.org>
	<20100106180705.GC11773@shareable.org>
	<1262803010.3181.8484.camel@macbook.infradead.org>
Cc: joff@embeddedarm.com, Jamie Lokier <jamie@shareable.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	H Hartley Sweeten <hartleys@visionengravers.com>, mcrapet@gmail.com,
	ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 6 Jan 2010, David Woodhouse wrote:

> On Wed, 2010-01-06 at 18:07 +0000, Jamie Lokier wrote:
> > That's unfortunate.  An option to git-am or it's subsidiary tools to
> > convert the patch as well as the commit would be useful.  After all it
> > _is_ made clear in the MIME header how it's formatted.
> 
> ISTR there was some resistance to that suggestion when git-am was first
> fixed to handle the Content-Type of mails. The idea was that the patch
> should be considered sacrosanct and shouldn't be mangled.

Well, initially git-am was "fixed" by providing an option to allow 
normalization to UTF-8 of patch metadata.  Nowadays this option is the 
default.  So at least providing an option to convert the patch content 
as well might be perfectly sane.


Nicolas
