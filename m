Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OnHi-0003L3-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 20:58:22 +0000
Received: from brand.scrye.com
	([207.174.18.194] helo=scrye.com ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14OnHf-0003Kw-00
	for mtd@infradead.org; Fri, 02 Feb 2001 20:58:20 +0000
Message-ID: <20010202205810.17803.qmail@scrye.com>
Date: Fri, 2 Feb 2001 13:58:10 -0700 (MST)
From: Kevin Fenzi <kevin@scrye.com>
To: mtd@infradead.org
Subject: DOC2000 issues...
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi folks. 

Some background:

we have a device that has a doc2000 (48MB version) on it. 
Currently we have kernel 2.2.14 with a very old m-systems driver
running on it. It boots fine from the doc2000 (thats the only bootable
device on there):

debug: entering NFDC 2148 identification routine.
Debug: identified NFDC 2148.
Debug: starting NFTL mount.
Debug: finished NFTL mount.
Trueffs: Mount status 0h
Flash disk driver for DiskOnChip2000
Copyright (C) 1998 IGEL GmbH
Copyright (C) 1998 M-Systems Flash Disk Pioneers Ltd.
Partition check:
 fla: fla1
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 40k freed

It's BIOS reports:

TrueFFS-BIOS -- Version 3.3.7 for DiskOnChip 2000 (V1.23)
Copyright (C) M-Systems, 1992-2000

Ok, so I attempted to get a 2.2.18 + mtdpatch working. 
I ran into problems getting the mtd stuff to compile into the kernel. 
I built the mtdpatch stuff as modules, and tried using a initrd. No
boot. (just hung from the bios)

So, I went to a 2.4.0 kernel, and compiled all the mtd stuff in
(compiled just fine):

...
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI       
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $          
...
NFTL_open                                          
ENODEV: thisNFTL = 0, minor = 23809, ip = c1173cf0, fp = c111bef8
VFS: Cannot open root device "5d01" or 5d:01                     
Please append a correct "root=" boot option 
Kernel panic: VFS: Unable to mount root fs on 5d:01

Then, I tried the newest m-systems driver with 2.2.18:

...
Copyright (C) 1998,2000 M-Systems Flash Disk Pioneers Ltd.
Copyright (C) 2000 Lineo                                  
DOC device(s) found: 4
...
fl_geninit: registered device at major: 100                                     
partition: 0: start_sect: 0, nr_sects: 177a0 Fl_blk_size[]: bbd0kb
partition: 1: start_sect: 0, nr_sects: 0 Fl_blk_size[]: 0kb       
partition: 64: start_sect: 0, nr_sects: 177a0 Fl_blk_size[]: bbd0kb
partition: 65: start_sect: 0, nr_sects: 0 Fl_blk_size[]: 0kb       
partition: 128: start_sect: 0, nr_sects: 177a0 Fl_blk_size[]: bbd0kb
partition: 129: start_sect: 0, nr_sects: 0 Fl_blk_size[]: 0kb       
partition: 192: start_sect: 0, nr_sects: 177a0 Fl_blk_size[]: bbd0kb
partition: 193: start_sect: 0, nr_sects: 0 Fl_blk_size[]: 0kb       
Partition check:                                             
 fla: fla1      
 flb: flb1
 flc: flc1
 fld: fld1
VFS: Cannot open root device 3e:01
Kernel panic: VFS: Unable to mount root fs on 3e:01

So, I know I am doing something wrong...can anyone point me in the
right direction? what is the best kernel to use for this? 

I would be happy to write up a HOWTO or the like if someone can help
me get it going. ;) 

kevin


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
