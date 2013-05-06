Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZGdm-0000MQ-0t
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 08:19:22 +0000
Message-ID: <518767E1.5020201@freescale.com>
Date: Mon, 6 May 2013 16:20:49 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH] mxs/gpmi-nand: fix error return from gpmi_get_clks()
References: <135ba9f94ed78b589a8576dc14f8b720d8425891.1367673436.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <135ba9f94ed78b589a8576dc14f8b720d8425891.1367673436.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Shawn Guo <shawn.guo@linaro.org>,
 linux-mtd@lists.infradead.org, Bill Pemberton <wfp5p@virginia.edu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8804=E6=97=A5 21:19, Micha=C5=82 Miros=C5=
=82aw =E5=86=99=E9=81=93:
> Signed-off-by: Micha=C5=82 Miros=C5=82aw<mirq-linux@rere.qmqm.pl>
> ---
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index 25ecfa1..1d18efc 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -473,12 +473,14 @@ static int gpmi_get_clks(struct gpmi_nand_data *t=
his)
>   	struct resources *r =3D&this->resources;
>   	char **extra_clks =3D NULL;
>   	struct clk *clk;
> -	int i;
> +	int err, i;
>
>   	/* The main clock is stored in the first. */
>   	r->clock[0] =3D clk_get(this->dev, "gpmi_io");
> -	if (IS_ERR(r->clock[0]))
> +	if (IS_ERR(r->clock[0])) {
> +		err =3D PTR_ERR(r->clock[0]);
>   		goto err_clock;
> +	}
>
>   	/* Get extra clocks */
>   	if (GPMI_IS_MX6Q(this))
> @@ -491,8 +493,10 @@ static int gpmi_get_clks(struct gpmi_nand_data *th=
is)
>   			break;
>
>   		clk =3D clk_get(this->dev, extra_clks[i - 1]);
> -		if (IS_ERR(clk))
> +		if (IS_ERR(clk)) {
> +			err =3D PTR_ERR(clk);
>   			goto err_clock;
> +		}
>
>   		r->clock[i] =3D clk;
>   	}
> @@ -511,7 +515,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *thi=
s)
>   err_clock:
>   	dev_dbg(this->dev, "failed in finding the clocks.\n");
>   	gpmi_put_clks(this);
> -	return -ENOMEM;
> +	return err;
>   }
>
>   static int acquire_resources(struct gpmi_nand_data *this)
Acked-by: Huang Shijie <b32955@freescale.com>
