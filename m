Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vcmp-0007qe-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 11:58:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <005d01c15ae9$099dc960$0205a8c0@uat.com.tw> 
References: <005d01c15ae9$099dc960$0205a8c0@uat.com.tw> 
To: =?big5?B?sWmm9qX0KFlvdS1KZW4gQ2hhbmcp?= <changyj@uat.com.tw>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Does DiskonChip work on IDT RC32334 CPU(MIPS)? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 22 Oct 2001 12:06:51 +0100
Message-ID: <6153.1003748811@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

changyj@uat.com.tw said:
>  My embedded linux system is MIPS(IDT RC32334 RISC CPU). The BIOS can
> detect DiskOnChip at 0xB2000000 address.

> How do I setup the physical address of DiskOnChip for  Memory
> Technology Device Subsystem in Linux ?  Is the address same as
> 0xB2000000?

It works on the Momenco Ocelot MIPS board - all the endianness funnies have 
been worked out. Check that 0xb2000000 is a _physical_ address, not a 
virtual address - it looks suspicious for a MIPS system, where normally 
only addresses under 0x20000000 are easily accessible. 

Also check how the DiskOnChip is wired up - whether its registers are 1 
byte, 2 bytes or 4 bytes apart as the CPU sees them. Look at the various 
forms of the ReadDOC_() and WriteDOC_() macros in include/linux/mtd/doc2000.h
and pick the correct one (or experiment).

Make sure the bus controller is set up properly for the wiring of the 
DiskOnChip too - for the Ocelot, we had to do that ourself, because the 
boot loader didn't (see the last two lines of momenco_ocelot_setup() in 
arch/mips/gt64120/momenco_ocelot/setup.c) 


--
dwmw2
