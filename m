Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D7PYS-0005hE-SQ
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 22:02:14 -0500
Received: from custom-daemon.mailout1.samsung.com by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	id <0ICU00704Z3LG1@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 12:02:09 +0900 (KST)
Received: from ep_mmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ICU002L5Z3KM7@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 12:02:08 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0ICU00GAEZ3JII@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 12:02:08 +0900 (KST)
Date: Sat, 05 Mar 2005 12:02:08 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <20050304184957.KWQO1243.mxfep04.bredband.com@mxfep04>
To: extabe@bredband.net, linux-mtd@lists.infradead.org
Message-id: <0ICU00GAFZ3KII@mmp2.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=ks_c_5601-1987
Content-transfer-encoding: quoted-printable
Cc: 
Subject: RE: Trying to get 1Gb Samsung nand flash working
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The flash works well in U-boot enviroment with jffs2 but I=20
> can=A2=A5t get it running i Linux.
> The chip i detected but then it reads badblocks on the entire chip.
>=20
> "Scanning device for bad blocks
> nand_read_oob: from =3D 0x00000000, len =3D 2 Bad eraseblock 0 at=20
> 0x00000000"
> ..and so on.
>  I=A2=A5ve used the same driver running a 64Mb nandflash with good =
result.
>=20
> Anyone else who used this chip?

omap_nor_cs3: Found 1 x16 devices at 0x0 in 16-bit bank
omap_nor_cs3: Found 1 x16 devices at 0x1000000 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Creating 4 MTD partitions on "omap_nor_cs3":
0x00000000-0x00020000 : "bootloader"
0x00020000-0x00040000 : "params"
0x00040000-0x00240000 : "kernel"
0x00240000-0x02000000 : "filesystem"
MUX: initialized L3_1610_FLASH_CS2B_OE
MUX: initialized M8_1610_FLASH_CS2B_WE
No NAND device found!!!
No NAND device found!!!
NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (<NULL> NAND 128MiB =
3,3V
8-bi)
NAND bus width 16 instead 8 bit
NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB =
3,3V
8-b)
Scanning device for bad blocks
Creating 5 MTD partitions on "NAND 128MiB 3,3V 8-bit":
0x00000000-0x00010000 : "Booting Image"
0x00010000-0x00050000 : "U-Boot"
0x00050000-0x00080000 : "U-Boot Environment"
0x00080000-0x00280000 : "Kernel"
0x00280000-0x08000000 : "File System"

There's no problem :)

% Test environment

kernel: Linux version 2.6.11-omap1

Kyungmin Park
