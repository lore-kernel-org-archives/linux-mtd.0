Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27435C982E6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQeDRXyh8Sl7sUrf2VmPZjsyved1MtMLteMekf0S1ko=; b=zDFnx7D/0aM+Akba3FDufOPwVA
	gkOHYNYjam2ySAE7mFFiqbA2Ro+ed/ICHi7awV22eqZH826Nsa84x344EcGwGJ0HZHq3L78mjVmj2
	klAs96G7kvZu4UWIzE7+Ld0A2UCgBnYY4ivvk9YnP5rQ5qc4D5+UJf25k9EWuym5kM9+u3rCYViUd
	e70EdCW0u8chX6/xRCHs5JxAuK/JB1RF3m1zM7GA3OY34XzGaFswl9BhSnsv+AO34eItIFiIhtIe/
	XhkeKOcD/ihgVhGDGt0vVwDHPdWcafI+u0dUibzEUlIYhSyaCFUdRZYDseMeAgrQlA1N1mTBVwIG6
	5mz01hQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fNH-00000002TUp-2CIG;
	Mon, 21 Sep 2026 14:52:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fNF-00000002TTy-1oKt
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 14:52:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB1AC600C8;
	Mon, 21 Sep 2026 14:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16451F000FF;
	Mon, 21 Sep 2026 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002324;
	bh=iBzaDTFhCv8gByiggXKs3p0z6UUKmnCA/sXWzByV9wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nTIaEWTOjTNWT59X5i/DxMipgg1LluTThVc0M6j+BJ+Li+8rHMbYlh9jdUVTttRU1
	 fCRV4VKl1H9rZf4Iz7x0jKN7jMx8sfKR4bZhRmexU6t5d5LsYTEfQFoT0809QntJod
	 HMOsTmd+58OOp4TcHZBt0Vpat1oD/ZnO3zoYv+aqRohnXDPa+FRAd2psKG/6QR3Ij7
	 AVO4xQIGWG7uEO/1Z98/nYGtBCO1Qe0bLbziRCyrETYnuug1KULsguhszERDmNJJtU
	 82ICOcgrOtwZdFgfrR784D4liSnYh/GfztC+IsrAUPZ6UDPMChzc8mK3bIOhlzGRe7
	 f2x858rK/gEhA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7836D1AC55A7; Mon, 21 Sep 2026 15:51:59 +0100 (BST)
Date: Mon, 21 Sep 2026 16:51:59 +0200
From: Mark Brown <broonie@kernel.org>
To: Fei Xie <fei.xie@horizon.auto>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parshuram Thombare <pthombar@cadence.com>,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
Message-ID: <arFEjzkHGMbecWWV@sirena.co.uk>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <20260921093701.1341766-3-fei.xie@horizon.auto>
MIME-Version: 1.0
In-Reply-To: <20260921093701.1341766-3-fei.xie@horizon.auto>
X-Cookie: Too clever is dumb.
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
Content-Type: multipart/mixed; boundary="===============2141857779933337250=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2141857779933337250==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8lF6WnBuWqq8JydY"
Content-Disposition: inline


--8lF6WnBuWqq8JydY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2026 at 05:36:59PM +0800, Fei Xie wrote:

> Add PIO master-DMA support for the controller auto-command mode.
> Configure the SPI NAND read, program, erase, status and reset
> sequences, retaining STIG for operations not consumed by ACMD.

> +struct cdns_xspi_acmd_info {
> +	u64 row_addr;
> +	u64 column_addr;
> +	size_t data_nbytes;
> +	bool row_addr_valid;
> +	bool initialized;
> +};
>  struct cdns_xspi_dev {

Missing blank line.

> +static void cdns_xspi_nand_erase_seq_init(struct cdns_xspi_dev *cdns_xspi,
> +					  struct spinand_device *spinand)
> +{
> +	u32 erase_seq_cfg0;
> +	u32 erase_seq_cfg1;
> +
> +	/* SPI-NAND block erase is always D8h with a 3-byte row address. */
> +	erase_seq_cfg0 =
> +		FIELD_PREP(CDNS_XSPI_ERSS_SEQ_P1_CMD_VAL, 0xd8) |

CDNS_XSPI_NAND_OP_BLOCK_ERASE.

> +static int cdns_xspi_nand_init(struct cdns_xspi_dev *cdns_xspi,
> +			       struct spinand_device *spinand)
> +{

How much of this initialisation is parameters based on the specific
flash passed in - what if there are two different flashes attached to
the same controller for some reason?

> +	cdns_xspi->dma_buf_len = spinand->base.memorg.pagesize +
> +				 spinand->base.memorg.oobsize;
> +	cdns_xspi->dma_buf = dmam_alloc_coherent(cdns_xspi->dev,
> +						 cdns_xspi->dma_buf_len,
> +						 &cdns_xspi->dma_addr,
> +						 GFP_KERNEL);
> +	if (!cdns_xspi->dma_buf)
> +		return -ENOMEM;

Why do we need the DMA buffer, I'd expect whatever reaches the driver to
already be DMA safe?

> +static int cdns_xspi_acmd_run(struct cdns_xspi_dev *cdns_xspi, u32 cmd_regs[6],
> +			      u32 thread)
> +{
> +	unsigned long timeout;
> +	int ret;
> +
> +	cdns_xspi_set_mode_acmd(cdns_xspi);
> +	reinit_completion(&cdns_xspi->auto_cmd_complete);
> +	cdns_xspi_set_interrupts(cdns_xspi, true);

We have the set_interrupts() operation.

> +	cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
> +
> +	timeout = msecs_to_jiffies(CDNS_XSPI_ACMD_TIMEOUT_MS);
> +	if (!wait_for_completion_timeout(&cdns_xspi->auto_cmd_complete,
> +					 timeout)) {
> +		dev_err(cdns_xspi->dev, "ACMD command timed out\n");
> +		ret = -ETIMEDOUT;

Don't we need to clean up the hardware if this times out?

> +	} else {
> +		ret = cdns_xspi_acmd_get_thread_status(cdns_xspi, thread);
> +	}

Does this need any updates to cover more error types?

> +static int cdns_xspi_pio_mdma_read(struct cdns_xspi_dev *cdns_xspi,
> +				   struct spinand_device *spinand,
> +				   const struct spi_mem_op *op)
> +{

> +	ret = cdns_xspi_acmd_run(cdns_xspi, cmd_regs,
> +				 CDNS_XSPI_ACMD_DATA_THREAD);
> +	if (ret) {
> +		dev_err(cdns_xspi->dev, "ACMD read failed: %d\n", ret);
> +		goto out_clear_read_state;
> +	}
> +
> +	memcpy(op->data.buf.in, cdns_xspi->dma_buf, op->data.nbytes);
> +
> +out_clear_read_state:
> +	cdns_xspi->acmd_info.row_addr_valid = false;
> +	cdns_xspi->acmd_info.row_addr = 0;
> +	return ret;
> +}

Does this do the right thing for short reads?

> +static int cdns_xspi_send_pio_command(struct cdns_xspi_dev *cdns_xspi,
> +				      struct spi_mem *mem,
> +				      const struct spi_mem_op *op)
> +{
> +	struct spinand_device *spinand;
> +	const struct spi_mem_op *read_cache;
> +	const struct spi_mem_op *write_cache;
> +	const struct spi_mem_op *update_cache;
> +	int ret;
> +
> +	if (cdns_xspi->flash_type != CDNS_XSPI_FLASH_TYPE_NAND)
> +		goto use_stig;
> +
> +	spinand = spi_mem_get_drvdata(mem);

This appears to be peering into the child's driver data without any
checking that the child is what we expect, this could go horribly wrong.

> +	case CDNS_XSPI_NAND_OP_GET_FEATURE:
> +		if (op->addr.val != CDNS_XSPI_NAND_STATUS_REG ||
> +		    !cdns_xspi->acmd_info.row_addr_valid)
> +			break;
> +
> +		if (op->data.dir != SPI_MEM_DATA_IN || !op->data.nbytes ||
> +		    !op->data.buf.in)
> +			return -EINVAL;
> +
> +		memset(op->data.buf.in, 0, op->data.nbytes);
> +		return 0;

Are you sure the zeroing makes sense here, for example with ECC?

--8lF6WnBuWqq8JydY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxRI4ACgkQJNaLcl1U
h9B9kQgAgexg4UroYbNqfnTx77dWvyfvZfAkOgGsSxorVl+++uS5zUEC4KFHAcv8
nkJ+48LXafFUvcS296w9kMf9fYlUgGnOis3kaVXPnjAmJQpf0ESIFMKWc/++sLNT
aDJxu/DmvkttnSswRXN87rtxXInLpPPXRSXHAc66nPGaa3aq9Uq0iZ9+N9wQfsP9
yfWJOixMNrFRApiIEMTqvasq+M7YLwTSjbu/aQDQsAflsw0mSqkKuJ6OrqAlJ6EA
bc7+75b0oBYOr6fiMqUvqlTGV3t1hPVRw1VkavKiRlBz3W9WqX0E4CTy2PEvPyAX
FrTYRxC4hJK8kkYTmvxPlBNeHszLAw==
=Mpw7
-----END PGP SIGNATURE-----

--8lF6WnBuWqq8JydY--


--===============2141857779933337250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2141857779933337250==--

