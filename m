Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1916yH-0003YO-Vl
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 16:49:46 +0100
Date: Thu, 3 Apr 2003 17:49:25 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: John Burch <jburch@vincisystems.com>
Message-ID: <20030403154925.GC5651@wohnheim.fh-wedel.de>
References: <1049369136.14220.5.camel@passion.cambridge.redhat.com>
	<003501c2f9f6$dc7373a0$1200a8c0@JOHNB>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <003501c2f9f6$dc7373a0$1200a8c0@JOHNB>
cc: 'Kenneth Johansson' <kenneth.johansson@etx.ericsson.se>
cc: 'Mtd' <linux-mtd@lists.infradead.org>
cc: tglx@linutronix.de
cc: 'David Woodhouse' <dwmw2@infradead.org>
Subject: Re: Can mtd partition span multiple devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 3 April 2003 10:36:54 -0500, John Burch wrote:
> 
> I'm using 2.4.17 and I don't think mtdconcat is part of that kernel
> (though I may not need it anyway based on dwmw2's response).  Are the
> changes since then substantial, and can 2.4.17 be patched to support the
> latest mtd/jffs2 code?

I wouldn't patch the mtd/jffs2 part, unless I had to. The better
strategy is to update the whole kernel, but that is always a bit
tricky inside some companies.

> Second, you imply that a single chip probe will handle multiple devices
> (assuming contiguous addressing?).  Is this supported in 2.4.17 and is
> it a common approach to use for multiple devices?

That support has been in the official kernel since 2.4.2 or even
longer.

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
