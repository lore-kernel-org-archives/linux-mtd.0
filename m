Received: from mail3.sea5.speakeasy.net ([69.17.117.5])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jjji7-0007Bc-L1
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 23:28:12 +0000
Date: Wed, 9 Apr 2008 16:27:02 -0700 (PDT)
From: Trent Piepho <tpiepho@freescale.com>
To: Vernon Sauder <vernoninhand@gmail.com>
Subject: Re: mtd->size revisited
In-Reply-To: <47FD4C1F.6010001@gmail.com>
Message-ID: <Pine.LNX.4.64.0804091626190.17847@t2.domain.actdsltmp>
References: <OF1E779C97.22C47CCA-ON88257426.007A4C73-88257426.007C6F5B@selinc.com>
	<47FD4C1F.6010001@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: MTD mailing list <linux-mtd@lists.infradead.org>, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 9 Apr 2008, Vernon Sauder wrote:
> Bruce_Leonard@selinc.com wrote:
>
> While I agree that it would be great to support larger devices, I'm
> going to ask a dumb question: does this have to grow to a 64-bit number?
> Can it be in KB or something? If device sizes are always divisible by
> 1KB, we don't need the bottom 10 bits anyway. That would seem an easier
> change in some ways.

It's more efficient that way too.

Instead of just changing the size to uint64_t, it might be better to create a
new type which can be 32 or 64.  Once you start using the right type
everywhere you usually don't have to change much code.  The only exception is
printf format strings, which can be a pain.

Or like Vern said, just shift off the bottom bits.  define MTD_SIZE_SHIFT to
the number of bits to shift off.  One can then make trivial macros/inline
functions mtd_size_to_kb(), mtd_size_to_bytes(), mtd_size_to_pages(), etc. 
when code actually cares about the units.  I imagine a lot of code doesn't
care if it's bytes or kilobytes, as long as everything uses the same units.
