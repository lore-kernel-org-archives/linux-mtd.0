Received: from relmlor4.renesas.com ([210.160.252.174]
 helo=relmlie3.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e9F0g-0006Ee-U5
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 18:42:08 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2 0/5] unconfuse get_unmapped_area and point/unpoint
 driver methods
Date: Mon, 30 Oct 2017 18:41:43 +0000
Message-ID: <SG2PR06MB11653D3E9472DEB222F11C5C8A590@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
 <SG2PR06MB1165A4668E066DAC5E810CD08A590@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <nycvar.YSQ.7.76.1710301432220.3238@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.1710301432220.3238@knanqh.ubzr>
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

On Monday, October 30, 2017, Nicolas Pitre wrote:
> On Mon, 30 Oct 2017, Chris Brandt wrote:
>=20
> > I was able to boot my system with the following kernel options:
> >
> >   "rootfstype=3Dcramfs root=3Dmtd:rootfs_xipcramfs"
> >
> > This meant the cramfs image was one where the executable code pages
> > remained in flash.
> >
> >
> > Therefore, for this MTD series, applied on top of the file system serie=
s
> > "[PATCH v6 0/4] cramfs refresh for embedded usage":
> >
> > Tested-by: Chris Brandt <chris.brandt@renesas.com>
>=20
> Thanks for testing!
>=20
>=20
> Nicolas


Thank you for implementing!


I've been trying to keep AXFS up to date with recent kernels since it=20
was my only solution for an XIP file system, but now that we'll have an=20
in-kernel solution, it's not as critical anymore if/when AXFS breaks=20
again.


Chris
