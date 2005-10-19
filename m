Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESFQt-0005Vn-85
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 11:00:52 -0400
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IOM00E0H4D5AZ00@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 11:00:41 -0400 (EDT)
Date: Wed, 19 Oct 2005 11:00:41 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F92C2EFE7C3BA745855BF7036E1F3F9A014CE48D@NNSMSX401>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0510191058000.5288@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A014CE48D@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: RE: XIP & GCC optimization & halting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Oct 2005, Korolev, Alexey wrote:

> Disassembling of cfi_cmdset001.o showed that operation ("/") is mapped
> to __divsi3 and __udivsi3 call from arch/arm/lib. 

Ahhhh.

> Now I'm not clear about solution for the problem.

Select only one CFI buswidth and only one chip interleave when 
configuring your kernel.  That will allow gcc to precompute everything a 
t compile time and avoid the runtime divide.

I'll think of a way to enforce that in Kconfig.


Nicolas
