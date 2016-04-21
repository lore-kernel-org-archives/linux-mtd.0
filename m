From: Yunhui Cui <yunhui.cui@nxp.com>
To: Han Xu <han.xu@nxp.com>, Yunhui Cui <B56489@freescale.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "han.xu@freescale.com" <han.xu@freescale.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Yao Yuan <yao.yuan@nxp.com>
Subject: RE: [PATCH 8/9] mtd: fsl-quadspi: disable AHB buffer prefetch
Date: Thu, 21 Apr 2016 09:41:26 +0000
Message-ID: <DB5PR0401MB1912F866F920C71BF1A26F29946E0@DB5PR0401MB1912.eurprd04.prod.outlook.com>
References: <1460605855-6689-1-git-send-email-B56489@freescale.com>,
 <1460605855-6689-9-git-send-email-B56489@freescale.com>
 <DB5PR0401MB18454AF685ADE37F1C39C088976D0@DB5PR0401MB1845.eurprd04.prod.outlook.com>
In-Reply-To: <DB5PR0401MB18454AF685ADE37F1C39C088976D0@DB5PR0401MB1845.eurprd04.prod.outlook.com>
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

On Thu, Apr 24, 2016 at 06:37:01 AM +0800, Han Xu wrote:
> ________________________________________
> From: Yunhui Cui <B56489@freescale.com>
> Sent: Wednesday, April 13, 2016 9:50 PM
> To: dwmw2@infradead.org; computersforpeace@gmail.com;
> han.xu@freescale.com
> Cc: linux-kernel@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
> arm-kernel@lists.infradead.org; Yao Yuan; Yunhui Cui
> Subject: [PATCH 8/9] mtd: fsl-quadspi: disable AHB buffer prefetch
>=20
> From: Yunhui Cui <yunhui.cui@nxp.com>
>=20
> A-009282: QuadSPI: QuadSPI data pre-fetch can result in incorrect data
> Affects: QuadSPI
> Description: With AHB buffer prefetch enabled, the QuadSPI may return
> incorrect data on the AHB interface. The buffer pre-fetch is enabled if
> the fetch size as configured either in the LUT or in the BUFxCR register
> is greater than 8 bytes.
> Impact: Only 64 bit read allowed.
> Workaround: Keep the read data size to 64 bits (8 Bytes), which disables
> the prefetch on the AHB buffer, and prevents this issue from occurring.
>=20
> Signed-off-by: Yunhui Cui <yunhui.cui@nxp.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-
> quadspi.c
> index fea18b6..d9f3e50 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -752,19 +752,36 @@ static void fsl_qspi_init_abh_read(struct fsl_qspi
> *q)  {
>         void __iomem *base =3D q->iobase;
>         int seqid;
> +       const struct fsl_qspi_devtype_data *devtype_data =3D
> + q->devtype_data;
>=20
>         /* AHB configuration for access buffer 0/1/2 .*/
>         qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base +
> QUADSPI_BUF0CR);
>         qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base +
> QUADSPI_BUF1CR);
>         qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base +
> QUADSPI_BUF2CR);
> +
>         /*
> -        * Set ADATSZ with the maximum AHB buffer size to improve the
> -        * read performance.
> +        * Errata: A-009282: QuadSPI data prefetch may result in
> incorrect data
> +        * Workaround: Keep the read data size to 64 bits (8 bytes).
> +        * This disables the prefetch on the AHB buffer and
> +        * prevents this issue from occurring.
>          */
> -       qspi_writel(q, QUADSPI_BUF3CR_ALLMST_MASK |
> -                       ((q->devtype_data->ahb_buf_size / 8)
> -                       << QUADSPI_BUF3CR_ADATSZ_SHIFT),
> -                       base + QUADSPI_BUF3CR);
> +       if (devtype_data->devtype =3D=3D FSL_QUADSPI_LS2080A ||
> +           devtype_data->devtype =3D=3D FSL_QUADSPI_LS1021A) {
>=20
> Use QUIRK, not SoC name.
[Yunhui] This is a SoC errata, we need distinguish according to the devtype=
_data->devtype
> +
> +               qspi_writel(q, QUADSPI_BUF3CR_ALLMST_MASK |
> +                               (1 << QUADSPI_BUF3CR_ADATSZ_SHIFT),
> +                               base + QUADSPI_BUF3CR);
> +
> +       } else {
> +               /*
> +                * Set ADATSZ with the maximum AHB buffer size to improve
> the
> +                * read performance.
> +               */
> +               qspi_writel(q, QUADSPI_BUF3CR_ALLMST_MASK |
> +                               ((q->devtype_data->ahb_buf_size / 8)
> +                               << QUADSPI_BUF3CR_ADATSZ_SHIFT),
> +                               base + QUADSPI_BUF3CR);
> +       }
>=20
>         /* We only use the buffer3 */
>         qspi_writel(q, 0, base + QUADSPI_BUF0IND);
> --
> 2.1.0.27.g96db324
