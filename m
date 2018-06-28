Date: Thu, 28 Jun 2018 09:00:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Yixun Lan
 <yixun.lan@amlogic.com>, <linux-mtd@lists.infradead.org>, Liang Yang
 <liang.yang@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: rawnand: meson: add support for Amlogic NAND
 flash controller
Message-ID: <20180628090034.0637a062@xps13>
In-Reply-To: <7ha7rfiz3c.fsf@baylibre.com>
References: <20180613161314.14894-1-yixun.lan@amlogic.com>
 <20180613161314.14894-3-yixun.lan@amlogic.com>
 <20180624213844.2207ca6f@bbrezillon> <7ha7rfiz3c.fsf@baylibre.com>
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

Hi Kevin,

On Wed, 27 Jun 2018 16:33:43 -0700, Kevin Hilman <khilman@baylibre.com>
wrote:

> Hi Boris,
>=20
> Boris Brezillon <boris.brezillon@bootlin.com> writes:
>=20
> > Hi Yixun,
> >
> > On Wed, 13 Jun 2018 16:13:14 +0000
> > Yixun Lan <yixun.lan@amlogic.com> wrote:
> > =20
> >> From: Liang Yang <liang.yang@amlogic.com>
> >>=20
> >> Add initial support for the Amlogic NAND flash controller which found
> >> in the Meson-GXBB/GXL/AXG SoCs.
> >>=20
> >> Singed-off-by: Liang Yang <liang.yang@amlogic.com>
> >> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> >> ---
> >>  drivers/mtd/nand/raw/Kconfig      |    8 +
> >>  drivers/mtd/nand/raw/Makefile     |    3 +
> >>  drivers/mtd/nand/raw/meson_nand.c | 1422 +++++++++++++++++++++++++++++
> >>  3 files changed, 1433 insertions(+)
> >>  create mode 100644 drivers/mtd/nand/raw/meson_nand.c =20
> >
> > Can you run checkpatch.pl --strict and fix the coding style issues?
> > =20
> >>=20
> >> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconf=
ig
> >> index 19a2b283fbbe..b3c17a3ca8f4 100644
> >> --- a/drivers/mtd/nand/raw/Kconfig
> >> +++ b/drivers/mtd/nand/raw/Kconfig
> >> @@ -534,4 +534,12 @@ config MTD_NAND_MTK
> >>  	  Enables support for NAND controller on MTK SoCs.
> >>  	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
> >> =20
> >> +config MTD_NAND_MESON
> >> +	tristate "Support for NAND flash controller on Amlogic's Meson SoCs"
> >> +	depends on ARCH_MESON || COMPILE_TEST
> >> +	select COMMON_CLK_REGMAP_MESON
> >> +	select MFD_SYSCON
> >> +	help
> >> +	  Enables support for NAND controller on Amlogic's Meson SoCs.
> >> +
> >>  endif # MTD_NAND
> >> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Make=
file
> >> index 165b7ef9e9a1..cdf6162f38c3 100644
> >> --- a/drivers/mtd/nand/raw/Makefile
> >> +++ b/drivers/mtd/nand/raw/Makefile
> >> @@ -1,5 +1,7 @@
> >>  # SPDX-License-Identifier: GPL-2.0
> >> =20
> >> +ccflags-$(CONFIG_MTD_NAND_MESON) +=3D -I$(srctree)/drivers/clk/meson =
=20
> >
> > Please don't do that. If you need to expose common regs, put them
> > in include/linux/soc/meson/. I'm also not sure why you need to access
> > the clk regs directly. Why can't you expose the MMC/NAND clk as a clk
> > provider whose driver would be placed in drivers/clk and which would use
> > the mmc syscon. This way the same clk driver could be used for both
> > MMC and NAND clk indifferently, and the NAND driver would be much
> > simpler. =20
>=20
> [...]
>=20
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const char * sd_emmc_ext_clk0_parent_names[MUX_CLK_NUM_PARENTS=
];
> >> +
> >> +static struct clk_regmap sd_emmc_c_ext_clk0_sel =3D {
> >> +	.data =3D &(struct clk_regmap_mux_data){
> >> +		.offset =3D SD_EMMC_CLOCK,
> >> +		.mask =3D 0x3,
> >> +		.shift =3D 6,
> >> +	},
> >> +	.hw.init =3D &(struct clk_init_data) {
> >> +		.name =3D "sd_emmc_c_nand_clk_mux",
> >> +		.ops =3D &clk_regmap_mux_ops,
> >> +		.parent_names =3D sd_emmc_ext_clk0_parent_names,
> >> +		.num_parents =3D ARRAY_SIZE(sd_emmc_ext_clk0_parent_names),
> >> +		.flags =3D CLK_SET_RATE_PARENT,
> >> +	},
> >> +};
> >> +
> >> +static struct clk_regmap sd_emmc_c_ext_clk0_div =3D {
> >> +	.data =3D &(struct clk_regmap_div_data){
> >> +		.offset =3D SD_EMMC_CLOCK,
> >> +		.shift =3D 0,
> >> +		.width =3D 6,
> >> +		.flags =3D CLK_DIVIDER_ROUND_CLOSEST | CLK_DIVIDER_ONE_BASED,
> >> +	},
> >> +	.hw.init =3D &(struct clk_init_data) {
> >> +		.name =3D "sd_emmc_c_nand_clk_div",
> >> +		.ops =3D &clk_regmap_divider_ops,
> >> +		.parent_names =3D (const char *[]){ "sd_emmc_c_nand_clk_mux" },
> >> +		.num_parents =3D 1,
> >> +		.flags =3D CLK_SET_RATE_PARENT,
> >> +	},
> >> +};
> >> +
> >> +static int meson_nfc_clk_init(struct meson_nfc *nfc)
> >> +{
> >> +	struct clk_regmap *mux =3D &sd_emmc_c_ext_clk0_sel;
> >> +	struct clk_regmap *div =3D &sd_emmc_c_ext_clk0_div;
> >> +	struct clk *clk;
> >> +	int i, ret;
> >> +
> >> +	/* request core clock */
> >> +	nfc->core_clk =3D devm_clk_get(nfc->dev, "core");
> >> +	if (IS_ERR(nfc->core_clk)) {
> >> +		dev_err(nfc->dev, "failed to get core clk\n");
> >> +		return PTR_ERR(nfc->core_clk);
> >> +	}
> >> +
> >> +	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
> >> +	regmap_update_bits(nfc->reg_clk, 0,
> >> +			CLK_SELECT_NAND | CLK_ALWAYS_ON | CLK_DIV_MASK,
> >> +			CLK_SELECT_NAND | CLK_ALWAYS_ON | CLK_DIV_MASK);
> >> +
> >> +	/* get the mux parents */
> >> +	for (i =3D 0; i < MUX_CLK_NUM_PARENTS; i++) {
> >> +		char name[16];
> >> +
> >> +		snprintf(name, sizeof(name), "clkin%d", i);
> >> +		clk =3D devm_clk_get(nfc->dev, name);
> >> +		if (IS_ERR(clk)) {
> >> +			if (clk !=3D ERR_PTR(-EPROBE_DEFER))
> >> +				dev_err(nfc->dev, "Missing clock %s\n", name);
> >> +			return PTR_ERR(clk);
> >> +		}
> >> +
> >> +		sd_emmc_ext_clk0_parent_names[i] =3D __clk_get_name(clk);
> >> +	}
> >> +
> >> +	mux->map =3D nfc->reg_clk;
> >> +	clk =3D devm_clk_register(nfc->dev, &mux->hw);
> >> +	if (WARN_ON(IS_ERR(clk)))
> >> +		return PTR_ERR(clk);
> >> +
> >> +	div->map =3D nfc->reg_clk;
> >> +	nfc->device_clk =3D devm_clk_register(nfc->dev, &div->hw);
> >> +	if (WARN_ON(IS_ERR(nfc->device_clk)))
> >> +		return PTR_ERR(nfc->device_clk);
> >> +
> >> +	ret =3D clk_prepare_enable(nfc->core_clk);
> >> +	if (ret) {
> >> +		dev_err(nfc->dev, "failed to enable core clk\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret =3D clk_prepare_enable(nfc->device_clk);
> >> +	if (ret) {
> >> +		dev_err(nfc->dev, "failed to enable device clk\n");
> >> +		clk_disable_unprepare(nfc->core_clk);
> >> +		return ret;
> >> +	}
> >> +
> >> +	return 0;
> >> +} =20
> >
> >
> > As said above, I don't like having a clk driver here, especially since
> > the registers you're accessing are not part of the NAND controller
> > registers. Please try to create a driver in drivers/clk/ for that. =20
>=20
> We went back and forth on this one on some off-list reviews.
>=20
> Had we known that the NAND controller was (re)using the clock registers
> internal to the MMC IP block from the beginning, we would have written a
> clock provider in drivers/clk for this, and shared it.
>=20
> However, when I wrote the MMC driver[1] (already upstream) along with
> the bindings[2], we did not fathom that the internal mux and divider
> would be "borrowed" by another device. :(
>=20
> We only recently found out that the NAND controller "borrows" one of the
> MMC clocks, whose registers are inside the MMC range.  Taking the clock
> out of the MMC driver and into its own clock-provider implies redoing
> the MMC driver, as well as its bindings, which we wanted to avoid
> (especially the binding changes.)
>=20
> We (I can take the blame) decided that since the MMC and NAND are
> mutually exclusive (they also share pins), that allowing NAND to reuse
> the MMC range would be a good compromise.  The DT still accurately
> describes the hardware, but we don't have to throw a large wrench into
> the DT bindings just for a newly discovered shared clock.
>=20
> I agree, it's not the prettiest thing, but when we cannot know the full
> details of the hardware when we start, sometimes we end up in a bit of a
> mess that requires some compromise.

I totally understand your situation but as MMC and NAND are mutually
exclusive, how is this a problem to have a dedicated clock driver used
only by the NAND controller (as maybe a first step)? I mean, if you
don't change the MMC bindings, then the MMC driver will still use its
own 'local' clock driver, right? I don't know if you can have two
nodes reserving the same address range though.


>=20
> Kevin
>=20
> [1] drivers/mmc/host/meson-gx-mmc.c
> [2] Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt           =
                                                                           =
                =20


Thanks,
Miqu=C3=A8l
