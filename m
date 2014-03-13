Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO35u-0003tx-GJ
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 10:42:35 +0000
Received: by mail-ob0-f176.google.com with SMTP id wp18so815583obc.21
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 03:42:11 -0700 (PDT)
MIME-Version: 1.0
From: Auclair Vincent <auclair.vincent@gmail.com>
Date: Thu, 13 Mar 2014 11:41:51 +0100
Message-ID: <CAC2x2XHNW6HytsBipspPkQOBup27G1-WXrWG+ec43EbS_pjROA@mail.gmail.com>
Subject: nand erratic behavior with data loss
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We've been having the following problem on two different boards with different
uboot & linux kernel version pair. If we write on the nand and reboot, from time
to time, the uboot env or uboot itself becomes corrupted and either the default
env kicks in or the board doesn't boot at all. We think this comes from linux,
but not sure how code could bypass the mtd slice code to write into
another slice.

We can randomly reproduce by running bonnie++ on a ubifs slice. We are
trying to test if the error can be reproduced via mtd directly by writing random
data on a /dev/mtdblock?. But we get random failures on the mtdblock at
different offsets each time.

We've been investigating this error for several weeks and are now in a dead-end.
Do you have any idea what could cause the nand to suddenly loose data from
a part which is never written to ?

We've investigated more on the following board, but exact same problem
happens on another one.

The following script is used to stresstest the nand.

```
#!/bin/sh

FILE=/tmp/test
set -e

while true; do
  flash_erase /dev/mtd4 0 256
  dd if=/dev/urandom of=$FILE bs=1k count=32k
  dd if=$FILE of=/dev/mtdblock3 bs=1k count=32k
  cmp $FILE /dev/mtdblock3
done
'''

The following randomly error appears after a while :

```
end_request: I/O error, dev mtdblock4, sector 7664
Buffer I/O error on device mtdblock4, logical block 958
end_request: I/O error, dev mtdblock4, sector 7664
Buffer I/O error on device mtdblock4, logical block 958
cmp: /dev/mtdblock4: I/O error
end_request: I/O error, dev mtdblock4, sector 25888
Buffer I/O error on device mtdblock4, logical block 3236
end_request: I/O error, dev mtdblock4, sector 25888
Buffer I/O error on device mtdblock4, logical block 3236
cmp: /dev/mtdblock4: I/O error
'''

Here follows mtdinfo -a

````
Count of MTD devices:           6
Present MTD devices:            mtd0, mtd1, mtd2, mtd3, mtd4, mtd5
Sysfs interface supported:      yes

mtd0
Name:                           uboot
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          16 (2097152 bytes, 2.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:0
Bad blocks are allowed:         true
Device is writable:             false

mtd1
Name:                           kernel
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          48 (6291456 bytes, 6.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:2
Bad blocks are allowed:         true
Device is writable:             false

mtd2
Name:                           rootfs
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1216 (159383552 bytes, 152.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:4
Bad blocks are allowed:         true
Device is writable:             true

mtd3
Name:                           XXX
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          256 (33554432 bytes, 32.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:6
Bad blocks are allowed:         true
Device is writable:             true

mtd4
Name:                           backup
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          256 (33554432 bytes, 32.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:8
Bad blocks are allowed:         true
Device is writable:             true

mtd5
Name:                           rsvd
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          256 (33554432 bytes, 32.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:10
Bad blocks are allowed:         true
Device is writable:             true
''''

Ubinfo of the two ubidevices, first one is mounted read-only :
```
# ubinfo /dev/ubi0
ubi0
Volumes count:                           1
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     1216 (156893184 bytes, 149.6 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  24
Current maximum erase counter value:     13
Minimum input/output unit size:          2048 bytes
Character device major/minor:            254:0
Present volumes:                         0
# ubinfo /dev/ubi1
ubi1
Volumes count:                           1
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     256 (33030144 bytes, 31.5 MiB)
Amount of available logical eraseblocks: 20 (2580480 bytes, 2.5 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  4
Current maximum erase counter value:     1140
Minimum input/output unit size:          2048 bytes
Character device major/minor:            253:0
Present volumes:                         0
'''

Nand device is : ``NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda
(Micron MT29F2G08ABAEAH4), page size: 2048, OOB size: 64''
Nand driver is : ``orion_nand''
Kernel cmdline for nand is :
``mtdparts="orion_nand:0x00200000(uboot)ro,0x600000(kernel)ro,0x09800000(rootfs),0x02000000(XXX),0x02000000(backup),0x02000000(rsvd)"''

Kernel version is : ``3.4.0'' with custom patches (nand/mtd/orion code path
is clean) as well as the following patches from mainline applied :
cf38aca520741ccdc1365efbef5a4cab33b0a4ac
78b495c39add820ab66ab897af9bd77a5f2e91f6

CPU: Feroceon

Thanks in advance

-- 
Vincent Auclair        -      auclair.vincent[ at ]gmail.com
