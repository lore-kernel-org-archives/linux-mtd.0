Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mXun-0004bn-00
	for mtd-list@infradead.org; Mon, 09 Apr 2001 10:24:53 +0100
Received: from ntp.iriti.cnr.it ([150.145.55.6] helo=ghirolo.iriti.cnr.it)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14mXul-0004bh-00
	for mtd@infradead.org; Mon, 09 Apr 2001 10:24:51 +0100
Received: from zot.iriti.cnr.it
	([150.145.55.66] helo=iriti.cnr.it ident=fabrizio)
	by ghirolo.iriti.cnr.it with esmtp (Exim 3.12 #1 (Debian))
	id 14mXuI-0004Hf-00
	for <mtd@infradead.org>; Mon, 09 Apr 2001 11:24:22 +0200
Message-ID: <3AD17FC6.6A918EA0@iriti.cnr.it>
Date: Mon, 09 Apr 2001 11:24:22 +0200
From: Fabrizio Pollastri <pollastri@iriti.cnr.it>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Problems with nftl_format
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have a problem with nftl_format. It give the following output to me.

# doc_loadbios /dev/mtd0 grub_firmware (OK: grub prompt appears at next
boot)
# nftl_format /dev/mtd0 81920
Phase 1. Checking and erasing Erase Zones from 0x00014000 to 0x01000000
Erasing Zone #10 @ 0x14000
Erasing Zone #11 @ 0x16000
Erasing Zone #12 @ 0x18000
Erasing Zone #13 @ 0x1a000
...
Erasing Zone #2044 @ 0xff8000
Erasing Zone #2045 @ 0xffa000
Erasing Zone #2046 @ 0xffc000
Erasing Zone #2047 @ 0xffe000
Phase 2.a Writing NFTL Media Header and Bad Unit Table
Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
Phase 3. Writing Unit Control Information to each Erase Unit
MEMWRITEOOB at 14200: Invalid argument
MEMWRITEOOB at 16200: Invalid argument
MEMWRITEOOB at 18200: Invalid argument
MEMWRITEOOB at 1a200: Invalid argument
...
MEMWRITEOOB at ff8200: Invalid argument
MEMWRITEOOB at ffa200: Invalid argument
MEMWRITEOOB at ffc200: Invalid argument
MEMWRITEOOB at ffe200: Invalid argument

My configuration is linux 2.4.3, DOC-2000 16MB @d6000, mtd sanpshot
1-mar-2001.
Most recent snapshots give similar errors. What's wrong?
Thank for any help.

Fabrizio Pollastri.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
