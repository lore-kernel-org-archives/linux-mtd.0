MIME-Version: 1.0
In-Reply-To: <1305557977-16871-9-git-send-email-marc.zyngier@arm.com>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
	<1305557977-16871-9-git-send-email-marc.zyngier@arm.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 16 May 2011 23:06:10 +0800
Message-ID: <BANLkTi=-Lcg5Wk7yuipTTzrSxs0nNmpMaw@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] MTD: physmap: let set_vpp() pass a platform_device
	instead of a map_info
To: Marc Zyngier <marc.zyngier@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org,
	Philipp Zabel <philipp.zabel@gmail.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 16, 2011 at 10:59 PM, Marc Zyngier <marc.zyngier@arm.com> wrote=
:
> The set_vpp() method provided by physmap passes a map_info back to
> the platform code, which has little relevance as far as the platform
> is concerned (this parameter is completely unused).
>
> Instead, pass the platform_device, which can be used in the pismo
> driver to retrieve some important information in a nicer way, instead
> of the hack that was in place.

Not really sure if a 'struct device' would be more generic here, though thi=
s
case is simply a 'struct platform_device'.

>
> The empty set_vpp function in board-at572d940hf_ek.c is removed, as
> it serves no real purpose.
>
> Cc: Andrew Victor <linux@maxim.org.za>
> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Philipp Zabel <philipp.zabel@gmail.com>
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
> =C2=A0arch/arm/mach-at91/board-at572d940hf_ek.c | =C2=A0 =C2=A04 ---
> =C2=A0arch/arm/mach-integrator/integrator_ap.c =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-integrator/integrator_cp.c =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-omap1/flash.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-pxa/hx4700.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-pxa/magician.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-realview/core.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-s3c2410/nor-simtec.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-versatile/core.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-vexpress/v2m.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/plat-omap/include/plat/flash.h =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0drivers/mtd/maps/physmap.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 15 ++++++++++-
> =C2=A0drivers/mtd/maps/pismo.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 40 ++--------------------------
> =C2=A0include/linux/mtd/physmap.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A014 files changed, 28 insertions(+), 53 deletions(-)
>
> diff --git a/arch/arm/mach-at91/board-at572d940hf_ek.c b/arch/arm/mach-at=
91/board-at572d940hf_ek.c
> index 3929f1c..c139799 100644
> --- a/arch/arm/mach-at91/board-at572d940hf_ek.c
> +++ b/arch/arm/mach-at91/board-at572d940hf_ek.c
> @@ -134,14 +134,10 @@ static struct mtd_partition eb_nor_partitions[] =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> -static void nor_flash_set_vpp(struct map_info* mi, int i) {
> -};
> -
> =C2=A0static struct physmap_flash_data nor_flash_data =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 4=
,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.parts =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D e=
b_nor_partitions,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.nr_parts =C2=A0 =C2=A0 =C2=A0 =3D ARRAY_SIZE(=
eb_nor_partitions),
> - =C2=A0 =C2=A0 =C2=A0 .set_vpp =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D nor_flash_=
set_vpp,
> =C2=A0};
>
> =C2=A0static struct resource nor_flash_resources[] =3D {
> diff --git a/arch/arm/mach-integrator/integrator_ap.c b/arch/arm/mach-int=
egrator/integrator_ap.c
> index 11bd49e..2aa98ee 100644
> --- a/arch/arm/mach-integrator/integrator_ap.c
> +++ b/arch/arm/mach-integrator/integrator_ap.c
> @@ -263,7 +263,7 @@ static void ap_flash_exit(struct platform_device *dev=
)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0}
>
> -static void ap_flash_set_vpp(struct map_info *map, int on)
> +static void ap_flash_set_vpp(struct platform_device *pdev, int on)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *reg =3D on ? SC_CTRLS : SC_CTRLC=
;
>
> diff --git a/arch/arm/mach-integrator/integrator_cp.c b/arch/arm/mach-int=
egrator/integrator_cp.c
> index ec9628f..b676b41 100644
> --- a/arch/arm/mach-integrator/integrator_cp.c
> +++ b/arch/arm/mach-integrator/integrator_cp.c
> @@ -259,7 +259,7 @@ static void intcp_flash_exit(struct platform_device *=
dev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, INTCP_VA_CTRL_BASE + INTCP_FLASHPR=
OG);
> =C2=A0}
>
> -static void intcp_flash_set_vpp(struct map_info *map, int on)
> +static void intcp_flash_set_vpp(struct platform_device *pdev, int on)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;
>
> diff --git a/arch/arm/mach-omap1/flash.c b/arch/arm/mach-omap1/flash.c
> index acd1616..1749cb3 100644
> --- a/arch/arm/mach-omap1/flash.c
> +++ b/arch/arm/mach-omap1/flash.c
> @@ -13,7 +13,7 @@
> =C2=A0#include <plat/tc.h>
> =C2=A0#include <plat/flash.h>
>
> -void omap1_set_vpp(struct map_info *map, int enable)
> +void omap1_set_vpp(struct platform_device *pdev, int enable)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0static int count;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 l;
> diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
> index 9cdcca5..f941a49 100644
> --- a/arch/arm/mach-pxa/hx4700.c
> +++ b/arch/arm/mach-pxa/hx4700.c
> @@ -735,7 +735,7 @@ static struct platform_device bq24022 =3D {
> =C2=A0* StrataFlash
> =C2=A0*/
>
> -static void hx4700_set_vpp(struct map_info *map, int vpp)
> +static void hx4700_set_vpp(struct platform_device *pdev, int vpp)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio_set_value(GPIO91_HX4700_FLASH_VPEN, vpp);
> =C2=A0}
> diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
> index 9984ef7..e192057 100644
> --- a/arch/arm/mach-pxa/magician.c
> +++ b/arch/arm/mach-pxa/magician.c
> @@ -662,7 +662,7 @@ static struct pxaohci_platform_data magician_ohci_inf=
o =3D {
> =C2=A0* StrataFlash
> =C2=A0*/
>
> -static void magician_set_vpp(struct map_info *map, int vpp)
> +static void magician_set_vpp(struct platform_device *pdev, int vpp)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio_set_value(EGPIO_MAGICIAN_FLASH_VPP, vpp);
> =C2=A0}
> diff --git a/arch/arm/mach-realview/core.c b/arch/arm/mach-realview/core.=
c
> index d3f1dde..c8ec088 100644
> --- a/arch/arm/mach-realview/core.c
> +++ b/arch/arm/mach-realview/core.c
> @@ -77,7 +77,7 @@ void __init realview_adjust_zones(unsigned long *size, =
unsigned long *hole)
>
> =C2=A0#define REALVIEW_FLASHCTRL =C2=A0 =C2=A0(__io_address(REALVIEW_SYS_=
BASE) + REALVIEW_SYS_FLASH_OFFSET)
>
> -static void realview_flash_set_vpp(struct map_info *map, int on)
> +static void realview_flash_set_vpp(struct platform_device *pdev, int on)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;
>
> diff --git a/arch/arm/mach-s3c2410/nor-simtec.c b/arch/arm/mach-s3c2410/n=
or-simtec.c
> index 598d130..ad9f750 100644
> --- a/arch/arm/mach-s3c2410/nor-simtec.c
> +++ b/arch/arm/mach-s3c2410/nor-simtec.c
> @@ -32,7 +32,7 @@
>
> =C2=A0#include "nor-simtec.h"
>
> -static void simtec_nor_vpp(struct map_info *map, int vpp)
> +static void simtec_nor_vpp(struct platform_device *pdev, int vpp)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
> diff --git a/arch/arm/mach-versatile/core.c b/arch/arm/mach-versatile/cor=
e.c
> index 06f406a..335d825 100644
> --- a/arch/arm/mach-versatile/core.c
> +++ b/arch/arm/mach-versatile/core.c
> @@ -190,7 +190,7 @@ void __init versatile_map_io(void)
>
> =C2=A0#define VERSATILE_FLASHCTRL =C2=A0 =C2=A0(__io_address(VERSATILE_SY=
S_BASE) + VERSATILE_SYS_FLASH_OFFSET)
>
> -static void versatile_flash_set_vpp(struct map_info *map, int on)
> +static void versatile_flash_set_vpp(struct platform_device *pdev, int on=
)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;
>
> diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
> index e326815..f860314 100644
> --- a/arch/arm/mach-vexpress/v2m.c
> +++ b/arch/arm/mach-vexpress/v2m.c
> @@ -206,7 +206,7 @@ static struct platform_device v2m_usb_device =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.dev.platform_data =3D &v2m_usb_config,
> =C2=A0};
>
> -static void v2m_flash_set_vpp(struct map_info *map, int on)
> +static void v2m_flash_set_vpp(struct platform_device *pdev, int on)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(on !=3D 0, MMIO_P2V(V2M_SYS_FLASH));
> =C2=A0}
> diff --git a/arch/arm/plat-omap/include/plat/flash.h b/arch/arm/plat-omap=
/include/plat/flash.h
> index 3e63270..3083195 100644
> --- a/arch/arm/plat-omap/include/plat/flash.h
> +++ b/arch/arm/plat-omap/include/plat/flash.h
> @@ -11,6 +11,6 @@
>
> =C2=A0#include <linux/mtd/map.h>
>
> -extern void omap1_set_vpp(struct map_info *map, int enable);
> +extern void omap1_set_vpp(struct platform_device *pdev, int enable);
>
> =C2=A0#endif
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 49676b7..89fe8be 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -74,6 +74,18 @@ static int physmap_flash_remove(struct platform_device=
 *dev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> +static void physmap_set_vpp(struct map_info *map, int state)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev;
> + =C2=A0 =C2=A0 =C2=A0 struct physmap_flash_data *physmap_data;
> +
> + =C2=A0 =C2=A0 =C2=A0 pdev =3D (struct platform_device *)map->map_priv_1=
;
> + =C2=A0 =C2=A0 =C2=A0 physmap_data =3D pdev->dev.platform_data;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (physmap_data->set_vpp)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physmap_data->set_vpp(=
pdev, state);
> +}
> +
> =C2=A0static const char *rom_probe_types[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"cfi_prob=
e",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"jedec_pr=
obe",
> @@ -134,8 +146,9 @@ static int physmap_flash_probe(struct platform_device=
 *dev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map[i].phys =
=3D dev->resource[i].start;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map[i].size =
=3D resource_size(&dev->resource[i]);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map[i].bankw=
idth =3D physmap_data->width;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->map[i].set_vpp =
=3D physmap_data->set_vpp;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->map[i].set_vpp =
=3D physmap_set_vpp;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map[i].pfow_=
base =3D physmap_data->pfow_base;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->map[i].map_priv_=
1 =3D (unsigned long)dev;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map[i].virt =
=3D devm_ioremap(&dev->dev, info->map[i].phys,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 info->map[i].size);
> diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
> index f4ce273..65bd1cd 100644
> --- a/drivers/mtd/maps/pismo.c
> +++ b/drivers/mtd/maps/pismo.c
> @@ -50,39 +50,13 @@ struct pismo_data {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device =C2=A0*dev[PISMO_NUM_CS=
];
> =C2=A0};
>
> -/* FIXME: set_vpp could do with a better calling convention */
> -static struct pismo_data *vpp_pismo;
> -static DEFINE_MUTEX(pismo_mutex);
> -
> -static int pismo_setvpp_probe_fix(struct pismo_data *pismo)
> +static void pismo_set_vpp(struct platform_device *pdev, int on)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 mutex_lock(&pismo_mutex);
> - =C2=A0 =C2=A0 =C2=A0 if (vpp_pismo) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&pismo_mu=
tex);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(pismo);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;
> - =C2=A0 =C2=A0 =C2=A0 }
> - =C2=A0 =C2=A0 =C2=A0 vpp_pismo =3D pismo;
> - =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&pismo_mutex);
> - =C2=A0 =C2=A0 =C2=A0 return 0;
> -}
> -
> -static void pismo_setvpp_remove_fix(struct pismo_data *pismo)
> -{
> - =C2=A0 =C2=A0 =C2=A0 mutex_lock(&pismo_mutex);
> - =C2=A0 =C2=A0 =C2=A0 if (vpp_pismo =3D=3D pismo)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpp_pismo =3D NULL;
> - =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&pismo_mutex);
> -}
> -
> -static void pismo_set_vpp(struct map_info *map, int on)
> -{
> - =C2=A0 =C2=A0 =C2=A0 struct pismo_data *pismo =3D vpp_pismo;
> + =C2=A0 =C2=A0 =C2=A0 struct i2c_client *client =3D to_i2c_client(pdev->=
dev.parent);
> + =C2=A0 =C2=A0 =C2=A0 struct pismo_data *pismo =3D i2c_get_clientdata(cl=
ient);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pismo->vpp(pismo->vpp_data, on);
> =C2=A0}
> -/* end of hack */
> -
>
> =C2=A0static unsigned int __devinit pismo_width_to_bytes(unsigned int wid=
th)
> =C2=A0{
> @@ -231,9 +205,6 @@ static int __devexit pismo_remove(struct i2c_client *=
client)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < ARRAY_SIZE(pismo->dev); i++)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_un=
register(pismo->dev[i]);
>
> - =C2=A0 =C2=A0 =C2=A0 /* FIXME: set_vpp needs saner arguments */
> - =C2=A0 =C2=A0 =C2=A0 pismo_setvpp_remove_fix(pismo);
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(pismo);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> @@ -257,11 +228,6 @@ static int __devinit pismo_probe(struct i2c_client *=
client,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pismo)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;
>
> - =C2=A0 =C2=A0 =C2=A0 /* FIXME: set_vpp needs saner arguments */
> - =C2=A0 =C2=A0 =C2=A0 ret =3D pismo_setvpp_probe_fix(pismo);
> - =C2=A0 =C2=A0 =C2=A0 if (ret)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pismo->client =3D client;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pdata) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pismo->vpp =3D pda=
ta->set_vpp;
> diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
> index d37cca0..49b9590 100644
> --- a/include/linux/mtd/physmap.h
> +++ b/include/linux/mtd/physmap.h
> @@ -24,7 +24,7 @@ struct physmap_flash_data {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0width;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*init)(struct platform_device *);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*exit)(struct platform_device *);
> - =C2=A0 =C2=A0 =C2=A0 void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(*set_vpp)(struct map_info *, int);
> + =C2=A0 =C2=A0 =C2=A0 void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(*set_vpp)(struct platform_device *, int);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nr_parts;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pfow_base;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0*probe_type;
> --
> 1.7.0.4
>
>
>
