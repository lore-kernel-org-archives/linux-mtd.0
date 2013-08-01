Received: from mail-db9lp0250.outbound.messaging.microsoft.com
 ([213.199.154.250] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4iK3-0003PL-OG
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2013 02:09:00 +0000
Message-ID: <51F9C432.2040808@freescale.com>
Date: Thu, 1 Aug 2013 10:13:06 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 05/25] mtd: nand: gpmi-nand: use more sensible error codes
 at various places
References: <1375279887-17928-1-git-send-email-LW@KARO-electronics.de>
 <1375279887-17928-3-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1375279887-17928-3-git-send-email-LW@KARO-electronics.de>
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
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index 4f7ec59..9a47189 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -355,7 +355,7 @@ static int acquire_register_block(struct gpmi_nand_=
data *this,
>   	r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, res_name);
>   	if (!r) {
>   		pr_err("Can't get resource for %s\n", res_name);
> -		return -ENXIO;
> +		return -ENODEV;
>   	}
>
>   	p =3D ioremap(r->start, resource_size(r));
> @@ -396,7 +396,7 @@ static int acquire_bch_irq(struct gpmi_nand_data *t=
his, irq_handler_t irq_h)
>   	r =3D platform_get_resource_byname(pdev, IORESOURCE_IRQ, res_name);
>   	if (!r) {
>   		pr_err("Can't get resource for %s\n", res_name);
> -		return -ENXIO;
> +		return -ENODEV;
>   	}
>
>   	err =3D request_irq(r->start, irq_h, 0, res_name, this);
> @@ -1597,7 +1597,7 @@ static int gpmi_nand_probe(struct platform_device=
 *pdev)
>   		pdev->id_entry =3D of_id->data;
>   	} else {
>   		pr_err("Failed to find the right device id.\n");
> -		return -ENOMEM;
> +		return -ENODEV;
>   	}
>
>   	this =3D kzalloc(sizeof(*this), GFP_KERNEL);
Acked-by: Huang Shijie <b32955@freescale.com>
