Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139kJu-0001jl-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 09:14:10 +0100
Message-ID: <3962E0E9.14051B82@crossnet.co.jp>
Date: Wed, 05 Jul 2000 16:16:57 +0900
From: Masami Komiya <mkomiya@crossnet.co.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: Fujitsu MBM29LV160
References: <395DC4F0.5610B924@crossnet.co.jp> <7330.962615057@cygnus.co.uk>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


It is CFI-compliant. May be, the command set is the different from
Intel's.

I changed the definition of the flash memory address in nora.c
according to our board. Kernel can detects flash momeries correctly.
But the module cfi_cmdset_0002 is required.   

The messages from kernel are:

Main: Initialising MTD Drivers
nora flash device: 200000 at bf000000
NORA: Found a coupled pair of CFI devices at location 0 in 16 bit mode
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
No Vpp line
Typical byte/word write timeout: 16 sssss
Maximum byte/word write timeout: 512 sssss
Full buffer write not supported
Typical block erase timeout: 1024 sssss
Maximum block erase timeout: 16384 sssss
Chip erase not supported
Device size: 0x200000 bytes (2 Mb)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 4
  Erase Region #0: BlockSize 0x4000 bytes, 1 blocks
  Erase Region #1: BlockSize 0x2000 bytes, 2 blocks
  Erase Region #2: BlockSize 0x8000 bytes, 1 blocks
  Erase Region #3: BlockSize 0x10000 bytes, 31 blocks

request_module[cfi_cmdset_0002]: Root fs not mounted
Invalid Extended Query Table at 0040: 40 C0 80
No supported Vendor Command Set found
ftl_cs: FTL header not found.


Should I make cfi_cmdset_0002? Is there the another resources ?

Best regards.

Masami Komiiya


David Woodhouse wrote:
> 
> mkomiya@crossnet.co.jp said:
> > We try to port Linux kernel to our embedded system that has Fujitsu's
> > NOR type Flash memory MBM29LV160.
> 
> Is it CFI-compliant?
> 
> If so, it'll be at least detected by the current code.
> 
> If it is capable of using the Intel command set, then it is supported.
> Otherwise, you will have a little bit of work to do to add support for it.
> 
> It should be quite simple to add support for it if it doesn't support the
> Intel command set.
> 
> First you need to provide a 'map' driver which allows access to the flash
> chips. Look at something simple like nora.c for an example - if your flash
> chips are mapped into virtual memory then all you need to do is change a
> couple of defines in nora.c to drive your own board.
> 
> Then load the cfi_probe module and the nora module (or your own map driver).
> 
> Show me all the output you get from it.
> 
> --
> dwmw2


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
