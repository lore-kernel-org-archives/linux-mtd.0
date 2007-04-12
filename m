Received: from mail128.messagelabs.com ([216.82.250.131])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HbtTR-0006FT-AD
	for linux-mtd@lists.infradead.org; Thu, 12 Apr 2007 03:12:08 -0400
Received: from il06exr02.mot.com (il06exr02.mot.com [129.188.137.132])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id l3C7C0YE016694
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Apr 2007 00:12:00 -0700 (MST)
Received: from il06vts01.mot.com (il06vts01.mot.com [129.188.137.141])
	by il06exr02.mot.com (8.13.1/Vontu) with SMTP id l3C7C01h015750
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Apr 2007 02:12:00 -0500 (CDT)
Received: from zuk35exm60.ds.mot.com (zuk35exm60.ea.mot.com [10.178.1.39])
	by il06exr02.mot.com (8.13.1/8.13.0) with ESMTP id l3C7BvqO015706
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Apr 2007 02:12:00 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Problem booting from MTD partition of NAND device
Date: Thu, 12 Apr 2007 08:11:56 +0100
Message-ID: <67194FEE6056B947B4EF756C9E497A2E017A42CD@zuk35exm60.ds.mot.com>
In-Reply-To: <37587.69.30.123.186.1176338248.squirrel@architechnical.net>
References: <37587.69.30.123.186.1176338248.squirrel@architechnical.net>
From: "Demke Torsten-atd012" <torsten.demke@motorola.com>
To: "Pete MacKay" <linux@architechnical.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pete,

> Not sure if you've done this, but make sure you specify=20
> "rootfstype=3Djffs2"
> in the kernel parameters.
Yes, I do.

>=20
> Additionally, make sure the NOR driver doesn't specify the=20
> root file system using code.  Look for "ROOT_DEV =3D=20
> MKDEV(MTD_BLOCK_MAJOR, 0);", or the inclusion of "<linux/root_dev.h>".
I didn't changed the NOR driver, just added a new *_map.c file.

Regards,
Torsten
>=20
> Torsten Demke writes:
>=20
> Hi all,
>=20
> I have a PPC system that consists of several MTD partitions=20
> on a mix of NOR and NAND flashes.
> MTD partition layout in my system:
> dev:    size   erasesize  name
> mtd0: 00020000 00020000 "enviroment-flash1"
> mtd1: 00500000 00020000 "kernel-flash1"
> mtd2: 01a60000 00020000 "empty-flash1"
> mtd3: 00080000 00020000 "uboot-flash1"
> mtd4: 02000000 00020000 "boot-flash1"
> mtd5: 00020000 00020000 "enviroment-flash2"
> mtd6: 00500000 00020000 "kernel-flash2"
> mtd7: 01a60000 00020000 "empty-flash2"
> mtd8: 00080000 00020000 "uboot-flash2"
> mtd9: 02000000 00020000 "boot-flash2"
> mtd10: 80000000 00020000 "NAND Flash"
>=20
> Partition 4 is the merge of partitions 0..3 Partition 9 is=20
> the merge of partition 5..8
> 0..4 and 5..9 are independent NOR flash devices (Intel=20
> Strataflash) Partition 10 is located on a NAND flash device=20
> and is formated with jffs2.
>=20
> Whenever I try to boot from the NAND flash=20
> (root=3D/dev/mtdblock10)  I get following error:
>   VFS: Mount ROOT_DEV 0 - mtdblock10		<< some additional debug
> output
>   Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
>=20
> When I disable all NOR flashes in the kernel (2.6.14) I can boot
> (root=3D/dev/mtdblock0)
> my board without a problem.
> Any hints or comments?
>=20
> Thanks for your help.
> Regards,
> Torsten
>=20
