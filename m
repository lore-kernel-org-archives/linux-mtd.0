Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EFDEB64DA
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LK4K7HA4PKv68tqTjxDVL03QL/OarQUuQ051uvyBNJE=; b=J5nbG8LanDeEHFKutEvYONHiTe
	AqQGgJ8mNx2TEWB8M8Dz68UQv7FombJmqzyOxW9+3HJHuuPbZpePrC6HOAuehInMMquDr/wvB0Lpk
	YHduFkFoRyGOGoUvkQgOl/ykOgH8Hxhci4Qh+8hqor4zFiR7LGhZqXmR0YvlVvj77DkK1KpKdjB4c
	kWamZhdIapKKo1GJhdoPqZDID3zPX36nMkuFeoHqtT7p0age3O+2/j88p71PzObnxoriGzsVI6n6C
	2qDmyl1h7/GFgH8EKP/qlBY8ZEktRsTgd3edQsvGrG0tZ3Hd7W6uECbAlGcg7Oo9HAxNJrLmKb4Ea
	bn5xl+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIWK-004GMQ-1L;
	Fri, 30 Jun 2023 18:07:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIWH-004GLp-04;
	Fri, 30 Jun 2023 18:06:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A87D617D2;
	Fri, 30 Jun 2023 18:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44654C433CC;
	Fri, 30 Jun 2023 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688148415;
	bh=yz5t1GiipNFNh1NtxgqisnUQ1CD8Mwvmr2prkm+aqsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h8BVS2sR9N6T9w9CrLbGEkLtZUN8hymR5Yfqq38a/aJIH/8+cN3LhWC1qe0ABBgYh
	 +WqBRGYdoQU6Nt3Hxgu274LZGxuj3dXTjUFC0gpadKnR24KWnwNss6TUOYs5HzPAgL
	 69DWTSkPmvlyIGijGGtVsdNgq93wlUFCgrMlNUyUbtwMMbYkbBTmdNaNRMd8a9wsOh
	 HHDYDzKOmi2CTL7ac6HlH4x3ONaT6UQE/kzzOtQfsAzzW63ScznY5jFrNSUqpfzIhG
	 AoZkWNd9IQDpbsm4pGf/Gu3vudY9yeH3x7B7zrg0vngrABIfRCyWMgg5e+S/ARWYIe
	 MIrXoY3Cv3KjA==
Date: Fri, 30 Jun 2023 19:06:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-oxnas@groups.io,
	Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v2 08/15] dt-bindings: net: oxnas-dwmac: remove obsolete
 bindings
Message-ID: <20230630-oppressor-circulate-1a2e5631d0dc@spud>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-8-fb6ab3dea87c@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-8-fb6ab3dea87c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_110657_098267_CBA7B88B 
X-CRM114-Status: GOOD (  12.46  )
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
Content-Type: multipart/mixed; boundary="===============5579710630494652370=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5579710630494652370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BvTA36mVIWDn/yrV"
Content-Disposition: inline


--BvTA36mVIWDn/yrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 06:58:33PM +0200, Neil Armstrong wrote:
> Due to lack of maintenance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 dwmac glue.
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--BvTA36mVIWDn/yrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8ZtgAKCRB4tDGHoIJi
0n34AQCaqt+oiyrpU/1VK5nJptp1QM1CruwCYZ4Kyxm+cqFlRAEA/3ZXE+gSBEOw
+/4RXjuoc0d0lEczRHPZqKqBpZdabgU=
=8KMl
-----END PGP SIGNATURE-----

--BvTA36mVIWDn/yrV--


--===============5579710630494652370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5579710630494652370==--

