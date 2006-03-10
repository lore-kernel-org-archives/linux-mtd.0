Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHkbi-0000yV-I9
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 11:36:57 -0500
Received: from xanadu.home ([66.131.142.204]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IVX00G2H7HB2T60@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 11:36:47 -0500 (EST)
Date: Fri, 10 Mar 2006 11:36:47 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <44071ED3.1030302@intel.com>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.64.0603021012120.29834@localhost.localdomain>
	<44071ED3.1030302@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm back, sorry for the delay.

On Thu, 2 Mar 2006, Alexey, Korolev wrote:

> Nicolas
> 
> 
> > Please don't just yet.
> > 
> > > The scenario of the issue is following:
> > > > 1. do_write_buffer
> > > 2. Waiting for write complete in xip_udelay
> > > 3. System Interrupt
> > > 4. Write suspend
> > > 5. Rescheduling
> > > 6. Block erasing by other process. ( This operation typically took
> > > rather long time )
> > > 7. Complete, rescheduling
> > > 8. Return to write (write is not complete due to suspend ).
> > > 9. Check timeout. Time is up.
> > > 10. Error.
> > 
> > This should not happen.  And if it does then the bug is in xip_udelay()
> > and therefore should be fixed there.
> > 
> > The fact is, xip_udelay() should not return until either the flash
> > status is 0x80 (done) or the delay expired.  The code looks like:
> > 
> This is absolutelly correct.
> But delay may expire sometimes before chip get ready even if chip has not been
> suspended.

So?

> Buffer programming time for chip may vary.
> For example timeout has expired couple usecs before status get ready. (the
> such variations are absolutely ok).

Agreed.

> You go up to do_write_buffer,  and get the described scenario if chips has
> been suspended at the very begging of waiting in xip_uddelay.

I still don't see the problem.

Let's suppose we enter xip_udelay(), and scheduling happens, and another 
or even multiple other threads take their time to erase the flash, say 
for more than 4 seconds.  Currently xip_udelay() remembers how much time 
it had remaining before being suspended and will report that time when 
it is scheduled back.  So xip_udelay() should never return before the 
estimated amount of time required to perform the write as actually been 
spent actively writing.

Do we agree so far?

Now xip_udelay() may return to do_write_buffer() either because the 
write has completed, or the timeout occurred.  Like you said the timeout 
is normal since the write might still have a few microseconds to go.  
But only at that point is the timeo variable initialized with
jiffies + (HZ/2).

Further down, though, is a call to UDELAY() going again into 
xip_udelay() but this time any suspended operation is not accounted for 
in the timeo variable.

But the thing is, if you look at get_chip(), you'll see that nothing can 
go and erase another flash sector when a write is suspended.  In other 
words, completion of a write operation always has priority on any erase 
attempt.  So the problem you're describing may not be due to any erase 
delay occurring in another thread.

The only possibility I can see is that xip_udelay() is interrupted so 
often that the UDELAY(map, chip, cmd_adr, 1) call never gets a chance to 
make any progress, even in the course of a half second wall clock time.

Do you have a high interrupt rate in your system?

If this is not the case that means there is a real bug somewhere and I'd 
prefer that the real bug be found and addressed instead of masking it 
out.


Nicolas
