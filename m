Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E01C072A2
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Nov 2023 00:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kyY97My+NkkNGI6WwJpeGXgyreQkgwnKHla6pCpmoY=; b=ABQIh9Ulk8TYuiFaVj79hmJxhL
	gpJBdj1UzulVqgGRUlhaOVpVM8jHXET6MnHQJ6EULnvx8x2neGt56fuEZF6mrmIeEuVpw1AT/cV3G
	x0GvdiF/xz1vWkGA6IFW1XdPs4ArNcAthZ943o2YSLCZMrcZflQNhP5PCmGamOZAyEmxj5D6DY5eT
	3VMj0lrZLN/WRs9DeEiWXgJYUJ60/nN6WovQ3MamqCg+1V4+D0K3QKwoncZCDbW7OX3FyXT6QNU+J
	WNo3b7unR5AepY7yxzEaoLWWQ5qcPgOiAubk7DjThf9eC3YTjBXGulTnSD97MhmoeL5bM6aQlYrhJ
	okVIohBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r49Ue-007dGs-18;
	Sat, 18 Nov 2023 00:47:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r49UY-007dFV-38;
	Sat, 18 Nov 2023 00:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 69FA8CE24B9;
	Sat, 18 Nov 2023 00:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF6EC433C8;
	Sat, 18 Nov 2023 00:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700268439;
	bh=YwEuSfGZ7ojP/5U2tC2NpapQhWjqP4EOmTbb1ZZs8/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJ8XljlaspZB+XcaGvZAyG9pkjA83ckeGDGVzvDZBn5U2nRTFgKamCA41aFSbku2s
	 HZINSaxrJrwtaUeYVdDfFuhjAoroF+tFPc4HJyN7lYe8Dm7CUg1A4RENsgm5Z8m9YP
	 r+BWEsi7tqhqjLIY3f+T6dH2qfGcf2DzYMa2FxHpOFs+jhef++sv0rlOKf1B/XRJo1
	 WuwwWEZsX1LLqMNCnYRyPQDV1CYUtTyTLImIQdkrGRD5eCM/ZqTeC/lArw4KT/L3vq
	 DbDx5ECXYht/Ma4n9tglO6TX+TTzLsfjCKRT45qtGbFQ5AUNz/HGJ5Y510RmelMbsv
	 uJzjloX6NwAvw==
Date: Sat, 18 Nov 2023 00:47:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, git@amd.com,
	amitrkcian2002@gmail.com, akumarma@amd.com
Subject: Re: [PATCH v9 0/8] spi: Add support for stacked/parallel memories
Message-ID: <ZVgJkzvMnopOsqr9@finisterre.sirena.org.uk>
References: <20231018213328.40131-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20231018213328.40131-1-amit.kumar-mahapatra@amd.com>
X-Cookie: Slow day.  Practice crawling.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_164723_214184_254E4A1F 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: multipart/mixed; boundary="===============0851064697925520451=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0851064697925520451==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r5uvpYN7krVaFv1A"
Content-Disposition: inline


--r5uvpYN7krVaFv1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 19, 2023 at 03:03:20AM +0530, Amit Kumar Mahapatra wrote:
> This patch is in the continuation to the discussions which happened on
> 'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
> adding dt-binding support for stacked/parallel memories.

This missed the last release since I'd been hoping for some testing by
others with relevant hardware - from a code point of view the SPI bits
look fine.  Could you resend based on v6.7-rc1 please, it doesn't apply
any more?

--r5uvpYN7krVaFv1A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVYCZMACgkQJNaLcl1U
h9BEwAf/VRlQwrkHLeoFYDISp+K+SZYmPqJ0OvYfI7oc0iciARZC/og+rjBq76ZY
rRJhX/vwm4ZroHv292scNztMg5MvVyd2G5MOhu9utieAIrC3QJQcZVb7+tONbLyA
7Owo3viONkjlTa8CMaK2VO6NsaVp0wD88ulHJel4lcvK4/zdiIwwN0VouEdjpmet
MB/1QwwOXKWf+ZKuOIvep1sSTtsZ1RdPjh5nNpXFJyT1c/f+NAWzIVF2/gWE2SDz
ZlWVyN4a3s7J24UtfW16OrPRTckkuSRbiHyYUKlETNrP4KLPlpbF49Omc+Wk0Tzc
fAts3F4Azz4JbVYP84LWEayeflJYXg==
=zI5Y
-----END PGP SIGNATURE-----

--r5uvpYN7krVaFv1A--


--===============0851064697925520451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0851064697925520451==--

