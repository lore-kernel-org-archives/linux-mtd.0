Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37EDC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLn7/7ft/vAiTwDgbR9IGYfB5thGZyj2dvgw8rdcdsY=; b=CCRetszj76CD9rSFQLPIDpN9Zy
	f1IgGqMiAX7OOEl4NG3G/+9GXIJeSzgG1/UtaWotUF8qOz+42d+NxqATgoC6JAMalG/aRlIbb1aAj
	dKGA5im92116ByMI1vE47tYQJOOsYmtx9vIUphsSycXSMO5tMRXPhcF2q8vue6U3IlzX8khd1yJEd
	xq2jI0iBY1rvA7qGNR36Xz+0q+EfaF4w5mcbJROHBhIBuJCY5bhXv2jOqqid8JVTEBRId5rfTdgeO
	+CTZRVD4eFuf7oC7a1jkQutBvBbfX15p04WlWOE4JivdaHcS75sazLY16yLGzEACnk88J5I+n/JKA
	yZVbCTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpeU-005QmD-0y;
	Tue, 31 Oct 2023 14:23:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpeQ-005QlO-02
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 14:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EE8F60F06;
	Tue, 31 Oct 2023 14:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3DBC433C8;
	Tue, 31 Oct 2023 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698762205;
	bh=gHF4eLRcWSiCzarvxwZwly4HI7O2WIslxS/qaonfnn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IF/eYp2S75f9+6CreJlVFYfR+mY6FyCR/9KiNtiYPaP0qLKjxIkDse+nhKqTi66os
	 1CzFoWhIsoj9Cz2byYZMH9eyI1Sgo7/pq8LcaMN2o0e7jj+fx9phqA0FLjw2lIATOT
	 P/hqOhMta3RA4afNUT6pEguAuSFticwlM3z4MnJzKRbkoM+7Go1Bl9BOyGoK5FHWvi
	 a7doouIyGKGVIMyHQMZWCA7VhD52vxM/T3bqFPp9fF9rqHhKfg1GhoZRug274n1ZQJ
	 ebV0fhvl9VUvEr1uOrLv3yoLv17cZrN0Y/teVBXBq+mGtAf8ktAdT0x6r58G1SYPKZ
	 Bg/jSkwvNKZmw==
Date: Tue, 31 Oct 2023 14:23:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	quic_srichara@quicinc.com, qpic_varada@quicinc.com
Subject: Re: [RFC PATCH 4/5] spi: qpic: Add support for qpic spi nand driver
Message-ID: <a1270a88-49a9-4bdb-89a9-ce6929f2294d@sirena.org.uk>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-5-quic_mdalam@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20231031120307.1600689-5-quic_mdalam@quicinc.com>
X-Cookie: Is it clean in other dimensions?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_072326_130576_D2A35509 
X-CRM114-Status: GOOD (  26.24  )
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
Content-Type: multipart/mixed; boundary="===============8533949636503613464=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8533949636503613464==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="910ikmaqu7YIRsJ2"
Content-Disposition: inline


--910ikmaqu7YIRsJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 05:33:06PM +0530, Md Sadre Alam wrote:

> +config SPI_QPIC_SNAND
> +	tristate "QPIC SNAND controller"
> +	default y
> +	depends on ARCH_QCOM
> +	help
> +	  QPIC_SNAND(Quad SPI) driver for Qualcomm QPIC_SNAND controller.
> +

I don't see any build dependencies on anything QC specific so please add
an || COMPILE_TEST here, this makes it much easier to do generic changes
without having to build some specific config.

> +++ b/drivers/spi/Makefile
> @@ -153,6 +153,7 @@ obj-$(CONFIG_SPI_XTENSA_XTFPGA)		+=3D spi-xtensa-xtfp=
ga.o
>  obj-$(CONFIG_SPI_ZYNQ_QSPI)		+=3D spi-zynq-qspi.o
>  obj-$(CONFIG_SPI_ZYNQMP_GQSPI)		+=3D spi-zynqmp-gqspi.o
>  obj-$(CONFIG_SPI_AMD)			+=3D spi-amd.o
> +obj-$(CONFIG_SPI_QPIC_SNAND)            +=3D spi-qpic-snand.o

Please keep this alphabetically sorted (there are some mistakes there
but no need to add to them).

> + * 	Sricharan R <quic_srichara@quicinc.com>
> + */
> +
> +#include <linux/mtd/spinand.h>
> +#include <linux/mtd/nand-qpic-common.h>
> +

This should be including the SPI API, and other API headers that are
used directly like the platform and clock APIs.

> +static int qcom_snand_init(struct qcom_nand_controller *snandc)
> +{
> +	u32 snand_cfg_val =3D 0x0;
> +	int ret;

=2E..

> +	ret =3D submit_descs(snandc);
> +	if (ret)
> +		dev_err(snandc->dev, "failure in sbumitting spiinit descriptor\n");
> +
> +	free_descs(snandc);

This seems to be doing a bit more than I would expect an init function
to, and it's very surprising to see the descriptors freed immediately
after something called a submit (which suggests that the descriptors are
still in flight).

> +static int qpic_snand_read_page(struct qcom_nand_controller *snandc,
> +				const struct spi_mem_op *op)
> +{
> +	return 0;
> +}
> +
> +static int qpic_snand_write_page(struct qcom_nand_controller *snandc,
> +				const struct spi_mem_op *op)
> +{
> +	return 0;
> +}

=2E..

> +static int qpic_snand_exec_op(struct spi_mem *mem, const struct spi_mem_=
op *op)
> +{
> +	struct qcom_nand_controller *snandc =3D spi_controller_get_devdata(mem-=
>spi->master);
> +	dev_dbg(snandc->dev, "OP %02x ADDR %08llX@%d:%u DATA %d:%u", op->cmd.op=
code,
> +		op->addr.val, op->addr.buswidth, op->addr.nbytes,
> +		op->data.buswidth, op->data.nbytes);
> +
> +	/*
> +	 * Check for page ops or normal ops
> +	 */
> +	if (qpic_snand_is_page_op(op)) {
> +		if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
> +			return qpic_snand_read_page(snandc, op);
> +		else
> +			return qpic_snand_write_page(snandc, op);

So does the device actually support page operations?  The above looks
like the driver will silently noop them.

> +	snandc->base_phys =3D res->start;
> +	snandc->base_dma =3D dma_map_resource(dev, res->start,
> +					   resource_size(res),
> +					   DMA_BIDIRECTIONAL, 0);
> +	if (dma_mapping_error(dev, snandc->base_dma))
> +		return -ENXIO;
> +
> +	ret =3D clk_prepare_enable(snandc->core_clk);
> +	if (ret)
> +		goto err_core_clk;

The DMA mapping and clock enables only get undone in error handling,
they're not undone in the normal device release path.

> +
> +	ret =3D clk_prepare_enable(snandc->aon_clk);
> +	if (ret)
> +		goto err_aon_clk;
> +
> +	ret =3D clk_prepare_enable(snandc->iomacro_clk);
> +	if (ret)
> +		goto err_snandc_alloc;
> +
> +	ret =3D qcom_nandc_alloc(snandc);
> +	if (ret)
> +		goto err_snandc_alloc;
> +
> +	ret =3D qcom_snand_init(snandc);
> +	if (ret)
> +		goto err_init;
> +
> +	// setup ECC engine
> +	snandc->ecc_eng.dev =3D &pdev->dev;
> +	snandc->ecc_eng.integration =3D NAND_ECC_ENGINE_INTEGRATION_PIPELINED;
> +	snandc->ecc_eng.ops =3D &qcom_snand_ecc_engine_ops;
> +	snandc->ecc_eng.priv =3D snandc;
> +
> +	ret =3D nand_ecc_register_on_host_hw_engine(&snandc->ecc_eng);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register ecc engine.\n");
> +		goto err_init;
> +	}
> +
> +	ctlr->num_chipselect =3D QPIC_QSPI_NUM_CS;
> +	ctlr->mem_ops =3D &qcom_spi_mem_ops;
> +	ctlr->mem_caps =3D &qcom_snand_mem_caps;
> +	ctlr->dev.of_node =3D pdev->dev.of_node;
> +	ctlr->mode_bits =3D SPI_TX_DUAL | SPI_RX_DUAL |
> +			    SPI_TX_QUAD | SPI_RX_QUAD;
> +
> +	ret =3D spi_register_master(ctlr);
> +	if (ret) {
> +		dev_err(&pdev->dev, "spi_register_controller failed.\n");
> +		goto err_init;
> +	}
> +
> +	return 0;
> +err_init:
> +	qcom_nandc_unalloc(snandc);
> +err_snandc_alloc:
> +	clk_disable_unprepare(snandc->aon_clk);
> +err_aon_clk:
> +	clk_disable_unprepare(snandc->core_clk);
> +err_core_clk:
> +	dma_unmap_resource(dev, res->start, resource_size(res),
> +			   DMA_BIDIRECTIONAL, 0);
> +
> +	return ret;
> +}
> +
> +static int qcom_snand_remove(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctlr =3D platform_get_drvdata(pdev);
> +	spi_unregister_master(ctlr);
> +
> +	return 0;
> +}
> +
> +static const struct qcom_nandc_props ipq9574_snandc_props =3D {
> +	.dev_cmd_reg_start =3D 0x7000,
> +	.is_bam =3D true,
> +	.qpic_v2 =3D true,
> +};
> +
> +static const struct of_device_id qcom_snandc_of_match[] =3D {
> +	{
> +		.compatible =3D "qcom,ipq9574-nand",
> +		.data =3D &ipq9574_snandc_props,
> +	},
> +	{}
> +}
> +MODULE_DEVICE_TABLE(of, qcom_snandc_of_match);
> +
> +static struct platform_driver qcom_snand_driver =3D {
> +	.driver =3D {
> +		.name		=3D "qcom_snand",
> +		.of_match_table =3D qcom_snandc_of_match,
> +	},
> +	.probe =3D qcom_snand_probe,
> +	.remove =3D qcom_snand_remove,
> +};
> +module_platform_driver(qcom_snand_driver);
> +
> +MODULE_DESCRIPTION("SPI driver for QPIC QSPI cores");
> +MODULE_AUTHOR("Md Sadre Alam <quic_mdalam@quicinc.com>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.34.1
>=20

--910ikmaqu7YIRsJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVBDdUACgkQJNaLcl1U
h9Ayhgf+Ka7rwW/sqJZ1kD93K1uUeVHjyDvf9z9Z5yfcVvPLmIkHxGj4/ETeJFnP
QIHcNM4TsiFOAjfsSU0JyCZKrw+7jgOgRE4EVfWUAqLwD3FdY9wTjmQmp5/pVlwF
PbU9JbZjvWnPHhTjoZJNUJbA80Ea3E3ROE7FAS+P9VNTBgRqX00ubdyhXQ4ya3MT
F3M8NiZmWmKNXOhoOOcNZkNNovhJh2X5ZY3GKhJ1mDdqlCcs3Uy7QU6lyhf6S9wR
QhnUtjZuFqRSiSkVa7oTQIr7vZeG+gRj4uaK+QzglDmCJCInE/atWbONPyipveku
8Ya+gviROLEJ0/htPxRIOAWjmwlKQw==
=ddU9
-----END PGP SIGNATURE-----

--910ikmaqu7YIRsJ2--


--===============8533949636503613464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8533949636503613464==--

