Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqe61-0007lZ-Ct
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2016 10:01:58 +0000
Date: Thu, 14 Apr 2016 12:01:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/9] mtd: nand: set ECC algorithm explicitly (part 2)
Message-ID: <20160414120134.087492a3@bbrezillon>
In-Reply-To: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
References: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
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

On Wed, 13 Apr 2016 14:06:53 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> This follow process of using enum nand_ecc_algo in order to clean
> nand_ecc_modes_t.
>=20
> All patches were compile-tested.
>=20
> This work is based on the nand/next branch.

Applied (waiting for the last part).

Thanks,

Boris

>=20
> Rafa=C5=82 Mi=C5=82ecki (9):
>   mtd: nand: omap2: set ECC algorithm explicitly
>   mtd: nand: s3c2410: set ECC algorithm explicitly
>   mtd: nand: sh_flctl: set ECC algorithm explicitly
>   mtd: nand: au1550nd: set ECC algorithm explicitly
>   mtd: nand: mpc5121_nfc: set ECC algorithm explicitly
>   mtd: nand: cmx270: set ECC algorithm explicitly
>   mtd: nand: fsl_upm: set ECC algorithm explicitly
>   mtd: nand: fsl_ifc: set ECC algorithm explicitly
>   mtd: nand: fsl_elbc: set ECC algorithm explicitly
>=20
>  drivers/mtd/nand/au1550nd.c      | 1 +
>  drivers/mtd/nand/cmx270_nand.c   | 1 +
>  drivers/mtd/nand/fsl_elbc_nand.c | 1 +
>  drivers/mtd/nand/fsl_ifc_nand.c  | 1 +
>  drivers/mtd/nand/fsl_upm.c       | 1 +
>  drivers/mtd/nand/mpc5121_nfc.c   | 1 +
>  drivers/mtd/nand/omap2.c         | 1 +
>  drivers/mtd/nand/s3c2410.c       | 1 +
>  drivers/mtd/nand/sh_flctl.c      | 1 +
>  9 files changed, 9 insertions(+)
>=20



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
