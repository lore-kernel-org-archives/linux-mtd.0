Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81325C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 15:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJIb2Ae1wLfquhx7BnKQnDjx/esDuo+YvWB6v4SwEHo=; b=Y3X6CQr3a0i35AzUumzUQHLaMc
	BxFzcRq6bNyjKhBQfNl749o7UPTSDTuBTEyTc5zSF+rZXNmLejm6ogQwrMnQYLm5ejgKm1e1dhL1L
	snRrp733GuTAIwwZw3HykIg/3uhpR6IZp9MK/c6l6Vhxi5XuqpzidhJiR2HCQJk3P5pVy9Ap1cUzn
	M5fYHktwg2oqk+gfrXo3TeyLU/gPeJsEfDc7PF8WYD4KWqhb3/jKngRQlYZTh7u5RN8xE7nwBCGis
	sGriSuXB/11MPaIdd4w9xL2t9hElv6g3y7dJZGwnyplU1lJ1LdtOYbwKu5aUuIZYYyVXjDy3ge3oY
	QuikHrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxs0t-000cMo-3C; Wed, 23 Nov 2022 15:50:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxs0N-000cBM-Ma; Wed, 23 Nov 2022 15:49:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E984F61D50;
	Wed, 23 Nov 2022 15:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5620C433C1;
	Wed, 23 Nov 2022 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669218581;
	bh=T0mf0ijZQTzNBNeBPF5fkFm6qTXOYlAmsvGjPYhocZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYvvVVFg3xABYgJQEwfoWni/oYrfqNnbcqqcQVrcp6uxcLqxAT3Hv4qpUOukDjTs/
	 0p7LoCYEfkSeEAiiX+7nrXQkbqjw1137EJi8AGbebG+uSGbSuFWy6ItixRDZdgYjzd
	 wI4+oGGgg+c8KPKVUQ5ZdWR+K+nR9Wh8y+eMc16I0PC838GB+J3v6zlQjhWOtg1c1c
	 6e5RsTLcd6FqRQaHdPekbba0bcco/SKnkdwTGzLKgRh+Lpo1he1WOZKJOaw2ZEIIXQ
	 GRY+SoMl3sj6Xk7pnSLZNQi8V4EhDNugotUmyQAc8a1pA6HLWIGeNLAtS34DQuw57+
	 eXjalnxk49wTQ==
Date: Wed, 23 Nov 2022 15:49:30 +0000
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
Subject: Re: [PATCH v2 7/9] dt-bindings: drop redundant part of title
 (beginning)
Message-ID: <Y35BCpD/tr/7prMh@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
X-Cookie: I'm rated PG-34!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_074943_794979_7F97633E 
X-CRM114-Status: GOOD (  12.30  )
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
Content-Type: multipart/mixed; boundary="===============4507993092955958406=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4507993092955958406==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uLB1Llf0h2iQ6rin"
Content-Disposition: inline


--uLB1Llf0h2iQ6rin
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:13PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.

Acked-by: Mark Brown <broonie@kernel.org>

--uLB1Llf0h2iQ6rin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+QQkACgkQJNaLcl1U
h9C5lAf8Dpp6enFuhrAPv0ZsgsZe6xWsOHu4pelgjbPEH8V7tDwUPWITXN5vLI3+
RuqFuOP0hYHIa9rUjaI4dZX0sPV7cFMF2BdyjTFdczyAizXljoNVh2r23soCG0RX
66rxbmsNE++z+1DObKtZgJoutGaB/ZAqMpW0t0XJERPq1KbjBGmy8D/fIq8lvoy/
4297MfYX3okBCVVhPRX/v+unG3sVqED0Bhdjpo/bwY0150YItakf4eVUXwFxfvTK
25XCxunGEShq5zi//+/abs2X89ZjhqLTfJtYtUVnj1xtSfEqoRb6mf82WrkieRvA
dYORYgupqLBXMecamcwbhHMcJBNZ3w==
=hyWV
-----END PGP SIGNATURE-----

--uLB1Llf0h2iQ6rin--


--===============4507993092955958406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4507993092955958406==--

