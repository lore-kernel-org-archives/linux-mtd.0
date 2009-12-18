Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NLinj-0001lA-1w
	for linux-mtd@lists.infradead.org; Fri, 18 Dec 2009 19:47:51 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KUV00H9G5NMCU30@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 18 Dec 2009 14:47:46 -0500 (EST)
Date: Fri, 18 Dec 2009 14:47:46 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Dennis Millard <millard@iomega.com>
Subject: Re: 4bit NAND ECC
In-reply-to: <4B2A920A.5080808@iomega.com>
Message-id: <alpine.LFD.2.00.0912181443480.28241@xanadu.home>
References: <4B2A920A.5080808@iomega.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 Dec 2009, Dennis Millard wrote:

> Anyone who has worked with NAND ECC support, I have a question-
> 
>    I have a platform running the 2.6.30 kernel based on the Marvell 88F6281.
> It has 512 MB NAND flash, and is very similar to the Marvell Sheevaplug
> reference design.  My Uboot is using 4bit NAND ECC to write the kernel and
> ramdisk to flash.  However, I recently discovered that the 2.6.30 kernel does
> not support 4bit ECC mode.  When I try to access the Uboot environment
> variables from the running kernel, I can only use 1bit ECC.  When I switch
> Uboot to use 1bit ECC, I get lots of errors while accessing the Uboot vars in
> flash.  I've been told that I really should be using 4bit ECC in Uboot.
> 
>    I noticed that the 2.6.32 kernel supports 4bit ECC, but it appears to be
> only for the TI DaVinci CPU.  Can someone confirm this?  Does this mean that
> 4bit ECC is not available for general use in the 2.6.32 kernel?  Does anyone
> know of a patch that would make it available for the Marvell 88F6281?

The Davinci 4-bit ECC support is about hardware ECC.

I'm sitting on software 4-bit ECC code that I still have to integrate 
with the MTD code at some point.

And you should really avoid using flash for ramdisks.  Better use 
JFFS2 or UBIFS directly rather than using a ramdisk.


Nicolas
