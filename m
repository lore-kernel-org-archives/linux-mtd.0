Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NUyG-0003n9-46
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 10:54:16 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Date: Wed, 4 Jun 2003 21:57:24 +1200
References: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
In-Reply-To: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <20030604095450.A129B4375@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Execute in place.
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David

Is there any discussion leading up to XIP? ie. Why? ... and why not!

A few questions/comments inline.

On Wednesday 04 June 2003 20:34, David Woodhouse wrote:
> I've done some work on kernel XIP. The basic principle of operation is
> that we copy any code which may need to run while the flash chips are in
> anything but 'read' mode into RAM, and we disable interrupts while the
> chips are busy. During erases, we poll not only for erase completion but
> also for pending IRQs. If an IRQ is pending, we suspend the erase
> operation, re-enable IRQs and call cond_resched().

It scares me that this adds a potentially huge interrupt latency. Some NOR 
devices need a good 20usec or so to get into erase suspend state. There are 
many situations (eg ARM FIQs) where this would not be a nice thing to do.  
Thus, mixing XIP with say a file system which might cause erases at 
(relatively) arbitrary times needs to be done with great caution. Men with 
red flags needed up front.

>
> The flash driver code is fairly simple, although it wants a little bit
> of cleanup and I want to be convinced that the arch-specific bits are
> done right before committing it.
>
> The arch-specific parts are implemented for XScale only so far, but
> should be relatively simple to do for new architectures. You need to
> ensure that parts of kernel code can be loaded into RAM instead of ROM,
> when marked with the '__xipram' attribute, that the udelay() function is
> in that section, and also your software TLB handlers if you have them --
> or indeed anything else which may be needed in the critical sections of
> the flash chip driver. I've reintroduced the get_unaligned() macro to
> potentially-unaligned data loads in the critical region, so alignment
> fixups do _not_ need to be in RAM.
>
> You also need to provide suitable xip_cli(), xip_sti(), and
> xip_irqpending() functions or macros in include/linux/mtd/xip.h. I
> suspect that wants moving to include/asm-$(ARCH)/xip.h or similar.

The fundamental implementation seems quite simple and elegant.IMHO.

-- Charles
