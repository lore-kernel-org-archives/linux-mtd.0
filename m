Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D15iC-00044j-Gt
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 11:38:09 -0500
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR007.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0IBY007Z1OVH64@VL-MO-MR007.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 11:38:05 -0500 (EST)
Date: Tue, 15 Feb 2005 11:38:02 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20050215154819.GB831@synertronixx3>
To: Konstantin Kletschke <lists@ku-gbr.de>
Message-id: <Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20050215154819.GB831@synertronixx3>
Cc: linux-mtd@lists.infradead.org
Subject: Re: XIP aware file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 Feb 2005, Konstantin Kletschke wrote:

> Hi people!
> 
> Since I got a reasonable burst modus of flash device running XIP is not
> taking more but less time now, so third attempt to get this running...
> I have to port the stuff in xip.h.
> 
> PXA:
> 
> I have a question why (ICIP & ICMR) is done. Because ICIP _is_ already
> the hardware "and"ed between  ICMR and ICPR so it seems bogus at this
> place to "and" pending and mask by software again.

   The  Interrupt Controller Pending register (ICPR) (see Section 25.5.1)
   has  a  bit  for  each of the peripherals (primary interrupt sources).
   Each  active  interrupt  sets  the  corresponding  bit.  The Interrupt
   Controller  IRQ  Pending  register (ICIP) (see Section 25.5.2) and the
   Interrupt  Controller FIQ Pending register (ICFP) (see Section 25.5.3)
   identify  the  active,  unmasked  pending  interrupt  sources that are
   causing  IRQ-  and  FIQ-level interrupts, respectively. Interrupts are
   set   at  their  source  and  masked  or  unmasked  in  the  interrupt
   controller. The programmable Interrupt Controller Mask register (ICMR)
   (see  Section 25.5.4) chooses which interrupt source is masked. Masked
   interrupt sources do not cause an IRQ or FIQ interrupt to the core and
   only update the ICPR. The Interrupt Control Level register (ICLR) (see
   Section 25.5.5) chooses whether an interrupt causes an IRQ or an FIQ.

> Is this done because of "ICCR[DIM]=0 & Idle mode='1'" "or"ed to ICMR?

I'm not sure if it is strictly necessary to use ICMR.  According to the 
manual quoted above masked interrupts only update ICPR and not ICIP.  If 
so the & with ICMR is redundent.

> If yes, on our i.MX it should be sufficient to do 
> ( IMX_NIPNDH || IMX_NIPNDL ) which are the IRQ pending registers already
> "and"ed between IRQ source and INT enable.

Right.

> The OSCR Register is read to get some timing stuff, at what frequency is
> the timer ++ed? I am sure it is 32.768kHz or 32.8kHz. Is that correct?

No. It's either 3686400 Hz or 3250000 Hz.  Therefore xip_elapsed_since() 
should do:

	ticks = OSCR(now) - OSCR(before)
	usecs = ticks / 3606400 (ticks/sec) * 1000000 (usecs/sec)

or	usecs = (OSCR - x) / 3.686400

Rounding it to avoid floats and making sure it provides a result smaller
than the actual delay in microsecs (per the comment in xip.h) we get:

#define xip_elapsed_since(x)    (signed)((OSCR - (x)) / 4)

The (signed) is to make sure the compiler does a signed compare with it 
later on regardless of the OSCR signedness.

> In this case I should also do
> (signed)((IMX_TCN(IMX_TIM1_BASE) - (x)) /4).
> because "our" timer runs at 32kHz. I am pretty sure though...

If your time base runs at 32kHz you need:

#define xip_elapsed_since(x) (signed)((IMX_TCN(IMX_TIM1_BASE) - (x)) * 31)

where 31 = 1000000 (usecs/sec) / 32000 (ticks/sec).

> Further I found in funktion __xipram xip_udelay() a call to printk()
> right at the beginning, "pending entry".

Where do you see that?

> This will never work,
> becaus printk is located in flash,is that
> correct (just trying to really understand)?
> When I look at dissassembled vmlinux I find several calls to functions in
> flash in xip_udelay:
> 
> c0013974:       ebc3fa2e        bl      bf112234 <cond_resched>
> c0013994:       ebc34c31        bl      bf0e6a60 <memset>
> c00139dc:       ebc18b27        bl      bf076680 <add_wait_queue>
> c00139e0:       ebc3f696        bl      bf111440 <schedule>
> c00139ec:       ebc18b45        bl      bf076708 <remove_wait_queue>
> 
> and so on.
> Is this correct?

Please study carefully xip_udelay() and try to understand _when_ it is 
OK to call other functions and when it is not.  This function is really 
where all the magic is happening.

> Hm, our Kernel freezes right after
> 
> Creating 5 MTD partitions on "scb9328_flash":             
> 0x00000000-0x00020000 : "U-boot"             
> 0x00020000-0x00040000 : "U-boot_env"
> 0x00040000-0x00140000 : "kernel"    
> 0x00140000-0x00540000 : "root"  
> 0x00540000-0x00940000 : "fs"
> 
> at the moment.

Look at your xip_elasped_since() implementation.


Nicolas
