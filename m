Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKyPO-0003Tc-72
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 15:29:43 +0100
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J56003L2DF4VVB0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 10:25:52 -0400 (EDT)
Date: Wed, 06 Sep 2006 10:25:52 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: Intel P30, locked sectors?
In-reply-to: <44FED214.7090309@kernelconcepts.de>
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Message-id: <Pine.LNX.4.64.0609061024300.18635@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <44FED214.7090309@kernelconcepts.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 6 Sep 2006, Nils Faerber wrote:

> Hi!
> I now did a kernel update (in fact, I started over with a new kernel)
> and am now using 2.6.18-RC6 from kernel.org.
> 
> I have read access to the flash, rootfs is mounted correctly but at
> first write attempt I get:
> 
> [42949375.150000] Freeing init memory: 96K
> [42949376.480000] Erase at 0x00cc0000 failed immediately: -EROFS. Is the
> sector locked?

Before the first write attempt you need to run flash-unlock on the 
corresponding flash partition.


Nicolas
