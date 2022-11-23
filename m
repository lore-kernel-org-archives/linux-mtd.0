Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7BBC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoWSSPcfCf4Oo3c7zcyMHF8dlzQlI2h58L44Z78TO04=; b=ZjNboahht5Bd8+JiDz6wxnbVaR
	B1BuIu7bkWwRs6gEMbdMZCT6+SmMkqerOdOhPyZt9IVpfjnHwl5sbUrTs4V3FGlsM4udyuumGu7yg
	r1hNDUZNgSiafIlztuOX2845IQ+XyXfsHFG236Fo6yek5LzSHDKB2EUfzGNtxMFbzVZT9QJ/c066C
	ocSLRuv7SeQdVlc9RW4p4wBR8qpC9mMkR9NkndrckF4hW8rGG65/ZWBNa9fh5PvTaWRo9vULQsOpU
	hPuTucV9w92fckpWEDG5PzkO5WSOWMAp8ZVAybwjCHwLDqAKrjpHaOun4RF9L1dmc9Mj6Cf5kETuw
	cZfRf5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxs3x-000eTP-Fm; Wed, 23 Nov 2022 15:53:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxs3V-000eN4-RO; Wed, 23 Nov 2022 15:52:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72D6861DD8;
	Wed, 23 Nov 2022 15:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5EEC43144;
	Wed, 23 Nov 2022 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669218776;
	bh=ZtsEDAGH6M1Hm2mKwIp+nkyl3EOfULlsa+PR5Jh+/yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCYae1otHmgUnvQhYydPYexYhzz0miYjM4zpf8c2mnxAms5CtVYUfAM7tWuXKgBlL
	 NCzjlOivqXZ6UqIGFo6Q3BntqxLP3hoWG6T432NPpsWDwgRF2tNVlSSreyLi6w5epT
	 5yRu6zDAJOHqLx2PKvtXWr2dbpMJrrYdASELSXDQ7oXGnQVROdJjqD20wCxJmK/TbF
	 LxosEZjoFf2ROozxpxjVeaVFcuzQLwzX93rS2p4/AwotUvzWq5hYJvRgCJVOQBQ8wc
	 Y+r3iBPxcrfDRitsbVrK4soZK4ULKoO7A7tHxHwHfbIwT8fluQgTwO6NOBHUOHbov+
	 PWGuJ73a1veDQ==
Date: Wed, 23 Nov 2022 15:52:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 9/9] dt-bindings: drop redundant part of title (manual)
Message-ID: <Y35BzU80hf36eRyo@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
X-Cookie: I'm rated PG-34!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_075257_955665_20CDCC5E 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: multipart/mixed; boundary="===============7702676410835442925=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7702676410835442925==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QAOhPtWQs4kr9fZE"
Content-Disposition: inline


--QAOhPtWQs4kr9fZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:15PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding" or a "schema", but instead just describe
> the hardware.

Acked-by: Mark Brown <broonie@kernel.org>

--QAOhPtWQs4kr9fZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+QcwACgkQJNaLcl1U
h9AXjAf8DK+4g+6i+PYcdDNKGnFY/1uo0vNGE7MKgsNgIAMn42Y9Tw++ts0ZwHYw
EDuQqMblUcsp9NKWMs1LVsvQ2YGAbZUXjgUzWpiImszGWwmUf6DZkjwNojGA5ngh
GAGhKyUYUGXRb0MKJ1X4O3pobituSQSnz8UWlDrpBOO2OiWnWvdbURWlhNYNqMSm
70ahwExSo8nv/Dxkvf+GV0FHLToE5K4JZxqRh/Gn0l0206IYzY4jvEbCq0DEuZPH
Jt7Az6phpVvce86sAHnvukNdIa0EQ/8pR+v9idvZiGVY5NJvdJA54BR+1AoXlMna
RQueknzjRrsbdQSr0xa/wr8lQW5rpw==
=Wum3
-----END PGP SIGNATURE-----

--QAOhPtWQs4kr9fZE--


--===============7702676410835442925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7702676410835442925==--

