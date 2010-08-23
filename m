MIME-Version: 1.0
In-Reply-To: <AANLkTimyyofn9VJ4+ubgXMUMRVFkRC_HU+G2pKbO5aaX@mail.gmail.com>
References: <AANLkTimyyofn9VJ4+ubgXMUMRVFkRC_HU+G2pKbO5aaX@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 23 Aug 2010 16:17:13 +0800
Message-ID: <AANLkTik-0ZzBWvbuDhH9BLR0pT4faBUgu_DfhCJxAUxx@mail.gmail.com>
Subject: Re: [PATCH 2/5] pxa3xx_nand: condense the flash definition
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 18, 2010 at 10:36 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> From 42627ce6300cd731340ccb0d42a30218295369eb Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Tue, 17 Aug 2010 13:50:23 +0800
> Subject: [PATCH 2/5] pxa3xx_nand: condense the flash definition
>
> Adding a new flash definition would need less code.
> Keep the platform passing flash definition method.
> If one flash is both defined in platform data and builtin table,
> driver would select the one from platform data first.
>
> By this way, platform could select the timing most suit for itself,
> not need to follow the common settings.
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>

Acked-by: Eric Miao <eric.y.miao@gmail.com>

> ---
> =C2=A0arch/arm/plat-pxa/include/plat/pxa3xx_nand.h | =C2=A0 18 ++--
> =C2=A0drivers/mtd/nand/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A07 -
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0172 +++-----------------------
> =C2=A03 files changed, 25 insertions(+), 172 deletions(-)
>
> diff --git a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> index 3478eae..01a8448 100644
> --- a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> +++ b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
> @@ -30,15 +30,15 @@ struct pxa3xx_nand_cmdset {
> =C2=A0};
>
> =C2=A0struct pxa3xx_nand_flash {
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
> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0chip_id;
> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0page_per_block; /* Pages=
 per block (PG_PER_BLK) */
> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0page_size; =C2=A0 =C2=A0=
 =C2=A0/* Page size in bytes (PAGE_SZ) */
> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0flash_width; =C2=A0 =C2=
=A0/* Width of Flash memory (DWIDTH_M) */
> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0dfc_width; =C2=A0 =C2=A0=
 =C2=A0/* Width of flash controller(DWIDTH_C) */
> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0num_blocks; =C2=A0 =C2=
=A0 /* Number of physical blocks in Flash */
> +
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_cmdset *cmdset; =C2=A0 =C2=A0 =
=C2=A0/* NAND command set */
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_timing *timing; =C2=A0 =C2=A0 =
=C2=A0/* NAND Flash timing */
> =C2=A0};
>
> =C2=A0struct pxa3xx_nand_platform_data {
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 8b4b67c..a6f22f5 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -400,13 +400,6 @@ config MTD_NAND_PXA3xx
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
> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MACH_ARMCORE
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 4d89f37..0b63f9c 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -176,21 +176,7 @@ MODULE_PARM_DESC(use_dma, "enable DMA for data
> transfering to/from NAND HW");
> =C2=A0*/
> =C2=A0static struct pxa3xx_nand_timing default_timing;
> =C2=A0static struct pxa3xx_nand_flash default_flash;
> -
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
> +static struct pxa3xx_nand_cmdset default_cmdset =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.read1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x3000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.read2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x0050,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.program =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x1080=
,
> @@ -203,143 +189,23 @@ static struct pxa3xx_nand_cmdset largepage_cmdset =
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
> - =C2=A0 =C2=A0 =C2=A0 .tRH =C2=A0 =C2=A0=3D 30,
> - =C2=A0 =C2=A0 =C2=A0 .tRP =C2=A0 =C2=A0=3D 40,
> - =C2=A0 =C2=A0 =C2=A0 .tR =C2=A0 =C2=A0 =3D 11123,
> - =C2=A0 =C2=A0 =C2=A0 .tWHR =C2=A0 =3D 110,
> - =C2=A0 =C2=A0 =C2=A0 .tAR =C2=A0 =C2=A0=3D 10,
> -};
> -
> -static struct pxa3xx_nand_flash samsung512MbX16 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &samsung51=
2MbX16_timing,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &smallpage=
_cmdset,
> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 32,
> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 512,
> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 16,
> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 16,
> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 4096,
> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x46ec,
> -};
> -
> -static struct pxa3xx_nand_flash samsung2GbX8 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &samsung51=
2MbX16_timing,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &smallpage=
_cmdset,
> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 8,
> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 8,
> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 2048,
> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xdaec,
> -};
> -
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
> +static struct pxa3xx_nand_timing timing[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 { 10, =C2=A00, 20, 40, 30, 40, 11123, 110, 10, },
> + =C2=A0 =C2=A0 =C2=A0 { 10, 25, 15, 25, 15, 30, 25000, =C2=A060, 10, },
> + =C2=A0 =C2=A0 =C2=A0 { 10, 35, 15, 25, 15, 25, 25000, =C2=A060, 10, },
> =C2=A0};
>
> -static struct pxa3xx_nand_timing micron_timing =3D {
> - =C2=A0 =C2=A0 =C2=A0 .tCH =C2=A0 =C2=A0=3D 10,
> - =C2=A0 =C2=A0 =C2=A0 .tCS =C2=A0 =C2=A0=3D 25,
> - =C2=A0 =C2=A0 =C2=A0 .tWH =C2=A0 =C2=A0=3D 15,
> - =C2=A0 =C2=A0 =C2=A0 .tWP =C2=A0 =C2=A0=3D 25,
> - =C2=A0 =C2=A0 =C2=A0 .tRH =C2=A0 =C2=A0=3D 15,
> - =C2=A0 =C2=A0 =C2=A0 .tRP =C2=A0 =C2=A0=3D 30,
> - =C2=A0 =C2=A0 =C2=A0 .tR =C2=A0 =C2=A0 =3D 25000,
> - =C2=A0 =C2=A0 =C2=A0 .tWHR =C2=A0 =3D 60,
> - =C2=A0 =C2=A0 =C2=A0 .tAR =C2=A0 =C2=A0=3D 10,
> +static struct pxa3xx_nand_flash builtin_flash_types[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 { 0x46ec, =C2=A032, =C2=A0512, 16, 16, 4096, &defa=
ult_cmdset, &timing[0] },
> + =C2=A0 =C2=A0 =C2=A0 { 0xdaec, =C2=A064, 2048, =C2=A08, =C2=A08, 2048, =
&default_cmdset, &timing[0] },
> + =C2=A0 =C2=A0 =C2=A0 { 0xd7ec, 128, 4096, =C2=A08, =C2=A08, 8192, &defa=
ult_cmdset, &timing[0] },
> + =C2=A0 =C2=A0 =C2=A0 { 0xa12c, =C2=A064, 2048, =C2=A08, =C2=A08, 1024, =
&default_cmdset, &timing[1] },
> + =C2=A0 =C2=A0 =C2=A0 { 0xb12c, =C2=A064, 2048, 16, 16, 1024, &default_c=
mdset, &timing[1] },
> + =C2=A0 =C2=A0 =C2=A0 { 0xdc2c, =C2=A064, 2048, =C2=A08, =C2=A08, 4096, =
&default_cmdset, &timing[1] },
> + =C2=A0 =C2=A0 =C2=A0 { 0xcc2c, =C2=A064, 2048, 16, 16, 4096, &default_c=
mdset, &timing[1] },
> + =C2=A0 =C2=A0 =C2=A0 { 0xba20, =C2=A064, 2048, 16, 16, 2048, &default_c=
mdset, &timing[2] },
> =C2=A0};
>
> -static struct pxa3xx_nand_flash micron1GbX8 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &micron_ti=
ming,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepage=
_cmdset,
> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 8,
> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 8,
> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 1024,
> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xa12c,
> -};
> -
> -static struct pxa3xx_nand_flash micron1GbX16 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &micron_ti=
ming,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepage=
_cmdset,
> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 16,
> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 16,
> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 1024,
> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xb12c,
> -};
> -
> -static struct pxa3xx_nand_flash micron4GbX8 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &micron_ti=
ming,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepage=
_cmdset,
> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 8,
> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 8,
> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 4096,
> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xdc2c,
> -};
> -
> -static struct pxa3xx_nand_flash micron4GbX16 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &micron_ti=
ming,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepage=
_cmdset,
> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 16,
> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 16,
> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 4096,
> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xcc2c,
> -};
> -
> -static struct pxa3xx_nand_timing stm2GbX16_timing =3D {
> - =C2=A0 =C2=A0 =C2=A0 .tCH =3D 10,
> - =C2=A0 =C2=A0 =C2=A0 .tCS =3D 35,
> - =C2=A0 =C2=A0 =C2=A0 .tWH =3D 15,
> - =C2=A0 =C2=A0 =C2=A0 .tWP =3D 25,
> - =C2=A0 =C2=A0 =C2=A0 .tRH =3D 15,
> - =C2=A0 =C2=A0 =C2=A0 .tRP =3D 25,
> - =C2=A0 =C2=A0 =C2=A0 .tR =3D 25000,
> - =C2=A0 =C2=A0 =C2=A0 .tWHR =3D 60,
> - =C2=A0 =C2=A0 =C2=A0 .tAR =3D 10,
> -};
> -
> -static struct pxa3xx_nand_flash stm2GbX16 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .timing =3D &stm2GbX16_timing,
> - =C2=A0 =C2=A0 =C2=A0 .cmdset =3D &largepage_cmdset,
> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
> - =C2=A0 =C2=A0 =C2=A0 .page_size =3D 2048,
> - =C2=A0 =C2=A0 =C2=A0 .flash_width =3D 16,
> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =3D 16,
> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =3D 2048,
> - =C2=A0 =C2=A0 =C2=A0 .chip_id =3D 0xba20,
> -};
> -
> -static struct pxa3xx_nand_flash *builtin_flash_types[] =3D {
> - =C2=A0 =C2=A0 =C2=A0 &samsung512MbX16,
> - =C2=A0 =C2=A0 =C2=A0 &samsung2GbX8,
> - =C2=A0 =C2=A0 =C2=A0 &samsung32GbX8,
> - =C2=A0 =C2=A0 =C2=A0 &micron1GbX8,
> - =C2=A0 =C2=A0 =C2=A0 &micron1GbX16,
> - =C2=A0 =C2=A0 =C2=A0 &micron4GbX8,
> - =C2=A0 =C2=A0 =C2=A0 &micron4GbX16,
> - =C2=A0 =C2=A0 =C2=A0 &stm2GbX16,
> -};
> -#endif /* CONFIG_MTD_NAND_PXA3xx_BUILTIN */
> -
> =C2=A0#define NDTR0_tCH(c) =C2=A0 (min((c), 7) << 19)
> =C2=A0#define NDTR0_tCS(c) =C2=A0 (min((c), 7) << 16)
> =C2=A0#define NDTR0_tWH(c) =C2=A0 (min((c), 7) << 11)
> @@ -1027,11 +893,6 @@ static int pxa3xx_nand_detect_config(struct
> pxa3xx_nand_info *info)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default_flash.flash_width =3D ndcr & NDCR_DWID=
TH_M ? 16 : 8;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default_flash.dfc_width =3D ndcr & NDCR_DWIDTH=
_C ? 16 : 8;
>
> - =C2=A0 =C2=A0 =C2=A0 if (default_flash.page_size =3D=3D 2048)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_flash.cmdset =
=3D &largepage_cmdset;
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_flash.cmdset =
=3D &smallpage_cmdset;
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set info fields needed to __readid */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->flash_info =3D &default_flash;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (default_flash.page_si=
ze =3D=3D 2048) ? 4 : 2;
> @@ -1068,6 +929,7 @@ static int pxa3xx_nand_detect_config(struct
> pxa3xx_nand_info *info)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_detect_timing(info, &default_timin=
g);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default_flash.timing =3D &default_timing;
> + =C2=A0 =C2=A0 =C2=A0 default_flash.cmdset =3D &default_cmdset;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
> @@ -1096,10 +958,9 @@ static int pxa3xx_nand_detect_flash(struct
> pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> -#ifdef CONFIG_MTD_NAND_PXA3xx_BUILTIN
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < ARRAY_SIZE(builtin_flash_typ=
es); i++) {
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D builtin_flash_ty=
pes[i];
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_t=
ypes[i];
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pxa3xx_nand_co=
nfig_flash(info, f))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;
> @@ -1110,7 +971,6 @@ static int pxa3xx_nand_detect_flash(struct
> pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (id =3D=3D f->c=
hip_id)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -#endif
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&info->pdev->dev,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "failed to detect=
 configured nand flash; found %04x instead of\n",
> --
> 1.7.0.4
>
