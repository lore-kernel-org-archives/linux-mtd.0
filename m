Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OdUn-0006gy-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 10:31:13 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14OdUl-0006gs-00
	for mtd@infradead.org; Fri, 02 Feb 2001 10:31:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10102011745120.12474-100000@bering.nmt.edu> 
References: <Pine.LNX.4.10.10102011745120.12474-100000@bering.nmt.edu> 
To: Jose Guilberto <guilbert@ee.nmt.edu>
Cc: mtd@infradead.org
Subject: Re: Supported Flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Feb 2001 10:30:25 +0000
Message-ID: <17953.981109825@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


guilbert@ee.nmt.edu said:
> 
> 	Is it possible to boot Linux from any kind of flash memory with the
> MTD project? If not, what are the basic requirements of the flash
> memory on a SBC to allow booting from it?  

The MTD stuff doesn't really handle booting - it's only Linux drivers for 
once you've managed to boot the kernel. There are some patches for Grub to 
make it work from a DiskOnChip, and there is some code in the boot/ 
directory of the CVS tree for making the kernel boot from ROM/flash as a 
BIOS extension. Also see LinuxBIOS  - http://www.linuxbios.org/

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
