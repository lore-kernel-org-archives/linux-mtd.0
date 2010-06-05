MIME-Version: 1.0
In-Reply-To: <4C09F359.1000100@gmail.com>
References: <4C09F359.1000100@gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Sat, 5 Jun 2010 15:15:12 +0800
Message-ID: <AANLkTilaptn-GhkoNC-CWLNP4XsTY7v-QCAypsF_BeKo@mail.gmail.com>
Subject: Re: [PATCH 3/3] MTD/pxa: use resource_size(res) for pxa2xx-flash
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
> The size calculation is end - start + 1. But,sometimes, the '1' can
> be forgotten carelessly, witch will have potential risk, so use resource_=
size
> should be good habit.
>
> Signed-off-by :Wan ZongShun <mcuos.com@gmail.com>

Acked.

>
> ---
> =C2=A0drivers/mtd/maps/pxa2xx-flash.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-fl=
ash.c
> index 43f8bb8..6ed9a2d 100644
> --- a/drivers/mtd/maps/pxa2xx-flash.c
> +++ b/drivers/mtd/maps/pxa2xx-flash.c
> @@ -79,7 +79,7 @@ static int __devinit pxa2xx_flash_probe(struct platform=
_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map.name =3D (char *) flash->name;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map.bankwidth =3D flash->width;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map.phys =3D res->start;
> - =C2=A0 =C2=A0 =C2=A0 info->map.size =3D res->end - res->start + 1;
> + =C2=A0 =C2=A0 =C2=A0 info->map.size =3D resource_size(res);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->parts =3D flash->parts;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->nr_parts =3D flash->nr_parts;
>
> --
> 1.6.3.3
>
