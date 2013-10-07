From: "Gupta, Pekon" <pekon@ti.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH v7 2/6] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Date: Mon, 7 Oct 2013 12:18:46 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA1F498@DBDE04.ent.ti.com>
References: <1380916188-24206-1-git-send-email-pekon@ti.com>
 <1380916188-24206-3-git-send-email-pekon@ti.com>
 <20131007113547.GB15365@e106331-lin.cambridge.arm.com>
In-Reply-To: <20131007113547.GB15365@e106331-lin.cambridge.arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Mark Rutland [mailto:mark.rutland@arm.com]
> > On Fri, Oct 04, 2013 at 08:49:44PM +0100, Pekon Gupta wrote:

 [snip]

> >
> > diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-
> omap2/gpmc.c
> > index 1c45b72..5a607fa 100644
> > --- a/arch/arm/mach-omap2/gpmc.c
> > +++ b/arch/arm/mach-omap2/gpmc.c
> > @@ -1341,12 +1341,6 @@ static void __maybe_unused
> gpmc_read_timings_dt(struct device_node *np,
> >
> >  #ifdef CONFIG_MTD_NAND
> >
> > -static const char * const nand_ecc_opts[] =3D {
> > -	[OMAP_ECC_HAM1_CODE_HW]			=3D "ham1",
> > -	[OMAP_ECC_BCH4_CODE_HW]			=3D "bch4",
> > -	[OMAP_ECC_BCH8_CODE_HW]			=3D "bch8",
> > -};
> > -
> >  static const char * const nand_xfer_types[] =3D {
> >  	[NAND_OMAP_PREFETCH_POLLED]		=3D "prefetch-polled",
> >  	[NAND_OMAP_POLLED]			=3D "polled",
> > @@ -1361,6 +1355,8 @@ static int gpmc_probe_nand_child(struct
> platform_device *pdev,
> >  	const char *s;
> >  	struct gpmc_timings gpmc_t;
> >  	struct omap_nand_platform_data *gpmc_nand_data;
> > +	const __be32 *phandle;
>=20
> I don't think you need this. With of_parse_phandle you should never need
> to see the raw phandle value.
>=20
> > +	int lenp;
> >
> >  	if (of_property_read_u32(child, "reg", &val) < 0) {
> >  		dev_err(&pdev->dev, "%s has no 'reg' property\n",
> > @@ -1376,12 +1372,39 @@ static int gpmc_probe_nand_child(struct
> platform_device *pdev,
> >  	gpmc_nand_data->cs =3D val;
> >  	gpmc_nand_data->of_node =3D child;
> >
> > -	if (!of_property_read_string(child, "ti,nand-ecc-opt", &s))
> > -		for (val =3D 0; val < ARRAY_SIZE(nand_ecc_opts); val++)
> > -			if (!strcasecmp(s, nand_ecc_opts[val])) {
> > -				gpmc_nand_data->ecc_opt =3D val;
> > -				break;
> > -			}
> > +	/* Detect availability of ELM module */
> > +	phandle =3D of_get_property(child, "ti,elm-id", &lenp);
> > +	if ((phandle =3D=3D NULL) || (lenp !=3D sizeof(void *))) {
> > +		pr_warn("%s: ti,elm-id property not found\n", __func__);
> > +		gpmc_nand_data->elm_of_node =3D NULL;
> > +	} else {
> > +		gpmc_nand_data->elm_of_node =3D
> > +
> 	of_find_node_by_phandle(be32_to_cpup(phandle));
> > +	}
>=20
> Use of_parse_handle rather than open-coding it:
>=20
> 	gpmc_nand_data->elm_of_node =3D
> 		of_parse_phandle(child, "ti,elm-id", 0);
>=20
> Was "elm_id" ever handled previously? I don't see any code handling it
> being remove or modified.
>=20
Yes, this piece of code has been moved from omap2.c (nand-driver)
to gpmc.c (GPMC driver), so as to perform all DT related parsing
at single place. =20
This change was needed as per feedbacks from Olof to simply
DT bindings so that they include only H/W related stuff.

Please refer omap2.c: omap3_init_bch() in [PATCH 3/6] of same series
where 'elm_id' DT parsing was original present.
-	/* Detect availability of ELM module */
-	parp =3D of_get_property(info->of_node, "elm_id", &lenp);
-	if ((parp =3D=3D NULL) && (lenp !=3D (sizeof(void *) * 2))) {
-		pr_err("Missing elm_id property, fall back to Software BCH\n");
-		info->is_elm_used =3D false;
-	} else {
-		struct platform_device *pdev;
-
-		elm_node =3D of_find_node_by_phandle(be32_to_cpup(parp));
-		pdev =3D of_find_device_by_node(elm_node);
-		info->elm_dev =3D &pdev->dev;
-
-		if (elm_config(info->elm_dev, bch_type) =3D=3D 0)
-			info->is_elm_used =3D true;



with regards, pekon
