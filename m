Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136siV-00023m-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 11:35:43 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 136siU-00023g-00
	for mtd@infradead.org; Tue, 27 Jun 2000 11:35:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <005001bfe01f$5267b700$658e05c3@techno.spb.ru> 
References: <005001bfe01f$5267b700$658e05c3@techno.spb.ru> 
To: "Nick Maximov" <maxs@techno.spb.ru>
Cc: mtd@infradead.org
Subject: Re: does anyone here used Ampro modules? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Jun 2000 11:38:17 +0100
Message-ID: <19568.962102297@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


maxs@techno.spb.ru said:
> I tried to load alternative firmware file (grub.exb) to DoC firmware
> area. Now my DoC even unable to be formated!

How did you make 'grub.exb'? I haven't written any tool to produce EXB 
files from the Grub images - I only write them to the flash with my own 
doc_loadbios utility.


maxs@techno.spb.ru said:
>  Does anyone knows what is exact address map for DoC device?

Load the docprobe and doc2000 modules under Linux - it'll probe all the 
possibilities and tell you where it's mapped in your particular board.


maxs@techno.spb.ru said:
> And then where the Flash Firmware is located? Why p5update utility
> unable to update exact area in memory space? 

The DiskOnChip firmware is at the beginning of the first flash chip in the 
DiskOnChip. As it's NAND flash, it's not memory-mapped directly.

You _have_ read the NAND flash datasheets, haven't you?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
