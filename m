Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E708DEB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlT0CwSw9j9tJj/9EALSSzW2ROwh59J+x+42GBirUZo=; b=dG3Cj7O1DaNr7B
	fHKBsZwj5Raywin03Ca1p0K5CR7tw7BUUcKMItyOzmvIHXMK/bqVk4bEo3lscNg1Ssb1kCGpInmSf
	Ad8y+SmyZRwkctTkyKZqaRycn211ZCNPxRNb/BTIqcy8lHO8U1pTnqikgO7E1bTsmACyVWlrwkJtD
	clp3oILNiQq4Sdp9NZxlsURyDZTnt31Rdm5wjD4cDmQvd8TuKdycyTVVJLt4MkpFKCV9LvJmFm07j
	KyGzw3Qi+4DxD1653yRLs2CrmKGyJJBpxyB7eOu58AdkNPRuMm69n9OJFpY7qDejFLp8ZEapkssuK
	L+yNlKNvavtOYaE527kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP3y-00AKBR-16;
	Thu, 20 Jul 2023 08:31:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP32-00AJRc-0E;
	Thu, 20 Jul 2023 08:30:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3B2461B4D;
	Thu, 20 Jul 2023 08:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 787C0C04E49;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841797;
	bh=xliP5b5WtrsMd3P6kYqtdaNfmgccnbmwCQZwXP0rCUk=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=jN1X7bztGFXqhT2t4W/0op7+NT2ZgRjrS7oFgq1GkIR3O0HTs2p5MUbG+ppLKDNz2
	 9pOLH3he29rt7wo3eQWucRp7vQz1toXWVpWH5uB6BUruoZBoGdMFF36dCiICWPjFb/
	 0OB5+3U1bpv6frSLxRbk+Rjjwh/QiCy8VV3iZ97FHROqcPOWmXPHxZNOX64Uq//zuh
	 o+N0TeKYWE4sJVqYDlFzfv4dEZym6ffeiLSN2C59G/52lD6PJFTbZGXIeEP7+VD+Ut
	 RJzB5mFBdpvFxBji81rm7hQzjwB0ML2vvwhoIh+dTw4LDmnnpDS/KgEsQA8xNzyf8t
	 0bWWquCPcVHhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63754C04FE2;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:15 +0300
Subject: [PATCH v3 15/42] dt-bindings: pwm: Add Cirrus EP93xx
MIME-Version: 1.0
Message-Id: <20230605-ep93xx-v3-15-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
To: Hartley Sweeten <hsweeten@visionengravers.com>, 
 Lennert Buytenhek <kernel@wantstofly.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>, 
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, 
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852590; l=1685;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=rt1EgnPNkoKlqWo1Tq3uwPiONIW4NQw+HWVXcah0yDs=; =?utf-8?q?b=3DCHLn+KRQpq74?=
 =?utf-8?q?gXOYvBEcLt/iCQ5AfHbNYjHSKp5MUbJToRILl9TN68J0zKvGo4FOgMteaRvnjJiq?=
 4/xdmr1tD8Eauw6RSVt4JkUHq75BtpLkC6C3jZwddFja6wTz5dks
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_013008_193587_ACE780EE 
X-CRM114-Status: GOOD (  15.22  )
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
Reply-To: nikita.shubin@maquefel.me
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4KCkFkZCBZQU1M
IGJpbmRpbmdzIGZvciBlcDkzeHggU29DIFBXTS4KClNpZ25lZC1vZmYtYnk6IE5pa2l0YSBTaHVi
aW4gPG5pa2l0YS5zaHViaW5AbWFxdWVmZWwubWU+CkFja2VkLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3B3bS9jaXJydXMsZXA5MzAxLXB3bS55YW1sIHwgNDggKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL2NpcnJ1cyxlcDkzMDEtcHdtLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL2NpcnJ1cyxlcDkzMDEtcHdt
LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi44MjVjMzIxMDcz
ZmYKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cHdtL2NpcnJ1cyxlcDkzMDEtcHdtLnlhbWwKQEAgLTAsMCArMSw0OCBAQAorIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIK
Ky0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9wd20vY2lycnVzLGVwOTMw
MS1wd20ueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIworCit0aXRsZTogQ2lycnVzIExvZ2ljayBlcDkzeHggUFdNIGNvbnRyb2xsZXIK
KworbWFpbnRhaW5lcnM6CisgIC0gQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRs
aW5AZ21haWwuY29tPgorICAtIE5pa2l0YSBTaHViaW4gPG5pa2l0YS5zaHViaW5AbWFxdWVmZWwu
bWU+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgb25lT2Y6CisgICAgICAtIGNv
bnN0OiBjaXJydXMsZXA5MzAxLXB3bQorICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGVudW06
CisgICAgICAgICAgICAgIC0gY2lycnVzLGVwOTMwMi1wd20KKyAgICAgICAgICAgICAgLSBjaXJy
dXMsZXA5MzA3LXB3bQorICAgICAgICAgICAgICAtIGNpcnJ1cyxlcDkzMTItcHdtCisgICAgICAg
ICAgICAgIC0gY2lycnVzLGVwOTMxNS1wd20KKyAgICAgICAgICAtIGNvbnN0OiBjaXJydXMsZXA5
MzAxLXB3bQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrczoKKyAgICBpdGVt
czoKKyAgICAgIC0gZGVzY3JpcHRpb246IFNvQyBQV00gY2xvY2sKKworcmVxdWlyZWQ6CisgIC0g
Y29tcGF0aWJsZQorICAtIHJlZworICAtIGNsb2NrcworCithZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9j
ay9jaXJydXMsZXA5M3h4LWNsb2NrLmg+CisgICAgcHdtQDgwOTEwMDAwIHsKKyAgICAgIGNvbXBh
dGlibGUgPSAiY2lycnVzLGVwOTMwMS1wd20iOworICAgICAgcmVnID0gPDB4ODA5MTAwMDAgMHgx
MD47CisgICAgICBjbG9ja3MgPSA8JnN5c2NvbiBFUDkzWFhfQ0xLX1BXTT47CisgICAgfTsKKwor
Li4uCgotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
