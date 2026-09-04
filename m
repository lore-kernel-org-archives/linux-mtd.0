Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720F5C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrA5uprP2bqx/94TVDFZtu/udeQ/xU2TnvgVv9Chq+I=; b=eDPuXrmI56h8/doGXagDKMcpqR
	P1suNL6ogYRld+EZlVcmHJjEndKTs6h/s2Vj9DY7FDH/vy0oPWIAuiAlUH6YIud94hXOXO6dqNAHw
	1jdkNOGuKdoce5r5RrWqvxLCrfKIAGx/Oeu4uda7VMwpinn8DOvuULSHtsbvHVAviQoGD4FKe2yk6
	xxmNDc4wddp+XL+MFmrkXaAUV06OE49q52rpVeGIr1Zfcb8DgzSuHiG74L7eQJCwtVgQF3fbJiyH9
	wxikiQcPIbqIa3qX68G9Dny/56tBAZsos5agFUNCfnUeOzwwdEG/mUBBVpSgVrtnMbhGWixa6vOh0
	kTiuvCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YR1-000000032L6-3VQV;
	Fri, 04 Sep 2026 18:14:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YQw-0000000328v-3EcL
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:14:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC17660A6F;
	Fri,  4 Sep 2026 18:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5226E1F00A3D;
	Fri,  4 Sep 2026 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788545677;
	bh=PmQzA/sVHLKqaojPdDB1mXMUb5EHle9cFpeog9QN+gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mi/Lo+Cq90i5cP0QgPI7iikCfwZfaVNeVSsUgOQ/nA3+xM4ZeyhAyP+ePSrNIy/+/
	 zE8Tg4j7TVbUFiro20luaggZcaQbxbHV7Y+tG7aVuykEGVXOnDAQgCj2etpIkdO1XL
	 2XM29PprBDgYg/5i08509yndfikxrA7OF9dacYBFwxnBuLN7hzUxz21RWfbAG4h61G
	 QOPC3gaudl+dQ/CnhBGU4j+1ghDonGjsVDGs2k+0SXOImrEMXxuKVElGJ0D3dpcaHX
	 cQYXFHExIf1sJyk7ISWEO/YvfBbGzfFg0Ke+lAq2v0qHQmDhZv/PDmHOZONkxPiyWn
	 I2Z9lK6O+lK2w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C754A1AC52F1; Fri, 04 Sep 2026 19:14:33 +0100 (BST)
Date: Fri, 4 Sep 2026 19:14:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: md.alam@oss.qualcomm.com, Johan Alvarado <contact@c127.dev>,
	konradybcio@kernel.org, pengpeng@iscas.ac.cn, j4g8y7@gmail.com,
	quic_varada@quicinc.com, quic_srichara@quicinc.com,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic-snand: publish the ECC context to
 snandc->qspi
Message-ID: <apsKiRC-bn7oPS2P@sirena.co.uk>
References: <20260825013848.1056946-1-contact@c127.dev>
 <178854349408.1467647.16557341714581809344.b4-ty@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <178854349408.1467647.16557341714581809344.b4-ty@bootlin.com>
X-Cookie: My vaseline is RUNNING...
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
Content-Type: multipart/mixed; boundary="===============6466039274667113561=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6466039274667113561==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b283S8Tm5n9MmedD"
Content-Disposition: inline


--b283S8Tm5n9MmedD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 07:38:14PM +0200, Miquel Raynal wrote:
> On Mon, 24 Aug 2026 20:38:48 -0500, Johan Alvarado wrote:
> > qcom_spi_ooblayout_ecc() and qcom_spi_ooblayout_free() read the ECC
> > configuration through snandc->qspi->ecc. qcom_spi_probe() points it at a

> [1/1] spi: spi-qpic-snand: publish the ECC context to snandc->qspi
>       commit: 93bc7c4d2f4198586a6dbd7797c3bbf1ca845761

Oh?

--b283S8Tm5n9MmedD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbCokACgkQJNaLcl1U
h9ATgQf/dI7Qk3Q5n9dlJsVPpF710sRJlyIVEwDCz5R7Vs8ciOj8eHvUTXXOEbYK
yNNzYEaKEEfgwI9ryihBPeSdMQNR0qHsOqFiMFi5aP6wBe918CPtYkyCu+sIrj5y
G4qRjRJkfznrSwqvFED//KX2IOFXpI9FzjLoKcNKcpFZvVW1H/gKEU6jvR7KYYBE
QYpQs7FIsSIbv7g270pm+kqb+K4Lt8IYXtWa+jyDSBiPMdPvYLbO9FMAqKnyS5zi
aN5HP4Q7WWNdG0ohl/itKF8Fq7HxqFO9Cs1gZiNY3ypjfNxLpJXanUowS0VNPdeb
jF01Bt7GyFGZ2+Q0x4xm5ZVp5t3o6g==
=I5SC
-----END PGP SIGNATURE-----

--b283S8Tm5n9MmedD--


--===============6466039274667113561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6466039274667113561==--

