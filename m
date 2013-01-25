Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tyldw-0004sF-ES
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2013 15:56:41 +0000
Date: Fri, 25 Jan 2013 15:56:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 3/3] arm: omap2: gpmc: add DT bindings for OneNAND
Message-ID: <20130125155633.GC16795@e106331-lin.cambridge.arm.com>
References: <1359116591-32730-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1359116591-32730-3-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1359116591-32730-3-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: Javier Martinez Canillas <martinez.javier@gmail.com>,
 "matthias.bgg@googlemail.com" <matthias.bgg@googlemail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, "tony@atomide.com" <tony@atomide.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "zonque@gmail.com" <zonque@gmail.com>,
 "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "jon-hunter@ti.com" <jon-hunter@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "b-cousson@ti.com" <b-cousson@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a couple more comments after looking though this a bit more thorough=
ly.

On Fri, Jan 25, 2013 at 12:23:11PM +0000, Ezequiel Garcia wrote:
> This patch adds device tree bindings for OMAP OneNAND devices.
> Tested on an OMAP3 3430 IGEPv2 board.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
> Changes from v2:
>  * Remove unneeded of_node_put() as reported by Mark Rutland
>=20
> Changes from v1:
>  * Fix typo in Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
>=20
>  .../devicetree/bindings/mtd/gpmc-onenand.txt       |   43 ++++++++++++++=
+++++
>  arch/arm/mach-omap2/gpmc.c                         |   45 ++++++++++++++=
++++++
>  2 files changed, 88 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Doc=
umentation/devicetree/bindings/mtd/gpmc-onenand.txt
> new file mode 100644
> index 0000000..deec9da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> @@ -0,0 +1,43 @@
> +Device tree bindings for GPMC connected OneNANDs
> +
> +GPMC connected OneNAND (found on OMAP boards) are represented as child n=
odes of
> +the GPMC controller with a name of "onenand".
> +
> +All timing relevant properties as well as generic gpmc child properties =
are
> +explained in a separate documents - please refer to
> +Documentation/devicetree/bindings/bus/ti-gpmc.txt

Which tree can I find this in?

> +
> +Required properties:
> +
> + - reg:=09=09=09The CS line the peripheral is connected to
> +
> +Optional properties:
> +
> + - dma-channel:=09=09DMA Channel index
> +
> +For inline partiton table parsing (optional):
> +
> + - #address-cells: should be set to 1
> + - #size-cells: should be set to 1
> +
> +Example for an OMAP3430 board:
> +
> +=09gpmc: gpmc@6e000000 {
> +=09=09compatible =3D "ti,omap3430-gpmc";
> +=09=09ti,hwmods =3D "gpmc";
> +=09=09reg =3D <0x6e000000 0x1000000>;
> +=09=09interrupts =3D <20>;
> +=09=09gpmc,num-cs =3D <8>;
> +=09=09gpmc,num-waitpins =3D <4>;
> +=09=09#address-cells =3D <2>;
> +=09=09#size-cells =3D <1>;
> +
> +=09=09onenand@0 {
> +=09=09=09reg =3D <0 0 0>; /* CS0, offset 0 */
> +
> +=09=09=09#address-cells =3D <1>;
> +=09=09=09#size-cells =3D <1>;
> +
> +=09=09=09/* partitions go here */
> +=09=09};
> +=09};
> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> index c6255f7..0636d0a 100644
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

I don't understand the format of the reg property, but it seems odd that yo=
u
only need to read one cell from it. Are the remaining address cell and size
cell used anywhere?

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

[...]

Otherwise looks good.

Thanks,
Mark.
