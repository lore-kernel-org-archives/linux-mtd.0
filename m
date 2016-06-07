Received: from mail-by2on0056.outbound.protection.outlook.com ([207.46.100.56]
 helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bA4im-0004Na-PL
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 00:18:18 +0000
From: David Olson <Dave.Olson@welchallyn.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Temporarily remounting rootfs as rw leads to kernel panic on reboot
Date: Tue, 7 Jun 2016 00:17:53 +0000
Message-ID: <DM2PR0801MB092606DB85030B4F62A0BBF6FF5D0@DM2PR0801MB0926.namprd08.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In our currently shipping product, we've arranged so that rootfs is mounted=
 ro
by doing the following:

 - using these parameters in the kernel command line invoked by U-Boot:
        rootwait=3D1 ro ubi.mtd=3D4,2048 rootfstype=3Dubifs root=3Dubi0:roo=
tfs
 - having this line in /etc/fstab:
        /dev/root / auto ro,errors=3Dremount-ro 0 0

After a successful boot, the 'mount' command shows (among other presumably
irrelevant lines), the following:
        rootfs on / type rootfs (rw)
        ubi0:rootfs on / type ubifs (ro,relatime)

Here is a portion of the boot log showing UBI & UBIFS related messages:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ONFI flash detected
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micron NAND 256MiB 1,8V =
16-bit)
omap2-nand: detected x16 NAND flash
Creating 8 MTD partitions on "omap2-nand.0":
0x000000000000-0x000000020000 : "U-Boot-min"
0x000000020000-0x000000260000 : "U-Boot"
0x000000260000-0x000000280000 : "U-Boot Env"
0x000000280000-0x0000006c0000 : "Kernel"
0x0000006c0000-0x00000df80000 : "File System"
0x00000df80000-0x00000e3c0000 : "Guard Band"
0x00000e3c0000-0x00000f7c0000 : "Data"
0x00000f7c0000-0x000010000000 : "Reserved"
UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. sequence number:       2
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "File System"
UBI: MTD device size:            216 MiB
UBI: number of good PEBs:        1734
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1734
UBI: number of PEBs reserved for bad PEB handling: 34
UBI: max/mean erase counter: 1/0
UBI: image sequence number:  1806916620
UBI: background thread "ubi_bgt0d" started, PID 46

...

UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: mounted read-only
UBIFS: file system size:   166211584 bytes (162316 KiB, 158 MiB, 1309 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem) readonly on device 0:13.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We are starting work on the next release and want to allow developers with
shell access to temporarily remount rootfs rw.  We do so by using the
following command:

        mount -o remount,rw /

A subsequent 'mount' invocation shows that this was apparently successful. =
 If
we immediately cycle power, the boot log is essentially identical up to the
point where we should be seeing "UBIFS" messages.  Instead we see:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes fr=
om PEB 3:4096, read 126976 bytes
UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes fr=
om PEB 4:4096, read 126976 bytes
UBI error: ubi_io_read: error -74 (ECC error) while reading 11 bytes from P=
EB 10:10240, read 11 bytes
UBIFS error (pid 1): ubifs_leb_read: reading 11 bytes from LEB 8:6144 faile=
d, error -74
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
Please append a correct "root=3D" boot option; here are the available parti=
tions:
1f00             128 mtdblock0  (driver?)
1f01            2304 mtdblock1  (driver?)
1f02             128 mtdblock2  (driver?)
1f03            4352 mtdblock3  (driver?)
1f04          221952 mtdblock4  (driver?)
1f05            4352 mtdblock5  (driver?)
1f06           20480 mtdblock6  (driver?)
1f07            8448 mtdblock7  (driver?)
b300         7879680 mmcblk0  driver: mmcblk
  b301         7875584 mmcblk0p1 00000000-0000-0000-0000-000000000000
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0=
,0)
Backtrace:
[<8004c86c>] (dump_backtrace+0x0/0x100) from [<803aeed8>] (dump_stack+0x18/=
0x1c)
 r6:8002e4e8 r5:af414000 r4:8053d018 r3:60000013
[<803aeec0>] (dump_stack+0x0/0x1c) from [<803af064>] (panic+0x60/0x178)
[<803af004>] (panic+0x0/0x178) from [<80009180>] (mount_block_root+0x1d8/0x=
218)
 r3:60000013 r2:00000000 r1:af43bf70 r0:8047168e
 r7:8002e4d4
[<80008fa8>] (mount_block_root+0x0/0x218) from [<80009418>] (prepare_namesp=
ace+0x94/0x1c4)
[<80009384>] (prepare_namespace+0x0/0x1c4) from [<80008d88>] (kernel_init+0=
x114/0x14c)
 r6:800731d0 r5:8002daac r4:8002daac
[<80008c74>] (kernel_init+0x0/0x14c) from [<800731d0>] (do_exit+0x0/0x5c0)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is a permanent condition, occurring on every subsequent boot.  Recover=
y
requires re-flashing rootfs.

The sequence
        mount -o remount,ro /
        <cycle power>
does not cause the problem.

The sequence
        mount -o remount,rw /
        mount -o remount,ro /
        <cycle power>
does cause the problem.

I should note that there was a period of time prior to our first release wh=
ere
we could successfully temporarily remount rootfs rw.  However there have be=
en
many changes since we last tried doing so.  So what I'm hoping for is to ga=
in
sufficient understanding of the effect on a UBIFS file system of making it =
rw
so that I can chase this further.

P.S. This is my first ever message on this list.  I believe I've followed t=
he published
protocol however I'm eager to correct any failures to do so.

--
David H. Olson
+1 503 530 7642
www.welchallyn.com
9525 SW Gemini Dr, Beaverton, OR 97008


CONFIDENTIAL NOTICE: If you are not the intended recipient of this message,=
 you are not authorized to intercept, read, print, retain, copy, forward, o=
r disseminate this communication. This communication may contain informatio=
n that is proprietary, attorney/client privileged, attorney work product, c=
onfidential or otherwise legally exempt from disclosure. If you have receiv=
ed this message in error, please notify the sender immediately either by ph=
one or by return e-mail, and destroy all copies of this message, electronic=
, paper, or otherwise.
