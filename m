Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DA5CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDqD78XJ4V10RPFyBnuseK3pr4QSgrR1sYOBy9o/xv8=; b=tVd40YB+RxODOKadLkd2XZNwAc
	g68O6r5MudCTgCPrqogJzfG/rPSCpngpK2lP7NHdWbqt+qnkN4AZHpk2JD0cYCLjSyuhlhZLpgYxR
	1NLC8HpRToKaa4Lonz+6xaFykqg4bIwDjY7GwGlRZxTyLITWoTmZ7ctNGChHIjbkyOZ4OVNsc9/H5
	XMDXD/UKHZZDSq1nnqaz06pjanEnENrHWNTelBCx8wxJ+ANVapCAC+3rnDEGWKFfg1+QV/G3GO3qi
	9ZqSgxiN/hHwOo5OiC3cKtLkIZeDfrZ2duTVwtIH+HVq30qN9da5TJ2tvqUVo/oH0T0Kwr2WjNe13
	5aPHh1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKIc-000000003pd-2pQa;
	Thu, 15 Oct 2026 12:11:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKIa-000000003pR-2HuL
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 12:11:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2999B43702;
	Thu, 15 Oct 2026 12:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03E01F000C4;
	Thu, 15 Oct 2026 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066264;
	bh=1woIpcqPxRIa5ueRrQVCv21ZA8veGBbKfrPvaOAzZZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GLXo5pne5wuStSnH/uiHY8Akr6i0ZPVSAby8JmSwNmcaxRCi9t9F+Zxq16CHBS3g1
	 bpI1ILFaj01BjrMLIXo3D05N4PIMMRcS7aGJ/QMSYzPFQ9l3kPD332inF96eYsmW/H
	 LfEIdMbmu02rNXYD5xR1C6L35s7OVygHczqDktD5C8YN+dABhwC1Bptm1x3VUHO6Ab
	 FwVFEg6zdZffvkwQ2fpS7+SaDx4pjOe1okCgVqiKxq45Rro2cszAGptt4uFYu6568/
	 G3LZcFu79u+oTmZ6OrJTQnPIi9jLBizJiO7tloy5iFV/LyZNWRpES1w4iAX9SqRtI+
	 9M8qmq1tXvNMg==
Date: Thu, 15 Oct 2026 13:10:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v3 2/7] mtd: spi-nor: Wait for NOR ready with
 poll_timeout_us()
Message-ID: <2feb1fd3-bf16-4351-af81-6147864b75e3@sirena.org.uk>
References: <20261014154301.157755-1-paul.cercueil@bootlin.com>
 <20261014154301.157755-3-paul.cercueil@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20261014154301.157755-3-paul.cercueil@bootlin.com>
X-Cookie: Tax and title extra.
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
Content-Type: multipart/mixed; boundary="===============1331565846396891744=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1331565846396891744==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b6iKUdWCnCdvOrdz"
Content-Disposition: inline


--b6iKUdWCnCdvOrdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 05:42:56PM +0200, Paul Cercueil wrote:
> @@ -711,30 +712,21 @@ static int spi_nor_ready(struct spi_nor *nor)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
> -						unsigned long timeout_jiffies)
> +static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor, u64 timeout_ms)
>  {

The parameter is renamed but the kerneldoc isn't updated to reflect
that.

--b6iKUdWCnCdvOrdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQwtEACgkQJNaLcl1U
h9CuoAf/Tw7pRrSYO/PSfTPC4gBHGycF8EA91WDNbutq+Q2TSbutlzP1sUX0S2/4
PRYrTXV1xpmNQAczcTJZo+PtT1TH+UNOfZAVP2dffjMA/G5a5rPXbsNE1oGygcQF
0GbSAMUp+B7N4arGpwp2y8vB2sb8YMDW7XqlCHThgXPVO9vhBkhmPFLm2200pHoS
PplpwDU+iGzIwSHrqlLYItqbJT4/fVdTVvOerR3dt3IigS7lu4N43SScNL/cpAGN
N9Bwc3SBZyis4duDNxXNOY1Aw72/Um35L6FX50gVF0pmpEvuYPbAzfpV/3M28cb9
eD1vIT+p6gP4CDjVOmCsASFD5d5u3w==
=bIpx
-----END PGP SIGNATURE-----

--b6iKUdWCnCdvOrdz--


--===============1331565846396891744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1331565846396891744==--

