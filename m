Received: from mail.dsa-ac.de ([62.112.80.99])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6SGi-0003nW-UN
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 10:25:19 -0400
Date: Thu, 5 Jul 2007 16:25:12 +0200 (CEST)
From: Guennadi Liakhovetski <gl@dsa-ac.de>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: Bogus usage of HZ in cfi_cmdset_0001.c
In-Reply-To: <alpine.LFD.0.999.0707050934570.26459@xanadu.home>
Message-ID: <Pine.LNX.4.63.0707051552270.8578@pcgl.dsa-ac.de>
References: <Pine.LNX.4.63.0707051445440.8578@pcgl.dsa-ac.de>
	<alpine.LFD.0.999.0707050934570.26459@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 Jul 2007, Nicolas Pitre wrote:

> On Thu, 5 Jul 2007, Guennadi Liakhovetski wrote:
> 
> > Hi
> > 
> > There are several places in cfi_cmdset_0001.c (possibly others?) like
> > 
> > 		} else if (usec >= 1000000/HZ) {
> > 		if (sleep_time >= 1000000/HZ) {
> > 			sleep_time = 1000000/HZ;
> > 	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
> > 
> > which means timeout (e.g., waiting for hardware) are hard-coded in ticks, 
> > which can have variable duration. What should they really be?
> 
> They should be exactly what they are, on purpose.
> 
> Did you read the comments surrounding those locations?  They should 
> provide sufficient hints to explain why things were done that way.

There are none (2.6.20.1) in the direct vicinity, that I could interpret 
as relevant. The only somewhat relevant comment I found in 
cfi_cmdset_0002.c:

	/*
	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
	 * have a max write time of a few hundreds usec). However, we should
	 * use the maximum timeout value given by the chip at probe time
	 * instead.  Unfortunately, struct flchip does have a field for
	 * maximum timeout, only for typical which can be far too short
	 * depending of the conditions.	 The ' + 1' is to avoid having a
	 * timeout of 0 jiffies if HZ is smaller than 1000.
	 */
	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;

but HZ/1000 + 1 I can understand. But not just 1000000/HZ, sorry, which 
comment was it?

> > The problem I am seeing is that on a PXA270-based system the unlock 
> > operation sometimes returns with a timeout, when the CPU is running with 
> > 520MHz, no problem up to 416MHz. Any idea?
> 
> Maybe your static memory space bus timings are not set up properly in 
> the 520 MHz case?

AFAICS, bus timing shouldn't change between

Run Mode clock: 208.00MHz (*16)
Turbo Mode clock: 520.00MHz (*2.5, active)
Memory clock: 208.00MHz (/2)
System bus clock: 208.00MHz

and

Run Mode clock: 208.00MHz (*16)
Turbo Mode clock: 416.00MHz (*2.0, active)
Memory clock: 208.00MHz (/2)
System bus clock: 208.00MHz

or am I mistaken?

> In any case the CPU clock doesn't change the value of 
> HZ anyway.

Sure, but I just verified that just doubling the timeout when waiting for 
unlock and the error is gone...

Thanks
Guennadi
---------------------------------
Guennadi Liakhovetski, Ph.D.
DSA Daten- und Systemtechnik GmbH
Pascalstr. 28
D-52076 Aachen
Germany
