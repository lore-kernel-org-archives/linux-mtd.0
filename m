Received: from ipmail05.adl6.internode.on.net ([150.101.137.143])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S898w-0003FH-RO
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2012 11:46:56 +0000
Message-ID: <4F61D6CF.4080707@internode.on.net>
Date: Thu, 15 Mar 2012 22:17:27 +1030
From: Craig Peacock <Craig.Peacock@internode.on.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Assistance with debugging ubi_io_read error -74 (ECC Error)
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm trying to get UBI volumes/fs working on a Seagate GoFlex Home 
platform with a custom kernel. The product orginally ships with a 
working UBIFS. It has a Marvell Kirkwood (ARM) processor with a Toshiba 
TC58NVG1S3ETA00 256Mbyte NAND flash and runs Kernel 2.6.22.18. It 
appears to be based on Marvell LSP Version KW_LSP_4.3.4_patch22. One of 
the kernel parameters is ubi.mtd=2,2048 setting the VID header to an 
offset of 2048 bytes and avoiding subpages.

I've recompiled my own kernel for the board based on Linux 3.2.9 but I 
am unable to successfully use UBIFS even when I set the VID header to a 
2048 byte offset.

When I try to boot with the root UBIFS on mtd2 I get:

NAND device: Manufacturer ID: 0x98, Chip ID: 0xda (Toshiba NAND 256MiB 
3,3V 8-bit)
Scanning device for bad blocks
Creating 3 MTD partitions on "orion_nand":
0x000000000000-0x000000100000 : "u-boot"
0x000000100000-0x000000700000 : "uImage"
0x000000700000-0x000010000000 : "root"
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBI error: ubi_io_read: error -74 (ECC error) while reading 64 bytes 
from PEB 6:0, read 64 bytes
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBI error: ubi_io_read: error -74 (ECC error) while reading 64 bytes 
from PEB 8:0, read 64 bytes
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBI error: ubi_io_read: error -74 (ECC error) while reading 64 bytes 
from PEB 17:0, read 64 bytes

...

UBI error: ubi_io_read: error -74 (ECC error) while reading 64 bytes 
from PEB 1984:0, read 64 bytes
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBI: max. sequence number:       5
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "root"
UBI: MTD device size:            249 MiB
UBI: number of good PEBs:        1992
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             1969
UBI: total number of reserved PEBs: 23
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 9/0
UBI: image sequence number:  205915892
UBI: background thread "ubi_bgt0d" started, PID 472

Documentation would suggest it could be a buggy NAND driver, ECC or 
subpage problem.

I've compiled and executed the mtd_nandecctest module. It reports ECC is 
all o.k. :

mtd_nandecctest: ok - nand-ecc-256
mtd_nandecctest: ok - nand-ecc-512

The pagetest module works fine, but the subpagetest returns the following :

=================================================
mtd_subpagetest: MTD device: 2
mtd_subpagetest: MTD device size 261095424, eraseblock size 131072, page 
size 2048, subpage size 512, count of eraseblocks 1992, pages per 
eraseblock 64, OOB size 64
mtd_subpagetest: scanning for bad eraseblocks
mtd_subpagetest: scanned 1992 eraseblocks, 0 are bad
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 1992 eraseblocks
mtd_subpagetest: writing whole device
mtd_subpagetest: written up to eraseblock 0
mtd_subpagetest: written up to eraseblock 256
mtd_subpagetest: written up to eraseblock 512
mtd_subpagetest: written up to eraseblock 768
mtd_subpagetest: written up to eraseblock 1024
mtd_subpagetest: written up to eraseblock 1280
mtd_subpagetest: written up to eraseblock 1536
mtd_subpagetest: written up to eraseblock 1792
mtd_subpagetest: written 1992 eraseblocks
mtd_subpagetest: verifying all eraseblocks
uncorrectable error :
mtd_subpagetest: error: read failed at 0x200
mtd_subpagetest: error -74 occurred
=================================================
insmod: error inserting 'mtd_subpagetest.ko': -1 Bad message

suggesting there is in fact a subpage problem.

I can mount a root filesystem using NFS. From here, I can erase, format 
and attach mtd2 on the target :

# flash_erase /dev/mtd2 0 0
# ubiformat /dev/mtd2 -s 2048 -O 2048
# ubiattach -p /dev/mtd2 -O 2048
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes 
from PEB 0:2048, read 512 bytes
uncorrectable error :
...
UBI error: ubi_io_read: error -74 (ECC error) while reading 64 bytes 
from PEB 1989:0, read 64 bytes
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBI: max. sequence number:       0
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "root"
UBI: MTD device size:            249 MiB
UBI: number of good PEBs:        1992
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             1969
UBI: total number of reserved PEBs: 23
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 0/0
UBI: image sequence number:  1321006557
UBI: background thread "ubi_bgt0d" started, PID 1172
UBI device number 0, total 1992 LEBs (252936192 bytes, 241.2 MiB), 
available 1969 LEBs (250015744 bytes, 238.4 MiB), LEB size 126976 bytes 
(124.0 KiB)
UBI: scrubbed PEB 0 (LEB 2147479551:0), data moved to PEB 1991
UBI: scrubbed PEB 1 (LEB 2147479551:1), data moved to PEB 0

If there any other tests I can run to narrow down the problem?

Do I assume this is a problem with the NAND driver, or do you have any 
ideas where I should start looking?

Regards,

Craig
