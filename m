Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ahEv-0000rX-00
	for mtd-list@infradead.org; Thu, 30 Mar 2000 16:52:09 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12ahEW-0000rQ-00
	for mtd@infradead.org; Thu, 30 Mar 2000 16:51:44 +0100
Message-ID: <38E378B1.2A635868@lucidvon.com>
Date: Thu, 30 Mar 2000 15:54:25 +0000
From: Dvir Oren <dviro@lucidvon.com>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: Problems with NFTL
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I'm summarizing my trouble with NFTL, perhaps someone can help me out:

1.  I don't understand why does the flash have 999 blocks when I format
it with M-Systems' dformat, and I have more blocks when I format it with
nftl_format.  I think this is somehow related to my file system trashes,
and to LILO not being able to boot.  I also get a message about reducing
capcity for geometry reasons from 0x7cf0 to 0x7ce0.  Could this be
related (this error only when I fromat with dformat).

2.  I took a flash formatted with M-Systems' dformat, booted linux with
a kernel with MTD drivers, I then ran fdisk to change the type from dos
to linux.  After I booted, MTD is unable to find any partitions, and in
fact, I can't even do fdisk /dev/nftla.  Something gets entirely
destroyed there.

3.  I booted a kernel with M-Systems' drivers, and then created a file
system on the flash.  I then booted a kernel with MTD drivers, and tried
to write something to the flash - that was successfuly, however when I
re-booted with the kerel with M-Systems' drivers, the drivers claimed
there was an error in the partition table, and they can't read anything
off the flash.

4.  I again created a flash with a file system under M-Systems' driver. 
I ran LILO on that flash, so that it will be able to boot.  I then
booted off the flash with a kernel with the MTD drivers in it!! 
However, after a couple of boots, the file system got destructed.  I
also tried to run LILO off the flash (to /dev/nftla, instead of /dev/fla
as I did before), and LILO couldn't load.

I would really want to get a kernel with the MTD drivers to boot and
operate correctly.  Currently, I'm playing around with all sorts of
things, and getting no where.  Any help would be appreciated.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
