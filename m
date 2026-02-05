Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF6EECD995
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 19:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwPR3JTztBfUXI1RPe3ErboHniuj7/cT7VEwpFfTgds=; b=N1JM/u7awJgeg1afLGSB4SoLVS
	ii84xt2nz+FQl5DKhuG8kifxUFuK7Z2dvfzJs69MTcTiuMRDl+uUvinmLphwRHQhXYu7x2z54+3bv
	VMVAPGr0dxBXc8OCMrCUVajB4BiNQ61PYRmaZ+hzSYfFcTfegH9wffx7EQQ0giuaiFiyyU7Xcg8KN
	ejEkV7qUJIQK5St3fxjf0ddLj57AHLbWyOZ7ZTVQ/jJkXtMArCvN1D5E/wBXkr5rhh3z1y187X3AM
	srIEnuube9i5s6PwHe2ugbeUkVVqVkBxDV/xTo9z7QxLZ51Oi8nl4UMwtwqxD7Z7ICNxwsqsoImLl
	Wbn/E6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4lj-0000000APxJ-1wsl;
	Thu, 05 Feb 2026 19:11:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4le-0000000APwx-0NSy
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 19:11:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 604E24388F;
	Thu,  5 Feb 2026 19:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26EAC4CEF7;
	Thu,  5 Feb 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770318711;
	bh=Jdvd9biND/r/WdJrI+oQtO2ma4r8HnLxLMFiFKljoGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1NgKviaI4JOd1E8pD76RmjeItc+e94R9UbnXP1I+nyqakLlx6/YENdvaqUSVj/LJ
	 fd8xjPcJ1LqK+5fApY5852xi9G4JcGRtI7KmEsqOGM9XHjPpGfBjRNQAVhN3poeOTw
	 vgvH3isrJxqTp//AGHRV6k026/WL7b7UXP+7KCacznQMs/IAt4rx4gSax+E5Z8gFM+
	 XGDzdbQ7QxIp1J3n+pmc5rhQEOAQN2PaAC7y7nC9xum6ciP43yr+jVmYwBHkw7UFMS
	 a6JTa55F2titDZFbzBBTZFS3TyiWjt0LOKAmS+NuY+3iuI3Gk3EiSU8jn39fs8X5qs
	 T6vi/UNcXGWNQ==
Date: Thu, 5 Feb 2026 19:11:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com,
	u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 1/4] spi: spi-mem: Flag DQS capability
Message-ID: <9aaeca54-292a-42f7-90d6-a533ff1f5022@sirena.org.uk>
References: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
 <20260205-winbond-nand-next-phy-tuning-v1-1-5e7d3976f0f1@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260205-winbond-nand-next-phy-tuning-v1-1-5e7d3976f0f1@bootlin.com>
X-Cookie: Non-sequiturs make me eat lampshades.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_111154_162561_E9432B95 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Type: multipart/mixed; boundary="===============1884100740851243149=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1884100740851243149==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="24J2+o9y03R8IWgG"
Content-Disposition: inline


--24J2+o9y03R8IWgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 05, 2026 at 08:06:58PM +0100, Miquel Raynal wrote:
> DQS is a typical SPI memory signal used to help with reading the data on
> the bus at high speeds (especially in DTR mode) by avoiding clock
> skews. The chip generates a clock signal synchronized with its data
> output fronts, also called data strobe.

Acked-by: Mark Brown <broonie@kernel.org>

This seems fine if the rest of the series is fine; if people like this
approach then it's probably sensible to merge along with the MTD patches
using it and then send me a tag with the SPI bit for me to apply the
SPI driver changes.

--24J2+o9y03R8IWgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmE63EACgkQJNaLcl1U
h9BNjwf9EUEUuHY+UB0cc4qKd+WC0rtyswcboXBt489rM6eND+4A6ZkjdoOZ7QuQ
KiaxQpPtbbTkDO9lfadMjHSk/jlEX+eZjF+SIYFcOYJ7L2ycEpcvIzsjuz2Kfl2X
07ZyH+I0nW9rI7Er/o6ceAeuS3G7b0li69IJ4yO9Lc/YWe4J+QA5ZeR0Zu10vkr7
9t1xIb2G2m1dIpAwTlwMYe5MrmpyYNwLjcAooykRvw7HHi+pKvCMS2pOBSljZzkk
kBasI38h4e48hUVuOzbNUVh3PWtyCI988FeD55mMPVf5ANL7ZI+TJLkz1YLtQFL8
psAixJqHyXyMLpXqTi9fx9+81IAohg==
=TaJd
-----END PGP SIGNATURE-----

--24J2+o9y03R8IWgG--


--===============1884100740851243149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1884100740851243149==--

