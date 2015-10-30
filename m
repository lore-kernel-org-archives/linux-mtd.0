Received: from antispamrelay02.bull-services.ch ([62.12.170.133])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs968-0004Ep-G1
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 12:48:02 +0000
From: Thomas Kaufmann <Thomas.Kaufmann@duagon.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS remounted ro during operation or from boot time
Date: Fri, 30 Oct 2015 12:47:33 +0000
Message-ID: <38b87e8310d347efba70c1d3cf79f226@chdua14.duagon.ads>
Content-Language: de-DE
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

Hi

we are using MTD / UBIFS on beaglebone based embedded device with linux.
Sometimes there is a problem with the ubifs root partition, where I am not =
certain about the root cause.
Details regarding our system:

CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
NAND device: Manufacturer ID: 0x2c, Chip ID: 0x38 (Micron MT29F8G08ABABAWP)

Linux kernel version is 3.2.0, compiled with gcc 4.5.3

It happens that the root partition is being remounted read only during oper=
ation. Sometimes also from boot up.
In the dmesg I find this printout:

[   12.224090] UBIFS: recovery needed
[   12.800018] UBIFS: recovery completed
[   12.803894] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[   12.810180] UBIFS: file system size:   407715840 bytes (398160 KiB, 388 =
MiB, 790 LEBs)
[   12.818420] UBIFS: journal size:       10452992 bytes (10208 KiB, 9 MiB,=
 21 LEBs)
[   12.826232] UBIFS: media format:       w4/r0 (latest is w4/r0)
[   12.832336] UBIFS: default compressor: lzo
[   12.836578] UBIFS: reserved for root:  0 bytes (0 KiB)
[   12.844970] VFS: Mounted root (ubifs filesystem) on device 0:13.

[   18.899841] UBIFS error (pid 1800): ubifs_check_node: bad CRC: calculate=
d 0xc6fd2232, read 0xef37a8c0
[   18.909515] UBIFS error (pid 1800): ubifs_check_node: bad node at LEB 48=
6:200480
[   18.917205] UBIFS error (pid 1800): ubifs_scanned_corruption: corruption=
 at LEB 486:200480
<then I think it prints the LEB>
[   18.932037] UBIFS error (pid 1800): ubifs_scan: LEB 486 scanning failed
[   18.939056] UBIFS warning (pid 1800): ubifs_ro_mode: switched to read-on=
ly mode, error -117
<more kernel traces>
[   19.095581] UBIFS error (pid 1800): make_reservation: cannot reserve 83 =
bytes in jhead 2, error -117
[   19.105102] UBIFS error (pid 1800): do_writepage: cannot write page 0 of=
 inode 10754, error -117

This is when the issue is present at bootup.
Sometimes this issue can be resolved by rebooting, but not always.

Is this happening due to a corrupted or defective flash (hardware problem)?
Or is there a known problem in the software versions we are using?

If required I will supply more information about our system.

thanks for any advice or hints towards a root cause
kind regards

Thomas
