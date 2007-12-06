Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J0N5H-0007uX-Lt
	for linux-mtd@lists.infradead.org; Thu, 06 Dec 2007 20:12:42 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JSN005LC9GOV3I0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 06 Dec 2007 15:12:24 -0500 (EST)
Date: Thu, 06 Dec 2007 15:12:24 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Jon Ringle <JRingle@vertical.com>
Subject: Re: Banking flash
In-reply-to: <4DD3AF7ECBBC43409BA36508938D01852CE779@CVAEX1.VERTICAL.COM>
Message-id: <alpine.LFD.0.99999.0712061511480.555@xanadu.home>
References: <4DD3AF7ECBBC43409BA36508938D01852CE779@CVAEX1.VERTICAL.COM>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 6 Dec 2007, Jon Ringle wrote:

> Hi,
> 
> We are in the process of designing a new board around the IXP435. The
> IXP435 has 4 Expansion bus chip selects with an address space of 16MB
> per chip select. I can only use CS0 for flash because the other 3 CSs
> are being used for other purposes. The challenge that we have is that we
> require 32MB of flash storage. One of the options that we are
> considering is to use a GPIO pin to bank 16MB of a 32MB Intel Strata
> flash chip at any given time to CS0's 16MB address space. I am trying to
> access the scope of work to be done in Linux to accomplish this and I am
> asking for feedback on this idea.

You will only need a custom map driver which is pretty trivial to do.


Nicolas
