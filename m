Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyaPu-0004EE-57
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 09:52:24 +0000
Date: Wed, 21 Mar 2018 10:52:00 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>,
 juliensu@mxic.com.tw, linux-mtd@lists.infradead.org,
 jocelyncarroue@macronix.com
Subject: Re: [PATCH RESEND v2 0/2] Migrate the GPMI driver to use NAND core
 timings
Message-ID: <20180321105200.417e2d0d@bbrezillon>
In-Reply-To: <20180302143840.3157-1-miquel.raynal@bootlin.com>
References: <20180302143840.3157-1-miquel.raynal@bootlin.com>
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

On Fri,  2 Mar 2018 15:38:38 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
>=20
> The GPMI NAND controller driver has its own timings logic while the core
> also has its own that should be preferred to avoid code duplication.
> This series migrates the driver to use the ->setup_data_interface()
> hook, preferred way to handle timings negotiation between controllers
> and NAND chips.
>=20
> This driver has stronger requirements in terms of respect of the ONFI
> specification than the core has, and last time I sent changes in the
> GPMI timings section, this was raised to me as a no go. Since then, I
> sent a series improving timings handling in the core, see [1] and [2],
> so this kind of change that moves the shared logic in the core can be
> applied safely.

Applied.

Thanks,

Boris

>=20
> [1] http://lists.infradead.org/pipermail/linux-mtd/2018-March/079456.html
> [2] http://lists.infradead.org/pipermail/linux-mtd/2018-March/079460.html
>=20
> Thank you,
> Miqu=C3=A8l
>=20
>=20
> Changes since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - Fix ->select_chip(): chipnr =3D=3D 0 is valid.
>   - Fix ->select_chip(): hw.must_apply_timings must be reset after a
>     ->setup_data_interface(). =20
>=20
> Changes since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - Removed inline on non-static gpmi_enable/disable_clk() functions.
>   - Rewording some lines of the patch.
>   - Use tREA_max value provided by the core instead of a locally defined
>     value.
>   - Check ->conf in gpmi_setup_data_interface() instead of
>     ->onfi_timing_mode_default (use tRC). =20
>   - Removed useless copy of hw.timing_mode.
>   - Moved gpmi_nfc_apply_timings() to ->select_chip().
>   - Canceled the useless move of one structure.
>=20
>=20
> Miquel Raynal (2):
>   mtd: rawnand: gpmi: support ->setup_data_interface()
>   mtd: rawnand: gpmi: use core timings instead of an empirical
>     derivation
>=20
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 811 +++++------------------=
------
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  82 ++-
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 131 +----
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h |   5 +
>  4 files changed, 185 insertions(+), 844 deletions(-)
>=20



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
