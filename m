Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Jx0z-00021r-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 12:48:49 +0100
Received: from [213.255.48.147] (helo=giga.prosa.it ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Jx0y-00021l-00
	for mtd@infradead.org; Wed, 02 Aug 2000 12:48:48 +0100
Received: from localhost (root@localhost [127.0.0.1])
	by giga.prosa.it (8.9.3/8.9.3/Debian/GNU) with ESMTP id NAA06446
	for <mtd@infradead.org>; Wed, 2 Aug 2000 13:47:49 +0200
Date: Wed, 2 Aug 2000 13:48:51 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: mtd@infradead.org
Subject: DOC2000 & NFTL problems
Message-ID: <20000802134851.A2924@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I decided to give a try to the DOC2000/NFTL driver included in mtd.
I have an Eurotech PC104 SBC with a DOC socket. I'm using a 2 Mb DOC2000,
enabled in the SBC BIOS and mapped at 0xd8000.

Under DOS everything works fine: the systems detects, identifies and
formats the DOC. Everything is also fine with the binary-only Linux driver
provided by M-Systems, under Linux 2.0.38.

Next, I try Linux 2.2.16 with the mtd driver and patch.

 ---------------------------------------------------------------------
 M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
 DiskOnChip 2000 found at address 0xD8000
 1 flash chips found. Total DiskOnChip size: 2 Mb
 Ignoring DiskOnChip 2000 at 0xDA000 - already configured
 M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
 $Id: nftl.c,v 1.37 2000/07/26 10:02:27 dwmw2 Exp $
 ---------------------------------------------------------------------

...then I get the following message, repeated for all EUNs (0-511)...

 ---------------------------------------------------------------------
 EUN 506: EraseMark not 0x3c69 (0xffff 0xffff instead)
 ---------------------------------------------------------------------

...and when it comes to detecting the partition, I get:

 ---------------------------------------------------------------------
  nftla: unknown partition table
 ---------------------------------------------------------------------

NOTE: there _is_ a valid NFTL partition on the DOC, while the above happens.

Okay, now I try to format the DOC using nftl_format: no errors.
When I try to fdisk /dev/nftla, though, I get an invalid partition table.
Any attempt to write a new partition table results in the following:

 ---------------------------------------------------------------------
 NFTL_writeblock(): Cannot find block to write to
 end_request: I/O error, dev 5d:00 (unknown), sector 2
 No Virtual Unit Chains available for folding. Failing request
 Cannot make free space.
 ---------------------------------------------------------------------

...I'm probably missing something obvious, but I would still appreciate
some feedback on this problem. Thank you.

Cheers,

Ciro

-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
