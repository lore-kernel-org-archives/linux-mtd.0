Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TxGWN-0004Ia-KH
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2013 12:30:40 +0000
Date: Mon, 21 Jan 2013 12:30:20 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 3/3] arm: omap2: gpmc: add DT bindings for OneNAND
Message-ID: <20130121123020.GI15707@e106331-lin.cambridge.arm.com>
References: <1358634477-25868-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1358634477-25868-3-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1358634477-25868-3-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: "martinez.javier@gmail.com" <martinez.javier@gmail.com>,
 "matthias.bgg@googlemail.com" <matthias.bgg@googlemail.com>,
 "eballetbo@gmail.com" <eballetbo@gmail.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[...]

> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> index 01ce462..f7de9eb 100644
> --- a/arch/arm/mach-omap2/gpmc.c
> +++ b/arch/arm/mach-omap2/gpmc.c
> @@ -39,6 +39,7 @@
>  #include "omap_device.h"
>  #include "gpmc.h"
>  #include "gpmc-nand.h"
> +#include "gpmc-onenand.h"
> =20
>  #define=09DEVICE_NAME=09=09"omap-gpmc"
> =20
> @@ -1259,6 +1260,43 @@ static int gpmc_probe_nand_child(struct platform_d=
evice *pdev,
>  }
>  #endif
> =20
> +#ifdef CONFIG_MTD_ONENAND
> +static int gpmc_probe_onenand_child(struct platform_device *pdev,
> +=09=09=09=09 struct device_node *child)
> +{
> +=09u32 val;
> +=09struct omap_onenand_platform_data *gpmc_onenand_data;
> +
> +=09if (of_property_read_u32(child, "reg", &val) < 0) {
> +=09=09dev_err(&pdev->dev, "%s has no 'reg' property\n",
> +=09=09=09child->full_name);
> +=09=09return -ENODEV;
> +=09}
> +
> +=09gpmc_onenand_data =3D devm_kzalloc(&pdev->dev, sizeof(*gpmc_onenand_d=
ata),
> +=09=09=09=09=09 GFP_KERNEL);
> +=09if (!gpmc_onenand_data)
> +=09=09return -ENOMEM;
> +
> +=09gpmc_onenand_data->cs =3D val;
> +=09gpmc_onenand_data->of_node =3D child;
> +=09gpmc_onenand_data->dma_channel =3D -1;
> +
> +=09if (!of_property_read_u32(child, "dma-channel", &val))
> +=09=09gpmc_onenand_data->dma_channel =3D val;
> +
> +=09gpmc_onenand_init(gpmc_onenand_data);
> +
> +=09return 0;
> +}
> +#else
> +static int gpmc_probe_onenand_child(struct platform_device *pdev,
> +=09=09=09=09    struct device_node *child)
> +{
> +=09return 0;
> +}
> +#endif
> +
>  static int gpmc_probe_dt(struct platform_device *pdev)
>  {
>  =09int ret;
> @@ -1276,6 +1314,12 @@ static int gpmc_probe_dt(struct platform_device *p=
dev)
>  =09=09=09return ret;
>  =09}
> =20

This doesn't look right to me:

> +=09for_each_node_by_name(child, "onenand") {
> +=09=09ret =3D gpmc_probe_onenand_child(pdev, child);
> +=09=09of_node_put(child);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09}

for_each_node_by_name automatically calls of_node_put on each node once pas=
sed,
and as far as I can tell, gpmc_probe_onenand_child doesn't do anything that=
'd
increment a node's refcount.

As far as I can see, you only need the of_node_put in the error case:

for_each_node_by_name(child, "onenand") {
=09ret =3D gpmc_probe_onenand_child(pdev, child);
=09if (ret < 0) {
=09=09of_node_put(child);
=09=09return ret;
=09}
}

Have I missed something here?

>  =09return 0;
>  }
>  #else
> --=20
> 1.7.8.6
>=20
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>=20

Thanks,
Mark.
