Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erOIq-0002vZ-9E
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 13:31:25 +0000
Received: by mail-wm0-x231.google.com with SMTP id 139so11699458wmn.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Mar 2018 05:31:07 -0800 (PST)
MIME-Version: 1.0
From: Maxim Uvarov <muvarov@gmail.com>
Date: Thu, 1 Mar 2018 16:31:04 +0300
Message-ID: <CAJGZr0LRw96bZL5kuJT1Go4CPDEwOJda9nCDTGBbOTV7WmpXRw@mail.gmail.com>
Subject: fsl,ifc + MT29F64G08CBAAAWP
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to make work NAND MT29F64G08CBAAAWP with fsl IFC driver.
And that seems trickly or I'm missing some fundamental thing.

>From MT29F64G08CBAAAWP  it's said:

Organization Page
=E2=80=93 Page size x8: 8640 bytes (8192 + 448 bytes)
=E2=80=93 Block size: 256 pages (2048K + 112K bytes)
=E2=80=93 Plane size: 2 planes x 2048 blocks per plane
=E2=80=93 Device size: 64Gb: 4096 blocks; 128Gb: 8192 blocks; 256Gb: 16,384
blocks; 512Gb: 32,786 blocks
- Minimum required ECC 24-bit ECC per 1080 bytes of data (BCH algo for ECC)

And it looks like drivers/mtd/nand/fsl_ifc_nand.c works well only with
512K blocks.

So the question is - should I set up IFC driver absolutely the same as
NAND chip spec says? Or it can work
with smaller blocks?

fsl_ifc_chip_init() csor =3D 0x9518c300 csor_ext 0x100000
fsl_ifc_chip_init() csor pgs =3D 0x180000
fsl_ifc_chip_init() CSOR_NAND_ECC_DEC_EN 1, CSOR_NAND_ECC_ENC_EN 1
fsl_ifc_chip_init() csor CSOR_NAND_ECC_MODE 268435456
fsl_ifc_chip_init() NAND_BUSWIDTH_16 0
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x88
nand: Micron MT29F64G08CBAAAWP
nand: 8192 MiB, MLC, erase size: 2048 KiB, page size: 8192, OOB size: 448
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->numchips =3D 1
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->chipsize =3D 8589=
934592
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->pagemask =3D    f=
ffff
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->chip_delay =3D 20=
0
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->badblockpos =3D 0
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->chip_shift =3D 33
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->page_shift =3D 13
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->phys_erase_shift =
=3D 21
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->ecc.mode =3D 2
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->ecc.steps =3D 0
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->ecc.bytes =3D 16
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: nand->ecc.total =3D 0
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: mtd->ooblayout =3D (ptr=
val)
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: mtd->flags =3D 00000000
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: mtd->size =3D 858993459=
2
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: mtd->erasesize =3D 2097=
152
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: mtd->writesize =3D 8192
fsl,ifc-nand 60000000.nand: fsl_ifc_chip_init_tail: mtd->oobsize =3D 448
nand: WARNING: 60000000.flash: the ECC used on your system is too weak
compared to the one required by the NAND chip
1 ofpart partitions found on MTD device 60000000.flash
Creating 1 MTD partitions on "60000000.flash":
0x000000000000-0x000040000000 : "rootfs"

Issue is that on mtd_test I get I/O errors. The same as ubu_attach.
ubi_format looks like pass first cycle but can not place bad blocks.
Should this NAND chip work with IFC or there is some limitation?

--=20
Best regards,
Max Uvarov
