Return-path: <mlist@sonn-online.de>
Received: from moutvdom00.kundenserver.de ([195.20.224.149])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13b8d4-0005lS-00
	for mtd-list@infradead.org; Mon, 18 Sep 2000 22:39:10 +0100
Received: from [195.20.224.208] (helo=mrvdom01.kundenserver.de)
	by moutvdom00.kundenserver.de with esmtp (Exim 2.12 #2)
	id 13b8d3-0001gb-00
	for mtd-list@infradead.org; Mon, 18 Sep 2000 23:39:09 +0200
Received: from pec-114-108.tnt7.s2.uunet.de ([149.225.114.108] helo=sonn-online.de)
	by mrvdom01.kundenserver.de with smtp (Exim 2.12 #2)
	id 13b8d0-00005Y-00
	for mtd-list@infradead.org; Mon, 18 Sep 2000 23:39:06 +0200
Date: Mon, 18 Sep 2000 23:33:53 +0100
From: Volker Sonn <mlist@sonn-online.de>
Reply-To: Volker Sonn <mlist@sonn-online.de>
To: mtd-list@infradead.org
Subject: Re: Grub support in DiskOnChip.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <E13b8d0-00005Y-00@mrvdom01.kundenserver.de>
List-ID: <linux-mtd.lists.infradead.org>

Hi,

i cant boot my DOC2000 with grub :-(

I did: (in this order)
- patched grub with the 2 patches in mtd/grub/
- make, make install (of grub)
- copied the pre_stage2 to /mdt/grub
- mdt/grub/make
- doc_loadbios /dev/mtd0 grub_firmware
- nftl_format /dev/mdt0 81920
- fdisk /dev/nftla
- mke2fs /dev/nftla1 -m 0
- copied a kernel and /boot/grub to /nftla1

After rebooting, the grub shell comes up, but i can't access the DOC with something like 
root (dc0,0) etc.
(Booting from (hd0) is possible)

Where I'm wrong ?


> Grub patches to support NFTL properly have just been contributed.

> See mtd/patches/grub* and send virtual beer to void@dr.com

> --
> dwmw2




> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
