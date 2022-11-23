Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A98C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VfoD/jP9d7fZuwmk8UsECCsM/6WtqoZCnM2nnJd/t0=; b=VUmmIVPpcmUPDYphFhcxNbCBW4
	mgmtp204M8X7mPYqyrGTC/r/flJxahvSd+9+h2OXDpYxguSdoY0ns7pfZJnTzKgnz9oEYscGs8u1x
	5CkdFYitEG0g1golijL5o42IDNvqolfz71SEKaIrPJae5grJSNs7L+PIgF7Isdyv6O4aTla/TKihe
	ZVKdFLc0SjBaEztcE9vn/pceHk26rGt+TcvTOO8KjKSiqJQcV3ND8vNt30t0qmmiyNTDF2QDlCmZo
	P1L/8hT/Ku3Z5XOLsR2bS9+XG7JUOK+9wkf2+/mig2ObmcWi2s6VetRFbBKWaXKxoUKAnyrECcO66
	MoDdy78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqAj-00HNmt-2p; Wed, 23 Nov 2022 13:52:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqAD-00HNbl-1x; Wed, 23 Nov 2022 13:51:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D4C061CB0;
	Wed, 23 Nov 2022 13:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70F3C433D6;
	Wed, 23 Nov 2022 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669211504;
	bh=yn6IQg9xUUV9CgWL40Zq6y52rg1mn5sa8oD03o5v7Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKfpNKKUztgIyNLf4JyG/Wh9x1SnC70ZZ6CMkTeLD14mkOzGlAm4+qghDz9TTaJEY
	 oavU1DO373ElaIHQhIEpVZi9OKHf+AB7y5AZ3a0QM4K6Mda5mlxZI6uj77Y+34o3+z
	 tC1+zaqNCkF1IRGWjNnvY9xTloZLlUjIwvwDNzzHVs6iAjJgjo18LVCElB+Z+suDGy
	 RWQBO44v5C47KQUPl5LJXsrQ6VqWTj1W9The96h2CM4sfIP1b0DOy3ZhTq1Wp6bXDL
	 C50DRWElKcd6PEaRVrgU5hEWY/A3MmvIZ+aqD+I2bHVUKaydHWSJ+FVF1rDhM8vyJp
	 Av8NqbWSqNyRA==
Date: Wed, 23 Nov 2022 13:51:32 +0000
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
Subject: Re: [PATCH v2 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <Y34lZFSBEwuI6G+a@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
X-Cookie: I'm rated PG-34!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_055145_166476_AD35A072 
X-CRM114-Status: GOOD (  12.80  )
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
Content-Type: multipart/mixed; boundary="===============5622518653611572956=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5622518653611572956==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sez8m7aAndejrS5d"
Content-Disposition: inline


--sez8m7aAndejrS5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:07PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.  For shared
> (re-usable) schemas, name them all as "common properties".

Acked-by: Mark Brown <broonie@kernel.org>

--sez8m7aAndejrS5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+JWMACgkQJNaLcl1U
h9CJ0gf/ajSRpLgN3RoHR7wLxFr99y5vWRywVoOaKU+lLq3UY2O6a9ssY8wOblzx
J9LbUP4Acep2fofTZCX1Ks2sTUHXNBB95SaeCwpSD/MX2HltHr0QvTGh8Lc9EfRf
f4l/ayjov4DbVsOJ019O7MKSgyuKezLb6Rj/5S38OrqdREbbzDoFe2ah8rSxpA8m
OQPEsY4eAbVfELEo/JQ86QYXN8gT6p3qA0+8IxDb0D+iLi3JCIz3GTrn+ZCudWRS
DkbD00vhGbeEaAbI/ufYp/KUWT0wfIoONENSAdGhmGMd+deqbmOt1Ryt+YoEt49j
pRMeSDCxuBZIpBjQfw7H+5ofOT8jsg==
=hoZL
-----END PGP SIGNATURE-----

--sez8m7aAndejrS5d--


--===============5622518653611572956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5622518653611572956==--

