Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffrC0-0005L9-UG
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 18:29:03 +0000
Date: Wed, 18 Jul 2018 20:28:10 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Xiaolei Li <xiaolei.li@mediatek.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/4] mtd: use mtd_device_register() where applicable
Message-ID: <20180718202810.04da2783@bbrezillon>
In-Reply-To: <20180713092734.16408-1-zajec5@gmail.com>
References: <20180713092734.16408-1-zajec5@gmail.com>
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

On Fri, 13 Jul 2018 11:27:30 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This is a tiny cleanup making code use mtd_device_register() helper
> macro.
>=20
> It makes checking which drivers (may) specify custom list of parsers
> just a bit easier.
>=20
> Rafa=C5=82 Mi=C5=82ecki (4):
>   mtd: rawnand: use mtd_device_register() where applicable
>   mtd: onenand: use mtd_device_register() where applicable
>   mtd: maps: use mtd_device_register() where applicable
>   mtd: sst25l: use mtd_device_register()

Applied patches 3 and 4 to mtd/next.

Thanks,

Boris

>=20
>  drivers/mtd/devices/sst25l.c        | 5 ++---
>  drivers/mtd/maps/impa7.c            | 5 ++---
>  drivers/mtd/maps/intel_vr_nor.c     | 2 +-
>  drivers/mtd/maps/latch-addr-flash.c | 5 ++---
>  drivers/mtd/maps/rbtx4939-flash.c   | 3 +--
>  drivers/mtd/nand/onenand/generic.c  | 5 ++---
>  drivers/mtd/nand/onenand/samsung.c  | 5 ++---
>  drivers/mtd/nand/raw/cmx270_nand.c  | 4 ++--
>  drivers/mtd/nand/raw/cs553x_nand.c  | 3 +--
>  drivers/mtd/nand/raw/davinci_nand.c | 3 +--
>  drivers/mtd/nand/raw/jz4740_nand.c  | 5 ++---
>  drivers/mtd/nand/raw/mtk_nand.c     | 2 +-
>  drivers/mtd/nand/raw/s3c2410.c      | 4 ++--
>  drivers/mtd/nand/raw/txx9ndfmc.c    | 2 +-
>  14 files changed, 22 insertions(+), 31 deletions(-)
>=20
