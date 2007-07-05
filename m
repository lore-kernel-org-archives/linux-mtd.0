Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6Tfe-0004qi-Hi
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 11:55:11 -0400
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JKP00IMCQV9EF50@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 11:54:46 -0400 (EDT)
Date: Thu, 05 Jul 2007 11:54:45 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: Bogus usage of HZ in cfi_cmdset_0001.c
In-reply-to: <Pine.LNX.4.63.0707051552270.8578@pcgl.dsa-ac.de>
To: Guennadi Liakhovetski <gl@dsa-ac.de>
Message-id: <alpine.LFD.0.999.0707051121090.26459@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=us-ascii
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.63.0707051445440.8578@pcgl.dsa-ac.de>
	<alpine.LFD.0.999.0707050934570.26459@xanadu.home>
	<Pine.LNX.4.63.0707051552270.8578@pcgl.dsa-ac.de>
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

> On Thu, 5 Jul 2007, Nicolas Pitre wrote:
> 
> > On Thu, 5 Jul 2007, Guennadi Liakhovetski wrote:
> > 
> > > Hi
> > > 
> > > There are several places in cfi_cmdset_0001.c (possibly others?) like
> > > 
> > > 		} else if (usec >= 1000000/HZ) {
> > > 		if (sleep_time >= 1000000/HZ) {
> > > 			sleep_time = 1000000/HZ;
> > > 	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
> > > 
> > > which means timeout (e.g., waiting for hardware) are hard-coded in ticks, 
> > > which can have variable duration. What should they really be?
> > 
> > They should be exactly what they are, on purpose.
> > 
> > Did you read the comments surrounding those locations?  They should 
> > provide sufficient hints to explain why things were done that way.
> 
> There are none (2.6.20.1) in the direct vicinity, that I could interpret 
> as relevant.

Let's see.

drivers/mtd/chips/cfi_cmdset_0001.c from line 1029:

|                } else if (usec >= 1000000/HZ) {
|                        /*
|                         * Try to save on CPU power when waiting delay
|                         * is at least a system timer tick period.
|                         * No need to be extremely accurate here.
|                         */
|                        xip_cpu_idle();

The important clue here is: "at least a system timer tick period".

>From line 1099:

|                if (sleep_time >= 1000000/HZ) {
|                        /*
|                         * Half of the normal delay still remaining
|                         * can be performed with a sleeping delay instead
|                         * of busy waiting.
|                         */
|                        msleep(sleep_time/1000);
|                        timeo -= sleep_time;
|                        sleep_time = 1000000/HZ;

The important clue is: "sleeping delay".

> > In any case the CPU clock doesn't change the value of 
> > HZ anyway.
> 
> Sure, but I just verified that just doubling the timeout when waiting for 
> unlock and the error is gone...

The unlock delay was indeed arbitrary set to the minimum sleepable delay 
possible.  Yet the code gives it a grace period of 8 times the provided 
delay.  So this value is most likely wrong, like 8 times too small, and 
probably right on the edge for your chip, then the faster CPU clock 
makes it fall on the other side of the fence.

It should instead be set to the real delay as specified by the data 
sheet, or better yet retrieved from the chip's feature table like for 
the other operation delays if it exists.


Nicolas
