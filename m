Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4iMN-0003SQ-Gd
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2013 02:11:24 +0000
Message-ID: <51F9C4C2.8040403@freescale.com>
Date: Thu, 1 Aug 2013 10:15:30 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 04/25] mtd: nand: gpmi-nand: janitorial cleanup: (commas
 after last element of struct initializer)
References: <1375279887-17928-1-git-send-email-LW@KARO-electronics.de>
 <1375279887-17928-2-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1375279887-17928-2-git-send-email-LW@KARO-electronics.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B407=E6=9C=8831=E6=97=A5 22:11, Lothar Wa=C3=9Fmann =
=E5=86=99=E9=81=93:
> Signed-off-by: Lothar Wa=C3=9Fmann<LW@KARO-electronics.de>
> ---
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index f557a1d..4f7ec59 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1569,19 +1569,19 @@ static const struct platform_device_id gpmi_ids=
[] =3D {
>   	{ .name =3D "imx23-gpmi-nand", .driver_data =3D IS_MX23, },
>   	{ .name =3D "imx28-gpmi-nand", .driver_data =3D IS_MX28, },
>   	{ .name =3D "imx6q-gpmi-nand", .driver_data =3D IS_MX6Q, },
> -	{},
> +	{}
>   };
>
>   static const struct of_device_id gpmi_nand_id_table[] =3D {
>   	{
>   		.compatible =3D "fsl,imx23-gpmi-nand",
> -		.data =3D (void *)&gpmi_ids[IS_MX23]
> +		.data =3D (void *)&gpmi_ids[IS_MX23],
>   	}, {
>   		.compatible =3D "fsl,imx28-gpmi-nand",
> -		.data =3D (void *)&gpmi_ids[IS_MX28]
> +		.data =3D (void *)&gpmi_ids[IS_MX28],
>   	}, {
>   		.compatible =3D "fsl,imx6q-gpmi-nand",
> -		.data =3D (void *)&gpmi_ids[IS_MX6Q]
> +		.data =3D (void *)&gpmi_ids[IS_MX6Q],
>   	}, {}
>   };
>   MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
is it any bad influence if we do not apply this patch?

I am not clear what we can benefit from this patch.

thanks
Huang Shijie
