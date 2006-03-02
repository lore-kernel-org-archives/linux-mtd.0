Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEqmL-000811-5S
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 11:35:53 -0500
Message-ID: <44071ED3.1030302@intel.com>
Date: Thu, 02 Mar 2006 19:35:31 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org
References: <Pine.LNX.4.64.0603021012120.29834@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603021012120.29834@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas


> Please don't just yet.
>
> > The scenario of the issue is following:
> > 
> > 1. do_write_buffer
> > 2. Waiting for write complete in xip_udelay
> > 3. System Interrupt
> > 4. Write suspend
> > 5. Rescheduling
> > 6. Block erasing by other process. ( This operation typically took
> > rather long time )
> > 7. Complete, rescheduling
> > 8. Return to write (write is not complete due to suspend ).
> > 9. Check timeout. Time is up.
> > 10. Error.
>
> This should not happen.  And if it does then the bug is in xip_udelay()
> and therefore should be fixed there.
>
> The fact is, xip_udelay() should not return until either the flash
> status is 0x80 (done) or the delay expired.  The code looks like:
>
This is absolutelly correct.
But delay may expire sometimes before chip get ready even if chip has 
not been suspended.
Buffer programming time for chip may vary.
For example timeout has expired couple usecs before status get ready. 
(the such variations are absolutely ok).
You go up to do_write_buffer,  and get the described scenario if chips 
has been suspended at the very begging of waiting in xip_uddelay.
I thought about possibility to make fix in xip_udelay, but I didn't find 
a good solution here.

Thanks a lot,
Alexey
