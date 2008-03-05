Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWurv-000416-TM
	for linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 14:45:20 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JX900K22IB8TT40@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 09:45:08 -0500 (EST)
Date: Wed, 05 Mar 2008 09:45:08 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [MTD][NOR] adding physical address to point()
In-reply-to: <6934efce0803050213i6908afbbn5655f13d10309c38@mail.gmail.com>
Message-id: <alpine.LFD.1.00.0803050943140.2947@xanadu.home>
References: <6934efce0803050213i6908afbbn5655f13d10309c38@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 Mar 2008, Jared Hulbert wrote:

> [MTD][NOR] adding physical address to point()
> 
> Adding the ability to get a physical address from point() in addition
> to virtual address.  This physical address is required for XIP of
> userspace code from flash.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> Reviewed-by: Joern Engel <joern@logfs.org>

Acked-by: Nicolas Pitre <nico@cam.org>

> We've looked at this before.  Joern came up with the idea and I've
> been doing the patch.  For a while I thought I could drop this patch.
> Turns out I do need it after all.

I think that's the only sensible thing to do anyway.


Nicolas
