Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFT7P-0005JK-P3
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2010 14:54:49 +0000
Received: by wyf22 with SMTP id 22so5475074wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Nov 2010 06:54:44 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 8 Nov 2010 15:54:43 +0100
Message-ID: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
Subject: PXA310: double bit errors on NAND
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openpxa-users@lists.sourceforge.net, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I get "double bit error @ page" messages while working with NAND on a
Colibri PXA310 module. Basically, when I write an UBI image to NAND,
either with U-Boot "nand write" or "nandwrite" from mtd-utils,
everything is OK on the *first* mount. But on the second mount I get
several "double bit error @ page" messages and mount fails. This
always happen (unless I'm mounting read-only -- then the problem is
gone). But the funny thing is that if I write an UBIFS image using
these commands:

ubiformat /dev/mtd7
ubiattach -m 7
ubimkvol /dev/ubi0 -N rootfs -m
ubiupdatevol /dev/ubi0_0 /rootfs.ubifs

everything is OK! I can mount/umount many times and no errors.

Any ideas why writing UBI image directly allows only *one* mount but
using the UBI tools above it works perfectly on all later mounts? I'd
really like to be able to flash UBI images directly and not having to
boot Linux over NFS just to be able to flash my rootfs...

Some notes:

1) I found a thread at
http://sourceforge.net/mailarchive/forum.php?thread_name=3D201009181607.383=
52.marek.vasut%40gmail.com&forum_name=3Dopenpxa-users
which seems to be about the very same problem, but I was not on the
list back then so I couldn't reply to that thread.

2) A console session where I provoke the "2nd UBIFS mount" failure:
# flash_eraseall /dev/mtd7
# nandwrite -p /dev/mtd7 /rootfs.ubi
# ubiattach -m7
[ 2011.367544] UBI: attaching mtd7 to ubi0
[ 2011.378022] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[ 2011.385102] UBI: logical eraseblock size:    126976 bytes
[ 2011.395127] UBI: smallest flash I/O unit:    2048
[ 2011.404498] UBI: VID header offset:          2048 (aligned 2048)
[ 2011.415154] UBI: data offset:                4096
[ 2011.826179] UBI: max. sequence number:       0
[ 2011.849846] UBI: attached mtd7 to ubi0
[ 2011.853591] UBI: MTD device name:            "rootfs 64 MiB"
[ 2011.860003] UBI: MTD device size:            64 MiB
[ 2011.868983] UBI: number of good PEBs:        512
[ 2011.874397] UBI: number of bad PEBs:         0
[ 2011.881566] UBI: max. allowed volumes:       128
[ 2011.886170] UBI: wear-leveling threshold:    4096
[ 2011.891614] UBI: number of internal volumes: 1
[ 2011.899102] UBI: number of user volumes:     1
[ 2011.906238] UBI: available PEBs:             142
[ 2011.911610] UBI: total number of reserved PEBs: 370
[ 2011.919086] UBI: number of PEBs reserved for bad PEB handling: 5
[ 2011.925844] UBI: max/mean erase counter: 0/0
[ 2011.932870] UBI: image sequence number:  0
[ 2011.937009] UBI: background thread "ubi_bgt0d" started, PID 1019
UBI device number 0, total 512 LEBs (65011712 bytes, 62.0 MiB),
available 142 LEBs (18030592 bytes, 17)
# mount -t ubifs /dev/ubi0_0 /mnt
[ 2174.116000] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[ 2174.122117] UBIFS: file system size:   44441600 bytes (43400 KiB,
42 MiB, 350 LEBs)
[ 2174.129771] UBIFS: journal size:       9023488 bytes (8812 KiB, 8
MiB, 72 LEBs)
[ 2174.137036] UBIFS: media format:       w4/r0 (latest is w4/r0)
[ 2174.142857] UBIFS: default compressor: lzo
[ 2174.146924] UBIFS: reserved for root:  0 bytes (0 KiB)
# ls /mnt
bin      etc      init     linuxrc  opt      root     sys      usr      www
dev      home     lib      mnt      proc     sbin     tmp      var
# umount /mnt
[ 2187.011934] UBIFS: un-mount UBI device 0, volume 0
# mount -t ubifs /dev/ubi0_0 /mnt
[ 2189.827801] double bit error @ page 0000d2c5
[ 2189.859454] double bit error @ page 0000d2c5
[ 2189.889241] UBIFS error (pid 1028): ubifs_recover_master_node:
failed to recover master node
[ 2189.901888] double bit error @ page 0000d2c5
mount: mounting /dev/ubi0_0 on /mnt failed: Invalid argument
# [ 2189.942810] UBI: scrubbed PEB 3 (LEB 0:1), data moved to PEB 511

3) I tried to flash and mount a jffs2 image instead of UBI/UBIFS. It
produced *lots* of errors and mount eventually failed:
# flash_eraseall /dev/mtd7      # the '-j' flag produces errors, so
I'm skipping it...
# nandwrite -p /dev/mtd7 /rootfs.jffs2
# mount -t jffs2 /dev/mtdblock7 /mnt
[ 5320.153576] jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985,
0xe001, 0x0000002b) has invalid CRC 0x1804b18f (calculated 0x7d266ee6)
[ 5320.168986] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x00000004: 0x002b instead
[ 5320.180415] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x00000008: 0xb18f instead
[ 5320.189258] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x0000000c: 0x0001 instead
[ 5320.198878] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x00000014: 0x0002 instead
[ 5320.212126] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x00000018: 0xc63b instead
[ 5320.221757] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x0000001c: 0x0403 instead
[ 5320.233390] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x00000020: 0x148e instead
[ 5320.243017] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x00000024: 0x5aed instead
[ 5320.254612] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x00000028: 0x6962 instead
[ 5320.263601] Further such events for this erase block will not be printed
<...snip lots of errors...>
[ 5349.320793] Empty flash at 0x0156c5c0 ends at 0x0156c5c4
[ 5349.336938] Empty flash at 0x0156c5d0 ends at 0x0156c5d4
[ 5349.355108] Empty flash at 0x0156c5e0 ends at 0x0156c5e4
<..snip lots of errors...>
[ 5374.079867] jffs2_scan_eraseblock(): Node at 0x02800000 {0x1985,
0xe002, 0x00000415) has invalid CRC 0x896de46f (calculated 0xec4f3b06)
[ 5374.092709] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800004: 0x0415 instead
[ 5374.104261] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800008: 0xe46f instead
[ 5374.113883] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x0280000c: 0x134b instead
[ 5374.125444] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800010: 0x0001 instead
[ 5374.135058] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800014: 0x81a4 instead
[ 5374.146676] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x0280001c: 0x165d instead
[ 5374.156287] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800020: 0xa68f instead
[ 5374.166811] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800024: 0xa68f instead
[ 5374.178375] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800028: 0xa68f instead
[ 5374.187367] Further such events for this erase block will not be printed
[ 5374.237539] Old JFFS2 bitmask found at 0x0280b86c
[ 5374.242332] You cannot use older JFFS2 filesystems with newer kernels
[ 5374.753907] Cowardly refusing to erase blocks on filesystem with no
valid JFFS2 nodes
[ 5374.761797] empty_blocks 191, bad_blocks 0, c->nr_blocks 512
mount: mounting /dev/mtdblock7 on /mnt failed: Input/output error
#

Best regards,
Bj=C3=B8rn Forsman
