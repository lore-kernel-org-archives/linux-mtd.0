Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D14vz-0003OO-Qo
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 10:48:20 -0500
Date: Tue, 15 Feb 2005 16:48:19 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050215154819.GB831@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: XIP aware file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi people!

Since I got a reasonable burst modus of flash device running XIP is not
taking more but less time now, so third attempt to get this running...
I have to port the stuff in xip.h.

PXA:

I have a question why (ICIP & ICMR) is done. Because ICIP _is_ already
the hardware "and"ed between  ICMR and ICPR so it seems bogus at this
place to "and" pending and mask by software again.
Is this done because of "ICCR[DIM]=0 & Idle mode='1'" "or"ed to ICMR?
If yes, on our i.MX it should be sufficient to do 
( IMX_NIPNDH || IMX_NIPNDL ) which are the IRQ pending registers already
"and"ed between IRQ source and INT enable.

The OSCR Register is read to get some timing stuff, at what frequency is
the timer ++ed? I am sure it is 32.768kHz or 32.8kHz. Is that correct?
In this case I should also do
(signed)((IMX_TCN(IMX_TIM1_BASE) - (x)) /4).
because "our" timer runs at 32kHz. I am pretty sure though...

Further I found in funktion __xipram xip_udelay() a call to printk()
right at the beginning, "pending entry". This will never work,
becaus printk is located in flash,is that
correct (just trying to really understand)?
When I look at dissassembled vmlinux I find several calls to functions in
flash in xip_udelay:

c0013974:       ebc3fa2e        bl      bf112234 <cond_resched>
c0013994:       ebc34c31        bl      bf0e6a60 <memset>
c00139dc:       ebc18b27        bl      bf076680 <add_wait_queue>
c00139e0:       ebc3f696        bl      bf111440 <schedule>
c00139ec:       ebc18b45        bl      bf076708 <remove_wait_queue>

and so on.
Is this correct?

Hm, our Kernel freezes right after

Creating 5 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
0x00020000-0x00040000 : "U-boot_env"
0x00040000-0x00140000 : "kernel"    
0x00140000-0x00540000 : "root"  
0x00540000-0x00940000 : "fs"

at the moment.

Kind regards, Konsti




-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
