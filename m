Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vDDV-0007yW-00
	for mtd-list@infradead.org; Mon, 13 Nov 2000 06:35:45 +0000
Received: from po4.glue.umd.edu ([128.8.10.124])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13vDDT-0007yQ-00
	for mtd@infradead.org; Mon, 13 Nov 2000 06:35:43 +0000
Date: Mon, 13 Nov 2000 01:35:30 -0500 (EST)
From: Adam Agnew <agnew@glue.umd.edu>
To: Ollie Lho <ollie@sis.com.tw>
cc: mtd@infradead.org
Subject: Re: Detecting the Disk-On-Chip 2800
In-Reply-To: <3A0F34B9.F8E18383@sis.com.tw>
Message-ID: <Pine.GSO.4.21.0011130130590.3054-100000@y.glue.umd.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Awesome, thank you. Sorry, I haven't figured out yet who has done what,
but I really appreciate that contribution :)

On Mon, 13 Nov 2000, Ollie Lho wrote:

> Adam Agnew wrote:
> > 
> > Is it common to be unable to detect the DOC after you've flashed a bios to
> > it? Can you get around that by explicitly stating the the memory address
> > and length for it?
> > - Adam Agnew
> > 
> 
> Adam,
> 	You should ask me directly, that is what I did to the driver ;-). The
> original firmware (IPL) in the DoC has 0x55AA signature in it. So the driver
> probe for it to determine if there is a DoC on the bus. After we reprogramming
> the IPL area, the signature is gone. You should CVS update your MTD source
> tree and reconfigure the kernel. There are two options, one is PROBE_HIGH,
> which will probe high address (near 4GB) rather than log address (under 1MB)
> for DoC. The other is PROBE_55AA, which probe the signature. If you are playing
> LinuxBIOS with SiS 630, please choose PROBE_HIGH == y, PROBE_55AA = n.
> 
> Ollie
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
