Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13jgC7-0001Gr-00
	for mtd-list@infradead.org; Thu, 12 Oct 2000 12:06:39 +0100
Received: from proxy.iperv.it ([151.4.122.158] helo=motoko.gremlin.it)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13jgC5-0001Gl-00
	for mtd@infradead.org; Thu, 12 Oct 2000 12:06:38 +0100
Received: from gremlin.it (IDENT:gremlin@localhost [127.0.0.1])
	by motoko.gremlin.it (8.9.3/8.8.7) with ESMTP id NAA01390
	for <mtd@infradead.org>; Thu, 12 Oct 2000 13:10:36 +0200
Message-ID: <39E59C26.D3969B6@gremlin.it>
Date: Thu, 12 Oct 2000 13:10:30 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: GRUB + DOC2000 = problems 
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


i have a DiskOnChip 2000 (48Mbytes) 

kernel 2.4.0-test9 ... and mtd-20000704 and grub-0.5.96

i compiled the kernel with DOC2000 + nflt + mtdchar 
compiled mtd utils ...
compiled grub ...
	copy stage2/pre_stage2 into mtd/grub dir 

in mtd/grub execute make ... 
so i obtain grub_firmware (size 60,256) 

then 
doc_loadbios /dev/mtd0 grub_firmware
nftl_format /dev/mtd0 81920 
fdisk /dev/nftla 
	create 3 partirions of 1Mbyte, 100k , and the rest ...
write and quit from fdisk ... 

now i vreate the filesystems ...
first partition (nftla1) is where kernel is into and is minix fs

reboot ... 

grob start and if i type

root (<TAB>
i obtain 

root (hd0,
	Partition num 0, filestem type unknow, partition size 0x83

no other partitions are visible ... 
no other devices are avaiable ... 
note that i compile grub with --enable-minix and --enable-ext2fs
in the HD (primary/master) i have only one partition in ext2 ...

what of wrong i'm doing ???? 


-- 
 /-----------------------------------------------------------------------\
|                 Alessandro Gardich : gremlin@gremlin.it                 |
 >-----------------------------------------------------------------------<
| Le aquile possono anche volare,                                         |
|                            ma le talpe non vengono risucchiate nei jet. |
|                                                                         |
|                                                                 "Micol" |
 \-----------------------------------------------------------------------/


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
