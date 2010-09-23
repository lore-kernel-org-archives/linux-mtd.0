Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oys5A-00056f-2i
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 20:07:52 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MO-MR006.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit))
	with ESMTP id <0L97003LURSZ9Z60@VL-MO-MR006.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 15:07:47 -0400 (EDT)
Date: Thu, 23 Sep 2010 15:07:47 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Subject: Re: NAND on MV78100
In-reply-to: <4C9B0CE3.6040703@kernelconcepts.de>
Message-id: <alpine.LFD.2.00.1009231500430.13233@xanadu.home>
References: <4C9B0CE3.6040703@kernelconcepts.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Sep 2010, Nils Faerber wrote:

> Hi!
> I am currently working on board support for a Marvell MV78100 based
> board. The MV78100 uses the same Orion SOC components as e.g. the
> Kirkwood which is quite well supported from OpenRD and SheevaPlug.
> 
> After some struggling I got the Orion NAND driver working, it detects
> the NAND chip properly (512MB) and assigns a partition. Everything seems
> OK so far.
> 
> But when I read from the device, e.g. just by "cat /dev/mtdblock1 | wc
> -c" it starts to fail with "uncorrectable error" after exactly 1MB
> (1024*1024).

This is most likely due to a difference in the ECC model used.
The quick "fix" would be to reformat the NAND (at least from the offset 
where it fails) using the Linux supported 1-bit ECC.

The Marvell LSPs (and most unfortunately the bootrom) are using a 
4-bit software ECC implementation that is poorly optimized, and layered 
backward.


Nicolas
