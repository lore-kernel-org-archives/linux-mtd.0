Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141bfw-0000bG-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 21:55:32 +0000
From: "Levi Khatskevitch" <lkhatskevitch@hotmail.com>
To: dwmw2@infradead.org
Cc: linuxbios@lanl.gov, mtd@infradead.org
Subject: blk_dev[93].request_fn == NULL bug is still there
Date: Thu, 30 Nov 2000 16:54:52 -0500
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <LAW-F91NtDEJmGzrLCC00005522@hotmail.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> > I've just tested the new code, the doc2001 use count still gets 
>increasingly
> > negative on each access to /dev/mtd0. Like:
>
>Are you sure you rebuilt mtdchar.o?
>
>--
>dwmw2
>
>

Ok, I was wrong I used the old vmlinux file :-). Module use count is correct 
now.

Now I've just reproduced the blk_dev[93].request_fn == NULL bug in the 
latest code. Here is how:

1) build the kernel with nftl*.o build in and doc*.o as modules.

2) insmod docecc.o; insmod doc2001.o; insmod docprobe.o
you'll see:

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip Millennium found at address 0xFFFC8000
Flash chip found: Manufacture ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 Mbytes
Cannot calculate an NFTL geometry to match size of 0x37c0.
Using C:1019 H:14 S:1 (== 0x37ba sects)
nftla:<3>ll_rw_block: Trying to read nonexistent block-device 5d:00 (0)
unable to read partition table
...

where "ll_rw_block: Trying to read nonexistent block-device 5d:00 (0)" is 
caused by blk_dev[0x5d].request_fn == NULL
any subsequent access to /dev/nftla results in the same error.

at the same time nftl *is* registered to MAJOR# 93 according to:
[root@c1000s-dtd /]# cat /proc/devices
Character devices:
  1 mem
  2 pty
  3 ttyp
  4 ttyS
  5 cua
10 misc
90 mtd
128 ptm
136 pts

Block devices:
  1 ramdisk
  2 fd
  7 loop
93 nftl
^^^^^^^^^

Regards,
- Levi

_____________________________________________________________________________________
Get more from the Web.  FREE MSN Explorer download : http://explorer.msn.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
