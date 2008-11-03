Received: from [2001:6f8:1178:4:290:27ff:fe1d:cc33]
	(helo=metis.extern.pengutronix.de)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kx0lC-0004Ex-RW
	for linux-mtd@lists.infradead.org; Mon, 03 Nov 2008 14:50:31 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 3 Nov 2008 15:49:58 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200811031549.59177.jbe@pengutronix.de>
Subject: FW: How to write rules for mtd based devices
Cc: Kay Sievers <kay.sievers@vrfy.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

I discussed this on the udev list:

=2D---->8----->8----->8----->8----->8----->8----->8----->8----->8----->8

has anybody an idea how to write some rules to match devices from the mtd
framework?

All I get is:
=2D-----------------------------------------------------------------
$ udevadm info -a -p /sys/block/mtdblock5

Udevinfo starts with the device specified by the devpath and then
walks up the chain of parent devices. It prints for every device
found, all possible attributes in the udev rules key format.
A rule to match, can be composed by the attributes of the device
and the attributes from one single parent device.

  looking at device '/devices/virtual/block/mtdblock5':
    KERNEL=3D=3D"mtdblock5"
    SUBSYSTEM=3D=3D"block"
    DRIVER=3D=3D""
    ATTR{range}=3D=3D"1"
    ATTR{removable}=3D=3D"0"
    ATTR{ro}=3D=3D"0"
    ATTR{size}=3D=3D"1024"
    ATTR{capability}=3D=3D"10"
    ATTR{stat}=3D=3D"       0        0        0        0        0        0 =
       0        0        0        0        0"
=2D-----------------------------------------------------------------

And its mostly the same for all the other mtdblock devices.

The other frameworks like SATA and USB providing much more information about
their bus controllers and connected devices to find adequate matching rules.
But mtd seems very uncommunicative, or do I query the wrong path to search =
for
usefull rules to match?

=2D---->8----->8----->8----->8----->8----->8----->8----->8----->8----->8

"Kay Sievers" <kay.sievers@vrfy.org> aswers:

=2D---->8----->8----->8----->8----->8----->8----->8----->8----->8----->8
>> Seems, there is not much you can do with the current information it
>> exposes. What is the hardware behind these mtd devices? Are these
>> devices show up somewhere in /sys/devices/, maybe as platform devices?
>> Then we could try to make the kernel use these as parents for the
>> block devices, so the block devices would not be "virtual".
>
> MTDs are simple memory devices. Flash (NOR or NAND type) and SRAM for exa=
mple.
> They are connected through a simple address/data bus, some also via SPI
> interface. About each of these devices the kernel knows at least the
> manufacturer and the device name (for flash memory this info can be
> autodetected). For the other types mostly a platform structure provides t=
his
> information. On my ARM (i.MX27 CPU) tree types of memory is available:
>
> SRAM:
> /sys/bus/platform/devices/mtd-ram.0
>
> NAND-flash:
> /sys/bus/platform/devices/mxc_nand.0
>
> NOR-flash:
> /sys/bus/platform/devices/physmap-flash.0
>
> Currently the NOR flash is using three partitions so I get:
>
> $ ls -l /dev/mtd*
> crw-rw----    1 root     root      90,   0 Jan  1 00:00 /dev/mtd0
> crw-rw----    1 root     root      90,   1 Jan  1 00:00 /dev/mtd0ro
> crw-rw----    1 root     root      90,   2 Jan  1 00:00 /dev/mtd1
> crw-rw----    1 root     root      90,   3 Jan  1 00:00 /dev/mtd1ro
> crw-rw----    1 root     root      90,   4 Jan  1 00:00 /dev/mtd2
> crw-rw----    1 root     root      90,   5 Jan  1 00:00 /dev/mtd2ro
> crw-rw----    1 root     root      90,   6 Jan  1 00:00 /dev/mtd3
> crw-rw----    1 root     root      90,   7 Jan  1 00:00 /dev/mtd3ro
> crw-rw----    1 root     root      90,   8 Jan  1 00:00 /dev/mtd4
> crw-rw----    1 root     root      90,   9 Jan  1 00:00 /dev/mtd4ro
> crw-rw----    1 root     root      90,  10 Jan  1 00:00 /dev/mtd5
> crw-rw----    1 root     root      90,  11 Jan  1 00:00 /dev/mtd5ro
> brw-rw----    1 root     root      31,   0 Jan  1 00:00 /dev/mtdblock0
> brw-rw----    1 root     root      31,   1 Jan  1 00:00 /dev/mtdblock1
> brw-rw----    1 root     root      31,   2 Jan  1 00:00 /dev/mtdblock2
> brw-rw----    1 root     root      31,   3 Jan  1 00:00 /dev/mtdblock3
> brw-rw----    1 root     root      31,   4 Jan  1 00:00 /dev/mtdblock4
> brw-rw----    1 root     root      31,   5 Jan  1 00:00 /dev/mtdblock5
>
> mtd*0 ... mtd*3 are the three partitions on the NOR flash (its also the m=
emory
> to boot from), mtd*4 is the NAND memory, mtd*5 is the SRAM. All I want is=
 to
> detect the NAND and the SRAM to create special links or node names for th=
ese
> devices to be independent from the partition count of the NOR memory and =
the
> changing device node numbers when this count changes.

It is something that should be changed in mtd. NAND for example
registers the device in drivers/mtd/nand/mxc_nand.c. Before that, it
has handled the platform device *pdev.

We would need to pass the pdev down to the mtd core and set "struct
gendisk->driverfs_dev" to  &pdev->dev, and the NAND mtd devices would
show up with a device path like:
  /sys/devices/platform/mxc_nand.0/block/mtdblock4

With these devices as parents, you can match on any property or device
name with usual udev rules.
=2D---->8----->8----->8----->8----->8----->8----->8----->8----->8----->8

Would that be possible to support it in the MTD framework?

Regards,
Juergen=20

=2D-=20
Dipl.-Ing. Juergen Beisert | http://www.pengutronix.de
=A0Pengutronix - Linux Solutions for Science and Industry
=A0   Handelsregister: Amtsgericht Hildesheim, HRA 2686
=A0 =A0 =A0    Vertretung Sued/Muenchen, Germany
   Phone: +49-8766-939 228 |  Fax: +49-5121-206917-9
