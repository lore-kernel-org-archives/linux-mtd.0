Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12WPTq-0007TT-00
	for mtd-list@infradead.org; Sat, 18 Mar 2000 20:05:50 +0000
From: "Dvir Oren" <dvir@lucidvon.com>
To: MTD <mtd@infradead.org>,
              David Woodhouse <dwmw2@infradead.org>
Date: Sat, 18 Mar 2000 22:05:11 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Questions about MTD
Message-Id: <E12WPTl-0007TN-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I'm trying to use the MTD drivers to boot off a DiskOnChip 2000, 
and ran into the following problems:

1.  The flash has to be formatted with nftl_format in order for the 
MTD drivers to write successfully to the flash.  However, when I run 
nftl_format, it destroys the bios extension that allows booting from 
the flash.  I then try to run nftl_format /dev/mtd0 49152, to skip the 
first 48K, which hold the bios extension.  However, this seems to 
cause some problems:

a.  nftl_format in fact does not erase the first 48K, however it does 
delete the partition table.  As I understand it, the disk partition is in 
the first 512 bytes, so how can that be?

b.  When I try to create the partition, there are a lot of file system 
errors, possibly because I formatted starting at 49152.  It seems 
like nftl_format doesn't set the start of the device from after the first 
48k, which will then conflict.

2.  doc_loadbios doesn't seem to do what it's supposed to do.  
However, it does destroy the flash, allowing me to docpmap /e the 
flash, which will lead me to the next...

3.  erase seg faults.  Is erase supposed to do what docpmap /e 
does?

4.  Some odd problems when trying to dd the first 48k.  The 
partition table is not saved after removing the nftl module.  Only 
after writing it a second time does it get saved.

5.  One thing I don't understand:  even though everybody talks 
about the first 48k being the firmware, the firmware itself is less 
than 48k.  How does that work?  And what about the first 512bytes 
of the partition table?

Can anybody help?
Has anybody succeeded in booting off a DiskOnChip 2000 using 
the MTD drivers?

BTW:  The lilo I posted here a few weeks ago which was patched 
to work with MTD, probably will not work correctly.  I'll post here a 
new one soon,. if it interests anyone.

I was partially able to load LILO off /dev/nftla, however only from the 
MBR (not /dev/nftla1) - it seems like nftl_format destroys the MBR, 
or something like that.  I was not able to create a full boot from the 
flash, since the file system keeps getting trashed.

---------
Dvir Oren <dvir@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
