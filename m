Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEprK-00076T-Ib
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 10:37:00 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IVI00EEIBDAGWF0@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 10:36:46 -0500 (EST)
Date: Thu, 02 Mar 2006 10:36:46 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F92C2EFE7C3BA745855BF7036E1F3F9A01A420F2@NNSMSX401>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0603021012120.29834@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01A420F2@NNSMSX401>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: RE: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 1 Mar 2006, Korolev, Alexey wrote:

> Hi all,
> 
> Several days ago I sent this patch to the list. I wonder are there any
> objections to it?

I do have some.

> I guess this patch shouldn't break anything. It just fixes write errors
> I saw in our tests. The patch has been verified on several
> configurations. 

It is not a proper fix.  Something else doesn't work as expected.

> If you don't mind I will commit it by the end of this week.

Please don't just yet.

> The scenario of the issue is following:
>  
> 1. do_write_buffer 
> 2. Waiting for write complete in xip_udelay
> 3. System Interrupt
> 4. Write suspend
> 5. Rescheduling
> 6. Block erasing by other process. ( This operation typically took
> rather long time )
> 7. Complete, rescheduling 
> 8. Return to write (write is not complete due to suspend ). 
> 9. Check timeout. Time is up.
> 10. Error.

This should not happen.  And if it does then the bug is in xip_udelay() 
and therefore should be fixed there.

The fact is, xip_udelay() should not return until either the flash 
status is 0x80 (done) or the delay expired.  The code looks like:

	...
	start = xip_curtime();
	...
	do {
		...
		if (xip_irqpending()...) {
			/* suspend code */
			...
			[here we substract the time waited so far]
			usec -= xip_elapsed_since(start);
			...
			/* schedule code */
			...
			/* Resume the write or erase operation */
			map_write(map, CMD(0xd0), adr);
			map_write(map, CMD(0x70), adr);
			chip->state = oldstate;
			start = xip_currtime();
		}
		...
		status = map_read(map, adr);
	} while (!map_word_andequal(map, status, OK, OK)
		 && xip_elapsed_since(start) < usec);

So, even if this gets rescheduled a long time after an erase occurred in 
another process, the "start" variable will get set to the new time when 
the write is resumed and the erase delay is therefore already accounted 
for.

What if you replace "usec -= xip_elapsed_since(start)" by
"usec -= xip_elapsed_since(start) / 2" instead?  This doesn't have to be 
exactly accurate -- in fact this is there just to avoid looping forever 
if the flash never return a success status.



Nicolas
