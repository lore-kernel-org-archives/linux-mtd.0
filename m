Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9753C47095
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 20:04:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405922100A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 20:04:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HzzL4NOA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZPhYhMW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 405922100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N+F9vIm3Lv7OUhoF8FxaBkzLehuYPndLpLoSJEFNz+I=; b=HzzL4NOAnZlxvIZQj28ciEoAA
	vvJIQy9ORiIOOVxNi0L8F928jK169/VjLh/IHi5rV8mJXzav4g2qzjdwIdMY8kNvvTqy/8QVJQQ+7
	mdh9vjRPKAps3bio6Q+iT2PaR7Dzu0nMwRXhT0nvC1PlkAEaJUi0SnDc7w3qlxtJwXRIv3l72o2Fx
	qvOXr53U0nduZ2v2Lxj1td+ByRls5B44Fww8FDpiVMQcas6zVuZEk0jdmZnqySqQVo70bvCrecarc
	ARhiy2VtjVpXgm8d6vdC5mnEuQd1BsdXfGnRG4iiLRCCLduBxfizg4PH0SnJIHogbpOhuKuirLfIj
	MIXAQUpeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPWhv-00029h-5l; Mon, 05 Oct 2020 20:03:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPWhs-00028d-7X; Mon, 05 Oct 2020 20:03:37 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBAA12100A;
 Mon,  5 Oct 2020 20:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601928215;
 bh=kAJPl5wTGCwkw+XuTKU5bbU4qKcWvd/W2QpX6dnKGVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DZPhYhMW6eTtoKQB9RgWc2d2lES+UJhbkT7IA5z3WDU8NbIsrMjY7inei/w1HQtXV
 ETrKpXZfdoc2j8f7iCRMCTk1xUpVenlivyiDIWBo2QXnl6+RynOUk0tqlJFgtkSNZR
 Ki32ki/tWedE2ZYPKvawsqMQevQkwXPmMbu/rqNk=
Date: Mon, 5 Oct 2020 21:02:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: Use 'additionalProperties' instead of
 'unevaluatedProperties'
Message-ID: <20201005200232.GH5139@sirena.org.uk>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-3-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-3-robh@kernel.org>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_160336_418775_47EA5124 
X-CRM114-Status: GOOD (  15.42  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: multipart/mixed; boundary="===============5211052793237107234=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5211052793237107234==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Content-Disposition: inline


--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 01:38:28PM -0500, Rob Herring wrote:
> In cases where we don't reference another schema, 'additionalProperties'
> can be used instead. This is preferred for now as 'unevaluatedProperties'
> support isn't implemented yet.

Acked-by: Mark Brown <broonie@kernel.org>

--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97e9cACgkQJNaLcl1U
h9CXkAf/fcrNGrdLapSqJwMLMbtJCS0D24DLJGYOMaq20DJF7wJFnGt99z6jdOhf
r333/DPm2cGni5/89bsEzGA828aVzQineYY/7MBxsmCMR+qegRX1DfC3dWz4jeSJ
TH7MaAw8Xfp5rRMBgBgb+rKGDNqVkzrHuLKEqqjXYKu/Utrgtz6pdj/FGAg0FRvv
JPdkDP3WHgdNj3cmoLzF6FP8C4hjT/PLkR7t1gEOeL5p7P0ieXOzwZbLn58MNQfp
5aJQdQ4UPjeqdwMySifyHNgRORfIVDHnEhgpnEadsg1EOaDOg4L1jOr/teo7vd56
D2PNzf0BgKBODXIIiuEu0SMMMxO7UA==
=ctKD
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--


--===============5211052793237107234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5211052793237107234==--

