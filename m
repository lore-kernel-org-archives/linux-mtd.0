Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elB0J-0002Zv-E1
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 10:06:33 +0000
Date: Mon, 12 Feb 2018 11:06:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Han Xu
 <han.xu@nxp.com>
Subject: Re: [PATCH v3 0/2] Migrate the GPMI driver to use NAND core timings
Message-ID: <20180212110609.5dccdd89@xps13>
In-Reply-To: <20180119135855.10673-1-miquel.raynal@free-electrons.com>
References: <20180119135855.10673-1-miquel.raynal@free-electrons.com>
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

Hello Han,

Would you mind give us your input about this series as well as the
patch that follows (Use core timings instead of an empirical
derivation) ?

If you are unhappy with them I will welcome your comments.

Thank you,
Miqu=C3=A8l

On Fri, 19 Jan 2018 14:58:53 +0100, Miquel Raynal
<miquel.raynal@free-electrons.com> wrote:

> Hello,
>=20
> The GPMI NAND controller driver has its own timings logic while the core
> also has its own that should be preferred to avoid code duplication.
> This series migrates the driver to use the ->setup_data_interface()
> hook, preferred way to handle timings negotiation between controllers
> and NAND chips.
>=20
> This driver has stronger requirements in terms of respect of the ONFI
> specification than the core has, and last time I post changes to this
> section this was raised to me. Hence, the first patch effectively
> applies the same requirements to the core. Doing this can slow down
> several chips that do not follow entirely the specifications, but
> another series is coming to add the possibility for NAND vendors to
> flag certain features as "unsupported". See
>=20
>     "mtd: nand: Check ONFI timings have been acked by the chip"
>=20
> commit log for more details.
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
> One comment is not addressed here: using one register for TIMING0/1 and
> CTRL1 that is only written in ->apply_timings(). This will be done in a
> later patch that will update the way timings are derived.
>=20
>=20
> Miquel Raynal (2):
>   mtd: nand: Check ONFI timings have been acked by the chip
>   mtd: nand: gpmi: Support ->setup_data_interface()
>=20
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 277 ++++++++++-----------------=
------
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  42 +++--
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  82 +++++-----
>  drivers/mtd/nand/nand_base.c           |  42 ++++-
>  4 files changed, 185 insertions(+), 258 deletions(-)
>=20



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
