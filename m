Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05135D5B156
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2024 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNBHvnd1EEfb5S90UV7x1+Q2/wgDAj8loowG55+1Ij8=; b=toKpVbcFg0ncp8MiqntTUqhgNI
	xEVua5KivWzk2vJTEGvz7P5fSVOXMwdfbesxJl5kUAFMyxkiB1rTHc+oQfen1vIvHodsAuoAhqZAP
	PjiwEk/itIk2rZSTf9Bn6UxwD0D+SYKlGt3SloC0/LtHnYzA3DHvSNxJDibJehnD++TAsGBSQrYrd
	/wpT8qR1aunpxYm/okvsDUoRVSt7qRrUjGJwSjwzWJyA4NWY95XmOY2PCc47V8BbliliMVdMXyS4U
	m0UuhUm/LZFPGmXgHCfZTN2gypracNNRdoG8sl1ISKeSg56cZF4qSvl0tppXkb27UQ5Z6xk9+picL
	Nbh+LDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X7f-0000000CJit-1z0J;
	Mon, 28 Oct 2024 21:17:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X0D-0000000CIMm-3GxG
	for linux-mtd@lists.infradead.org;
	Mon, 28 Oct 2024 21:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AAC95C5BC9;
	Mon, 28 Oct 2024 21:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6580C4CEC3;
	Mon, 28 Oct 2024 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730149816;
	bh=TenOVswCi2FxBf8paViD4gSc4Q9nfnp+Lxzukvx5Ggw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqUpI8Qt6dNFEsk8pUrus/16RKinKgX8UenlTxoGniCL+sPc8e4N2L6N7gnV0mYtB
	 WQAf/sa8+35/QyS3FPoFzIrhg4aMToWUYdShwyxU9fITfvoSsFyZv+WzEBv0SJu9Vx
	 0foLaYTM1fsXJyL0JhD8IzNW0TAnRhf5kBVtvyKGYmO1TRChsOdC7Kwap4VO2CkQRv
	 Tj1YRyEuyp9UWhvdJGZVim+rmPNlhru91IyahluHfcK5Kr/kTmmVvZ/S3Xg4VOezlt
	 d8/A8PUyU8rNTQGqk36SaFfwRuWlufY6bzO/L/kkVspPLdrDHAQr2y4+WGiyRb623F
	 f01CsxLYBLbpA==
Date: Mon, 28 Oct 2024 21:10:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 02/24] spi: spi-mem: Add a new controller capability
Message-ID: <ddad474f-826f-40e4-ba7f-410a088813b6@sirena.org.uk>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20241025161501.485684-3-miquel.raynal@bootlin.com>
X-Cookie: Remember the... the... uhh.....
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_141017_884282_BA52E285 
X-CRM114-Status: GOOD (  13.76  )
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
Content-Type: multipart/mixed; boundary="===============3081449858539813131=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3081449858539813131==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3rVIVdUbm9/vkM7Q"
Content-Disposition: inline


--3rVIVdUbm9/vkM7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 25, 2024 at 06:14:39PM +0200, Miquel Raynal wrote:
> There are spi devices with multiple frequency limitations depending on
> the invoked command. We probably do not want to afford running at the
> lowest supported frequency all the time, so if we want to get the most
> of our hardware, we need to allow per-operation frequency limitations.

This all makes sense to me.  I'll leave it a little bit to see if anyone
(especially people working with the individual devices) has any thoughts
and assuming no issues apply the SPI bits on a branch.  Does that sound
sensible?

--3rVIVdUbm9/vkM7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcf/bEACgkQJNaLcl1U
h9BjVwf/XF7IMIoYSYn6DyESYxB0+bQLaPzmZ5+0vRkDO0pKcu6VsAbWB3vPfM6c
SP1r9lk+hMsUleHIwVSmIUlnfti75RN9I9u/jB/wkGHxhQncExs/H2NvVe/qsoc6
QV73NmGJkk9xeTYPxW4i/m9sGOQAwWhj3DvRMZc4y5gFj3OJxVERC/u3VZfHwPJD
h/msp9wd2D7hDvbq2c6xdlMXaHx3cvtL0kRomSmGge7HiS52d2h4YB2mQjCm2ioc
4zrQLL5XWjmb4EBNvT9HvRCQ6htwC/4m0T22j2bV6YLScTMKizZB1rTb55skxQTT
VOlL2ZsbU3KLKMbBDACU0kefGf/cuA==
=LbX2
-----END PGP SIGNATURE-----

--3rVIVdUbm9/vkM7Q--


--===============3081449858539813131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3081449858539813131==--

