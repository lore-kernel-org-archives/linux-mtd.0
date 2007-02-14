Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHRCF-0001YT-V0
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 15:57:49 -0500
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JDH00JA30WALJG0@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 15:57:47 -0500 (EST)
Date: Wed, 14 Feb 2007 15:57:46 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [SPAM]  Re: P30 flash left in read status mode after a write
In-reply-to: <45D373FE.7080900@ringle.org>
To: Jon Ringle <jon@ringle.org>
Message-id: <Pine.LNX.4.64.0702141556340.1757@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <45D35A6F.3060203@ringle.org>
	<Pine.LNX.4.64.0702141443270.1757@xanadu.home>
	<45D36C8F.9010102@ringle.org>
	<Pine.LNX.4.64.0702141526130.1757@xanadu.home>
	<45D373FE.7080900@ringle.org>
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

> > And how do you determine that you have a read failure?
> >
> > Because the flash doesn't necessarily always have 0x00800080 to show 
> > when outside of the read mode.
> >   
> True. However, the data that is being read has magic values and a 
> checksum for validity, so the likelihood of a false positive on passing 
> these tests is extremely unlikely.
> > Of course, since you have an unusual setup you can have an unusual patch 
> > in your own kernel tree for this issue.  But this isn't entirely safe 
> > since the Pentium code might be fooled by some other flash status output 
> > that doesn,t look like a read failure.
> >   
> I was intending for just patching my own kernel tree for this issue, 
> since this issue is unlikely to be of wider audience appeal. I just 
> wanted to present my problem to people that are more knowledgeable with 
> the mtd code as a sanity check for my solution.

Your solution looked sane.


Nicolas
