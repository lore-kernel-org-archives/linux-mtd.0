Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHQob-0000fA-3E
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 15:33:24 -0500
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JDG00I1JZR9R3N0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 15:33:10 -0500 (EST)
Date: Wed, 14 Feb 2007 15:33:09 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [SPAM]  Re: P30 flash left in read status mode after a write
In-reply-to: <45D36C8F.9010102@ringle.org>
To: Jon Ringle <jon@ringle.org>
Message-id: <Pine.LNX.4.64.0702141526130.1757@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <45D35A6F.3060203@ringle.org>
	<Pine.LNX.4.64.0702141443270.1757@xanadu.home>
	<45D36C8F.9010102@ringle.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Feb 2007, Jon Ringle wrote:

> Nicolas Pitre wrote:
> > First, why is this a problem for you?
> >
> >   
> This is a problem on our (unusual) hardware because we have a Pentium M
> processor (not running Linux) that reads fconfig partition outside the context
> of the IXP processor that is running Linux. It does so via data path: Pentium
> -> PCI -> IXP Expansion bus -> Flash. This data path allows the Pentium to
> directly access the fconfig partition without needing any active code on the
> IXP's arm core processor to do anything to facilitate such access by the
> Pentium. However, when the mtd driver leaves the flash in read status mode,
> the Pentium just reads 0x0080 when trying to read the fconfig partition. With
> a change to have the mtd driver put the flash back into ready mode after a
> write, then I think that the Pentium only needs to deal with a temporary read
> failure if it happens to do a read at the same time that a write is occurring
> on the jffs2. In which case, the Pentium code simply spins retrying to do the
> read until it is successful.

And how do you determine that you have a read failure?

Because the flash doesn't necessarily always have 0x00800080 to show 
when outside of the read mode.

Of course, since you have an unusual setup you can have an unusual patch 
in your own kernel tree for this issue.  But this isn't entirely safe 
since the Pentium code might be fooled by some other flash status output 
that doesn,t look like a read failure.


Nicolas
