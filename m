Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecTly-0004ZB-O9
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 10:19:48 +0000
Date: Fri, 19 Jan 2018 11:19:24 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v2 2/2] mtd: nand: gpmi: Support ->setup_data_interface()
Message-ID: <20180119111924.24b43b27@xps13>
In-Reply-To: <20180119092547.26873-3-miquel.raynal@free-electrons.com>
References: <20180119092547.26873-1-miquel.raynal@free-electrons.com>
 <20180119092547.26873-3-miquel.raynal@free-electrons.com>
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

Hello,

On Fri, 19 Jan 2018 10:25:47 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Until now the GPMI driver had its own timings logic while the core
> already handles that and request the NAND controller drivers to support
> the ->setup_data_interface() hook. Implement that hook by reusing the
> already existing function. No real glue is necessary between core timing
> delays and GPMI registers because the driver already translates the
> ONFI timing modes into register values.
>=20
> Make use of the core's tREA, tRLOH and tRHOH values that allow computing
> more precise timings for mode [0-3] and get significantly better values
> (+20% with an i.MX6 Sabre Auto board). Otherwise use the existing logic.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 275 +++++++++------------------=
------
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  43 ++++--
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  82 +++++-----
>  3 files changed, 149 insertions(+), 251 deletions(-)
>=20

[...]

> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index b51db8c85405..a3db75c27348 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -938,11 +938,32 @@ static void gpmi_select_chip(struct mtd_info *mtd, =
int chipnr)
>  {

[...]

> +	/*
> +	 * This driver currently supports only one NAND chip. Plus, dies share
> +	 * the same configuration. So once timings have been applied on the
> +	 * controller side, they will not change anymore. When the time will
> +	 * come, the check on must_apply_timings will have to be dropped.
> +	 */
> +	if (chipnr > 0 && this->hw.must_apply_timings) {

I realized after sending that performances were actually bad, it is
because this line is wrong twice: the chipnr may be 0, and
hw.must_apply_timings must be reset after a ->setup_data_interface().

> +		this->hw.must_apply_timings =3D false;
> +		gpmi_nfc_apply_timings(this);
> +	}

I will send a v3, sorry for the noise.

Regards,
Miqu=C3=A8l
