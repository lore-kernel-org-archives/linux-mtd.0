Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1421hD-0005Ad-00
	for mtd-list@infradead.org; Sat, 02 Dec 2000 01:42:35 +0000
Message-ID: <3A28531C.4F5C8E14@sis.com.tw>
Date: Sat, 02 Dec 2000 09:40:44 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org, linuxbios@lanl.gov
Subject: Re: DiskOnChip 2000/Millennium driver merge.
References: <8574.975681632@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> I've now cleaned up some of the differences between the new combined
> doc200[01] driver and the doc2001-only driver, and enabled
> DOC_SINGLE_DRIVER in the docprobe code.
> 
> I haven't removed the conditional stuff for two reasons -
>         1. Ollie wants to keep the separate doc2001 driver for easier
>                 development and testing
>         2. The doc2000 driver doesn't actually _work_ for writing. It
>                 exhibits the same behaviour with both types of device -
>                 writes to NFTL just don't appear to _stay_ written.
> 
> If you need write support for the Millennium right now, just comment out
> the definition of DOC_SINGLE_DRIVER in docprobe.c and continue to use
> the doc2001 module.
> 
> As the doc2001 driver is working fine, I'm fairly sure it's a hardware
> driver problem, not an NFTL code problem. Writes to the main body of the
> flash appear to work too, so I currently suspect that it's an OOB data write
> problem.
> 
> If anyone else with Millennium hardware could take a look at the
> differences between doc2000.c and doc2001.c, especially Ollie who actually
> knows what he's doing, that'd be very much appreciated.
> 

David,
	I just tried the updated CVS version. The Millennium part of 
doc2000.c works for some extend. It has some bugs which will offset/lost
1 or 2 bytes at begin/end of each 512byte page. It is a common problem if
you are not programming the chip fully comply to M-Systems Spec (actually
you have to do some "undocumented" tricks too). I will review the new code
next week possiblly after you get the SiS 630 LinuxBIOS demo/devel platform.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
