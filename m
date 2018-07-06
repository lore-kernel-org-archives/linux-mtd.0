Received: from mail-it0-x22a.google.com ([2607:f8b0:4001:c0b::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbUUL-0001L1-Sq
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 17:25:47 +0000
Received: by mail-it0-x22a.google.com with SMTP id p17-v6so18141206itc.2
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2018 10:25:34 -0700 (PDT)
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Fri, 6 Jul 2018 18:25:22 +0100
Message-ID: <CABatt_xYR1OXfmoK=gUS2ny67U3q0hg6Q_woRmuDQ=U4By3POg@mail.gmail.com>
Subject: UBI on small SPI-NOR device
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to get UBI working on a small SPI-NOR flash device, it's
working great on the NAND but for some reason I can't get it working
on the SPI-NOR.

It's very small as you can see and only needs to store several small files.

mtd3: 000a0000 00008000 "u-boot"
mtd4: 00160000 00008000 "nvmem"

I've set the device up so it has a 32KiB Sector Size.  But when I
erase the mtd partition and then attach to it I see UBI Erase Blocks
every 64KiB even though the output looks ok

root@mach-cw-rnet-ppm-1717:~# flash_erase /dev/mtd4 0 0
Erasing 32 Kibyte @ 6400158000 -- -1 % complete
root@mach-cw-rnet-ppm-1717:~# ubiattach /dev/ubi_ctrl -p /dev/mtd4
UBI device number 0, total 44 LEBs (1436160 bytes, 1.4 MiB), available
38 LEBs (1240320 bytes, 1.2 MiB), LEB size 32640 bytes (31.9 KiB)
root@mach-cw-rnet-ppm-1717:~# ubinfo /dev/ubi0
ubi0
Volumes count:                           0
Logical eraseblock size:                 32640 bytes, 31.9 KiB
Total amount of logical eraseblocks:     44 (1436160 bytes, 1.4 MiB)
Amount of available logical eraseblocks: 38 (1240320 bytes, 1.2 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  0
Current maximum erase counter value:     1
Minimum input/output unit size:          1 byte
Character device major/minor:            245:0

Yet a Hexdump of /dev/mtd4 shows what I'm assuming erase blocks every 64KiB

00138000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00138010  00 00 00 40 00 00 00 80  5c 6f 29 43 00 00 00 00  |...@....\o)C....|
00138020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00138030  00 00 00 00 00 00 00 00  00 00 00 00 e6 a6 98 04  |................|
00138040  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00148000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00148010  00 00 00 40 00 00 00 80  5c 6f 29 43 00 00 00 00  |...@....\o)C....|
00148020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00148030  00 00 00 00 00 00 00 00  00 00 00 00 e6 a6 98 04  |................|
00148040  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00158000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00158010  00 00 00 40 00 00 00 80  5c 6f 29 43 00 00 00 00  |...@....\o)C....|
00158020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00158030  00 00 00 00 00 00 00 00  00 00 00 00 e6 a6 98 04  |................|
00158040  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|

root@mach-cw-rnet-ppm-1717:~# hexdump -C /dev/mtd4 | grep UBI#
00008000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00018000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00028000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00038000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00048000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00058000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00068000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00078000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00088000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00098000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
000a8000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
000b8000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
000c8000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
000d8000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
000e8000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
000f8000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00108000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00118000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00128000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00138000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00148000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|
00158000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#............|

I count 22 eraseblocks and not 44 which again suggests that 64KiB has been used.

Here's the entry from the spi_nor_ids
{ "is25lp016", INFO(0x9d6015, 0, 32 * 1024,  64, SPI_NOR_DUAL_READ |
SPI_NOR_QUAD_READ) },

which I have added.

I've tried using 64KiB Erase blocks but then there aren't enough when
mounting the UBI volume.

I can actually create a volume and mount it but when I detach and
re-attach a couple of times it fails

root@mach-cw-rnet-ppm-1717:~# ubimkvol /dev/ubi0 -N nvmem -m
Set volume size to 1240320
Volume ID 0, size 38 LEBs (1240320 bytes, 1.2 MiB), LEB size 32640
bytes (31.9 KiB), dynamic, name "nvmem", alignment 1
root@mach-cw-rnet-ppm-1717:~# mount -t ubifs ubi0:nvmem /mnt
root@mach-cw-rnet-ppm-1717:~# df -h /mnt
Filesystem                Size      Used Available Use% Mounted on
ubi0:nvmem              588.0K     20.0K    524.0K   4% /mnt
root@mach-cw-rnet-ppm-1717:~# echo test > /mnt/test.txt
root@mach-cw-rnet-ppm-1717:~# df -h /mnt
Filesystem                Size      Used Available Use% Mounted on
ubi0:nvmem              588.0K     24.0K    520.0K   4% /mnt
root@mach-cw-rnet-ppm-1717:~# umount /mnt
root@mach-cw-rnet-ppm-1717:~# ubidetach -p /dev/mtd4
root@mach-cw-rnet-ppm-1717:~# ubiattach /dev/ubi_ctrl -p /dev/mtd4
ubi0 warning: ubi_read_volume_table: volume table copy #2 is corrupted
UBI device number 0, total 44 LEBs (1436160 bytes, 1.4 MiB), available
0 LEBs (0 bytes), LEB size 32640 bytes (31.9 KiB)
root@mach-cw-rnet-ppm-1717:~# ubidetach -p /dev/mtd4
root@mach-cw-rnet-ppm-1717:~# ubiattach /dev/ubi_ctrl -p /dev/mtd4
ubi0 error: ubi_read_volume_table: the layout volume was not found
ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
ubiattach: error!: cannot attach "/dev/mtd4"
           error 22 (Invalid argument)


Kernel is 4.9 and UBI is working absolutely fine on the NAND device we
also have on this board.

Any help would be greatly appreciated,
Martin.
