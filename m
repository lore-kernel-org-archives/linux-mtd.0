Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQg3h-00078O-5u
 for linux-mtd@lists.infradead.org; Fri, 12 Apr 2013 15:38:38 +0000
Received: by mail-wi0-f176.google.com with SMTP id hm14so1724728wib.15
 for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2013 08:38:35 -0700 (PDT)
Message-ID: <51682A79.1010307@gmail.com>
Date: Fri, 12 Apr 2013 16:38:33 +0100
From: Paul Black <paul.0000.black@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS Problems After Upgrading Kernel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm looking at upgrading the kernel on an embedded product we have from
2.6.36 to 3.4.x (currently testing with 3.4.39).

The device has UBIFS that is created on 2.6.30 running on the device
itself with the following commands:
flash_eraseall /dev/mtd8
ubiformat -y /dev/mtd8 -s 512
ubiattach /dev/ubi_ctrl -m 8
ubimkvol /dev/ubi0 -N rootfs -m

(I'm not sure why there is the "-s 512" there but I'm sure there was a
good reason at the time!).

The various UBI utilitites would appear to be v1.0.


The UBIFS generated in this way works fine under 2.6.36:
[    0.580000] NAND device: Manufacturer ID: 0xad, Chip ID: 0xda (Hynix
NAND 256MiB 3,3V 8-bit)
[    0.590000] AT91 NAND: 8-bit, Software ECC
[    0.600000] Scanning device for bad blocks

[    0.790000] 0x000000800000-0x000010000000 : "rootfs"
[    0.800000] UBI: attaching mtd8 to ubi0
[    0.800000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.810000] UBI: logical eraseblock size:    129024 bytes
[    0.810000] UBI: smallest flash I/O unit:    2048
[    0.820000] UBI: sub-page size:              512
[    0.820000] UBI: VID header offset:          512 (aligned 512)
[    0.830000] UBI: data offset:                2048
[    1.100000] UBI: max. sequence number:       675
[    1.120000] UBI: attached mtd8 to ubi0
[    1.130000] UBI: MTD device name:            "rootfs"
[    1.130000] UBI: MTD device size:            248 MiB
[    1.140000] UBI: number of good PEBs:        1984
[    1.140000] UBI: number of bad PEBs:         0
[    1.150000] UBI: max. allowed volumes:       128
[    1.150000] UBI: wear-leveling threshold:    4096
[    1.160000] UBI: number of internal volumes: 1
[    1.160000] UBI: number of user volumes:     1
[    1.160000] UBI: available PEBs:             0
[    1.170000] UBI: total number of reserved PEBs: 1984
[    1.170000] UBI: number of PEBs reserved for bad PEB handling: 19
[    1.180000] UBI: max/mean erase counter: 1/0
[    1.180000] UBI: image sequence number:  0
[    1.190000] UBI: background thread "ubi_bgt0d" started, PID 30

[    1.530000] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    1.530000] UBIFS: file system size:   251467776 bytes (245574 KiB,
239 MiB, 1949 LEBs)
[    1.540000] UBIFS: journal size:       12644352 bytes (12348 KiB, 12
MiB, 98 LEBs)
[    1.550000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    1.560000] UBIFS: default compressor: lzo
[    1.560000] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
[    1.570000] VFS: Mounted root (ubifs filesystem) on device 0:11.


However, after upgrading to 3.4.39, the root FS doesn't mount:
[    0.710000] atmel_nand: Use On Flash BBT
[    0.720000] atmel_nand atmel_nand: No DMA support for NAND access.
[    0.720000] NAND device: Manufacturer ID: 0xad, Chip ID: 0xda (Hynix
NAND 256MiB 3,3V 8-bit)
[    0.730000] Bad block table not found for chip 0
[    0.740000] Bad block table not found for chip 0
[    0.740000] Scanning device for bad blocks
[    0.870000] Bad block table written to 0x00000ffe0000, version 0x01
[    0.880000] Bad block table written to 0x00000ffc0000, version 0x01

[    0.960000] 0x000000800000-0x000010000000 : "rootfs"
[    0.970000] UBI: attaching mtd8 to ubi0
[    0.970000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.980000] UBI: logical eraseblock size:    129024 bytes
[    0.980000] UBI: smallest flash I/O unit:    2048
[    0.990000] UBI: sub-page size:              512
[    0.990000] UBI: VID header offset:          512 (aligned 512)
[    1.000000] UBI: data offset:                2048
[    1.280000] UBI: max. sequence number:       745
[    1.290000] UBI warning: print_rsvd_warning: cannot reserve enough
PEBs for bad PEB handling, reserved 15, need 19
[    1.310000] UBI: attached mtd8 to ubi0
[    1.310000] UBI: MTD device name:            "rootfs"
[    1.310000] UBI: MTD device size:            248 MiB
[    1.320000] UBI: number of good PEBs:        1980
[    1.320000] UBI: number of bad PEBs:         4
[    1.330000] UBI: number of corrupted PEBs:   0
[    1.330000] UBI: max. allowed volumes:       128
[    1.340000] UBI: wear-leveling threshold:    4096
[    1.340000] UBI: number of internal volumes: 1
[    1.350000] UBI: number of user volumes:     1
[    1.350000] UBI: available PEBs:             0
[    1.360000] UBI: total number of reserved PEBs: 1980
[    1.360000] UBI: number of PEBs reserved for bad PEB handling: 15
[    1.370000] UBI: max/mean erase counter: 1/0
[    1.370000] UBI: image sequence number:  0
[    1.380000] UBI: background thread "ubi_bgt0d" started, PID 799

[    1.650000] UBIFS error (pid 1): ubifs_read_node: bad node type (255
but expected 6)
[    1.660000] UBIFS error (pid 1): ubifs_read_node: bad node at LEB
0:0, LEB mapping status 0
[    1.660000] Not a node, first 24 bytes:
[    1.670000] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff                          ........................
[    1.680000] [<c000d2d0>] (unwind_backtrace+0x0/0xf0) from
[<c00ccdf4>] (ubifs_read_node+0x22c/0x2a4)
[    1.690000] [<c00ccdf4>] (ubifs_read_node+0x22c/0x2a4) from
[<c00c94b8>] (ubifs_read_sb_node+0x54/0x78)
[    1.700000] [<c00c94b8>] (ubifs_read_sb_node+0x54/0x78) from
[<c00ca1d0>] (ubifs_read_superblock+0xca4/0x1674)
[    1.710000] [<c00ca1d0>] (ubifs_read_superblock+0xca4/0x1674) from
[<c00c7e38>] (ubifs_mount+0x6dc/0x1b44)
[    1.720000] [<c00c7e38>] (ubifs_mount+0x6dc/0x1b44) from [<c00749ac>]
(mount_fs+0x14/0xcc)
[    1.730000] [<c00749ac>] (mount_fs+0x14/0xcc) from [<c00888b4>]
(vfs_kern_mount+0x4c/0xac)
[    1.740000] [<c00888b4>] (vfs_kern_mount+0x4c/0xac) from [<c0088b74>]
(do_kern_mount+0x34/0xd4)
[    1.740000] [<c0088b74>] (do_kern_mount+0x34/0xd4) from [<c008a324>]
(do_mount+0x3f8/0x6b4)
[    1.750000] [<c008a324>] (do_mount+0x3f8/0x6b4) from [<c008a66c>]
(sys_mount+0x84/0xc4)
[    1.760000] [<c008a66c>] (sys_mount+0x84/0xc4) from [<c0346ab4>]
(mount_block_root+0xf0/0x298)
[    1.770000] [<c0346ab4>] (mount_block_root+0xf0/0x298) from
[<c0346d4c>] (prepare_namespace+0x8c/0x174)
[    1.780000] [<c0346d4c>] (prepare_namespace+0x8c/0x174) from
[<c0346884>] (kernel_init+0x16c/0x1a8)
[    1.790000] [<c0346884>] (kernel_init+0x16c/0x1a8) from [<c0009c24>]
(kernel_thread_exit+0x0/0x8)

(This is with all the UBI/UBIFS debugging options turned on that I could
find).

Is there a way that I can get the FS mounted under the later kernel?

Cheers.


Paul
