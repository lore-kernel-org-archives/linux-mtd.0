Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL3Ix-0005v3-G4
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 02:42:54 +0000
Message-ID: <50723E5C.3020403@freescale.com>
Date: Mon, 8 Oct 2012 10:45:48 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] nand: gpmi-nand: Fix clock registration
References: <1348425062-17427-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1348425062-17427-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, artem.bityutskiy@linux.intel.com, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA09=D4=C224=C8=D5 02:31, Fabio Estevam =D0=B4=B5=C0:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> On a mx28 board the following error happens since commit 638064e56c=20
> (mtd: gpmi: change the code for clocks):
>
> gpmi-nand: probe of 8000c000.gpmi-nand failed with error -12
>
> Acquire the clock using "NULL" as it was done previously, so that the d=
river
> can register on mx23/mx28 as well.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index c46be6c..1f23cb4 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -492,7 +492,7 @@ static int __devinit gpmi_get_clks(struct gpmi_nand=
_data *this)
>  	int i;
> =20
>  	/* The main clock is stored in the first. */
> -	r->clock[0] =3D clk_get(this->dev, "gpmi_io");
> +	r->clock[0] =3D clk_get(this->dev, NULL);
Please do not change this line.

The gpmi_io is for mx6q.
If you replace it with `NULL`. The mx6q can not find the proper clock.

thanks
Huang Shijie
>  	if (IS_ERR(r->clock[0]))
>  		goto err_clock;
> =20
