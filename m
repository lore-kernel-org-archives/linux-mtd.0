Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Fakb-0003V4-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 12:13:53 +0100
Received: from sis.com.tw ([203.67.208.2] helo=fw11.sis.com.tw)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13FakX-0003Uv-00
	for mtd@infradead.org; Fri, 21 Jul 2000 12:13:51 +0100
Message-ID: <39782FC2.1EA5A739@sis.com.tw>
Date: Fri, 21 Jul 2000 19:10:58 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
CC: hecman@evoserve.com, mtd@infradead.org
Subject: Re: SOLVED: Turnning On DOC Millennium ECC Logic
References: <397825D6.BDE058A3@sis.com.tw> <39783001.2FE9E3AC@evoserve.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=big5
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

"Rogelio M. Serrano Jr." wrote:
> 
> Ollie Lho wrote:
> 
> > Ronald,
> >         I can now program the IPL area correctly, the IPL area can be download
> 
> Cool! Can this be done on the DOC2000 too?
> 

Nop, only DOC Millennium has the 512 byte SRAM area for the IPL. On power-up
the internal download logic automatically download the first page the of NAND
flash to these SRAM. The logic also check the ECC along with the download
process so this is why I am working so hard to turn the ECC logic On. 

> >
> > by the internal logic of the Millennium such that the disk on chip acts as a
> > 512 bytes ROM when power-up. We can proceed to work on how to shrink the DRAM
> > sizing/timing code into 512 byte. After that we will have a complete Diskless,
> > BIOSless, maintance free enviroment which should be very useful for you cluster
> 
> Is that also usefull on ordinary PC?  Super cool!
> 

Possible. With the proper LinuxBIOS support for your M/B chipset, you can
totally replace your traditional BIOS + NOR flash with LinuxBIOS + Linux +
DOC Millennium combination.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
