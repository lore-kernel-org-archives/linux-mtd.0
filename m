Received: from web52602.mail.yahoo.com ([206.190.39.140])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DiujD-0000dh-8E
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 09:48:21 -0400
Message-ID: <20050616134813.59400.qmail@web52602.mail.yahoo.com>
Date: Thu, 16 Jun 2005 06:48:13 -0700 (PDT)
From: Vincent Lim <e2vincent@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Mounting Problem on MTD NAND (Samsung) device on 2.6.11
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Gurus:

I experienced problem mounting the MTD NAND (Samsung
K9f1208UOA) device on 2.6.11 kernel. 
These are the steps that I made using the utility
built-in:

 mkfs.jffs2 -d ~/PM/ -e 0x4000 -p 0x4000 -o 
 NANDjffs2.image
 eraseall /dev/mtd3 
 nandwrite /dev/mtd3 NANDjffs2.image
 mount -t jffs2 /dev/mtdblock3 /mnt/mtd3
 dir /mnt/mtd3/ 

I have error messages as below while executing the
commands. See below.
I have no clue yet what I need to do, can someone show
me the pointers where I should narrow down the problem
?
Is it because of an error during the creation of the
JFFS2 filesystem while mounting ?
I hope it is just a bad part. :-)
 

BR,

V.
------------------------------------------------------
root@(none):~# eraseall /dev/mtd3
Erasing 16 Kibyte @ 0 --  0 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 4000 --  0 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 8000 --  0 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ c000 --  0 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 10000 --  0 % complete.
...
Erasing 16 Kibyte @ 7e0000 -- 98 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 7e4000 -- 98 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 7e8000 -- 98 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 7ec000 -- 99 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 7f0000 -- 99 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 7f4000 -- 99 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 7f8000 -- 99 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erasing 16 Kibyte @ 7fc000 -- 99 % complete.
eraseall: /dev/mtd3: MTD Erase failure: Input/output
error
Erased 8192 Kibyte @ 0 -- 100% complete.

root@(none):~# nandwrite /dev/mtd3 NANDjffs2.image
Writing data to block 0
Bad block at 0, will be skipped
Writing data to block 4000
Bad block at 4000, will be skipped
Writing data to block 8000
Bad block at 8000, will be skipped
Writing data to block c000
Bad block at c000, will be skipped
Writing data to block 10000
Bad block at 10000, will be skipped
Writing data to block 14000
Bad block at 14000, will be skipped
Writing data to block 18000
Bad block at 18000, will be skipped
Writing data to block 1c000
Bad block at 1c000, will be skipped
Writing data to block 20000
Bad block at 20000, will be skipped
...
Writing data to block 7e8000
Bad block at 7e8000, will be skipped
Writing data to block 7ec000
Bad block at 7ec000, will be skipped
Writing data to block 7f0000
Bad block at 7f0000, will be skipped
Writing data to block 7f4000
Bad block at 7f4000, will be skipped
Writing data to block 7f8000
Bad block at 7f8000, will be skipped
Writing data to block 7fc000
Bad block at 7fc000, will be skipped
Data did not fit into device, due to bad blocks
: Success


root@(none):~# mount -t jffs2 /dev/mtdblock3 /mnt/mtd3
mtd->read(0x400 bytes from 0x0) returned ECC error
mtd->read(0x3c08 bytes from 0x3f8) returned ECC error
mtd->read(0x400 bytes from 0x4000) returned ECC error
mtd->read(0x3c08 bytes from 0x43f8) returned ECC error
mtd->read(0x400 bytes from 0x8000) returned ECC error
mtd->read(0x3c08 bytes from 0x83f8) returned ECC error
mtd->read(0x400 bytes from 0xc000) returned ECC error
mtd->read(0x3c08 bytes from 0xc3f8) returned ECC error
...
mtd->read(0x400 bytes from 0x734000) returned ECC
error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x00734168: 0xd700 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x0073416c: 0xd7d7 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x00734170: 0xd7d7 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x00734174: 0xd7d7 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x00734178: 0xd7d7 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x0073417c: 0xd7d7 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x00734180: 0xd7d7 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x00734184: 0xd7d7 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x00734188: 0xd7d7 insd
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x0073418c: 0xd7d7 insd
Further such events for this erase block will not be
printed
mtd->read(0x3c08 bytes from 0x7343f8) returned ECC
error
...
mtd->read(0x3c08 bytes from 0x7ec3f8) returned ECC
error
mtd->read(0x400 bytes from 0x7f0000) returned ECC
error
mtd->read(0x3c08 bytes from 0x7f03f8) returned ECC
error
mtd->read(0x400 bytes from 0x7f4000) returned ECC
error
mtd->read(0x3c08 bytes from 0x7f43f8) returned ECC
error
mtd->read(0x400 bytes from 0x7f8000) returned ECC
error
mtd->read(0x3c08 bytes from 0x7f83f8) returned ECC
error
mtd->read(0x400 bytes from 0x7fc000) returned ECC
error
mtd->read(0x3c08 bytes from 0x7fc3f8) returned ECC
error
Cowardly refusing to erase blocks on filesystem with
no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 512
mount: /dev/mtdblock3: can't read superblock

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
