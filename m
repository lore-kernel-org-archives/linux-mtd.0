Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C4AC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otw3ybhy3mKjvActOlb1sFhTEfvBOPL2GQ2z1e6Jdfs=; b=rLN4768Cp0WJktzmDvYWon1Gqz
	47KRzYROznYjn3Mgnqg0q/v0w+aXsNJ2itb3gp5H6Uj5ib/ZE7lHyDj3EKJO7LvkwvSQzZ9RHXNns
	t9odSZE/rnyHXK1dpD3RxNtqribjAlLOT+q9DO33VpB98BmbylbN9asUJntAbyAHNLT8A8P/WebwW
	aoq/8ryLXwcEccj2E37G6u5zjDZxVkME+aX3NBRypzM7z57YPVtSlOv738ixKNGWJ640zPsvVQiki
	C3pzeF6ESXqczwFbUU0VfBE+Q36kzNFiorvM6TniGqXuf5nk/rHMwkjHw5xVg0xAQ9t6bmZ0rFgQb
	jXChw3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrqw-000WYZ-93; Wed, 23 Nov 2022 15:39:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrqF-000WP2-Q9; Wed, 23 Nov 2022 15:39:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D3C161D96;
	Wed, 23 Nov 2022 15:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9DFC433D7;
	Wed, 23 Nov 2022 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669217954;
	bh=pCgyV6URGkswg9KKfkXhBda5Iki1k2lO8qrKykFSEt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3k9sXYZXMZbJL2KgSGmWiPRXMvHRdfTCIP9VQmjXd650/uUYXwTHEqUWxxttSOWT
	 hB9b2sL956S0bUti6tuHTy2XEt5HjAbHeCo+axvVAD2rZcRJx2sPwnWchFDK3MrGxa
	 yAlYOmKN8Mg4CXN+fkDD7QVG2+Cel0JnNA0akTveOPTARV97+qqsyEi6hpO6vdCsSE
	 LSyr4JBajkK5pYVRAYm5iecBZGybtYAXBVbkB+5aKcTmslEywj8Jzp0bx/0VpZMrY2
	 D5rI9GA2AAWuXzKpflAIq18/MHA6MmSTayBSrTtAwCYcKH0rMZJiTAzR77dwqComaB
	 rsQQ9HVyYiq1w==
Date: Wed, 23 Nov 2022 15:39:00 +0000
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
Subject: Re: [PATCH v2 5/9] dt-bindings: drop redundant part of title (end,
 part two)
Message-ID: <Y34+lGKAxewL8B1w@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
X-Cookie: I'm rated PG-34!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_073915_904575_F6155E9F 
X-CRM114-Status: GOOD (  12.59  )
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
Content-Type: multipart/mixed; boundary="===============7981293006978420430=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7981293006978420430==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3A/ckh57FM2wa6K8"
Content-Disposition: inline


--3A/ckh57FM2wa6K8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:11PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.

Acked-by: Mark Brown <broonie@kernel.org>

--3A/ckh57FM2wa6K8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+PpQACgkQJNaLcl1U
h9D31gf/diT1M+7KeH7O9XMaZE9GvQx7EpNfWPd6EPxvzUkePN6w8u24ztB2s1gn
LKqFnrfx5FQwvbCsjmuHqePIJ6kdBJHpd8zn0XYx/cJQJlR/lFm5FPbdjhDnfcCC
lH4+dPqm7Tms/Dmlw8z49shzkjbAkN5O81QNFCdqvgYfp94E6kUVysgHobbu7DzT
8dtk4IMR8dgd1gsVYd3RlfLDv7zlhti06pOwAYvL7I/+ELvcFRXtGgOq8p8EMd//
e9dFGh61GX0//8+cYUSUG2Qb/npn7nA2mFko17JRUU21NrTgMn1qbJvntYvhfKqj
AqDREqKbfhSeQVkKulAfyfkiBA4hNg==
=SxY0
-----END PGP SIGNATURE-----

--3A/ckh57FM2wa6K8--


--===============7981293006978420430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7981293006978420430==--

