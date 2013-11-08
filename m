Received: from mail-db8lp0184.outbound.messaging.microsoft.com
 ([213.199.154.184] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vebiq-0000Zz-5k
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 02:22:57 +0000
Message-ID: <527C4BAA.40209@freescale.com>
Date: Fri, 8 Nov 2013 10:25:46 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Use devm_clk_get()
References: <1383870758-29777-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1383870758-29777-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA11=D4=C208=C8=D5 08:32, Fabio Estevam =D0=B4=B5=C0:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Using devm_clk_get() can make the code smaller and cleaner.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index 7ac2280..43d25ec 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -579,21 +579,6 @@ acquire_err:
>  	return -EINVAL;
>  }
> =20
> -static void gpmi_put_clks(struct gpmi_nand_data *this)
> -{
> -	struct resources *r =3D &this->resources;
> -	struct clk *clk;
> -	int i;
> -
> -	for (i =3D 0; i < GPMI_CLK_MAX; i++) {
> -		clk =3D r->clock[i];
> -		if (clk) {
> -			clk_put(clk);
> -			r->clock[i] =3D NULL;
> -		}
> -	}
> -}
> -
>  static char *extra_clks_for_mx6q[GPMI_CLK_MAX] =3D {
>  	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
>  };
> @@ -606,7 +591,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *thi=
s)
>  	int err, i;
> =20
>  	/* The main clock is stored in the first. */
> -	r->clock[0] =3D clk_get(this->dev, "gpmi_io");
> +	r->clock[0] =3D devm_clk_get(this->dev, "gpmi_io");
>  	if (IS_ERR(r->clock[0])) {
>  		err =3D PTR_ERR(r->clock[0]);
>  		goto err_clock;
> @@ -622,7 +607,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *thi=
s)
>  		if (extra_clks[i - 1] =3D=3D NULL)
>  			break;
> =20
> -		clk =3D clk_get(this->dev, extra_clks[i - 1]);
> +		clk =3D devm_clk_get(this->dev, extra_clks[i - 1]);
>  		if (IS_ERR(clk)) {
>  			err =3D PTR_ERR(clk);
>  			goto err_clock;
> @@ -644,7 +629,6 @@ static int gpmi_get_clks(struct gpmi_nand_data *thi=
s)
> =20
>  err_clock:
>  	dev_dbg(this->dev, "failed in finding the clocks.\n");
> -	gpmi_put_clks(this);
>  	return err;
>  }
> =20
> @@ -684,7 +668,6 @@ exit_regs:
> =20
>  static void release_resources(struct gpmi_nand_data *this)
>  {
> -	gpmi_put_clks(this);
>  	release_register_block(this);
>  	release_bch_irq(this);
>  	release_dma_channels(this);
I ever planed to do the gpmi-nand's clean-up myself.

Since you like to do it, i am happy too.

thanks.

Acked-by: Huang Shijie <b32955@freescale.com>
