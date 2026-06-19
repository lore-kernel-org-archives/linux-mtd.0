Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE34CD98F2
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2026 17:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivAx2QToU8RIdb0vYLXe6SJmnDzoRLLvn9uacGDmalQ=; b=k8TNy2cF9D2q8zEAsq26ln3zTX
	nzQKOjLHlmQrufYs41NQPVe69A2XG1jt4xniWcsWP5JiV9F0D3/p4XrxMzgDcfuWtH3cdOh027bj6
	KDe8pkS+7K2NN5pM9JPzFrozdWPgmX/JVlmFBdvinqVdNlg814lrcTQVC4D/pUGc7g3rduG6Iap9G
	lLfR42A4NnLMe9TbGOJJD6jREmKFyKD8lHy7zEXhx+l4kZ4ydHuJOLsFx58HoYx5+3zHTRHdBnc1f
	Ohh935bqvC31xHV4iRAExFiBVP1KrQ5bAqW+IGbvjOtf36oAalig6ff65Riq6bF262gFUbPqOPLdR
	PriSv/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wad5y-00000002pg5-3IQG;
	Fri, 19 Jun 2026 17:33:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wad5w-00000002pfi-19dL
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jun 2026 17:33:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B6FC601E2;
	Fri, 19 Jun 2026 17:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8E51F000E9;
	Fri, 19 Jun 2026 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781890410;
	bh=jUAGYTKOtwMpNBSHQMUJ5aes50Gr7xk+ZO5i531tYG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nc02rNxNGB+A8xG3KABMWnBbTanTkHfoAO1dG+WRyE2ITIbzZRejVtJT+Y5ZAeB39
	 0Cx4+Xql/dyHXNrsxqTHCQTMWqSWfnmd09A0ITkKCJdX+rJf4fwPXoN+Qpj1OcCyVG
	 8MJFO3aQRYU+cckSsLKhh7P3u4HmJ3A9NctgLvdyEJtl2tHMlvxq0gTr4Uf4Kt4GiV
	 jsadi7RhuMv0WPAjdAwtSItBxDbQnM4hCZ7bQ4KfptPqdTPHoFqBYSOoQgMvHszDQo
	 EaoIsr1MSLjG7bey5jSmQZBRt5bBPf3734uSnn9WsoduQULWPifW99gLYFukuGwz3O
	 SXpfQSa9Q4ugQ==
Date: Fri, 19 Jun 2026 18:33:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	pratyush@kernel.org, mwalle@kernel.org,
	takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com,
	a-dutta@ti.com
Subject: Re: [PATCH v4 08/16] spi: cadence-quadspi: add PHY tuning support
Message-ID: <bc3d98bd-bfbf-4981-8c14-4ffec0f55f7b@sirena.org.uk>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-9-s-k6@ti.com>
MIME-Version: 1.0
In-Reply-To: <20260618073725.84733-9-s-k6@ti.com>
X-Cookie: Courage is your greatest present need.
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
Content-Type: multipart/mixed; boundary="===============7381164424922767497=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7381164424922767497==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="emUb/++xjn7z2sWr"
Content-Disposition: inline


--emUb/++xjn7z2sWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 01:07:17PM +0530, Santhosh Kumar K wrote:
> The Cadence QSPI controller supports a delay-line PHY for high-speed
> operation. Without calibration the PHY is unused and read capture relies
> on a fixed delay, limiting throughput at frequencies above the base
> operating speed.

> +static int cqspi_get_phy_pattern_offset(struct device *dev, u32 *offset)
> +{
> +	struct device_node *np, *flash_np = NULL, *part_np;
> +	const __be32 *reg;
> +	int len;
> +
> +	if (!dev || !dev->of_node)
> +		return -EINVAL;
> +
> +	for_each_child_of_node(dev->of_node, np) {
> +		if (of_node_name_prefix(np, "flash")) {
> +			flash_np = np;
> +			break;
> +		}
> +	}

This isn't going to do the right thing if there's more than one flash,
that doesn't seem a super sensible hardware configuration but I'm not
sure I see anything stopping it being set up and system integrators do
enjoy differentiating.

--emUb/++xjn7z2sWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo1fWQACgkQJNaLcl1U
h9CBbwf+JUro882D48ocB6LXQj2ooeWVcGnBvdpgmPzUwbsP7ETh+7BH1ofWUp8z
58gs3CxQfnlH6CosGuHQ14dJmr41Lc7YRjOMn56SFgJFnNiYN72XRLqT5+SQD6cu
D5Q/Wiv0oI7F1wSRMPyTU/8XWMxHFYl39mX4gqiI5Q+IcGzQw1SYOliNeZ4djAVa
FDkRmkvMJNphmQMgNyNbK3WGP9HxHI+6DKrCuliEcKDX2OJ/UBXvrw6JtSGXYavl
OtPcY2UsK8fwFKuLmPV23w6QBFVD4krToRNED1n+koRWwOuZNtQ3zr4nRYTZItQ2
pEOS4CCkI2cEPPu79/61uPeZ3IITVg==
=wojw
-----END PGP SIGNATURE-----

--emUb/++xjn7z2sWr--


--===============7381164424922767497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7381164424922767497==--

