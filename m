Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CF9E77199
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2025 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbhHm7U1oc1mUoSgUEOTDuhzBKR2dwWIVv7KfpbWcug=; b=ET2SYJPXQJmvFxTqhyvpWlviV/
	t3Q8e+B9YGiHix3aXJKVJKML6QztDoWanVy3eXJZV3F+DmfDLnKk98MBZGdcZ2FOnT+lV5cJsJjVC
	evGJ2qfRGrOXFJqb34IqwE6EyBb19k9Hlv3UgWhLZ7ZR+EEQO/Ut2tazy6K8BEBkmYqdS/pX211WB
	1kYbJ4Eal8cABJBLL2T3odudd9qrvlmxI9hlocx7meXP6ExJpcNUOFz7GrxUYUn7IW4DJYUvnaaBK
	QeKsPSYC92toYysBfiZn8HXS3GSOPlOdJjcsNUKp4zPJzHcfCaBQU0HZkDcvnJJZwm+8Seix94RPX
	zKe+aEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpA1-00000001nHX-1p5c;
	Mon, 06 Jan 2025 15:36:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUp9z-00000001nG2-0Zec
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jan 2025 15:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C98885C6011;
	Mon,  6 Jan 2025 15:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570F0C4CEDF;
	Mon,  6 Jan 2025 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736177813;
	bh=QwinYCQ2WjYTC2sOkCWAxpCU3ScrO4vQVvf7WAwcGsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWcP2euOlEdfcSXUUfE945mBDShiSXLQzL1ktnPsWHOpZNeNs8+eLxhIWnVvNcuNJ
	 K7337VpFEkdEe7g+KR40Gw1t8OFeFFy8oOUUnVOl3C5Bu6Mhdg/M2jSPr378ajnm0A
	 8626XTlWXH5tQQVEJWzzcNFlPD7YYQ9pBsYo+tCh+1Ek9On+3k2L/xXEO1O6RK90Sz
	 gmY12s3r8cy6cte2UhGuk9mMJ9TMmJvmKb3DtGapXk2IqFYUQgPMQvx6yTLCZLDFo3
	 zqKvW6Tibx1gM/+qnLncSGP1gK9PJri2objS9aUpcbFUO/kIp1UroTM/LClZlZOBIC
	 wmW50xvt+68gg==
Date: Mon, 6 Jan 2025 15:36:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
	konradybcio@kernel.org, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Tudor Ambarus <Tudor.Ambarus@linaro.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Michael Walle <michael@walle.cc>,
	Pratyush Yadav <pratyush@kernel.org>, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [GIT PULL] mtd: topic branch for spi with Qcom changes
Message-ID: <96bdefb1-4607-4a4a-8bed-b4d9b5971171@sirena.org.uk>
References: <87jzbp9hnt.fsf@bootlin.com>
 <87bjwkoxwh.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87bjwkoxwh.fsf@bootlin.com>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_073655_218293_34DD06C9 
X-CRM114-Status: GOOD (  12.63  )
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
Content-Type: multipart/mixed; boundary="===============8863870764059138169=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8863870764059138169==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqRwxSb805p5WCuC"
Content-Disposition: inline


--AqRwxSb805p5WCuC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 06, 2025 at 02:49:18PM +0100, Miquel Raynal wrote:
> On 24/12/2024 at 17:20:38 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > I'm merging the Qcom series, in case you need a topic branch to apply
> > the spi bits (binding and driver), here it is.

> There is a breakage on x86 with this series, I'm applying another patch
> from Md Sadre Alam on top, so I'd suggest to not merge this branch and
> wait for the next cycle to take the spi bits if you're happy with them.

Thanks for the heads up - I didn't pull it yet so as you suggest I can
just leave it and pick things up from mainline.

--AqRwxSb805p5WCuC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd7+I4ACgkQJNaLcl1U
h9Al1wf/Z38j6IMH2sQcchcR65v7clNd2dtn6xeFvosviIPsVcUw6Wsj5IwN1hPf
MMJBlaFeJHfo9zaiBJOmChI+QxHThedm9IkCTMiW79Xm3tOh2e3BVt/IeLerNPvj
J4oPZY0L3Qg8VLHwbBSFsTtrb/RLFcpFixplb4rBh2SoY9T6FvSxw6PYM1aaGcLs
zfmLo9l3UGtW3d+O7610V6aTzx++Ixig6dk5c9L8kojPvq/xgbYJmEuY8B/SL72F
eqDg+cUq9OFi75blmdoTc9d4dtcWr7xkwjqP1l9hW+v5oQgvwcwuuXVuFvPiRcU3
stfh6D6Mpd0ETLC2cop+97PBajux0g==
=SsOD
-----END PGP SIGNATURE-----

--AqRwxSb805p5WCuC--


--===============8863870764059138169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8863870764059138169==--

