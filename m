Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IAbR-0001uD-00
	for mtd-list@infradead.org; Mon, 15 Jan 2001 14:27:21 +0000
Date: Mon, 15 Jan 2001 17:34:39 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: mtdpart.c 
In-Reply-To: <25549.979318127@redhat.com>
Message-ID: <Pine.LNX.4.21.0101151730520.31216-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 12 Jan 2001, David Woodhouse wrote:
> > Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard) 
> > No supported Vendor Command Set found
> 
> CONFIG_MTD_CFI_AMDSTD

I had that configured, it looked like it detected the chip and everything
and then bailed out at the end..

BTW I have a suggestion - how about making mtdpart.o depend on a
CONFIG_option instead of trying to guess when it's needed in the Makefile
? In our system, we have all our drivers in our arch-dir, setting CONFIG
flags to bring in other drivers in the rest of the kernel. But we cannot
bring in mtdpart.o for our physical mapping, not without hacking the mtd
Makefile and that should not be necessary of course :)

It can be a hidden CONFIG option, like Config.in sets it automatically for
those physmappings that require it, and then just remove the logic to do
that in the Makefile - I can check that in if you want :)

I also tried dropping the HEAD of mtd in the cvs over my 2.4.0 and reboot,
but that made the problem worse:

Axis flash mapping: 200000 at 50000000
Axis flash: Found 1 x16 CFI device at 0x0 in 16 bit mode
Number of erase regions is zero
cfi_probe erred 0

Now it does not even probe the flash apart from the initial CFI find :)

/BW



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
