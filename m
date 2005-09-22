Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIUka-0003IK-7V
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 13:20:59 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IN8008ARAUHCQ70@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 13:20:41 -0400 (EDT)
Date: Thu, 22 Sep 2005 13:20:41 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.63.0509221318180.18381@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: Re: XIP fails on kernels  2.6.12 and higher
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 Sep 2005, Korolev, Alexey wrote:

> Hi all,
> 
> I can't bootup XIP linux kernel on Mainstone platform (based on PXA270
> processor). I tried several different kernel versions 
> 2.6.9, 2.6.11 - bootup with enabled XIP kernel feature fine.
> But 2.6.12 and 2.6.13 - faults at the start of booting. 
> I found very big changes between 2.6.12 and 2.6.11 in memory management
> code. I suspect it brokes XIP. 

If you can find the exact intermediate release between 2.6.11 and 2.6.12 
that broke it that would be extrelely helpful.

> Do you know this problem?

It has been reported in the past.

> Has XIP been broken on all platforms or just on Mainstone platform only?

This is generic code so probably on all platforms.


Nicolas
