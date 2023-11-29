Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A96C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 21:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+wpHtlDiyjVwEbPKrT4HXqtf1XOfHUUZvjhh8zXOHU=; b=yufPxk08U/QR/Ix1kGlxKnEQBq
	8JqolDffhqaa6rbz3KHnH2uxFBzEaP/K6aqUWjD9GgbiNjFPiCTVD5Qgmig5SpHOl8BKSIohXsce/
	ptDqY5DHZLeg9hH9S3IlQgK51o73p+M5t835l5MMMXsye0jAlLZVuP3JFhQkdQNCW9m2WQ/axnWIF
	7zpjW+7fiyIzxVF/XX6XmGe1dAmMuYUGnjlj2opJIY6vVMz3H6Ux6WP9WM4UZbvbesLyy9GCMaYq5
	v+P8dFp/ME1aR6uGbfqyTUD7Neq/nAiizl2Zv3Rjw+pQ0VJDOfLBDpCjDapYhYBpWBUatEYBZ2a3p
	9ab19vcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Rxr-009J2b-0K;
	Wed, 29 Nov 2023 21:19:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Rxo-009J21-2j
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 21:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 57706CE201A;
	Wed, 29 Nov 2023 21:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61002C433C9;
	Wed, 29 Nov 2023 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701292757;
	bh=/fnIy3jD+36xv/6RVbKvsPzVZU//UMZaIm+uyGyKuVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJGsY37qWAKZiaCPTj8usxvNJEo9ZjhCkmSFdb3EuOQP8O3tGp/pzkc8CgKfMQexL
	 AzgxmckMb+VGbyGPYDZBGEKN0mGNEM3oRIM+Md8q4qyDVQ9Mp+E9THhxalSeJYPVA/
	 nyMkErvsc5Q81ne41oYTE6NmOXl1MD5mM6aQr3uhd9CPha7TtcXcyys8c0UD0bYSgD
	 MW/pdtMIwTbu3HdmHS7t7nOKdDu3orAeP/eEsZSD4uJ1hRuWUjBMtflrftYnD3PPmP
	 MbnpP1ow5fPamK7cxRxJQX8fD1As2jOCKtYZCSq64maE9juW70AWhPoUFeDboMvp1G
	 a72GRv2mLlyCw==
Date: Wed, 29 Nov 2023 21:19:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: AceLan Kao <acelan.kao@canonical.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Mario Kicherer <dev@kicherer.org>,
	Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] mtd: spi-nor: Stop reporting warning message when
 soft reset is not suported
Message-ID: <2e88fbd7-64ac-41a1-8368-edd430e86e6c@sirena.org.uk>
References: <20231129064311.272422-1-acelan.kao@canonical.com>
 <20231129064311.272422-2-acelan.kao@canonical.com>
 <9c97e28e-fbb8-4a7f-8205-821fcbd579f6@linaro.org>
MIME-Version: 1.0
In-Reply-To: <9c97e28e-fbb8-4a7f-8205-821fcbd579f6@linaro.org>
X-Cookie: Are you a turtle?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_131921_091691_80FEA16D 
X-CRM114-Status: GOOD (  11.26  )
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
Content-Type: multipart/mixed; boundary="===============8741460403021819940=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8741460403021819940==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7YWgVhkvHWbLOpD6"
Content-Disposition: inline


--7YWgVhkvHWbLOpD6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 29, 2023 at 07:46:02AM +0000, Tudor Ambarus wrote:

> You haven't specified who shall take these patches. Is it fine for you
> if I take just the SPI NOR bits? If you want Mark to queue both:

I can certainly take both.  I guess there's no build time dependency so
we could each take the subsystem specific patch, though there'd be some
bisection drift if that happens?

--7YWgVhkvHWbLOpD6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVnqs4ACgkQJNaLcl1U
h9Bfywf+IhNs9FBX4arNA6V1SfNZlB4veB+gZpxcSWRk0wMv7//dofmoZXk9dEee
9dSuk4BjfDCsrfhbwbDY+3ieYDb2zZtxC3Zr3Rhfq8Y2e2amI5cRhc1x0XiQ60aZ
F9l4e2NteA9xPCZx2+IiE2tZg/guvNe0r1YgNM+iB4/yamLg/guVjCxpvvHPO1Wy
rpvn4WEUdrCEDAV7uk9dEtswP4ikWJAaWikmiZZUkto3f1pxhuU8g27GwJf5O7kI
a+wNykTKWEGa7Y7OS1wp+KhkrGlzz/L4e2oLyI9jT7QKw02+mR5PunZLOB6BcPv4
cljHGqo8YFG8eNl9P7dbAlsK0ZVpRQ==
=nOsL
-----END PGP SIGNATURE-----

--7YWgVhkvHWbLOpD6--


--===============8741460403021819940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8741460403021819940==--

