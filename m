Received: from relmlor4.renesas.com ([210.160.252.174]
 helo=relmlie3.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e9EYp-00013d-PG
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 18:13:22 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2 0/5] unconfuse get_unmapped_area and point/unpoint
 driver methods
Date: Mon, 30 Oct 2017 18:12:53 +0000
Message-ID: <SG2PR06MB1165A4668E066DAC5E810CD08A590@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
In-Reply-To: <20171017152826.11658-1-nicolas.pitre@linaro.org>
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

On Tuesday, October 17, 2017 1, Nicolas Pitre wrote:
> This series improves or implements the point and unpoint driver methods
> and reimplements mtd_get_unmapped_area() in terms of those. Because
> mtd->_point() provides a superset of what mtd->_get_unmapped_area() does
> then there is no reason for having both. Or worse: having one but not
> the other.
>=20
> This is motivated by my work on XIP cramfs for both MMU and !MMU systems
> where I do need the more complete point functionality. And it just looks
> like the right thing to do.
>=20
> This is also available on top of Linux v4.14-rc3 via git here:
>=20
>   http://git.linaro.org/people/nicolas.pitre/linux mtd_point
>=20
>=20
> Changes from v1:
>=20
> - Fix retlen computation in mtdram.c:ram_point().
>=20
> - Added Richard Weinberger's REviewd-by tags.
>=20
>=20
> diffstat:
>=20
>  drivers/mtd/chips/map_ram.c  | 34 ++++++++++++++++++++--------------
>  drivers/mtd/chips/map_rom.c  | 34 +++++++++++++++++++++-------------
>  drivers/mtd/devices/mtdram.c | 36 ++++++++++++++++++++++--------------
>  drivers/mtd/mtdconcat.c      | 27 ---------------------------
>  drivers/mtd/mtdcore.c        | 17 ++++++++++++-----
>  drivers/mtd/mtdpart.c        | 14 --------------
>  include/linux/mtd/mtd.h      |  4 ----
>  7 files changed, 75 insertions(+), 91 deletions(-)

I was able to boot my system with the following kernel options:

  "rootfstype=3Dcramfs root=3Dmtd:rootfs_xipcramfs"

This meant the cramfs image was one where the executable code pages=20
remained in flash.


Therefore, for this MTD series, applied on top of the file system series=20
"[PATCH v6 0/4] cramfs refresh for embedded usage":

Tested-by: Chris Brandt <chris.brandt@renesas.com>
