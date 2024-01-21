Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB858C47DB7
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jan 2024 21:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFPDg8fH2SSarUUDDqp98JUZjF8CSTiLXiRqs9XmxqA=; b=M/zRwTMWkEha2YMM5XqENgtbIy
	zeGJN/Xw6L5glTAySLh/tpm85dchoI+7IzvsozKBwBVLVKqQLMN2BpkT1eh+uPEuwOVctD4Y8YE/0
	kWffVJTbwrj5bPvvtvsOimUub89aN6qCBXI6VrbxjICa0eAl+W8kkiaJX66I02dlsVxwOzjv9ry2G
	ASsjpCONb8zXZGWt72nib5F6CPJPccN0DuO83jc4UiSh8cQgAivaIAyUuMkgOJ/z69YV0t2eUm9Yh
	I0KgSA2sPUfxx4uvn44RB2lbiEadgFMjwWdhxkHXrO9oT5iKhKrnJPgrm4I+lx8kYQFQdD5J/uBT5
	xhytpjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRfCe-00A3cS-14;
	Sun, 21 Jan 2024 21:18:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRfCb-00A3bY-1A;
	Sun, 21 Jan 2024 21:18:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AEA460EB7;
	Sun, 21 Jan 2024 21:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A64EC433C7;
	Sun, 21 Jan 2024 21:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705871880;
	bh=h45STSfPy1P3Y2GbWo89YV/iBga1C9nJ+uPwiQ9NLLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhR+7g+N26Oh8TUBBWHDR4e4Ao5+BO0iPfaqNrwoueieSZ2Y25fB5bmyNN4lALQOf
	 ZB6sWAyqtXi9S7gnUaSWKIA+mfRTZi4gUMswHz6vygxOk7mXg6jXDe1Ej8VqgW/2OP
	 XczGEJz/GK9DaABwFFQjEjhalev7oivpob93FI3hG8uWQ8Ww9CPrBSTxrfmkExenw9
	 QuSg0PpALT1HsFD/F1KRAM6hmWymcCaP8a+Virr5n8Hl+dneFGBqiIAV52bLtD6ChV
	 UuCldWKDA1SJ+lcg+QlLfmz2LOt1sFIR0gXw+LNycpe3MIiM5ryukpuPUxN5a3PvqB
	 bmy4uWMX+nlOg==
Date: Sun, 21 Jan 2024 21:17:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Michael Walle <michael@walle.cc>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, lee@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Message-ID: <Za2KBNsUmE6xRqD6@finisterre.sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
 <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
 <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
 <9806d99fab46c928f337b30b21057b3e@walle.cc>
 <ed1de0d4-9a88-47b1-a280-b872f6fdecb6@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <ed1de0d4-9a88-47b1-a280-b872f6fdecb6@roeck-us.net>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_131801_439653_123E1478 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1175306763544834441=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1175306763544834441==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tcmSRZRy9C5FJXV1"
Content-Disposition: inline


--tcmSRZRy9C5FJXV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 21, 2024 at 11:29:48AM -0800, Guenter Roeck wrote:

> So I guess 8 would be the absolute minimum to re-enable support for
> affected systems.

That's actually the number I went for, just waiting for CI to go
through before I send it out.

--tcmSRZRy9C5FJXV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWtigMACgkQJNaLcl1U
h9Bupwf9ElV4f82yrrRTlzrth8zQZIj8vOQ1sXS02CQRaCYayGxIcjYRGvRCtLvO
Rw0SV2fD+C7t+UMikK/3GPIstF42bYF7hpXWhIyvKXKS3jZiBE3Y21VQtvaDGVSO
oNkyDqph/hbwQ09ps9TUi6AC5LOQWHdm3QLM9pOrZ2jMr6z56Vge/RlkK4VoLHYg
PUIgguXVtDEK31eqYfmji9p8xByXg0B+88MH90buxC6H11PG2JIRnIMMTY95C8r4
VDiaT2HCw+nf36cpv6LbkMr68qARlHcdOA1H3bvy9ofNDbkkLcvV3q8cj0IDeDRV
xtlgLlOsbzrWoh7pcG6QTXtih3SIWg==
=X0HL
-----END PGP SIGNATURE-----

--tcmSRZRy9C5FJXV1--


--===============1175306763544834441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1175306763544834441==--

