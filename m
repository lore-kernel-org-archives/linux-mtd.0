MIME-Version: 1.0
In-Reply-To: <4C09F25E.8090908@gmail.com>
References: <4C09F25E.8090908@gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Sat, 5 Jun 2010 15:14:55 +0800
Message-ID: <AANLkTillJtAYn653DamU7_u3fmKt7rKGJtwfCHPPUVUF@mail.gmail.com>
Subject: Re: [PATCH 2/3] MTD/pxa: use __devinit for pxa2xx_flash_probe
To: Wan ZongShun <mcuos.com@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
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

2010/6/5 Wan ZongShun <mcuos.com@gmail.com>:
> This patch is to use the '__devinit' for pxa2xx_flash_probe.
>
>
> Signed-off-by :Wan ZongShun <mcuos.com@gmail.com>

Acked.

> ---
> =C2=A0drivers/mtd/maps/pxa2xx-flash.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-fl=
ash.c
> index 1d2583f..43f8bb8 100644
> --- a/drivers/mtd/maps/pxa2xx-flash.c
> +++ b/drivers/mtd/maps/pxa2xx-flash.c
> @@ -51,7 +51,7 @@ struct pxa2xx_flash_info {
> =C2=A0static const char *probes[] =3D { "RedBoot", "cmdlinepart", NULL };
>
>
> -static int __init pxa2xx_flash_probe(struct platform_device *pdev)
> +static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct flash_platform_data *flash =3D pdev->de=
v.platform_data;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa2xx_flash_info *info;
> --
> 1.6.3.3
>
