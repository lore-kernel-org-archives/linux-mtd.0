Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136SgX-0006Fy-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 07:47:57 +0100
Received: from maverick.techno.spb.ru ([195.5.142.101])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 136SgU-0006Fs-00
	for mtd@infradead.org; Mon, 26 Jun 2000 07:47:55 +0100
Received: from techno.spb.ru (localhost [127.0.0.1])
	by maverick.techno.spb.ru (8.9.3/8.9.3) with ESMTP id KAA07893
	for <mtd@infradead.org>; Mon, 26 Jun 2000 10:54:43 +0400
Message-ID: <3956FE32.B38F1EF8@techno.spb.ru>
Date: Mon, 26 Jun 2000 10:54:42 +0400
From: Nick Maximov <maxs@techno.spb.ru>
Reply-To: maxs@techno.spb.ru
MIME-Version: 1.0
To: MTD Mailing List <mtd@infradead.org>
Subject: GRUB bootloader as firmware
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Now I got success with CVS archive
version of MTD. I used kernel 2.2.16 on Ampro CM/p5e+M-Systems Doc2000
(8Mb)
with latest code from CVS.

Kernel was successfully compiled, and my DiskOnChip
was detected after module installation (in order: mtdcore, doc2000,
docprobe, nftl).
I can read and write Linux native partition on my DOC using /dev/nftla1,

BUT! When I create Linux FS (type 83) by fdisk /dev/nftla
command, I LOSE compability with original DOC firmware (doc123.exb),
and system did not boot from flash.

I saw here some discussion about grub loader structurized as firmware
code.
I have 2 utilities from Ampro (the original M-Systems pupdate.exe and
pformat.exe
are incompatible with Ampro CM/p5e)

Documentation said that I have 3 areas in flash - CPU BIOS, Flash
firmaware
and BIOS extention. 

** Which area I have to update with grub firmware? I tried to update 
BIOS extention area with grub_firmware but system does not boot.
Doc firmware area is not large enough to fit compiles firmware...

Can I create DOC boot disk with grub using /dev/nftla? 
Or NFTL-MTD is not compatible with DOC firmware? (I use doc123.exb to
load
original firmware and doc2.fff to boot from HDD).


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
