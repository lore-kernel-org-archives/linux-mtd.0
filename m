Received: from mail.meprolight.com ([194.90.149.17] helo=meprolight.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeRKv-0008Hi-Ar
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 13:40:46 +0000
From: Alex Gershgorin <alexg@meprolight.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 12 Jun 2012 16:39:33 +0300
Subject: RE: [PATCH] mtd: nand: mxc_nand fix compiler warning
Message-ID: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3332@MEP-EXCH.meprolight.com>
References: <1339499887-17859-1-git-send-email-alexg@meprolight.com>,
 <20120612120115.GU22191@pengutronix.de>
In-Reply-To: <20120612120115.GU22191@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, Jun 12, 2012 at 02:18:07PM +0300, Alex Gershgorin wrote:
> This patch removes the following warning:
> drivers/mtd/nand/mxc_nand.c:1246: warning: initialization discards qualif=
iers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1249: warning: initialization discards qualif=
iers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1252: warning: initialization discards qualif=
iers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1255: warning: initialization discards qualif=
iers from pointer target type
>
> Signed-off-by: Alex Gershgorin <alexg@meprolight.com>
>
> Applies to v3.5-rc2+
> ---
> >Better write the "Applies to" line after the tripple dash. Then this
> >info doesn't make it into the commit log. Instead point out the
> >offending commit.

Sorry my mistake

> >Having said that, I prefer to have

> >  http://mid.gmane.org/1335171381-24869-1-git-send-email-u.kleine-koenig=
@pengutronix.de
> > (and the follow-ups) applied. Casting away consts is nearly always
> > wrong.

I think this patch will solve the warnings problem only in mxc_nand driver,=
 but this patch also creates
 new same problems to  other drivers that use struct of_device_id.

Thanks
Alex

>  drivers/mtd/nand/mxc_nand.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index c58e6a9..74b6e75 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1243,16 +1243,16 @@ static const struct mxc_nand_devtype_data imx51_n=
and_devtype_data =3D {
>  static const struct of_device_id mxcnd_dt_ids[] =3D {
>       {
>               .compatible =3D "fsl,imx21-nand",
> -             .data =3D &imx21_nand_devtype_data,
> +             .data =3D (void *)&imx21_nand_devtype_data,
>       }, {
>               .compatible =3D "fsl,imx27-nand",
> -             .data =3D &imx27_nand_devtype_data,
> +             .data =3D (void *)&imx27_nand_devtype_data,
>       }, {
>               .compatible =3D "fsl,imx25-nand",
> -             .data =3D &imx25_nand_devtype_data,
> +             .data =3D (void *)&imx25_nand_devtype_data,
>       }, {
>               .compatible =3D "fsl,imx51-nand",
> -             .data =3D &imx51_nand_devtype_data,
> +             .data =3D (void *)&imx51_nand_devtype_data,
>       },
>       { /* sentinel */ }
>  };
> --
> 1.7.0.4
>
>

--
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            =
|
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
