Received: from smtp802.mail.sc5.yahoo.com ([66.163.168.181])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bo6hQ-0005cb-VD
	for linux-mtd@lists.infradead.org; Fri, 23 Jul 2004 16:31:28 -0400
From: "Brock Denson" <bdenson@wa-ventures.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 23 Jul 2004 15:31:13 -0500
Message-ID: <011d01c470f4$012c7b40$6400a8c0@BDENSONLAPTOP>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: problems with mtd on atmel dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having problems with the flash on my at91rm9200dk board with
linux-2.4.26-vrs1 and the at91-03052004 patch.  The dk has two flash =
chips,
an 8M dataflash (serial) at54db642, and a 2M parallel at49bv1614a.  In =
the
boot log I get the following:

For the parallel flash:
...
physmap flash device: 200000 at 10000000
CFI: Found no Physically mapped flash device at location zero
Search for id:(1f c0) interleave(1) type(2)
Found: Atmel AT49BV16X
Physically mapped flash:=20
Found 1 x16 devices at 0x0 in 16-bit mode
kmod: failed to exec /sbin/modprobe -s -k cfi_cmdset_0002, errno =3D 2
Support for command set 0002 not present
gen_probe: No supported Vendor Command Set found
kmod: failed to exec /sbin/modprobe -s -k map_rom, errno =3D 2
...

For the serial flash:
...
Found AT91 i2c
AT91 SPI driver loaded
at91_dataflash: Atmel AT45DB642 detected [spi0] (8650752 bytes)
Creating 3 MTD partitions on "Atmel AT45DB642":
0x00000000-0x00010000 : "bootloader"
0x00010000-0x000d0000 : "kernel"
mtd: partition "kernel" doesn't start on an erase block boundary -- =
force
read-only
0x000d0000-0x00840000 : "filesystem"
mtd: partition "filesystem" doesn't start on an erase block boundary --
force read-only
...

If I do a ls dev/mtdblock I see:
0	1	2
Which I assume are the three partitions on the dataflash device, but I =
can
not mount them with mount -t jffs2 /dev/mtdblock/0 /mnt.  I get a =
permission
denied error.

I don't see any listing at all for the parallel flash.  Can someone =
point me
in the right direction on how to solve this problem?



Thanks,

Brock Denson
WAIV
bdenson@wa-ventures.com
210 849-1988
