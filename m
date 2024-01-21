Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F6C47422
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jan 2024 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2uM1Vp9B/YfO+SfAvpmMUHK+JdrE9dP3fvY+dqTTgs=; b=2n52Z63xctZd5K6uWJqzZ6ZMVc
	/Us+RD9V+CQ/+eLNvGmAdcRzQUpj/1Gm9CuCQtoC0duXhGOIKDquGe1qWtx1NKAeE5Q7h6uEM38C3
	A6N7FtfazG0HZwdgr8MysbHYtKVIR4ZXlkefpjStkDIlKqxSibg/JK/LwuA79JvJ+ua6pJEiKsTIE
	ohRHQRxVSp3aAJkbgjZ/K2i2LUQA4NALM2mp61pGMGxjHWBK/4D2i9XD4KDj8qCuoS1FjdeIb0+xA
	AMT0BN3ZvsV2pYMhbnkQmg92dxhp+gYEu9I+4+2767gc7gQ+RmcQOG8NxRzoTZAt5PgOXGcge/4UF
	RdY6N5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRfAM-00A3JH-2L;
	Sun, 21 Jan 2024 21:15:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRfAI-00A3IX-2l;
	Sun, 21 Jan 2024 21:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 644E4CE1FB4;
	Sun, 21 Jan 2024 21:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3723C433C7;
	Sun, 21 Jan 2024 21:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705871731;
	bh=kpFY2RXVxwUhXk4eqhD0utH+s2JevbcgTonbpZsQyvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUmQzfNE5I476xwm15KvhWPBP+M6mlMealJoyw1XtxiG6Yy5zlZ3WeOGe47eQmy7b
	 tFy5f8Jwl9GEjM6jI8ebZVaSu2z3bQjFzx1yFFlufOZP40a4bc4zOZEmcx5lln1F7S
	 REv+swQPS+/xra7QSSyTUC+aJbURXZr3P62O02R8ccwMmKL3wgCEltsFSqeq6GlLfE
	 O9Ww5VwTsLJ+AxbWMglQ0+2iLnfhPlEzrnv6/0rH6ahcnSy8IQEh6PiOpKyVI7Ok3/
	 fO7C4DZ3HoeUzkyY+Om7H3wbYn1W9zy4yufYp64gWZ8oM2OQCv8ftDeXWO6gqw6TRp
	 UTbxPzcQGeZdw==
Date: Sun, 21 Jan 2024 21:15:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Guenter Roeck <linux@roeck-us.net>,
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
Message-ID: <Za2JcHQNipO2qK60@finisterre.sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
 <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
 <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
 <9806d99fab46c928f337b30b21057b3e@walle.cc>
MIME-Version: 1.0
In-Reply-To: <9806d99fab46c928f337b30b21057b3e@walle.cc>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_131539_091393_82FCADA9 
X-CRM114-Status: GOOD (  12.20  )
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
Content-Type: multipart/mixed; boundary="===============8352119007223296759=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8352119007223296759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jaYudf2Qatjg9XbQ"
Content-Disposition: inline


--jaYudf2Qatjg9XbQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 21, 2024 at 07:06:31PM +0100, Michael Walle wrote:

> Given that, that the rest of this series is under discussion (and esp.
> whether
> it is the correct way to do it) it might make sense to just revert the
> picked
> patches.

The API change in the patch is a pain out of tree due to the way it's
easy to add new things that miss the helpers without it so I'd rather
keep it in if possible.  The underlying implementation does need some
TLC though.

--jaYudf2Qatjg9XbQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWtiW0ACgkQJNaLcl1U
h9BQswf9GyF3//21FvfdPQIKhkExHr2h2cGzlMrSSeuagdoyh+dlJPQXC4C/poic
vpt9904btt6ubjlnpp3LJhtEFky7nLQQiRCYUMXZoLJwZ556Ixk0GQQ844SMI5h0
Frz9fUTXkKW24um3wXkfWA1KHEK2obOTAZzlP6KqnHmkwzRMWbEvWGG9OXGXmNL1
HwWa+Sw/HmdcYUo1gYwUY/Sy7SDTw4/vJDTwQMxiC/uPNd60FrRC7Ia6qBP+vUD2
QzwRmme2U+gfLbWSzrkYYPqGsKYQYddgz0Y1BMspZ1Ptvw00somMsz4zMqxOIKQN
K0Ao5bjbuOFXpRh6EulWQonrG0tLCA==
=Na53
-----END PGP SIGNATURE-----

--jaYudf2Qatjg9XbQ--


--===============8352119007223296759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8352119007223296759==--

