Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sj1lZ-0000A2-L0
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 05:23:17 +0000
Received: by pbbrq13 with SMTP id rq13so6541897pbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jun 2012 22:23:11 -0700 (PDT)
MIME-Version: 1.0
Sender: iwo.mergler@gmail.com
Date: Mon, 25 Jun 2012 15:23:10 +1000
Message-ID: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
Subject: UBIFS fails to mount on second boot
From: Iwo <Iwo.Mergler@netcomm.com.au>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,


I'm trying to use a UBIFS partition as the linux root filesystem.
After flashing the
UBI image, the system boots successfully and is functional.

On the second boot, however, mounting of the UBIFS fails and the kernel panics.
It is possible to avoid the failure by performing a large number of filesystem
operations (i.e. file system benchmark) during the first session.

Has anyone seen this before? Suggestions?

The hardware is a TI am335x processor with a 256MB, 2K pages, 128K erase block
NAND flash.

As is all too common, the flash supports sub-pages, the driver does
not. Thus, I'm
forcing the VID header offset to 2048.

The kernel is a 3.1.0 with TI patches and UBI+UBIFS patches from
git://git.infradead.org/~dedekind/ubifs-v3.1.git today. I had to change
IS_ENABLED(DEBUG_FS) to IS_ENABLED(CONFIG_DEBUG_FS)
to make that compile. The original v3.1.0 UBI/UBIFS code exhibited
the same behaviour though.

The image is generated like so (using the latest MTD tools GIT):

 mkfs.ubifs -d staging -F -o root.ubifs -m 0x800 -e 126976 -c 511
 Using UBI volume size of 16760832 (16777216)
 ubinize -o root.ubi -m 0x800 -p 0x20000 ubi.cfg

ubi.cfg:

 [ubifs]
 mode=ubi
 image=root.ubifs
 vol_id=0
 vol_size=16777216
 vol_type=dynamic
 vol_name=rootfs
 vol_flags=autoresize

The UBI image is written by U-Boot, skipping write on any pages that
contain 0xFF.

Here are the interesting bits from the kernel log. First (successful) boot:

[    0.000000] Kernel command line: console=ttyO0,115200n8 noinitrd
rootfstype=ubifs rootwait=1 ip=none ubifs.debug_msgs=0xffff
root=ubi0:rootfs rw ubi.mtd=roota,2048
...
[    1.370993] Creating 8 MTD partitions on "omap2-nand.0":
[    1.376607] 0x000000000000-0x000000300000 : "S1S2EN"
[    1.384479] 0x000000300000-0x000000800000 : "kernela"
[    1.392911] 0x000000800000-0x000002800000 : "roota"
[    1.412292] 0x000002800000-0x000003800000 : "ovla"
[    1.424904] 0x000003800000-0x000003d00000 : "kernelb"
[    1.433216] 0x000003d00000-0x000005d00000 : "rootb"
[    1.452552] 0x000005d00000-0x000006d00000 : "ovlb"
[    1.465172] 0x000006d00000-0x000020000000 : "NAND"
[    1.638785] UBI: attaching mtd2 to ubi0
[    1.643081] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    1.649669] UBI: logical eraseblock size:    126976 bytes
[    1.655362] UBI: smallest flash I/O unit:    2048
[    1.660305] UBI: sub-page size:              512
[    1.665174] UBI: VID header offset:          2048 (aligned 2048)
[    1.671487] UBI: data offset:                4096
[    1.878540] UBI: max. sequence number:       0
[    1.912626] UBI: volume 0 ("rootfs") re-sized from 133 to 250 LEBs
[    1.920864] UBI: attached mtd2 to ubi0
[    1.924870] UBI: MTD device name:            "roota"
[    1.930090] UBI: MTD device size:            32 MiB
[    1.935234] UBI: number of good PEBs:        256
[    1.940085] UBI: number of bad PEBs:         0
[    1.944769] UBI: number of corrupted PEBs:   0
[    1.949438] UBI: max. allowed volumes:       128
[    1.954304] UBI: wear-leveling threshold:    2048
[    1.959248] UBI: number of internal volumes: 1
[    1.963930] UBI: number of user volumes:     1
[    1.968599] UBI: available PEBs:             0
[    1.973282] UBI: total number of reserved PEBs: 256
[    1.978409] UBI: number of PEBs reserved for bad PEB handling: 2
[    1.984738] UBI: max/mean erase counter: 1/0
[    1.989225] UBI: image sequence number:  1111822412
[    1.995070] UBI: background thread "ubi_bgt0d" started, PID 38
...
[    2.500482] UBIFS: start fixing up free space
[    3.876113] UBIFS: free space fixup complete
[    3.882701] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    3.889027] UBIFS: file system size:   30347264 bytes (29636 KiB,
28 MiB, 239 LEBs)
[    3.897125] UBIFS: journal size:       8507392 bytes (8308 KiB, 8
MiB, 67 LEBs)
[    3.904833] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    3.910965] UBIFS: default compressor: lzo
[    3.915285] UBIFS: reserved for root:  0 bytes (0 KiB)
[    3.924923] VFS: Mounted root (ubifs filesystem) on device 0:14.

Second (failed) boot:

[    0.000000] Kernel command line: console=ttyO0,115200n8 noinitrd
rootfstype=ubifs rootwait=1 ip=none ubifs.debug_msgs=0xffff
root=ubi0:rootfs rw ubi.mtd=roota,2048
...
[    1.370779] Creating 8 MTD partitions on "omap2-nand.0":
[    1.376394] 0x000000000000-0x000000300000 : "S1S2EN"
[    1.384281] 0x000000300000-0x000000800000 : "kernela"
[    1.392713] 0x000000800000-0x000002800000 : "roota"
[    1.412102] 0x000002800000-0x000003800000 : "ovla"
[    1.424706] 0x000003800000-0x000003d00000 : "kernelb"
[    1.433017] 0x000003d00000-0x000005d00000 : "rootb"
[    1.452362] 0x000005d00000-0x000006d00000 : "ovlb"
[    1.464988] 0x000006d00000-0x000020000000 : "NAND"
[    1.638603] UBI: attaching mtd2 to ubi0
[    1.642893] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    1.649480] UBI: logical eraseblock size:    126976 bytes
[    1.655171] UBI: smallest flash I/O unit:    2048
[    1.660115] UBI: sub-page size:              512
[    1.664984] UBI: VID header offset:          2048 (aligned 2048)
[    1.671297] UBI: data offset:                4096
[    1.937185] UBI: max. sequence number:       30
[    1.956309] UBI: attached mtd2 to ubi0
[    1.960262] UBI: MTD device name:            "roota"
[    1.965548] UBI: MTD device size:            32 MiB
[    1.970675] UBI: number of good PEBs:        256
[    1.975544] UBI: number of bad PEBs:         0
[    1.980214] UBI: number of corrupted PEBs:   0
[    1.984898] UBI: max. allowed volumes:       128
[    1.989750] UBI: wear-leveling threshold:    2048
[    1.994707] UBI: number of internal volumes: 1
[    1.999376] UBI: number of user volumes:     1
[    2.004062] UBI: available PEBs:             0
[    2.008731] UBI: total number of reserved PEBs: 256
[    2.013871] UBI: number of PEBs reserved for bad PEB handling: 2
[    2.020186] UBI: max/mean erase counter: 2/0
[    2.024687] UBI: image sequence number:  1111822412
[    2.030525] UBI: background thread "ubi_bgt0d" started, PID 38
...
[    2.400325] UBIFS: recovery needed
[    2.437280] UBIFS error (pid 1): replay_log_leb: first log node at
LEB 3:0 is not CS node
[    2.445923] UBIFS error (pid 1): replay_log_leb: log error detected
while replaying the log at LEB 3:0
[    2.455729]  magic          0x6101831
[    2.459575]  crc            0xb972ae2d
[    2.463532]  node_type      8 (reference node)
[    2.468202]  group_type     0 (no node group)
[    2.472795]  sqnum          11443
[    2.476276]  len            64
[    2.479484]  lnum           128
[    2.482797]  offs           71680
[    2.486278]  jhead          1
[    2.491687] List of all partitions:
[    2.495377] No filesystem could mount root, tried:  ubifs
[    2.501071] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)
