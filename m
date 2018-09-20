Received: from mail-eopbgr50066.outbound.protection.outlook.com ([40.107.5.66]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2wF9-0003Lt-3T
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 10:31:33 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Mark Brown
 <broonie@kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
CC: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: RE: [PATCH 3/3] spi: spi-mem: Add extra sanity checks on the op param
Date: Thu, 20 Sep 2018 10:31:16 +0000
Message-ID: <VI1PR04MB1038A9979C770938CE7C36B999130@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <20180920073112.7897-1-boris.brezillon@bootlin.com>
 <20180920073112.7897-4-boris.brezillon@bootlin.com>
In-Reply-To: <20180920073112.7897-4-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf =
Of
> Boris Brezillon
> Sent: Thursday, September 20, 2018 1:01 PM
> To: Mark Brown <broonie@kernel.org>; linux-spi@vger.kernel.org
> Cc: Marek Vasut <marek.vasut@gmail.com>; Richard Weinberger
> <richard@nod.at>; Boris Brezillon <boris.brezillon@bootlin.com>; linux-
> mtd@lists.infradead.org; Brian Norris <computersforpeace@gmail.com>; Davi=
d
> Woodhouse <dwmw2@infradead.org>
> Subject: [PATCH 3/3] spi: spi-mem: Add extra sanity checks on the op para=
m
>=20
> Some combinations are simply not valid and should be rejected before the =
op is
> passed to the SPI controller driver.
>=20
> Add an spi_mem_check_op() helper and use it in spi_mem_exec_op() and
> spi_mem_supports_op() to make sure the spi-mem operation is valid.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/spi/spi-mem.c | 54
> +++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c index
> eb72dba71d83..cc3d425aae56 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -12,6 +12,8 @@
>=20
>  #include "internals.h"
>=20
> +#define SPI_MEM_MAX_BUSWIDTH		4
> +
>  /**
>   * spi_controller_dma_map_mem_op_data() - DMA-map the buffer attached to
> a
>   *					  memory operation
> @@ -149,6 +151,44 @@ static bool spi_mem_default_supports_op(struct
> spi_mem *mem,  }  EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
>=20
> +static bool spi_mem_buswidth_is_valid(u8 buswidth) {
> +	if (hweight8(buswidth) > 1 || buswidth > SPI_MEM_MAX_BUSWIDTH)

Isn't check for lower limit should be '< 1'?

--
Regards
Yogesh Gaur

> +		return false;
> +
> +	return true;
> +}
> +
> +static int spi_mem_check_op(const struct spi_mem_op *op) {
> +	if (!op->cmd.buswidth)
> +		return -EINVAL;
> +
> +	if ((op->addr.nbytes && !op->addr.buswidth) ||
> +	    (op->dummy.nbytes && !op->dummy.buswidth) ||
> +	    (op->data.nbytes && !op->data.buswidth))
> +		return -EINVAL;
> +
> +	if (spi_mem_buswidth_is_valid(op->cmd.buswidth) ||
> +	    spi_mem_buswidth_is_valid(op->addr.buswidth) ||
> +	    spi_mem_buswidth_is_valid(op->dummy.buswidth) ||
> +	    spi_mem_buswidth_is_valid(op->data.buswidth))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static bool spi_mem_internal_supports_op(struct spi_mem *mem,
> +					 const struct spi_mem_op *op)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +
> +	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)
> +		return ctlr->mem_ops->supports_op(mem, op);
> +
> +	return spi_mem_default_supports_op(mem, op); }
> +
>  /**
>   * spi_mem_supports_op() - Check if a memory device and the controller i=
t is
>   *			   connected to support a specific memory operation
> @@ -166,12 +206,10 @@
> EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
>   */
>  bool spi_mem_supports_op(struct spi_mem *mem, const struct spi_mem_op
> *op)  {
> -	struct spi_controller *ctlr =3D mem->spi->controller;
> -
> -	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)
> -		return ctlr->mem_ops->supports_op(mem, op);
> +	if (spi_mem_check_op(op))
> +		return false;
>=20
> -	return spi_mem_default_supports_op(mem, op);
> +	return spi_mem_internal_supports_op(mem, op);
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_supports_op);
>=20
> @@ -196,7 +234,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const
> struct spi_mem_op *op)
>  	u8 *tmpbuf;
>  	int ret;
>=20
> -	if (!spi_mem_supports_op(mem, op))
> +	ret =3D spi_mem_check_op(op);
> +	if (ret)
> +		return ret;
> +
> +	if (!spi_mem_internal_supports_op(mem, op))
>  		return -ENOTSUPP;
>=20
>  	if (ctlr->mem_ops) {
> --
> 2.14.1
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists=
.infr
> adead.org%2Fmailman%2Flistinfo%2Flinux-
> mtd%2F&amp;data=3D02%7C01%7Cyogeshnarayan.gaur%40nxp.com%7C3593fc7
> 7e9d44b5b7a6e08d61ecb6c1c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> 7C0%7C636730256384380635&amp;sdata=3DlTp45z8K1WFhI0LA7Nxca2p8pdHsQL
> gXNFC1GJIi1NM%3D&amp;reserved=3D0
