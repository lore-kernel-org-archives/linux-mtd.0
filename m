Date: Fri, 2 Sep 2016 16:17:05 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: mxc_nand: Set timing for v2 controllers
Message-ID: <20160902161705.043eb3a5@ipc1.ka-ro>
In-Reply-To: <1472820149-24241-3-git-send-email-s.hauer@pengutronix.de>
References: <1472820149-24241-1-git-send-email-s.hauer@pengutronix.de>
 <1472820149-24241-3-git-send-email-s.hauer@pengutronix.de>
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

Hi,

On Fri,  2 Sep 2016 14:42:29 +0200 Sascha Hauer wrote:
> So far we relied on reset default or the bootloader to configure a
> suitable clk rate for the Nand controller. This works but we can
> optimize the timing for better performance. This sets the clk rate for
> v2 controllers (i.MX25/35) based on the timing mode read from the ONFI
> parameter page. This may also enable the symmetric mode (aks EDO mode)
> if necessary which reads one word per clock cycle.
> Tested on an i.MX25 with a Micron MT29F4G08ABBDAHC attached.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c | 80 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 80 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 5173fad..3cd2696 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -152,6 +152,9 @@ struct mxc_nand_devtype_data {
>  	void (*select_chip)(struct mtd_info *mtd, int chip);
>  	int (*correct_data)(struct mtd_info *mtd, u_char *dat,
>  			u_char *read_ecc, u_char *calc_ecc);
> +	int (*setup_data_interface)(struct mtd_info *mtd,
> +			  const struct nand_data_interface *conf,
> +			  bool check_only);
> =20
<nit>
indentation inconsistent with the preceding line.
(<TAB><SPACE><SPACE> vs. <TABs> only)
</nit>

>  	/*
>  	 * On i.MX21 the CONFIG2:INT bit cannot be read if interrupts are masked
> @@ -1012,6 +1015,80 @@ static void preset_v1(struct mtd_info *mtd)
>  	writew(0x4, NFC_V1_V2_WRPROT);
>  }
> =20
> +static int mxc_nand_v2_setup_data_interface(struct mtd_info *mtd,
> +					    const struct nand_data_interface *conf,
> +					    bool check_only)
> +{
> +	struct nand_chip *nand_chip =3D mtd_to_nand(mtd);
> +	struct mxc_nand_host *host =3D nand_get_controller_data(nand_chip);
> +	int tRC_min_ns, tRC_ps, ret;
> +	unsigned long rate, rate_round;
> +	const struct nand_sdr_timings *timings;
> +	uint16_t config1;
> +
> +	if (conf->type !=3D NAND_SDR_IFACE)
> +		return -ENOTSUPP;
> +
> +	config1 =3D readw(NFC_V1_V2_CONFIG1);
> +
> +	timings =3D &conf->timings.sdr;
> +
> +	tRC_min_ns =3D timings->tRC_min / 1000;
> +	rate =3D 1000000000 / tRC_min_ns;
> +
> +	/*
> +	 * For tRC < 30ns we have to use EDO mode. In this case the controller
> +	 * does one access per clock cycle. Otherwise the controller does one
> +	 * access in two clock cycles, thus we have to double the rate to the
> +	 * controller.
> +	 */
> +	if (tRC_min_ns < 30) {
> +		rate_round =3D clk_round_rate(host->clk, rate);
> +		config1 |=3D NFC_V2_CONFIG1_ONE_CYCLE;
> +		tRC_ps =3D 1000000000 / (rate_round / 1000);
> +	} else {
> +		rate_round =3D clk_round_rate(host->clk, rate * 2);
> +		config1 &=3D ~NFC_V2_CONFIG1_ONE_CYCLE;
> +		tRC_ps =3D 1000000000 / (rate_round / 1000 / 2);
> +		rate *=3D 2;
>
You could save an extra lsl by doing the *2 first:
		rate *=3D 2;
		rate_round =3D clk_round_rate(host->clk, rate);
[...]

> +	/*
> +	 * The timing values compared against are from the i.MX25 Automotive
> +	 * datasheet, Table 50. NFC Timing Parameters
> +	 */
> +	if (timings->tCLS_min > tRC_ps - 1000 ||
> +	    timings->tCLH_min > tRC_ps - 2000 ||
> +	    timings->tCS_min > tRC_ps - 1000 ||
> +	    timings->tCH_min > tRC_ps - 2000 ||
> +	    timings->tWP_min > tRC_ps - 1500 ||
> +	    timings->tALS_min > tRC_ps ||
> +	    timings->tALH_min > tRC_ps - 3000 ||
> +	    timings->tDS_min > tRC_ps ||
> +	    timings->tDH_min > tRC_ps - 5000 ||
> +	    timings->tWC_min > 2 * tRC_ps ||
> +	    timings->tWH_min > tRC_ps - 2500 ||
> +	    timings->tRR_min > 6 * tRC_ps ||
> +	    timings->tRP_min > 3 * tRC_ps / 2 ||
> +	    timings->tRC_min > 2 * tRC_ps ||
> +	    timings->tREH_min > (tRC_ps / 2) - 2500) {
> +		dev_dbg(host->dev, "Timing out of bounds\n");
>
Since it is an error which prevents the driver from being loaded, the
message deserves to be printed with dev_err(), so that the user can see
why the driver failed (without having to recompile the kernel with
'#define DEBUG' added to the driver source).


Lothar Wa=C3=9Fmann
