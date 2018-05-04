Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEXHQ-00077c-Nt
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 09:45:34 +0000
Date: Fri, 4 May 2018 11:45:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: rawnand: fsmc: Make sure we wait tWB before
 polling the STATUS reg
Message-ID: <20180504114510.4ea1e2f2@xps13>
In-Reply-To: <20180503074544.19938-1-boris.brezillon@bootlin.com>
References: <20180503074544.19938-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Thu,  3 May 2018 09:45:44 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> NAND chips require a bit of time to take the NAND operation into account
> and set the BUSY bit in the STATUS reg. Make sure we don't poll the
> STATUS reg too early.
>=20
> Fixes: 4da712e70294 ("mtd: nand: fsmc: use ->exec_op()")
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/fsmc_nand.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc=
_nand.c
> index 28c48dcc514e..0960665858b7 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -18,6 +18,7 @@
> =20
>  #include <linux/clk.h>
>  #include <linux/completion.h>
> +#include <linux/delay.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>
> @@ -695,6 +696,13 @@ static int fsmc_exec_op(struct nand_chip *chip, cons=
t struct nand_operation *op,
>  			pr_debug("  ->WAITRDY  [max %d ms]\n",
>  				 instr->ctx.waitrdy.timeout_ms);
> =20
> +			/*
> +			 * Make sure we wait tWB before polling the STATUS
> +			 * register.
> +			 */
> +			if (op_id && op->instrs[op_id - 1].delay_ns)
> +				ndelay(op->instrs[op_id - 1].delay_ns);
> +
>  			ret =3D nand_soft_waitrdy(chip,
>  						instr->ctx.waitrdy.timeout_ms);
>  			break;

I'm afraid that we encounter this exact same issue with all the drivers
using nand_soft_waitrdy() whenever the controller does not already
wait for tWB. Could we force a tWB_max delay directly inside
nand_soft_waitrdy()?

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
