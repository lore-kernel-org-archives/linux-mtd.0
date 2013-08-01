Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4iJ6-0003Ng-I4
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2013 02:08:01 +0000
Message-ID: <51F9C3FD.4080302@freescale.com>
Date: Thu, 1 Aug 2013 10:12:13 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 03/25] mtd: nand: gpmi-nand: let the driver core handle
 pinctrl
References: <1375279887-17928-1-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1375279887-17928-1-git-send-email-LW@KARO-electronics.de>
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
> without this patch the driver fails to load with -EBUSY.
>
> Signed-off-by: Lothar Wa=C3=9Fmann<LW@KARO-electronics.de>
> ---
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    8 --------
>   1 files changed, 0 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index b741a6c..f557a1d 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -520,7 +520,6 @@ err_clock:
>
>   static int acquire_resources(struct gpmi_nand_data *this)
>   {
> -	struct pinctrl *pinctrl;
>   	int ret;
>
>   	ret =3D acquire_register_block(this, GPMI_NAND_GPMI_REGS_ADDR_RES_NA=
ME);
> @@ -539,19 +538,12 @@ static int acquire_resources(struct gpmi_nand_dat=
a *this)
>   	if (ret)
>   		goto exit_dma_channels;
>
> -	pinctrl =3D devm_pinctrl_get_select_default(&this->pdev->dev);
> -	if (IS_ERR(pinctrl)) {
> -		ret =3D PTR_ERR(pinctrl);
> -		goto exit_pin;
> -	}
> -
>   	ret =3D gpmi_get_clks(this);
>   	if (ret)
>   		goto exit_clock;
>   	return 0;
>
>   exit_clock:
> -exit_pin:
>   	release_dma_channels(this);
>   exit_dma_channels:
>   	release_bch_irq(this);

The similar patches have been sent for several times.
So this is a duplicated patch.

thanks
Huang Shijie
