Received: from smtp-out04.msg.oleane.net ([62.161.7.2])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SwudE-0003T5-0g
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 12:36:01 +0000
Received: from smtp04.msg.oleane.net (smtp04.mail.priv [172.17.20.113])
 by smtp-out04.msg.oleane.net with ESMTP id q72CZE16032203
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 14:35:14 +0200
Received: from smtp04.msg.oleane.net (localhost [127.0.0.1])
 by smtp04.msg.oleane.net (MTA-AV) with ESMTP id q72CZEV6032382
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 14:35:14 +0200
Received: from EG13SEVEN64 (117.49.72.86.rev.sfr.net [86.72.49.117])
 (authenticated)
 by smtp04.msg.oleane.net (MSA) with ESMTP id q72CZD7A032280
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 14:35:13 +0200
From: "Fabien Comte" <fabien.comte@ercogener.com>
To: <linux-mtd@lists.infradead.org>
Subject: Potential issue on UBIFS for Kernel 3.4.7
Date: Thu, 2 Aug 2012 14:35:12 +0200
Message-ID: <005901cd70ab$4356c150$ca0443f0$@ercogener.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I migrated some products (embedded devices with 256 Mbytes NAND flash, about
5 products broken by the transition) from a kernel 3.4.4 (they had previous
versions before 3.4.4) to a 3.4.7. And after a clean shutdown (no power
cut), I got these messages and some files corrupted (random, not always the
same).

[    5.800000] UBIFS error (pid 884): ubifs_read_node: bad node type (255
but expected 2)
[    5.800000] UBIFS error (pid 884): ubifs_read_node: bad node type (255
but expected 2)
[    5.810000] UBIFS error (pid 884): ubifs_read_node: bad node at LEB
694:34816, LEB mapping status 0
[    5.810000] UBIFS error (pid 884): ubifs_read_node: bad node at LEB
694:34816, LEB mapping status 0
[    5.820000] UBIFS error (pid 885): ubifs_read_node: bad node type (255
but expected 2)
[    5.820000] UBIFS error (pid 885): ubifs_read_node: bad node type (255
but expected 2)
[    5.830000] UBIFS error (pid 885): ubifs_read_node: bad node at LEB
694:34816, LEB mapping status 0
[    5.830000] UBIFS error (pid 885): ubifs_read_node: bad node at LEB
694:34816, LEB mapping status 0
[   10.390000] UBIFS error (pid 968): ubifs_read_node: bad node type (255
but expected 2)
[   10.390000] UBIFS error (pid 968): ubifs_read_node: bad node type (255
but expected 2)
[   10.390000] UBIFS error (pid 968): ubifs_read_node: bad node at LEB
694:120832, LEB mapping status 0
[   10.390000] UBIFS error (pid 968): ubifs_read_node: bad node at LEB
694:120832, LEB mapping status 0

I noticed that the problem appends on products that worked few weeks with
previous versions of kernel (potentially a lot of writes on the NAND due to
logging applications running on the device). Problem is not on new products
if I flash them with a kernel 3.0.4 and jump directly to a 3.4.7 after few
minutes.

My boot arguments are :
ubi.mtd=7 root=ubi0:at91sam9260ek-rootfs rootfstype=ubifs
rootflags=sync,bulk_read,chk_data_crc,compr=lzo rw

MTD tests looks good.

On next commant, mtd7 is my rootfs and is formatted with UBIFS.

mtdinfo -a
Count of MTD devices:           8
Present MTD devices:            mtd0, mtd1, mtd2, mtd3, mtd4, mtd5, mtd6,
mtd7
Sysfs interface supported:      yes

mtd0
Name:                           bootstrap
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:0
Bad blocks are allowed:         true
Device is writable:             true

mtd1
Name:                           uboot
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4 (524288 bytes, 512.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:2
Bad blocks are allowed:         true
Device is writable:             true

mtd2
Name:                           env1
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:4
Bad blocks are allowed:         true
Device is writable:             true

mtd3
Name:                           env2
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:6
Bad blocks are allowed:         true
Device is writable:             true

mtd4
Name:                           spare
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:8
Bad blocks are allowed:         true
Device is writable:             true

mtd5
Name:                           kernel1
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          28 (3670016 bytes, 3.5 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:10
Bad blocks are allowed:         true
Device is writable:             true

mtd6
Name:                           kernel2
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          28 (3670016 bytes, 3.5 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:12
Bad blocks are allowed:         true
Device is writable:             true

mtd7
Name:                           rootfs
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1984 (260046848 bytes, 248.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:14
Bad blocks are allowed:         true
Device is writable:             true



ubinfo -a

UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:63
Present UBI devices:            ubi0

ubi0
Volumes count:                           1
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     1980 (255467520 bytes, 243.6 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       4
Count of reserved physical eraseblocks:  34
Current maximum erase counter value:     3
Minimum input/output unit size:          2048 bytes
Character device major/minor:            253:0
Present volumes:                         0

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        1942 LEBs (250564608 bytes, 239.0 MiB)
State:       OK
Name:        at91sam9260ek-rootfs
Character device major/minor: 253:1

Do someone get any idea ?

Thank you.

Fabien
