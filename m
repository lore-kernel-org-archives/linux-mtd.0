Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB69C61DBE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Aug 2026 21:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=id0vXGt8qnLEjav0vyIwuA6xCHdawOJo0b1nVzMoIso=; b=hwQ8FgCzIumVJxLRteqZoWpPtr
	6g6uXErg0eiEyml05uv22jaknbOVFRI3Eldo8n3PKVjld3K7RT8fGMGR5o35KcRNQZKhrlGqusiFu
	TE+uiULnyZ5K6hLLqRmpvF+tIY41gdIArnJBI3q5uhuzLH3AQcEA66dm7Ca9RInnzHCn6DPANKDEC
	8w6t+P2wmbOK40u/tUYXWf8CxNPn/o7rHiA5Xqp10dbpZCDkIgjVebESCkA63ersE3v6ax6sfmpRC
	/o/o0/B7sWUqCTaDLiRJlwPF5wBZUil43+L6gp4e5p7Jaz7X8J5RyzAlGQb85phjkD6WCZWcbwWYh
	0i88eVlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzLPP-000000032s7-0oPf;
	Wed, 26 Aug 2026 21:43:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzLPN-000000032rw-1tbZ
	for linux-mtd@lists.infradead.org;
	Wed, 26 Aug 2026 21:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37B256020E;
	Wed, 26 Aug 2026 21:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D011F000E9;
	Wed, 26 Aug 2026 21:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787780623;
	bh=PSSo4bsAC2cEjTDtAnRZIQ9NfAW3QdjZrYCnvuLAkE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ChqqMJa3vxAiQad8g3dw8iasniT73h2asuuBLUzmnNANnaUP31o+KyDZuOY0hQQnl
	 zLsEAHlr8uMYX3p4oSKLfjQocnhfkDYH/F6ZyJRg8KM05kmGKdEyiaIPPoMPieiB4j
	 L4dXQO7wnmoNHCJCrEoQtICccHRvv0ix+og7ZY+w7eFblO2IZXSzL3poAsP8kEQt+v
	 jHCKPMZMYXhBFNsQyCoUbJCEIAMipli3CTwlvrV50S0JF/9WW1sjl4ahjBEmHHHilX
	 pZE3mp3iCJBd0iYDyqbt6mlLXWULkkl5JsyDsgNpP2076JFQ4gm73DXIbD+p1CdFtd
	 YLUD5MdlyMjnA==
Date: Wed, 26 Aug 2026 22:43:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	pratyush@kernel.org, mwalle@kernel.org,
	takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, praneeth@ti.com,
	sebin.francis@ti.com, u-kumar1@ti.com, a-dutta@ti.com
Subject: Re: [PATCH v9 08/18] spi: cadence-quadspi: add PHY tuning support
Message-ID: <8aac0c42-fad5-4146-a2a3-b60bdab71a20@sirena.org.uk>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-9-s-k6@ti.com>
MIME-Version: 1.0
In-Reply-To: <20260825171737.776052-9-s-k6@ti.com>
X-Cookie: Obey all traffic laws.
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
Content-Type: multipart/mixed; boundary="===============1211459560434106210=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1211459560434106210==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nryroxhrKHKI4MVn"
Content-Disposition: inline


--nryroxhrKHKI4MVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:47:27PM +0530, Santhosh Kumar K wrote:
> The Cadence QSPI controller supports a delay-line PHY for high-speed
> operation. Without calibration the PHY is unused and read capture relies
> on a fixed delay, limiting throughput at frequencies above the base
> operating speed.

> Add an execute_tuning callback that performs delay-line calibration using
> a known data pattern written to a dedicated flash region. The pattern is
> either read from a NOR partition identified by the DT property
> spi-phy-pattern-partition, or written to the NAND page cache before
> each calibration read.

>  struct cqspi_flash_pdata {

> +	bool			use_dqs;
> +	bool			use_tuned_phy;

The AM65x has a fun erratum i2189 which mentions that it requires=20
disabling DQS for writes:

   https://www.ti.com.cn/lit/er/sprz452i/sprz452i.pdf

which suggests we might need separate controls for read and write
operation.

> +static int cqspi_write_pattern_to_cache(struct cqspi_flash_pdata *f_pdat=
a,
> +					struct spi_mem *mem,
> +					const struct spi_mem_op *write_op)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	struct spi_mem_op op =3D *write_op;
> +	int ret;
> +
> +	op.max_freq =3D mem->spi->max_speed_hz;
> +	op.data.nbytes =3D sizeof(phy_tuning_pattern);
> +	op.data.buf.out =3D phy_tuning_pattern;
> +
> +	ret =3D ctlr->mem_ops->exec_op(mem, &op);
> +	if (ret) {
> +		dev_err(dev, "Failed to write PHY pattern to cache: %d\n", ret);
> +		return ret;
> +	}
> +	dev_dbg(dev, "PHY pattern (%zu bytes) written to cache\n",
> +		sizeof(phy_tuning_pattern));
> +
> +	return 0;
> +}

spinand_write_page() has a multi-operation sequence, I've not checked if
any fancy flashes with DQS support actually need that.  _read_page()
looks more straightforward.

--nryroxhrKHKI4MVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqPXgkACgkQJNaLcl1U
h9CVpgf+IEFBtsEfC8voVsHpmOfwjvGr+ozW/f+mGll/kPgYXkUFR5UgVC+QMaF6
3S6zPGMFpJNRm4DAo3iIaiXXgiZ7DMkjr7Q7ougvDy7JVJWv3csUMu/RKZIy++Dx
o2K1Da6/W4AzDrQExhVklMLQpa0wTaMav8FeEv23oOvFqPmwPBIryDzQRUB5Xz4Z
MCPmMvgG8wCXG3bPk/Ueigap6FXN3Xh7dVR9PEFEnYVrxj6DD4ladF9bc6GGd25x
4e/rMV2ra6P84FeUryMHBpbXwAv6/tq2UZS3Tijf6bF17giPvx2EAelgwdpA9OCg
a/Fbtj+DnJpFaO8EnzNiYorzzawsQg==
=f6hj
-----END PGP SIGNATURE-----

--nryroxhrKHKI4MVn--


--===============1211459560434106210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1211459560434106210==--

