Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E687C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzhGhO7Hgl/ymnomDK5nWSqIh32NKCt6c1aXl7gwEpw=; b=rBLrvoy5q5dWwz
	b1YJAuaLKufg1rxFe6Smb2wilWQ8Hr8+kp/TrB+I9nPSTgbkJWhNJYpH8FHp8Y7qQvoGlcqsgOLRl
	xDXDaVypaJyc5Jkl1SFdmTKU/pztb5XqQnai3i0dkMKxoBPQCbgXRxPBTAbtw5Jv1A6coZK9PhI6+
	z8hvUvRo6gkVcwGFq72YJH6AEy0BgeRSkOhhhj0v2nKDdPogRo9MMZi6WxOzpHsdMveTaPSPoAKAW
	X93eISbqwaF9RSncwmPUoQWg+YawLdbFFYOFD0P1XoztJLQ3DwmlJFC47f6SdW31N72ExEEx8ThAl
	s4h5Un/H3BUL11LH83hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZeGn-00HMGn-A0; Wed, 30 Mar 2022 19:46:17 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZeGj-00HMGH-Uf; Wed, 30 Mar 2022 19:46:15 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UJjoND084456;
 Wed, 30 Mar 2022 14:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648669550;
 bh=7BZJswZpinoSi+llRpQFg4O5kYc5qsNk6rlACahA5Pw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=lq2WPqHRurspXI3AN0UUGyrNPfg23mskrg++iURzy+GNPlSxBRrO42JAy5Gu1wcPi
 yqh7jzg5e96D5XdqX6Fv/YsL2As2NnJvtLPsSif8V8hPELpjGf+rRU7C0+nTPcmyfv
 pHVRw/mJO20E5ZtpsTDCoK+ONX6+FHB0XRpRk2kk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UJjoLR019064
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Mar 2022 14:45:50 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 14:45:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 14:45:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UJjnvL004221;
 Wed, 30 Mar 2022 14:45:49 -0500
Date: Thu, 31 Mar 2022 01:15:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH v4 04/11] spi: aspeed: Add support for direct mapping
Message-ID: <20220330194548.zldbkaoctlhgwcl2@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-5-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220325100849.2019209-5-clg@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_124614_100676_09E7D410 
X-CRM114-Status: GOOD (  31.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 25/03/22 11:08AM, C=E9dric Le Goater wrote:
> Use direct mapping to read the flash device contents. This operation
> mode is called "Command mode" on Aspeed SoC SMC controllers. It uses a
> Control Register for the settings to apply when a memory operation is
> performed on the flash device mapping window.
> =

> If the window is not big enough, fall back to the "User mode" to
> perform the read.
> =

> Since direct mapping now handles all reads of the flash device
> contents, also use memcpy_fromio for other address spaces, such as
> SFDP.
> =

> Direct mapping for writes will come later when validated.
> =

> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Tao Ren <rentao.bupt@gmail.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 67 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 997ec2e45118..0951766baef4 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -322,8 +322,8 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem,=
 const struct spi_mem_op *o
>  		if (!op->addr.nbytes)
>  			ret =3D aspeed_spi_read_reg(chip, op);
>  		else
> -			ret =3D aspeed_spi_read_user(chip, op, op->addr.val,
> -						   op->data.nbytes, op->data.buf.in);
> +			memcpy_fromio(op->data.buf.in, chip->ahb_base + op->addr.val,
> +				      op->data.nbytes);

I think I commented on this earlier too, though I failed to respond to =

your reply. Let me bring the topic back up. I think this can cause an =

invalid memory address to be accessed. Not all SPI MEM consumers will =

use dirmap APIs, and they won't use them all the time. For example, SPI =

NOR can perform some operations to reset the flash before shutting down. =

For example, SPI NOR turns off 4byte address mode during shutdown. This =

will be a register read/write operation, which usually has a different =

opcode.

So I think you should keep dirmap and exec_op() independent of each =

other.

>  	} else {
>  		if (!op->addr.nbytes)
>  			ret =3D aspeed_spi_write_reg(chip, op);
> @@ -403,10 +403,73 @@ static int aspeed_spi_chip_set_default_window(struc=
t aspeed_spi_chip *chip)
>  	return chip->ahb_window_size ? 0 : -1;
>  }
>  =

> +static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
> +{
> +	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->spi->=
master);
> +	struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chip_sele=
ct];
> +	struct spi_mem_op *op =3D &desc->info.op_tmpl;
> +	u32 ctl_val;
> +	int ret =3D 0;
> +
> +	chip->clk_freq =3D desc->mem->spi->max_speed_hz;
> +
> +	/* Only for reads */
> +	if (op->data.dir !=3D SPI_MEM_DATA_IN)
> +		return -EOPNOTSUPP;
> +
> +	if (desc->info.length > chip->ahb_window_size)
> +		dev_warn(aspi->dev, "CE%d window (%dMB) too small for mapping",
> +			 chip->cs, chip->ahb_window_size >> 20);
> +
> +	/* Define the default IO read settings */
> +	ctl_val =3D readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
> +	ctl_val |=3D aspeed_spi_get_io_mode(op) |
> +		op->cmd.opcode << CTRL_COMMAND_SHIFT |
> +		CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) |
> +		CTRL_IO_MODE_READ;
> +
> +	/* Tune 4BYTE address mode */
> +	if (op->addr.nbytes) {
> +		u32 addr_mode =3D readl(aspi->regs + CE_CTRL_REG);
> +
> +		if (op->addr.nbytes =3D=3D 4)
> +			addr_mode |=3D (0x11 << chip->cs);
> +		else
> +			addr_mode &=3D ~(0x11 << chip->cs);
> +		writel(addr_mode, aspi->regs + CE_CTRL_REG);
> +	}
> +
> +	/* READ mode is the controller default setting */
> +	chip->ctl_val[ASPEED_SPI_READ] =3D ctl_val;
> +	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
> +
> +	dev_info(aspi->dev, "CE%d read buswidth:%d [0x%08x]\n",
> +		 chip->cs, op->data.buswidth, chip->ctl_val[ASPEED_SPI_READ]);
> +
> +	return ret;
> +}
> +
> +static ssize_t aspeed_spi_dirmap_read(struct spi_mem_dirmap_desc *desc,
> +				      u64 offset, size_t len, void *buf)
> +{
> +	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->spi->=
master);
> +	struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chip_sele=
ct];
> +
> +	/* Switch to USER command mode if mapping window is too small */
> +	if (chip->ahb_window_size < offset + len)
> +		aspeed_spi_read_user(chip, &desc->info.op_tmpl, offset, len, buf);
> +	else
> +		memcpy_fromio(buf, chip->ahb_base + offset, len);
> +
> +	return len;
> +}
> +
>  static const struct spi_controller_mem_ops aspeed_spi_mem_ops =3D {
>  	.supports_op =3D aspeed_spi_supports_op,
>  	.exec_op =3D aspeed_spi_exec_op,
>  	.get_name =3D aspeed_spi_get_name,
> +	.dirmap_create =3D aspeed_spi_dirmap_create,
> +	.dirmap_read =3D aspeed_spi_dirmap_read,
>  };
>  =

>  static void aspeed_spi_chip_set_type(struct aspeed_spi *aspi, unsigned i=
nt cs, int type)
> -- =

> 2.34.1
> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
