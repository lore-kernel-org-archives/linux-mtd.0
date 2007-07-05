Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6Rbj-00030X-EL
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 09:42:58 -0400
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JKP0072JKR8NX70@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 09:42:44 -0400 (EDT)
Date: Thu, 05 Jul 2007 09:42:42 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: Bogus usage of HZ in cfi_cmdset_0001.c
In-reply-to: <Pine.LNX.4.63.0707051445440.8578@pcgl.dsa-ac.de>
To: Guennadi Liakhovetski <gl@dsa-ac.de>
Message-id: <alpine.LFD.0.999.0707050934570.26459@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=us-ascii
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.63.0707051445440.8578@pcgl.dsa-ac.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 Jul 2007, Guennadi Liakhovetski wrote:

> Hi
> 
> There are several places in cfi_cmdset_0001.c (possibly others?) like
> 
> 		} else if (usec >= 1000000/HZ) {
> 		if (sleep_time >= 1000000/HZ) {
> 			sleep_time = 1000000/HZ;
> 	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
> 
> which means timeout (e.g., waiting for hardware) are hard-coded in ticks, 
> which can have variable duration. What should they really be?

They should be exactly what they are, on purpose.

Did you read the comments surrounding those locations?  They should 
provide sufficient hints to explain why things were done that way.

> The problem I am seeing is that on a PXA270-based system the unlock 
> operation sometimes returns with a timeout, when the CPU is running with 
> 520MHz, no problem up to 416MHz. Any idea?

Maybe your static memory space bus timings are not set up properly in 
the 520 MHz case?  In any case the CPU clock doesn't change the value of 
HZ anyway.


Nicolas
