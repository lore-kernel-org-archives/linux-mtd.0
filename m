Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7854C48BC4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78Yw4Z4owT2q1wMmVZZkTNMFpOdcGka/IJcB7D7is4Y=; b=0/nLxGoAWb8olE4LOzjaV7vpFN
	yYAyOYM2YSI6aXdHVfdVL9VSzuBnRqH5yW5VcDyUExeruI3PSMVLsPMNhtWU3kzGIVhV84d993W7Y
	sNYjSbgui42zNud5bCd52/SnFGSVYKTEW/ISWh30ETm7BPFGlrfk/XJutDLevVlLaZp0ZPTwIxKF5
	mUamlN2Ni3q9Q+TMlNkRrf4Kc0hbEy9R3RK3/tCBMDYy5ppMLOGySYMBz0QCJIcyl/sEHicOu/Jsg
	n5ag6D31fk0YEyzsS+IdnLR1GB1JPgSd9zLkKtk6g50ArFtJySk/J2Hds0mdCe8yDO4m4SQi4K+J0
	fIdCl94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racVb-0000000GWMV-28Wv;
	Thu, 15 Feb 2024 14:14:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racVY-0000000GWM7-1NZ8
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 14:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A569761DCD;
	Thu, 15 Feb 2024 14:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1856FC43399;
	Thu, 15 Feb 2024 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708006475;
	bh=RtD5fIwW2Tv98e2ZwItrznuWej/tQ+n+fDjWn0UkU18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=idNGx56Z5MDGH1zTVRUU5AS28xfueBdbCV1C/deCWpkJJh6WN0lbvNfZTwGBpT2ih
	 m2QBP/WBTV+9ooTCV+3tUsOix0622rp1usFV97Bd0FmZsZyFARUCYG9FrH4mb/46wM
	 ao2XsXsdzY5cW8n1Z6y87mu6DLtn4DDLpPkrXg0bfAs32llBCdaQD1x93BosBzuWGm
	 Vv5w3Duz4ylJepPvEGPgwTe69fgpd5sAeK101U9vg5p0+jaT4kkkaIB/ReOG5drZ/n
	 574CJarVFgDx7NsiiJ2yRmYIhjDdYYqsmEl7Pgcs65ecGf7pPpdLZ6xWeBFlaD7Re8
	 ZZIkTkge6/ORw==
Date: Thu, 15 Feb 2024 14:14:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
Message-ID: <21dde665-54b4-48e4-b963-1008ac890df3@sirena.org.uk>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-4-quic_mdalam@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240215134856.1313239-4-quic_mdalam@quicinc.com>
X-Cookie: Pass with care.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_061436_471755_7F4E6146 
X-CRM114-Status: GOOD (  26.92  )
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
Content-Type: multipart/mixed; boundary="===============8050639276462288178=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8050639276462288178==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XhokIFG6tLIbxTBQ"
Content-Disposition: inline


--XhokIFG6tLIbxTBQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 15, 2024 at 07:18:54PM +0530, Md Sadre Alam wrote:

> +config SPI_QPIC_SNAND
> +	tristate "QPIC SNAND controller"
> +	default y

Why is this driver so special it should be enabled by default?

> +	depends on ARCH_QCOM

Please add an || COMPILE_TEST so this gets some build coverage.

> +	help
> +	  QPIC_SNAND (QPIC SPI NAND) driver for Qualcomm QPIC controller.
> +	  QPIC controller supports both parallel nand and serial nand.
> +	  This config will enable serial nand driver for QPIC controller.
> +
>  config SPI_QUP
>  	tristate "Qualcomm SPI controller with QUP interface"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
> index 4ff8d725ba5e..1ac3bac35007 100644
> --- a/drivers/spi/Makefile
> +++ b/drivers/spi/Makefile
> @@ -153,6 +153,7 @@ obj-$(CONFIG_SPI_XTENSA_XTFPGA)		+= spi-xtensa-xtfpga.o
>  obj-$(CONFIG_SPI_ZYNQ_QSPI)		+= spi-zynq-qspi.o
>  obj-$(CONFIG_SPI_ZYNQMP_GQSPI)		+= spi-zynqmp-gqspi.o
>  obj-$(CONFIG_SPI_AMD)			+= spi-amd.o
> +obj-$(CONFIG_SPI_QPIC_SNAND)            += spi-qpic-snand.o

Please keep this sorted.

> --- /dev/null
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -0,0 +1,1025 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.

Please make the entire comment a C++ one so things look more
intentional.

> +#define snandc_set_read_loc_first(snandc, reg, cw_offset, read_size, is_last_read_loc)	\
> +snandc_set_reg(snandc, reg,			\
> +	      ((cw_offset) << READ_LOCATION_OFFSET) |		\
> +	      ((read_size) << READ_LOCATION_SIZE) |			\
> +	      ((is_last_read_loc) << READ_LOCATION_LAST))
> +
> +#define snandc_set_read_loc_last(snandc, reg, cw_offset, read_size, is_last_read_loc)	\
> +snandc_set_reg(snandc, reg,			\
> +	      ((cw_offset) << READ_LOCATION_OFFSET) |		\
> +	      ((read_size) << READ_LOCATION_SIZE) |			\
> +	      ((is_last_read_loc) << READ_LOCATION_LAST))

For type safety and legibility please write these as functions, mark
them as static inline if needed.

> +void snandc_set_reg(struct qcom_nand_controller *snandc, int offset, u32 val)
> +{
> +	struct nandc_regs *regs = snandc->regs;
> +	__le32 *reg;
> +
> +	reg = offset_to_nandc_reg(regs, offset);
> +
> +	if (reg)
> +		*reg = cpu_to_le32(val);
> +}

This silently ignores writes to invalid registers, that doesn't seem
great.

> +	return snandc->ecc_stats.failed ? -EBADMSG : snandc->ecc_stats.bitflips;

For legibility please just write normal conditional statements.

> +static int qpic_snand_program_execute(struct qcom_nand_controller *snandc,
> +				      const struct spi_mem_op *op)
> +{

> +       int num_cw = 4;

> +	data_buf = (u8 *)snandc->wbuf;

Why the cast?  If it's needed that smells like it's masking a bug, it
looks like it's casting from a u8 * to a u8 *.

> +	for (i = 0; i < num_cw; i++) {
> +		int data_size;

All these functions appear to hard code "num_cw" to 4.  What is "num_cw"
and why are we doing this per function?

> +static int qpic_snand_program_execute(struct qcom_nand_controller *snandc,
> +                                     const struct spi_mem_op *op)

> +	if (op->cmd.opcode == SPINAND_READID) {
> +		snandc->buf_count = 4;
> +		read_reg_dma(snandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
> +
> +		ret = submit_descs(snandc);
> +		if (ret)
> +			dev_err(snandc->dev, "failure in submitting descriptor for readid\n");
> +
> +		nandc_read_buffer_sync(snandc, true);
> +		memcpy(op->data.buf.in, snandc->reg_read_buf, snandc->buf_count);

These memcpy()s don't seem great, why aren't we just reading directly
into the output buffer?

> +	if (op->cmd.opcode == SPINAND_GET_FEATURE) {

This function looks like it should be a switch statement.

> +static bool qpic_snand_is_page_op(const struct spi_mem_op *op)
> +{

> +	if (op->data.dir == SPI_MEM_DATA_IN) {
> +		if (op->addr.buswidth == 4 && op->data.buswidth == 4)
> +			return true;
> +
> +		if (op->addr.nbytes == 2 && op->addr.buswidth == 1)
> +			return true;
> +
> +	} else if (op->data.dir == SPI_MEM_DATA_OUT) {
> +		if (op->data.buswidth == 4)
> +			return true;
> +		if (op->addr.nbytes == 2 && op->addr.buswidth == 1)
> +			return true;
> +	}

Again looks like a switch statement.

> +	ctlr = devm_spi_alloc_master(dev, sizeof(*snandc));
> +	if (!ctlr)
> +		return -ENOMEM;

Please use _alloc_controller.

> +static int qcom_snand_remove(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctlr = platform_get_drvdata(pdev);
> +
> +	spi_unregister_controller(ctlr);
> +
> +	return 0;
> +}

We don't disable any of the clocks in the remove path.

--XhokIFG6tLIbxTBQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXOHEQACgkQJNaLcl1U
h9DPNQf+J50wqlt9PTavj5k8BZ9Z6zwjzegCMvrnHopmC1YAf4xbXkQCAQxV7emn
twIkNpsgq47QVVagkvGaKItUPEEBYLfAD0xSueD9f45evFnwqXWn0vKkaVIN4rwu
1G/1V7E6yS71iuctmkMd1QDTey4Q2zG869/GYDKkBC01JFJ5yWzMi8kpCetcJYs1
D1a6PVUMWv6wWaCGIcXPjPXguhKmy2S3Z6WSqZ/pr8hxDfNHgy58ie9lvh71axNc
AM+nlRRggHB6he9/9EtGMxe1nNAmFa5i6rIPVHlPYgbmKiy9H325PnGwXsoJ0GRb
3BRpV35HMNNSHJyfXyBP/J3nWz7MqQ==
=n07f
-----END PGP SIGNATURE-----

--XhokIFG6tLIbxTBQ--


--===============8050639276462288178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8050639276462288178==--

