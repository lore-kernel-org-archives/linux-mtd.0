Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 146HAT-0007gQ-00
	for mtd-list@infradead.org; Wed, 13 Dec 2000 19:02:21 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 146HAS-0007gK-00
	for mtd@infradead.org; Wed, 13 Dec 2000 19:02:20 +0000
Date: Wed, 13 Dec 2000 14:02:16 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: <mstumpf@pobox.com>
cc: <mtd@infradead.org>
Subject: Re: MTD, generic physmap memory, MTD_BLOCK
In-Reply-To: <20001213164807.18924.qmail@web2104.mail.yahoo.com>
Message-ID: <Pine.LNX.4.30.0012131359200.3311-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 13 Dec 2000, Michael Stumpf wrote:

>
> I'm working in embedded LinuxPPC on a system with low RAM and ROM -- 6 meg RAM,
> 8 meg flash ROM.  It seems like that MTD may provide (or almost so) a method
> for mapping memory space in as a block device.  It already appears to sort-of
> do that, but I was wondering if full support for booting off of non-CFI
> compliant, but transparently mapped in, memories is either in place now
> (doesn't seem to be there) or is planned for the future.

Look at mtdram.c.  It might require verylittle modifications to do just what
you want.

> It's a trivial driver, and I'll write it / modify existing MTD code if
> desired/needed, but it really seems important to have so that I can
> execute-in-place from a cramfs partition in ROM (and also have this as my root
> partition).

It's impossible to execute_in_place from a cramfs partition since the
in-place code is compressed.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
