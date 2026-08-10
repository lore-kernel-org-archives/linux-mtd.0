Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18136C5AD55
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YtXndEqje7M7Fi3HeNuWqRIK21m+OpeRjlMTMslM0nc=; b=zGp3EDgjSi59WE
	MWL4gbU/SPrprm27tNbELGR8o6HYrkJdmO44MNEIAIph7m25DgOO0M7JAMe1l88iLTRNei77Wvjo2
	FBrYPj1p2qD9+SvIKhIhm+y8btK+eC8Ea5f3lOuy16RNcTC9OmfjlXdyDlOPzD9WqD4N03lFO7aGk
	eO/RoYiMg3akfjJGiGXShblXxz8BqMmK8dYxfWtz2BLCS5A6CEQr6jizVQDBE+uXdpmYI0VZGe6az
	ao7hzCtGh+LeGsMW7ABbyP6wCkpZ0vqrSXzHezsEv88fla/M9LINftoWpiGK8SmA4/pRKCCty/wlj
	XzoKU0l///1WjtE/b9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQna-0000000ByE7-49Lv;
	Mon, 10 Aug 2026 14:16:18 +0000
Received: from 5.mo581.mail-out.ovh.net ([178.32.120.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQnW-0000000ByBx-3SIk
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 14:16:17 +0000
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.231.104])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4hJcHP0HLhz5yxQ
	for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 14:16:00 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-nv62s (unknown [10.111.182.119])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BCA8080474;
	Mon, 10 Aug 2026 14:15:56 +0000 (UTC)
Received: from m-works.net ([37.59.142.108])
	by ghost-submission-7d8d68f679-nv62s with ESMTPSA
	id PxmDHhzdeWoT+wUA+y4jow
	(envelope-from <maciej.andrzejewski@m-works.net>); Mon, 10 Aug 2026 14:15:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002b9938c9b-5063-437c-b380-4c4edae5ac1d,
                    ED6AA3D647CD945153C5C800EF75597CE9F2D384) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 144.125.48.245
Date: Mon, 10 Aug 2026 16:15:55 +0200
From: Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	broonie@kernel.org, linux-spi@vger.kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, maciej.andrzejewski@m-works.net
Cc: linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>
Subject: [PATCH 0/2] gpiolib: of: Scope the legacy SPI CS quirk to SPI
Message-ID: <20260810141555.70575-1-maciej.andrzejewski@m-works.net>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0
x-ovh-tracer-id: 15933735482169893667
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE4EN55RJhVq6HnQXjLgYEkeokzgdDSeWKywccT583QP2uOgrZ2gP0CI5iy25N4cv/oYhS23lcgNgG/WpLPLlz0xfCtuePGgIcZaM2AF/AktLbtaoN9SMhP3bGY0+JYJNBLx2r/r4ROrmDKZpcKTi6lq/Ajus7xRAGJr4X44p+mREyo1U6yK1gic3C2Z03zWD64G23zs1YhY56Kao4x3SGOXPMQaCqoKF9ZbvOu/z8SUkQ9Cf0CDeOMmanTBj4cj9+tK2yzq3eU08yGABdWaFFaw6vcPYHKbTt5K+b0sZMUQoXM1hCIxsG7E1PJQFfmFmN/zZW531uDTTQKnkCIahF0UxhOIvNOURM7pBeNCXMiHMi4iDQ6SwWIeA1XwYild7HiwWXgDJ3cCugl1chTssqbFzo2nPV2sWhnUc7fuQWLEMYu383o9BYcaVIJoAjzVUQG7MGQpiUxGIdlMPsg9MWiFxI6kX63IvCZJhW3X44/YowwF6f9nP2cJRI6fiCLNjtlVrzT8pceWS32ixoGc+7PGLBXOb8ZKjPia544Jy2qk0PigIEAZ7fzlcsJc6BG8ZleuKA3kFF4Ce03aj407cvGqgQ2EStto4bk1XWfmbtNYOrRu/sXIzfAT+mxBkLNc7kBJgNS2JNm8KQkfHImC0xZAH36CC9AJPYzFFj4h5m1ig
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_071615_007974_0DCD3754 
X-CRM114-Status: GOOD (  15.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

of_gpio_flags_quirks() decides whether to apply SPI chip-select polarity
semantics purely from the property name "cs-gpios". Nothing about that
name is SPI specific. nand-controller.yaml documents it for NAND
controllers too, and rawnand_dt_parse_gpio_cs() asks for those lines
with gpiod_count(dev, "cs"), which gpiolib expands to "cs-gpios". The
result is that a NAND chip node whose first reg cell happens to equal a
GPIO index gets flipped to active low, and since the NAND core requests
the descriptors GPIOD_OUT_HIGH and drivers assert with a logical 0, the
die is never selected.

We hit this on an Arasan controller with a GPIO CS1 and worked around it
downstream by putting spi-cs-high on the NAND chip node, which is
plainly the wrong property to need. These two patches narrow the quirk
instead, so that it only fires on an SPI bus.

Device tree has no bus type marker, so the series uses two tests, one
per patch, and applies the quirk if either matches:

  1. the matched child has a property namespaced with "spi-"
  2. the controller nodename has the "spi" prefix that
     spi-controller.yaml requires

Testing
-------

Both tests were scored against every board device tree in the kernel.
Each .dts under arch/*/boot/dts was expanded with the same cpp and
scripts/dtc pipeline the build uses; all 3620 expand. 503 of them hold
at least one GPIO chip select that can reach the quirk, 765 in total.
761 match both tests, 1 needs only the property scan, 3 need only the
nodename, and none match neither, so no in-tree board changes behaviour.
Patch 2 names the four exceptions individually.

The collision with NAND is in-tree but latent: 36 board trees, all
Atmel/Microchip at91, give their nand@3 controller a cs-gpios line and
escape only because the sole child of those nodes is a partitions
container with no reg for the quirk to match against.

drivers/gpio/gpiolib-of.o builds warning-free at W=1 with CONFIG_SPI=y
and with CONFIG_SPI=n.

Note on bisect
--------------

The two tests are complementary rather than layered, so patch 1 on its
own would stop applying the quirk to the three peripherals that carry no
"spi-" property (a panel, an mcp251xfd and one ecspi child, all named in
patch 2). Only the pair is behaviour-preserving. They are split because
the property scan and the nodename test are separate arguments and I
expect the second to attract more discussion. Happy to squash them into
one commit if you would rather not have that window.

Maciej Andrzejewski ICEYE (2):
  gpiolib: of: Only apply the SPI CS quirk to SPI peripherals
  gpiolib: of: Identify SPI controllers by nodename

 drivers/gpio/gpiolib-of.c | 40 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)


base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
