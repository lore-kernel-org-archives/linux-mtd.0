Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C98EB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8CdtyKfe3Pu5O6Gn4s8c0MlwU0voCiRxJL1zMMB9jU=; b=JvLRDBgdM0di8I53Nhz/tPxk/g
	vXY0O2M5werUCe2JSyTaMxuYRICZyiyTD0q8AwsdEV4TnUq1/flsZ94fF+qFKDkSoaFJWfXKy0H6l
	NdIYf8s5YnO/ioNpMr0AWgwEghtdEORlN4bxTVojX5TDPfxLopgKVl3APu/DU2+pySShRpm4UGH2q
	hz8GlP/JTcUoUOtgk5DR9UE7ad+Qk5GBKz4n1Q0uBMbE73IpWDEpNZpnD7DjUokyzfs0BEJQqMNgC
	maiXvKFldluqj6VKRs2VymKTYAdqX60xm0bnH5kSWcijiaK4hm3CNk5AJoKiwL86UnC8yeELEGsBe
	Zw2z/o7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkCq-00A3Qj-2J;
	Mon, 26 Jun 2023 11:16:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkCo-00A3Pm-0v
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 11:16:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA1D960DDF;
	Mon, 26 Jun 2023 11:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12A7C433C8;
	Mon, 26 Jun 2023 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687778184;
	bh=9ayFCBj3MQtyKAKoLoTqh0KbhdeaXWiq1Cdbv5W5AVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwR9SI1mPvpmw1/mlLt3jvVOiaQj8T+wFQ0AP1YxHhtKdHbI5towmlwY58Olc4dLo
	 RRFjgTsgxQcbry37GnCqXNV2ITSDzzzJ/g3Yq30LnEE8cV5Ph9HXR6thlWSLjXryDC
	 61XZrChya6l80f6mjKvjNVXIM1qWtOSAJkOYHkjQu1/Bkrj5B2Th4e8/NXbB+axdfz
	 dPxVJH/TGX3wZDJspn6ZPruIVqMk8w2IYQ+1UQgvqpNhq+RIE4ngDUteqzKjnSdNMK
	 odgRPK5pnyqTxgXsXs9tihC6DkHd8DjTJWpMbmhgmqOW5ZL7/39BNsWx5e05wry/XY
	 cIiCwZ1csxa9Q==
Date: Mon, 26 Jun 2023 13:16:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dt-bindings: mtd: Fix nand-controller.yaml license
Message-ID: <5rup662p25xia6r2pdiaitqoubs66n4tyok4gklilk7aqebmvm@mw7ekpf5654w>
References: <20230622212415.3583886-1-miquel.raynal@bootlin.com>
 <20230623210508.GA1096125-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230623210508.GA1096125-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_041626_378725_EFE78C5D 
X-CRM114-Status: GOOD (  16.85  )
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
Content-Type: multipart/mixed; boundary="===============6095794237618615705=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6095794237618615705==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ayqqxbdxc6tslgyl"
Content-Disposition: inline


--ayqqxbdxc6tslgyl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 03:05:08PM -0600, Rob Herring wrote:
> On Thu, Jun 22, 2023 at 11:24:15PM +0200, Miquel Raynal wrote:
> > Binding files should be dual licensed, this file was writtent with the
> > idea in mind of following the rules, but the SPDX tag did not reflect
> > that correctly. Fix the tag so we are sure this file is licensed
> > correctly.
>=20
> Yes, we do want dual license, but things converted from txt bindings=20
> need those authors' permission as the txt bindings are all implicitly=20
> GPLv2. That didn't happen here, so we kept the default implicit license.=
=20
> Looks like this case is all Bootlin authors for significant parts of the=
=20
> original txt binding, so you should be good on that part (assuming your=
=20
> employer agrees). Maxime did the schema, so need his permission too.

I'm not sure how redundant it is with what Thomas just said, but for
that patch and any license change from GPL to GPL+BSD-2-Clause:

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ayqqxbdxc6tslgyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJlzhAAKCRDj7w1vZxhR
xdPAAP9p8kRc0j7S1e3EdWoZuCXO69Xvcs5qDnmzkbkcC2TdfwEA4kJf6AoMzR7I
bxwxTtp7zkU0GlykL+Jd/TDnXL7uwwg=
=UziJ
-----END PGP SIGNATURE-----

--ayqqxbdxc6tslgyl--


--===============6095794237618615705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6095794237618615705==--

