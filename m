Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIYbp-0005J0-Tp
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 11:59:15 +0000
Date: Tue, 15 May 2018 13:59:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cardoen Pieter <P.Cardoen@TELEVIC.com>
Cc: "han.xu@nxp.com" <han.xu@nxp.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI nand flash ECC errors with mainline kernel
Message-ID: <20180515135900.3bf24b98@xps13>
In-Reply-To: <HE1PR0702MB362877849767B637814CF9B6FF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
References: <HE1PR0702MB362877849767B637814CF9B6FF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
MIME-Version: 1.0
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

Hi Cardoen,

> I am currently trying to use the mainline kernel on a custom imx6ul board=
 with an SLC NAND flash device (29F4G08ABADAH4). When the rootfs is mounted=
, I get continuously ECC errors (see log below).
>=20
> I am however sure that the rootfs is programmed. The device boots with an=
 older kernel version on the same device.
>=20
> I also noticed that with my previous kernel version, it used mtd->_read i=
n function mtd_read while now it is using mtd->_read_oob.
>=20
> Can someone assist me how to debug this issue?

I don't think the problem comes from changes in the core.
It is possibly related to one of these two commits:

b1206122069a mtd: rawnand: gpmi: use core timings instead of an empirical d=
erivation
76e1a0086a0c mtd: rawnand: gpmi: support ->setup_data_interface()

Can you please revert the first one, check if it changes something, and
if it still fails revert also the second one?

Thanks,
Miqu=C3=A8l

> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
> nand: Micron MT29F4G08ABADAH4
> nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
> Bad block table not found for chip 0
> Bad block table not found for chip 0
> Scanning device for bad blocks
> Bad eraseblock 1692 at 0x00000d380000
> Bad eraseblock 1694 at 0x00000d3c0000
> Bad eraseblock 1696 at 0x00000d400000
> Bad eraseblock 1698 at 0x00000d440000
> Bad eraseblock 1700 at 0x00000d480000
> Bad eraseblock 1702 at 0x00000d4c0000
> Bad eraseblock 1704 at 0x00000d500000
> Bad block table written to 0x00001ffe0000, version 0x01
> Bad block table written to 0x00001ffc0000, version 0x01
> 1 cmdlinepart partitions found on MTD device gpmi-nand
> Creating 1 MTD partitions on "gpmi-nand":
> 0x000000000000-0x000020000000 : "nandflash"
> gpmi-nand 1806000.gpmi-nand: driver registered.
> ubi0: attaching mtd0
> ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes fr=
om PEB 0:0, read only 64 bytes, retry
> ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes fr=
om PEB 0:0, read only 64 bytes, retry
> ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes fr=
om PEB 0:0, read only 64 bytes, retry
> ubi0 error: 0xc02d66e8: error -74 (ECC error) while reading 64 bytes from=
 PEB 0:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.15.0+ #65
> Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> Function entered at [<c010c0a0>] from [<c010a780>]
> Function entered at [<c010a780>] from [<c02d66ec>]
> Function entered at [<c02d66ec>] from [<c02d69e0>]
> Function entered at [<c02d69e0>] from [<c02db408>]
> Function entered at [<c02db408>] from [<c02dc8c0>]
> Function entered at [<c02dc8c0>] from [<c02d114c>]
> Function entered at [<c02d114c>] from [<c051c678>]
> Function entered at [<c051c678>] from [<c01024bc>]
> Function entered at [<c01024bc>] from [<c0500c70>]
> Function entered at [<c0500c70>] from [<c0317958>]
> Function entered at [<c0317958>] from [<c01010e8>]
> Exception stack(0xdf04dfb0 to 0xdf04dff8)
> dfa0:                                     00000000 00000000 00000000 0000=
0000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes fr=
om PEB 1:0, read only 64 bytes, retry
> ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes fr=
om PEB 1:0, read only 64 bytes, retry
> ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading 64 bytes fr=
om PEB 1:0, read only 64 bytes, retry
> ubi0 error: 0xc02d66e8: error -74 (ECC error) while reading 64 bytes from=
 PEB 1:0, read 64 bytes
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.15.0+ #65
> Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> Function entered at [<c010c0a0>] from [<c010a780>]
> Function entered at [<c010a780>] from [<c02d66ec>]
> Function entered at [<c02d66ec>] from [<c02d69e0>]
> Function entered at [<c02d69e0>] from [<c02db408>]
> Function entered at [<c02db408>] from [<c02dc8c0>]
> Function entered at [<c02dc8c0>] from [<c02d114c>]
> Function entered at [<c02d114c>] from [<c051c678>]
> Function entered at [<c051c678>] from [<c01024bc>]
> Function entered at [<c01024bc>] from [<c0500c70>]
> Function entered at [<c0500c70>] from [<c0317958>]
> Function entered at [<c0317958>] from [<c01010e8>]
> Exception stack(0xdf04dfb0 to 0xdf04dff8)
>=20
>=20
>=20
>=20
