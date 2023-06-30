Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F12BEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 18:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMlfkuvTvtSJ6hSslTPpbSucqJa1IhsGrJ87QKYAF1w=; b=0iAKKEAuC3gJxjdFd8BRh4aCtD
	KR+JiBc9wgFYGi89xFyitALQ7bGsgcL+HkGNqIzj+v4T2SPSLfS36XoqYOMdHw+7RG/JmCZ5KfJyD
	2fGYzwiH2dJm/mGV4mePFBlA+OWsea4uHD/Xp/G5T/tjpen9CnbrpkH8iQrzvf0AoB21XyKZuq4gU
	VYr13cViwkgVIpWbRdQ1ywJS/udOCJcAQA/1wJMx34yjhJCNCsf1/vzfi7Ksd7hT8JQd9CEiKs9Wm
	1b5zIi9leO5ZVl/w7YIW02gjGnwtjTXB9V8kFjL0UYdC/sJ0bBPNc2b4dvSC3igpua4vOADOG+i2C
	QGMg0eKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIWp-004GV5-0N;
	Fri, 30 Jun 2023 18:07:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIWl-004GTr-2q;
	Fri, 30 Jun 2023 18:07:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5978A616D7;
	Fri, 30 Jun 2023 18:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFB0C433C0;
	Fri, 30 Jun 2023 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688148446;
	bh=t3UiunEO1jCFQO48ppNgdOs68jT6bdUCWvW91NbYvx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsolcNbxeIfKRUkDzAeIeP+FAczdcaxY7suAmHTs4REMOWIBxBCF1ivd6b5v67PKC
	 O/ykE2B6j+McmLwMcrmFgCimdsbzDsuSnraDCFnFhFMN87wOOLonGq9O10xX2pl8xC
	 i5tMXoVzZXj9ax33debb349/ap0Ppg7oOJbQFERZwLQRti73kS2cGvrPz5Vyy/2lDs
	 xmhLejciKKgYKuhnSUs2LCYvoIzAA17feKPjczCju/s9nM0X4zvJZky1faL30feOaW
	 ebCsLsWAyEhp6bvuZzyM0nJD6i4h6JmpfnuR2ct/P77xuKrMFV5WPUgWg0HGT4J9uf
	 Wz+gtnuHXHwAA==
Date: Fri, 30 Jun 2023 19:07:17 +0100
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
Subject: Re: [PATCH v2 14/15] dt-bindings: interrupt-controller:
 arm,versatile-fpga-irq: mark oxnas compatible as deprecated
Message-ID: <20230630-carmaker-tablet-da1516122b65@spud>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-14-fb6ab3dea87c@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-14-fb6ab3dea87c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_110727_959975_2B3AF9E2 
X-CRM114-Status: GOOD (  12.79  )
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
Content-Type: multipart/mixed; boundary="===============2276622370283456521=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2276622370283456521==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FNR50n0ttdoybkYr"
Content-Disposition: inline


--FNR50n0ttdoybkYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 06:58:39PM +0200, Neil Armstrong wrote:
> Due to lack of maintenance and stall of development for a few years now,
> and since no new features will ever be added upstream, mark the
> OX810 and OX820 IRQ compatible as deprecated.
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--FNR50n0ttdoybkYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8Z1QAKCRB4tDGHoIJi
0oi5AP0fOVGdDREXAChDzrubQUvnaUVdAhqsJYui9kW6ylPwiwEA3lkNSMv2oqP7
pXh6Uo+fuIM4XtY3n9BAm0Wmeq+jOwI=
=Bqlm
-----END PGP SIGNATURE-----

--FNR50n0ttdoybkYr--


--===============2276622370283456521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2276622370283456521==--

