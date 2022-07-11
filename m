Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71124C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+9pSwitVnPrzIzK0eTWCPpPgzwQY67tb4raL60LPcc=; b=xvo1P6A8FIq3IfSmBN0lJ+IK0k
	hrMvI6KyzCLwwbKt92tPSQCilPchBNxSTUfo/jZfy6MVKdoYSD1eO91znUG9ALqsWHpaEtFWNQu++
	uZ4eSiCfOaHVYb1Mn7zZ21flhvwlGEYzCi7XoYNYn5QhnCjaOViQ5JT4ekgZSH3JwDklPcqFdfgPA
	ZljmnvQ67KPKqo7tqROX+up4FCDeZc35mh2+JmDu8L6b8rIUqrkHD9a1pb4UL3H4uPWzfhL8+rktD
	ZQt0KRHlMVb4OuqWXIl/aNvdHg2cemt7Unxqb0QQH8mRYYZzCL8tB4LFHSzA7/vMnPwEG3qPtWkrF
	sTcHNV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAumT-002bgF-EG; Mon, 11 Jul 2022 14:53:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAumB-002bSi-Ex; Mon, 11 Jul 2022 14:52:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CC5C1B81025;
	Mon, 11 Jul 2022 14:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66C9C34115;
	Mon, 11 Jul 2022 14:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657551160;
	bh=T5/YgjZEyFa9qar9PBcP/h4QGGDW5ssEp2nL2da/rbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FruxfvHb7pRbBBKIhc4BZ4LRHPprizlmPVXQS1iaXTGP3mgGGgRP55lY90bNGTJnA
	 OT1+WTtiPEFSUVn2Tg5wAMGpjjG3usGRRsF6/jUH758RS/RygHWSHg/lMONF2Rqlkq
	 4X1cHCexjg+mTGOGHaJGJ6nPWWtvjhHaSnFpd3vYobOIzYlxPgZjnRkAZ/Luf40u83
	 0t9djetXzX5gMjB7V4yP0O1Gm/io7vVDjEJy3sg8p3PodwEUxchAZxGEksxtZB8Blu
	 sFcf1VXgD+ZN0cIf0lQtlo+upOC9x0DA/NjhmVkz2e4jveY5VCqFuBi3ES8Y2BtO4q
	 Tmr8GBBH/12eQ==
Date: Mon, 11 Jul 2022 15:52:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@xilinx.com>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, git@xilinx.com, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] spi: Add multiple CS support for a single SPI
 device
Message-ID: <Ysw5MpvjKM5LKvWd@sirena.org.uk>
References: <20220606112607.20800-1-amit.kumar-mahapatra@xilinx.com>
 <20220606112607.20800-2-amit.kumar-mahapatra@xilinx.com>
 <YqHfccvhy7e5Bc6m@sirena.org.uk>
 <40110ff8-5c19-bc54-759b-a51a919788eb@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <40110ff8-5c19-bc54-759b-a51a919788eb@xilinx.com>
X-Cookie: I am NOMAD!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_075243_668718_F2727236 
X-CRM114-Status: GOOD (  19.71  )
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
Content-Type: multipart/mixed; boundary="===============2479348139523740317=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2479348139523740317==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="myd8/Fo7asf/V7NN"
Content-Disposition: inline


--myd8/Fo7asf/V7NN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 11, 2022 at 02:47:54PM +0200, Michal Simek wrote:
> On 6/9/22 13:54, Mark Brown wrote:
> > On Mon, Jun 06, 2022 at 04:56:06PM +0530, Amit Kumar Mahapatra wrote:

> > > +	u32 cs[SPI_CS_CNT_MAX];
> > > +	u8 idx;
> > >   	/* Mode (clock phase/polarity/etc.) */
> > >   	if (of_property_read_bool(nc, "spi-cpha"))

> > This is changing the DT binding but doesn't have any updates to the
> > binding document.  The binding code also doesn't validate that we don't
> > have too many chip selects.

> I would like to better understand your request here in connection to change
> in the binding code for validation.
> What exactly do you want to validate?
> That child reg property is not bigger than num-cs in controller node?

If you are adding support for multiple chip selects in the driver then
there must be some mechanism for expressing that in the bindings which I
would expect to see appear as a change to the binding document.

--myd8/Fo7asf/V7NN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLMOTEACgkQJNaLcl1U
h9DUywf/elR3ZLKLxsB3PZJFT+KXa1Qr7NqEluE38DikQ0asVPDKT2SyDCuVZBFu
P1WzVgQFGEAjOkRrNtJYKBi8zPlGyjCp45MoWQeXNMqI/1jyNP0O9ewCBZH8rT2x
zhtyqxEFRWbPxdGdiNvhUodfbdnWjbE6tgt6XEgnJT+b9yqAUx13OGx5PK4tf8ql
Bg+I0GCGybcOmQgJ1DPuTY8l1c5Hs2sd3kHCdpgjtEjnSnD7dqOtDQ0lH2vSVVzF
1tlp1tSqbatA+jmgJSki0T/eVtXpiNHOWq/WBdjEx9nBu8YN28UR8iMVtxeua7Ni
i8DPKRKrXRFE6Qz2NK5U6/DYNEVDVw==
=ZBqB
-----END PGP SIGNATURE-----

--myd8/Fo7asf/V7NN--


--===============2479348139523740317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2479348139523740317==--

