Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Flnwj-0007EN-Cu
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 10:14:47 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J0600E7DQ8HVWD0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 10:14:42 -0400 (EDT)
Date: Thu, 01 Jun 2006 10:14:41 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: XIP kernel(2.6.11 with MTD) fail in compiling
In-reply-to: <447EEB2A.70307@sjtu.edu.cn>
To: "Chen,Xi" <xichen@sjtu.edu.cn>
Message-id: <Pine.LNX.4.64.0606011011240.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <447EEB2A.70307@sjtu.edu.cn>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 1 Jun 2006, Chen,Xi wrote:

> Hello,
> 
> I'm working on a PXA-272 based development board and trying to enable a 
> XIP kernel for it.

Please try a later kernel.

> I found an option in kernel configuration, named "MTD_XIP" and it seemed 
> a solution.

It is mandatory if you want to use MTD with a XIP kernel.

> I also added a "-mlong-calls" option to CFLAGS when XIP enabled, in case 
> some function
> calls exceeded the PC24 limitation in ARM.

This is unnecessary.  The XIP kernel is already properly located in 
memory so to not exceed linkage requirements on ARM.


Nicolas
