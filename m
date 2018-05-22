Received: from mail-eopbgr00139.outbound.protection.outlook.com
 ([40.107.0.139] helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL1ae-0006n3-BT
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 07:20:15 +0000
From: Cardoen Pieter <P.Cardoen@TELEVIC.com>
To: "richard@nod.at" <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64
 bytes from PEB
Date: Tue, 22 May 2018 07:19:54 +0000
Message-ID: <AM0PR0702MB36185844E179A06774067996FF940@AM0PR0702MB3618.eurprd07.prod.outlook.com>
References: <AM0PR0702MB3618DC80EB44C036F19CABEBFF910@AM0PR0702MB3618.eurprd07.prod.outlook.com>
In-Reply-To: <AM0PR0702MB3618DC80EB44C036F19CABEBFF910@AM0PR0702MB3618.eurprd07.prod.outlook.com>
Content-Language: nl-BE
Content-Type: text/plain; charset="iso-8859-1"
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


Dear


Can someone advice me with this question. It is blocking me and I don't kno=
w how to debug this. =20


I am currently trying to use the mainline kernel on a custom imx6ul board w=
ith an SLC NAND flash device (29F4G08ABADAH4). When the rootfs is mounted, =
I get continuously ECC errors (see log below).

I am however sure that the rootfs is programmed. The device boots with an o=
lder kernel version on the same device.

I also noticed that with my previous kernel version, it used mtd->_read in =
function mtd_read while now it is using mtd->_read_oob.

=A0When the gpmi driver is loaded, the device gets scanned for bad blocks. =
In that case nand_read_oob is executed and this results in a call to nand_d=
o_read_oob:
=A0
=A0=A0=A0 if (!ops->datbuf)
=A0=A0=A0=A0=A0=A0=A0 ret =3D nand_do_read_oob(mtd, from, ops);
=A0=A0=A0 else
=A0=A0=A0=A0=A0=A0=A0 ret =3D nand_do_read_ops(mtd, from, ops);

Can someone assist me how to debug this issue?

Thanks
Pieter Cardoen


nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
nand: Micron MT29F4G08ABADAH4
nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
Bad eraseblock 1692 at 0x00000d380000
Bad eraseblock 1694 at 0x00000d3c0000
Bad eraseblock 1696 at 0x00000d400000
Bad eraseblock 1698 at 0x00000d440000
Bad eraseblock 1700 at 0x00000d480000
Bad eraseblock 1702 at 0x00000d4c0000
Bad eraseblock 1704 at 0x00000d500000
Bad block table written to 0x00001ffe0000, version 0x01
Bad block table written to 0x00001ffc0000, version 0x01
1 cmdlinepart partitions found on MTD device gpmi-nand
Creating 1 MTD partitions on "gpmi-nand":
0x000000000000-0x000020000000 : "nandflash"
gpmi-nand 1806000.gpmi-nand: driver registered.
ubi0: attaching mtd0
ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes from=
 PEB 0:0, read only 64 bytes, retry
ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes from=
 PEB 0:0, read only 64 bytes, retry
ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes from=
 PEB 0:0, read only 64 bytes, retry
ubi0 error: 0xc02d66e8: error -74 (ECC error) while reading 64 bytes from P=
EB 0:0, read 64 bytes
CPU: 0 PID: 1 Comm: swapper Not tainted 4.15.0+ #65
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
Function entered at [<c010c0a0>] from [<c010a780>]
Function entered at [<c010a780>] from [<c02d66ec>]
Function entered at [<c02d66ec>] from [<c02d69e0>]
Function entered at [<c02d69e0>] from [<c02db408>]
Function entered at [<c02db408>] from [<c02dc8c0>]
Function entered at [<c02dc8c0>] from [<c02d114c>]
Function entered at [<c02d114c>] from [<c051c678>]
Function entered at [<c051c678>] from [<c01024bc>]
Function entered at [<c01024bc>] from [<c0500c70>]
Function entered at [<c0500c70>] from [<c0317958>]
Function entered at [<c0317958>] from [<c01010e8>]
Exception stack(0xdf04dfb0 to 0xdf04dff8)
dfa0:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 00000000 00000000 00000000 00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes from=
 PEB 1:0, read only 64 bytes, retry
ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes from=
 PEB 1:0, read only 64 bytes, retry
ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes from=
 PEB 1:0, read only 64 bytes, retry
ubi0 error: 0xc02d66e8: error -74 (ECC error) while reading 64 bytes from P=
EB 1:0, read 64 bytes
CPU: 0 PID: 1 Comm: swapper Not tainted 4.15.0+ #65
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
Function entered at [<c010c0a0>] from [<c010a780>]
Function entered at [<c010a780>] from [<c02d66ec>]
Function entered at [<c02d66ec>] from [<c02d69e0>]
Function entered at [<c02d69e0>] from [<c02db408>]
Function entered at [<c02db408>] from [<c02dc8c0>]
Function entered at [<c02dc8c0>] from [<c02d114c>]
Function entered at [<c02d114c>] from [<c051c678>]
Function entered at [<c051c678>] from [<c01024bc>]
Function entered at [<c01024bc>] from [<c0500c70>]
Function entered at [<c0500c70>] from [<c0317958>]
Function entered at [<c0317958>] from [<c01010e8>]
Exception stack(0xdf04dfb0 to 0xdf04dff8)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


linux-mtd Info Page - lists.infradead.org
lists.infradead.org
List for discussion of drivers for Memory Technology Devices under Linux. T=
o see the collection of prior postings to the list, visit the linux-mtd Arc=
hives. ...
    =
