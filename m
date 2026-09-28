Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF5CA5FA5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svncCBQ7RxbDVtjs9coehqCsYO1qz7BA4AIGAZMEVFM=; b=Pv1g61yDnn6hFV9s0BCqWQO75D
	LDQ0bkiNV1kTgxPfk1+cKhYnhbI4GvTvaJ+0Hviw6I3NEuUjWUBkqBXHi4eE2HBpP9SUa8tGYdjZq
	Gq55OdYe0cTFvNtC+wJx0jbd7MERmPVDJbz33lqjWQRfaUi2wIyHIV7MAL8Nc8IWeM+ls8Ef0BdRw
	XcpcT4VQdpSbiV1kk/h6JYjiiwHhVvz12oUZe1Dx6nOyJxhpbVm7hxRZldXBgO12VYh5mIkjc0SIC
	/hN3i9aNM5Zo+UDs2psSL/zoiL6JTc9tAPyPPQ1OcgJRAj/hJkVwEG/vgDmVnMyouvXpiC2suMxq8
	Uw157kqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCyL-00000000rBy-3sIi;
	Mon, 28 Sep 2026 15:08:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCyL-00000000rBj-10XD
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 15:08:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A86624396A;
	Mon, 28 Sep 2026 15:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E681F000FF;
	Mon, 28 Sep 2026 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790608132;
	bh=v+86pY99f9Mrk7cH2S6hh0JxWIlKV8Q01gKUQP1sGWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrIN7/Fe/DLtQMb4ZNm93wXqsYFbgZeElpI+rGtZ5FEkbyc08On+5BqSICFngypW0
	 Wn9r4L2c/HF0KZQ7YslHfXuHYGlPfwwdIW5cXwsawmYrOf7laDvSRI6o1UvU66SkTj
	 Bowb75sMWKbVFCVdSw/ux/c6UddG0982SuKxFtH/XjiFy5fKm8tbW2J1/OCHMLE4c7
	 BPMAr247e92qEKeQYtyEWtUedJhYtjxlkFWMVRH3kLjYsxrm89A6Ita0sfWwSaYvoD
	 iVFXNE6CAou63jcv59q4fVednKg66VZhM2P6DJFBC8LlKVYY0/L6RlyKRa+o6lXRwE
	 amU0fgU9l+z7g==
Date: Mon, 28 Sep 2026 16:08:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>
Subject: Re: [PATCH 0/4] spi: spi-mem/mtd: spinand: Prevent SPI NAND
 continuous reads on am65/am62
Message-ID: <38290328-a562-4813-a9e0-2fafaa3874c7@sirena.org.uk>
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
 <878qa7dzke.fsf@bootlin.com>
 <87mrt177km.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87mrt177km.fsf@bootlin.com>
X-Cookie: All is fear in love and war.
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
Content-Type: multipart/mixed; boundary="===============7556827951272007391=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7556827951272007391==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UW2x+p4caSA0vA8C"
Content-Disposition: inline


--UW2x+p4caSA0vA8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2026 at 04:51:21PM +0200, Miquel Raynal wrote:

> It seems like the spi bits have not been applied, can you check if you
> can still apply them? Without these, people using this controller with
> continuous read capable devices may observe spurious issues hard to
> debug (due to the CS possibly not being kept asserted during long reads,
> leading to the continuous read being cancelled by the SPI NAND).

No, they don't apply to even v7.3-rc1.  I didn't see the immutable
branch mentioned in:

   https://lore.kernel.org/r/1FyLxEwWqNFzX@sirena.co.uk

yet?

--UW2x+p4caSA0vA8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6gv4ACgkQJNaLcl1U
h9DudQf7BuWfGWihFlF2YkdCUNB4BRnTbzaO30+LUfjJ7Qwcy3qf7sS/X3hyPTuH
WtJoIY+UOpk5OE3Jl1PuBbcZqV8cWokcXCwQCtHp/hROw1fLEHQH0UiKqABUe88C
2x3PINQRmgINaSiImDEPzH+8epIU8d7v2TGEUwcXdNA7JAkFUZQrDoInDMeF+vDp
68O14Y5djmpT3WLf53E0W0RtUXwAlyCz8v2/VcUs+EoOTaR+PzAkiF8+ef/Tuibp
sYzA+bEMbBeqPegks8mItzFKIJA90Tflv+aVISYFkoJD7dC9BPCZVD3lIg7a0G5q
CYlhzRU4XF+6P5DoHPLccd3TbHFP/w==
=hVRM
-----END PGP SIGNATURE-----

--UW2x+p4caSA0vA8C--


--===============7556827951272007391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7556827951272007391==--

