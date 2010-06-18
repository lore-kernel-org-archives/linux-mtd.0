MIME-Version: 1.0
In-Reply-To: <AANLkTil1FnPkGS7l6W0HWeXyOxXzWbZkvFWY4jJF_I_A@mail.gmail.com>
References: <AANLkTil1FnPkGS7l6W0HWeXyOxXzWbZkvFWY4jJF_I_A@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Fri, 18 Jun 2010 14:23:02 +0800
Message-ID: <AANLkTinOsQ8AcH-As91CRqrEQVnXdsm_CmFQgyj7gI1_@mail.gmail.com>
Subject: Re: [PATCH 01/25] pxa3xx_nand: condense the flash definition
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <david.woodhouse@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 18, 2010 at 1:32 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> From 76684334fbf214ab164ed07791b02535a3f04779 Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Sat, 20 Mar 2010 19:01:23 +0800
> Subject: [PATCH 01/25] pxa3xx_nand: condense the flash definition
>
> Adding a new flash definition would need less code.
> Keep the platform passing flash defition method.
                                  ^^^^^^^^ definition?
> If one flash is both defined in platform data and builtin table,
> driver would select the one from platform data first.

This makes sense. I thin the CONFIG_MTD_NAND_PXA3xx_BUILTIN is introduced
as an optimization so to reduce the code size if platform flash definition
is provided, instead of an option to remove built-in definitions.

>
> By this way, platform could select the timing most suit for itself,
                                                     ^^^^ suitable
> not need to follow the common settings.
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>

// there are some line wrapped though, maybe it's my gmail fault.

> ---
> =C2=A0arch/arm/plat-pxa/include/plat/pxa3xx_nand.h | =C2=A0 37 ----
> =C2=A0drivers/mtd/nand/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A07 -
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0241 +++++++-------------------
> =C2=A03 files changed, 66 insertions(+), 219 deletions(-)
>
> diff --git a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> index 3478eae..7e5a28f 100644
> --- a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> +++ b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> @@ -4,43 +4,6 @@
> =C2=A0#include <linux/mtd/mtd.h>
> =C2=A0#include <linux/mtd/partitions.h>
>
> -struct pxa3xx_nand_timing {
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tCH; =C2=A0/* Enable sig=
nal hold time */
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tCS; =C2=A0/* Enable sig=
nal setup time */
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWH; =C2=A0/* ND_nWE hig=
h duration */
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWP; =C2=A0/* ND_nWE pul=
se time */
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tRH; =C2=A0/* ND_nRE hig=
h duration */
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tRP; =C2=A0/* ND_nRE pul=
se width */
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tR; =C2=A0 /* ND_nWE hig=
h to ND_nRE low for read */
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWHR; /* ND_nWE high to =
ND_nRE low for status read */
> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tAR; =C2=A0/* ND_ALE low=
 to ND_nRE low delay */
> -};
> -
> -struct pxa3xx_nand_cmdset {
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read1;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read2;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0program;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read_status;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read_id;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0erase;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0reset;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0lock;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock;
> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0lock_status;
> -};
> -
> -struct pxa3xx_nand_flash {
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_timing *timing; /* NAND F=
lash timing */
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset;
> -
> - =C2=A0 =C2=A0 =C2=A0 uint32_t page_per_block;/* Pages per block (PG_PER=
_BLK) */
> - =C2=A0 =C2=A0 =C2=A0 uint32_t page_size; =C2=A0 =C2=A0 /* Page size in =
bytes (PAGE_SZ) */
> - =C2=A0 =C2=A0 =C2=A0 uint32_t flash_width; =C2=A0 /* Width of Flash mem=
ory (DWIDTH_M) */
> - =C2=A0 =C2=A0 =C2=A0 uint32_t dfc_width; =C2=A0 =C2=A0 /* Width of flas=
h controller(DWIDTH_C) */
> - =C2=A0 =C2=A0 =C2=A0 uint32_t num_blocks; =C2=A0 =C2=A0/* Number of phy=
sical blocks in Flash */
> - =C2=A0 =C2=A0 =C2=A0 uint32_t chip_id;
> -};
> -

So does this prevent board code from defining their own timing and etc?

> =C2=A0struct pxa3xx_nand_platform_data {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the data flash bus is shared between the St=
atic Memory
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 98a04b3..9a35d92 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -399,13 +399,6 @@ config MTD_NAND_PXA3xx
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This enables the driver for the NAND fl=
ash device found on
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PXA3xx processors
>
> -config MTD_NAND_PXA3xx_BUILTIN
> - =C2=A0 =C2=A0 =C2=A0 bool "Use builtin definitions for some NAND chips =
(deprecated)"
> - =C2=A0 =C2=A0 =C2=A0 depends on MTD_NAND_PXA3xx
> - =C2=A0 =C2=A0 =C2=A0 help
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 This enables builtin definitions for some N=
AND chips. This
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 is deprecated in favor of platform specific=
 data.
> -
> =C2=A0config MTD_NAND_CM_X270
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Support for NAND Flash on CM-X270 mo=
dules"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MTD_NAND && MACH_ARMCORE
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index e02fa4f..013e075 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c

... snipped ...

> =C2=A0static struct pxa3xx_nand_timing default_timing;
> =C2=A0static struct pxa3xx_nand_flash default_flash;
>
> -static struct pxa3xx_nand_cmdset smallpage_cmdset =3D {
> - =C2=A0 =C2=A0 =C2=A0 .read1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x000=
0,
> - =C2=A0 =C2=A0 =C2=A0 .read2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x005=
0,
> - =C2=A0 =C2=A0 =C2=A0 .program =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x1080,
> - =C2=A0 =C2=A0 =C2=A0 .read_status =C2=A0 =C2=A0=3D 0x0070,
> - =C2=A0 =C2=A0 =C2=A0 .read_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0090,
> - =C2=A0 =C2=A0 =C2=A0 .erase =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xD06=
0,
> - =C2=A0 =C2=A0 =C2=A0 .reset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x00F=
F,
> - =C2=A0 =C2=A0 =C2=A0 .lock =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x002=
A,
> - =C2=A0 =C2=A0 =C2=A0 .unlock =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x2423,
> - =C2=A0 =C2=A0 =C2=A0 .lock_status =C2=A0 =C2=A0=3D 0x007A,
> -};
> -
> -static struct pxa3xx_nand_cmdset largepage_cmdset =3D {
> +const static struct pxa3xx_nand_cmdset cmdset =3D {

So how to handle the difference of command set between smallpage and
largepage?

> =C2=A0 =C2=A0 =C2=A0 =C2=A0.read1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x3000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.read2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x0050,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.program =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x1080=
,
> @@ -203,143 +225,26 @@ static struct pxa3xx_nand_cmdset largepage_cmdset =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.lock_status =C2=A0 =C2=A0=3D 0x007A,
> =C2=A0};
>
> -#ifdef CONFIG_MTD_NAND_PXA3xx_BUILTIN
> -static struct pxa3xx_nand_timing samsung512MbX16_timing =3D {
> - =C2=A0 =C2=A0 =C2=A0 .tCH =C2=A0 =C2=A0=3D 10,
> - =C2=A0 =C2=A0 =C2=A0 .tCS =C2=A0 =C2=A0=3D 0,
> - =C2=A0 =C2=A0 =C2=A0 .tWH =C2=A0 =C2=A0=3D 20,
> - =C2=A0 =C2=A0 =C2=A0 .tWP =C2=A0 =C2=A0=3D 40,

...

> +static struct pxa3xx_nand_timing __devinitdata timing[] =3D {

Better with some comment columns like below:

  /*	    tCH tCS tWH tWP ... */
> + =C2=A0 =C2=A0 =C2=A0 /* Samsung NAND series */
> + =C2=A0 =C2=A0 =C2=A0 { 10, =C2=A00, 20, 40, 30, 40, 11123, 110, 10, },
> + =C2=A0 =C2=A0 =C2=A0 /* Micron NAND series */
> + =C2=A0 =C2=A0 =C2=A0 { 10, 25, 15, 25, 15, 30, 25000, =C2=A060, 10, },
> + =C2=A0 =C2=A0 =C2=A0 /* ST NAND series */
> + =C2=A0 =C2=A0 =C2=A0 { 10, 35, 15, 25, 15, 25, 25000, =C2=A060, 10, },

Now define something like

#define NAND_TIMING_SAMSUNG	(&timing[0])
#define NAND_TIMING_MICRON	(&timing[1])
#define NAND_TIMING_ST		(&timing[2])

> =C2=A0};
>
> -static struct pxa3xx_nand_flash samsung32GbX8 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &samsung51=
2MbX16_timing,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &smallpage=
_cmdset,
> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 128,
> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 4096,
> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 8,
> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 8,
> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 8192,
> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xd7ec,
> +static struct pxa3xx_nand_flash __devinitdata builtin_flash_types[] =3D =
{

/*	  Chip ID, page per block, page size, flash width, .... */

> + =C2=A0 =C2=A0 =C2=A0 { 0x46ec, =C2=A032, =C2=A0512, 16, 16, 4096, &timi=
ng[0], },
> + =C2=A0 =C2=A0 =C2=A0 { 0xdaec, =C2=A064, 2048, =C2=A08, =C2=A08, 2048, =
&timing[0], },
> + =C2=A0 =C2=A0 =C2=A0 { 0xd7ec, 128, 4096, =C2=A08, =C2=A08, 8192, &timi=
ng[0], },
> + =C2=A0 =C2=A0 =C2=A0 { 0xa12c, =C2=A064, 2048, =C2=A08, =C2=A08, 1024, =
&timing[1], },
> + =C2=A0 =C2=A0 =C2=A0 { 0xb12c, =C2=A064, 2048, 16, 16, 1024, &timing[1]=
, },
> + =C2=A0 =C2=A0 =C2=A0 { 0xdc2c, =C2=A064, 2048, =C2=A08, =C2=A08, 4096, =
&timing[1], },
> + =C2=A0 =C2=A0 =C2=A0 { 0xcc2c, =C2=A064, 2048, 16, 16, 4096, &timing[1]=
, },
> + =C2=A0 =C2=A0 =C2=A0 { 0xba20, =C2=A064, 2048, 16, 16, 2048, &timing[2]=
, },
> =C2=A0};

BTW, I like the array above very much.

>
> -static struct pxa3xx_nand_timing micron_timing =3D {
> - =C2=A0 =C2=A0 =C2=A0 .tCH =C2=A0 =C2=A0=3D 10,
> - =C2=A0 =C2=A0 =C2=A0 .tCS =C2=A0 =C2=A0=3D 25,
> - =C2=A0 =C2=A0 =C2=A0 .tWH =C2=A0 =C2=A0=3D 15,
> - =C2=A0 =C2=A0 =C2=A0 .tWP =C2=A0 =C2=A0=3D 25,
> - =C2=A0 =C2=A0 =C2=A0 .tRH =C2=A0 =C2=A0=3D 15,
> - =C2=A0 =C2=A0 =C2=A0 .tRP =C2=A0 =C2=A0=3D 30,
> - =C2=A0 =C2=A0 =C2=A0 .tR =C2=A0 =C2=A0 =3D 25000,

... snipped ...

> -};
> -#endif /* CONFIG_MTD_NAND_PXA3xx_BUILTIN */
> -
> =C2=A0#define NDTR0_tCH(c) =C2=A0 (min((c), 7) << 19)
> =C2=A0#define NDTR0_tCS(c) =C2=A0 (min((c), 7) << 16)
> =C2=A0#define NDTR0_tWH(c) =C2=A0 (min((c), 7) << 11)
> @@ -412,7 +317,6 @@ static int prepare_read_prog_cmd(struct
> pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint16_t cmd, int column, int page_addr)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct pxa3xx_nand_flash *f =3D info->fl=
ash_info;
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D f->cmd=
set;

I think it's better to keep a local pointer. Reference within a function
to a global structure is always a bad idea, one day you will find you've
to modify all these references again when you add a new cmdset.

And most of the modifications below can thus be removed and patch simplifie=
d.
