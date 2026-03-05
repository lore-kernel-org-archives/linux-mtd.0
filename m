Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CA3F513E1
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 22:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3y1Rzc0drLYvvHn5zZ7VGk7BkqSkaa85a11hGncy8o=; b=oI3Q1P0vG7ixejJuEuA0+kOmIJ
	jFMI2XMJCimYDrmYMQiTMqHSkQgSd5QI0Ag42SteB5Hi7HA9S6NqeezcNEmgawksB/aA4UWyrekd7
	FP5riMSDhbOozmvzhsvhwYwm0oFS+pFoHwktCDKI+eozyhATZbK2JLQxU+fD5lx6MpoeB0bM0YVSJ
	QamA/Wi25T0jpwNYxKGIbUU8PdHjnNJfJzrBJLbDf0AG+TaTO9tszwzT965dcW8IW3qZ1Ip0+iGF+
	9EmyviCPgQP3shvdphpSg3TF3tHyTXaUz5xa+V6yQoBh3DLbW6z3vSlp+V3Fg0GpTmGxtJxlYM4Pe
	qll+Kwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGxk-00000002dDp-3AHy;
	Thu, 05 Mar 2026 22:14:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGxh-00000002dCI-2u6i
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 22:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDD1860127;
	Thu,  5 Mar 2026 22:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BF0C116C6;
	Thu,  5 Mar 2026 22:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772748868;
	bh=w9TjvGcKwJt8/ARHSEztsvDfZLAllFDGqn1q3g9Xd0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8LIfBUNHfNlibr/LWwaJVc97mlmmpka3bZTOtYcYLewV61glSEY65BPIi89kVjse
	 aktYtnm8J8wbRpWVH6pQlpHVXyj57XCUBqn7uvSMs6oRTgTNTEvdFG0o9X9MBJBhjf
	 H3JgF4iPNGjmU2x/kKAIQXB9q0kj6ByzShtSMNLC4Rqj5BLZ3irmhbFoN6G4hooGRS
	 h6nqq8pycmsEKZ6ywT14M4laQkXWpZ0o2NgkM4lRgC0WWAGNIbIZ5cJxu5NsZobzph
	 LbbNyAhJ73PMLjO3VyswNRriU/pQS+AxYFPQx8gb3YuZe8C6mHDs/SvfpDV9obO1wj
	 ffjs0SNWQKyIQ==
Date: Thu, 5 Mar 2026 22:14:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Han Xu <han.xu@nxp.com>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH RFC 1/7] spi: Add 'rx_sampling_delay_ns' parameter for
 clock to RX delay
Message-ID: <c5c762db-86f5-4ca8-b2da-a7e0b73b8f27@sirena.org.uk>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-1-9326bbc492d6@kontron.de>
 <20260303210131.2966214-19-Frank.Li@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260303210131.2966214-19-Frank.Li@nxp.com>
X-Cookie: Onward through the fog.
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
Content-Type: multipart/mixed; boundary="===============1091475955077913923=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1091475955077913923==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b1uVgqjIjfycBOiD"
Content-Disposition: inline


--b1uVgqjIjfycBOiD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2026 at 04:01:14PM -0500, Frank Li wrote:
> From: Frank Li (AI-BOT) <frank.li@nxp.com>

Please add a human step before sending these reviews.

> > + * @rx_sampling_delay_ns: spi clk to spi rx data delay

> Comment is too terse. Expand to clarify the unit and purpose:
> "clock-to-RX-data delay in nanoseconds; see tCLQV in device datasheets"

I'm not sure restating the unit in the comment as well as the name is
super useful...

> > +	/* Transfer characteristics */
> > +	u32			rx_sampling_delay_ns; /* clk to rx data delay */

> The inline comment duplicates the field name. Remove it or expand the
> block comment above to explain when/how drivers should use this field.
> Also: is u32 the right type? Consider if negative values or larger
> ranges are possible, or if this should be `struct spi_delay` for
> consistency with cs_setup, cs_hold, cs_inactive above.

...especially given the contradictory feedback here, and the comment
about a negative delay is obviously not appropriate.  I'm not convinced
anyone needs an explanation of what to do with the field either.

--b1uVgqjIjfycBOiD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmqAD4ACgkQJNaLcl1U
h9AnSgf/aUqkU1qA+35Es3IE9yRd/Tn35gI+K3cIbQwk2tKVgQ3JnJBxhVyqE0XV
RCO3HXJTjOF/G+5OUcCyE5O0fPnHv/83+tKYdO6gteK2qDmL4FQOoxEo7uyhck0A
wCEyYwQ+mA30wOE8S5d4npnhB9K1aIw1gMGFjvUfWUc2gHysTVL7mJOM7oo24dCB
kbfSgaXXcavf8j8YQQLMzjuJ6xAAYf0Rkgw6cNr7nuxI3bUK6jJPY1z9FpcKj6rT
MNcV9et+BaiGEpoVKmx8sGybIkhD9XNHhFHJLlNLi9LKhsVhzzmGQ/n3mUmpaeE1
8B5vtuGNBMwiL4K5tZ/FoXEL0RhlaA==
=yiHr
-----END PGP SIGNATURE-----

--b1uVgqjIjfycBOiD--


--===============1091475955077913923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1091475955077913923==--

