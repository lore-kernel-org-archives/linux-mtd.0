Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19uFJK-0005PT-Vz
	for <linux-mtd@lists.infradead.org>; Tue, 02 Sep 2003 18:51:23 +0100
Date: Mon, 1 Sep 2003 12:18:36 -0700
From: Matthew Dharm <mdharm@momenco.com>
To: dima <_pppp@mail.ru>
Message-ID: <20030901121836.A26873@momenco.com>
References: <3F52FB48.3020908@mail.ru>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: trouble with samsung drive
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

USB Mass Storage devices aren't handled via the MTD driver, generally.
They are handled by the usb-storage driver via SCSI emulation.

If the device shows up in /proc/bus/usb/devices with class code 8, then the
USB low-level is working and it's time to move on to enabling the
usb-storage driver.

The place for usb-storage help is linux-usb-users@lists.sf.net

Matt

On Mon, Sep 01, 2003 at 11:54:48AM +0400, dima wrote:
> Hello!
> I got the Samsung flash drive last weekend. It looks like a noname one 
> marked as "Samsung 128MB, Made in Korea" only. It might be something of 
> the K9F28XXX0C series 
> (http://www.samsung.com/Products/Semiconductor/Flash/NAND/128Mbit/K9F2816Q0C/K9F2816Q0C.htm).
> I tried to get it working on my old laptop on Sunday but failed. It 
> could be a problem with the USB hub since it is USB 1.1 & the flash 
> drive is reported to be USB 2.0. I searched the web & figured out that 
> Samsung chips must be NAND-compatible. I used DiskOnChip 2000 driver 
> first, but it failed to probe the device (btw, USB hub didn't report any 
> unclaimed devices). Then I tried almost all MTD drivers availble in the 
> standard (kernel.org) kernel distribution (v2.4.20) -- none of them 
> seemed to probe the device successfully.
> So I have 3 questions:
> 1) Is this a problem with my old USB hub?
> 2) Which driver should I use if no?
> 3) I didn't enable SCSI emulation support in the kernel yet (I decided 
> to leave it for the next step since the device hadn't been detected). 
> Can it be the problem?
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Matthew Dharm                              Work: mdharm@momenco.com
Senior Software Designer, Momentum Computer
