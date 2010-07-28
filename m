MIME-Version: 1.0
In-Reply-To: <AANLkTim9fYeDqUBXXuuwiczNdtMobYStRWutLF6qyp6C@mail.gmail.com>
References: <AANLkTim9fYeDqUBXXuuwiczNdtMobYStRWutLF6qyp6C@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Wed, 28 Jul 2010 14:21:49 +0800
Message-ID: <AANLkTikjC3DgcUEGx7ceRN6ytHCqAeL8R3SAXRGiorM=@mail.gmail.com>
Subject: Re: [PATCH 03/29] pxa3xx_nand: introduce default timing to reduce
	read id times
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <david.woodhouse@intel.com>, Lei Wen <leiwen@marvell.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 28, 2010 at 1:56 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> From 3450c0a0a881b4b37776a3d22917aa7752bfd980 Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Tue, 22 Jun 2010 20:20:16 +0800
> Subject: [PATCH 03/29] pxa3xx_nand: introduce default timing to reduce
> read id times
>
> We certainly don't need to send read id command times by times, since
> we already know what the id is after the first read id...
>
> So create a default timing which could ensure it would successfully read
> id out all supported chip. Then follow the build-in table to reconfigure
> the timing.
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> ---
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 56 ++++++++++++++++++------=
---------------
> =C2=A01 files changed, 26 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 52cec28..b605147 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -190,15 +190,18 @@ static struct pxa3xx_nand_cmdset default_cmdset =3D=
 {
> =C2=A0};
>
> =C2=A0static struct pxa3xx_nand_timing __devinitdata timing[] =3D {
> - =C2=A0 =C2=A0 =C2=A0 { 10, =C2=A00, 20, 40, 30, 40, 11123, 110, 10, },
> - =C2=A0 =C2=A0 =C2=A0 { 10, 25, 15, 25, 15, 30, 25000, =C2=A060, 10, },
> - =C2=A0 =C2=A0 =C2=A0 { 10, 35, 15, 25, 15, 25, 25000, =C2=A060, 10, },
> + =C2=A0 =C2=A0 =C2=A0 { 40, 80, 60, 100, 80, 100, 90000, 400, 40, },
> + =C2=A0 =C2=A0 =C2=A0 { 10, =C2=A00, 20, =C2=A040, 30, =C2=A040, 11123, =
110, 10, },
> + =C2=A0 =C2=A0 =C2=A0 { 10, 25, 15, =C2=A025, 15, =C2=A030, 25000, =C2=
=A060, 10, },
> + =C2=A0 =C2=A0 =C2=A0 { 10, 35, 15, =C2=A025, 15, =C2=A025, 25000, =C2=
=A060, 10, },
> =C2=A0};
>
> -#define NAND_SETTING_SAMSUNG =C2=A0 =C2=A0 &default_cmdset, &timing[0]
> -#define NAND_SETTING_MICRON =C2=A0 =C2=A0 =C2=A0&default_cmdset, &timing=
[1]
> -#define NAND_SETTING_ST =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&default_cmdse=
t, &timing[2]
> +#define NAND_SETTING_DEFAULT =C2=A0 =C2=A0 &default_cmdset, &timing[0]
> +#define NAND_SETTING_SAMSUNG =C2=A0 =C2=A0 &default_cmdset, &timing[1]
> +#define NAND_SETTING_MICRON =C2=A0 =C2=A0 =C2=A0&default_cmdset, &timing=
[2]
> +#define NAND_SETTING_ST =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&default_cmdse=
t, &timing[3]
> =C2=A0static struct pxa3xx_nand_flash __devinitdata builtin_flash_types[]=
 =3D {
> + =C2=A0 =C2=A0 =C2=A0 { =C2=A0 =C2=A0 =C2=A00, =C2=A0 0, 2048, =C2=A08, =
=C2=A08, =C2=A0 =C2=A00, NAND_SETTING_DEFAULT, },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x46ec, =C2=A032, =C2=A0512, 16, 16, 4096, N=
AND_SETTING_SAMSUNG, },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0xdaec, =C2=A064, 2048, =C2=A08, =C2=A08, 20=
48, NAND_SETTING_SAMSUNG, },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0xd7ec, 128, 4096, =C2=A08, =C2=A08, 8192, N=
AND_SETTING_SAMSUNG, },
> @@ -948,36 +951,29 @@ static int pxa3xx_nand_detect_flash(struct
> pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pxa3xx_nand_de=
tect_config(info) =3D=3D 0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;
>
> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i<pdata->num_flash; ++i) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D pdata->flash + i=
;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pxa3xx_nand_config=
_flash(info, f))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__readid(info, &id=
))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id =3D=3D f->chip_=
id)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(builtin_flash_types);=
 i++) {
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_t=
ypes[i];
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pxa3xx_nand_config=
_flash(info, f))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__readid(info, &id=
))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id =3D=3D f->chip_=
id)
> + =C2=A0 =C2=A0 =C2=A0 /* we use default timing to detect id */
> + =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_types[0];

This is not intuitive when referencing an array item, probably define a
macro for this:

#define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])

right after the builtin_flash_types array, with comment to explain
that this only works when probing/detecting.

> + =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_config_flash(info, f);
> + =C2=A0 =C2=A0 =C2=A0 if (__readid(info, &id))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_detect;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i=3D0; i<ARRAY_SIZE(builtin_flash_types) + pd=
ata->num_flash - 1; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we first choose the=
 flash definition from platfrom */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i < pdata->num_fla=
sh)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 f =3D pdata->flash + i;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 f =3D &builtin_flash_types[i - pdata->num_flash + 1];

Or

f =3D (i < pdata->num_flash) ? ...

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f->chip_id =3D=3D =
id) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dev_info(&info->pdev->dev, "detect chip id: 0x%x\n", id);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pxa3xx_nand_config_flash(info, f);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&info->pdev->dev,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "failed to detect=
 configured nand flash; found %04x instead of\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id);
> +fail_detect:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
> =C2=A0}
>
> --
> 1.7.0.4
>

Otherwise looks good to me.
