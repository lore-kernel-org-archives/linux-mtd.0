Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqFUm-0007YU-Q4
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 07:45:53 +0000
Date: Wed, 13 Apr 2016 09:45:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/8] mtd: nand: set ECC algorithm explicitly
Message-ID: <20160413094521.74b2427e@bbrezillon>
In-Reply-To: <1460111031-8706-1-git-send-email-zajec5@gmail.com>
References: <1460111031-8706-1-git-send-email-zajec5@gmail.com>
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

Hi Rafal,

On Fri,  8 Apr 2016 12:23:43 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> As part of nand_ecc_modes_t cleaning process we introduced enum
> nand_ecc_algo. Before we start using it (mostly in nand_core.c) we have
> to modify all driver to set it properly.
>=20
> This is the first patchset modifying existing drivers. All patches were
> compile-tested. More patches will follow in the future, but I was hoping
> to have this first series accepted meanwhile.
>=20
> This work is based on the nand/next branch.

Whole series applied.

Thanks,

Boris

>=20
> Rafa=C5=82 Mi=C5=82ecki (8):
>   mtd: nand: ams-delta: set ECC algorithm explicitly
>   mtd: nand: gpio: set ECC algorithm explicitly
>   mtd: nand: mxc: set ECC algorithm explicitly
>   mtd: nand: nuc900: set ECC algorithm explicitly
>   mtd: nand: orion: set ECC algorithm explicitly
>   mtd: nand: pasemi: set ECC algorithm explicitly
>   mtd: nand: plat: set ECC algorithm explicitly
>   mtd: nand: socrates: set ECC algorithm explicitly
>=20
>  drivers/mtd/nand/ams-delta.c     | 1 +
>  drivers/mtd/nand/gpio.c          | 1 +
>  drivers/mtd/nand/mxc_nand.c      | 1 +
>  drivers/mtd/nand/nuc900_nand.c   | 1 +
>  drivers/mtd/nand/orion_nand.c    | 1 +
>  drivers/mtd/nand/pasemi_nand.c   | 1 +
>  drivers/mtd/nand/plat_nand.c     | 1 +
>  drivers/mtd/nand/socrates_nand.c | 1 +
>  8 files changed, 8 insertions(+)
>=20



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
