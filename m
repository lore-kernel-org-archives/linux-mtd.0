Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDC3EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dz3FFDzuH2kiBcVz0pelR8/llXqX+sbr4aBCsgyE3Bo=; b=O+N49DHUjiHVhV
	qof9LxB6LrHNSorQbt5by2HjCLAmkEE27ENPYyZOYz9xAGYZ8k6zwKEBhKPd9R+ipYJA/Pd1snOWa
	qEDi4hYdg7zpboQGoYke4u3duxVgvfotD2TkNudsfHozflhRm54CGL6VziysMzRbsz1OATYJwD4zc
	qPg4katwdzj7y/g94TWDMKTpQuDFDBFV7Qxwdj9Z/IPv3g9S5+4DZ3ZjIGVJf3Bd2se0eGYIca7Pf
	I5L+Dy9Mo36N85ji+IWnZaTHlV8Yl54FiBgyQrCx2UyD5twYVC3qnnW+x4sHJ5jl8umsE05YtfFy5
	b2njzeseJLK1HefBZgKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP4n-00AKrq-2c;
	Thu, 20 Jul 2023 08:31:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMP3D-00AJPu-38;
	Thu, 20 Jul 2023 08:30:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E949E61CAD;
	Thu, 20 Jul 2023 08:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4549C0091C;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841799;
	bh=Jwb+NIIyfhlr04cBvj4QbShaBQondg1D/B6oWBJYado=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=slZUc4n5c34/I8/5je4GOexeeECLoJ8+l4TO4l8UQxDpjKohPzPBWrs1eNKYkK+sa
	 VE/ax+SCXoP+AHzt2sk7G9yLzjw/naG0HkOV8YzRgKTvpsbH75M8Yj0J2rrwbMZ1Ug
	 LWciIAwAbH6K6PHWG29odPMGCK61PgVbKMytkqjV1G80z+S9Npu5JpGFpr6gJs23Pt
	 tBNCgfY4rcNSMhR53W0UvFJoBJ5qtjICzGlmGyOa1U1hbyiE5mCFXaNsbSyIgwH05k
	 mG++S+8JRzbxDv+HOXqKo5Retjwebeztf6/2o1I7ofCFzn2FygOX0ZIFpA4bkWItgP
	 wYeQoJK0mX8sQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E9AC10F19;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:37 +0300
Subject: [PATCH v3 37/42] pwm: ep93xx: drop legacy pinctrl
MIME-Version: 1.0
Message-Id: <20230605-ep93xx-v3-37-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=4334;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=WBzTz0y9WETmbwEPUNlS3vfiPeT6Yq9Stg5hAL8clMU=; =?utf-8?q?b=3DnNg8cNkDVXnF?=
 =?utf-8?q?soK72XlvRIwEWps36Li8bfOpmvDiUHH0efPgenKhJQcZelGD4ChSs+Uw+hR8Jbq8?=
 y+R6UivIAmvCscuMj8oUcEpbo5aFvY6lp65Ppw+qptddRIyC2hFf
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_013020_149176_DFB6FD5E 
X-CRM114-Status: GOOD (  18.96  )
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

RnJvbTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4KCkRyb3AgbGVn
YWN5IGdwaW8gcmVxdWVzdC9mcmVlIHNpbmNlIHdlIGFyZSB1c2luZwpwaW5jdHJsIGZvciB0aGlz
IG5vdy4KClNpZ25lZC1vZmYtYnk6IE5pa2l0YSBTaHViaW4gPG5pa2l0YS5zaHViaW5AbWFxdWVm
ZWwubWU+CkFja2VkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtL21hY2gtZXA5M3h4L2NvcmUuYyAgICAgICB8IDQyIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9wd20vcHdtLWVw
OTN4eC5jICAgICAgICAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvc29j
L2NpcnJ1cy9lcDkzeHguaCB8ICA0IC0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNjQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1lcDkzeHgvY29yZS5jIGIvYXJjaC9hcm0v
bWFjaC1lcDkzeHgvY29yZS5jCmluZGV4IGM2MGE5ZDM2MzJkZC4uOWFmYzYwOTVkMWMxIDEwMDY0
NAotLS0gYS9hcmNoL2FybS9tYWNoLWVwOTN4eC9jb3JlLmMKKysrIGIvYXJjaC9hcm0vbWFjaC1l
cDkzeHgvY29yZS5jCkBAIC01NzYsNDggKzU3Niw2IEBAIHZvaWQgX19pbml0IGVwOTN4eF9yZWdp
c3Rlcl9wd20oaW50IHB3bTAsIGludCBwd20xKQogCQlwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXIo
JmVwOTN4eF9wd20xX2RldmljZSk7CiB9CiAKLWludCBlcDkzeHhfcHdtX2FjcXVpcmVfZ3Bpbyhz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQotewotCWludCBlcnI7Ci0KLQlpZiAocGRldi0+
aWQgPT0gMCkgewotCQllcnIgPSAwOwotCX0gZWxzZSBpZiAocGRldi0+aWQgPT0gMSkgewotCQll
cnIgPSBncGlvX3JlcXVlc3QoRVA5M1hYX0dQSU9fTElORV9FR1BJTzE0LAotCQkJCSAgIGRldl9u
YW1lKCZwZGV2LT5kZXYpKTsKLQkJaWYgKGVycikKLQkJCXJldHVybiBlcnI7Ci0JCWVyciA9IGdw
aW9fZGlyZWN0aW9uX291dHB1dChFUDkzWFhfR1BJT19MSU5FX0VHUElPMTQsIDApOwotCQlpZiAo
ZXJyKQotCQkJZ290byBmYWlsOwotCi0JCS8qIFBXTSAxIG91dHB1dCBvbiBFR1BJT1sxNF0gKi8K
LQkJZXA5M3h4X2RldmNmZ19zZXRfYml0cyhFUDkzWFhfU1lTQ09OX0RFVkNGR19QT05HKTsKLQl9
IGVsc2UgewotCQllcnIgPSAtRU5PREVWOwotCX0KLQotCXJldHVybiBlcnI7Ci0KLWZhaWw6Ci0J
Z3Bpb19mcmVlKEVQOTNYWF9HUElPX0xJTkVfRUdQSU8xNCk7Ci0JcmV0dXJuIGVycjsKLX0KLUVY
UE9SVF9TWU1CT0woZXA5M3h4X3B3bV9hY3F1aXJlX2dwaW8pOwotCi12b2lkIGVwOTN4eF9wd21f
cmVsZWFzZV9ncGlvKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCi17Ci0JaWYgKHBkZXYt
PmlkID09IDEpIHsKLQkJZ3Bpb19kaXJlY3Rpb25faW5wdXQoRVA5M1hYX0dQSU9fTElORV9FR1BJ
TzE0KTsKLQkJZ3Bpb19mcmVlKEVQOTNYWF9HUElPX0xJTkVfRUdQSU8xNCk7Ci0KLQkJLyogRUdQ
SU9bMTRdIHVzZWQgZm9yIEdQSU8gKi8KLQkJZXA5M3h4X2RldmNmZ19jbGVhcl9iaXRzKEVQOTNY
WF9TWVNDT05fREVWQ0ZHX1BPTkcpOwotCX0KLX0KLUVYUE9SVF9TWU1CT0woZXA5M3h4X3B3bV9y
ZWxlYXNlX2dwaW8pOwotCi0KIC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBFUDkzeHggdmlkZW8gcGVy
aXBoZXJhbCBoYW5kbGluZwogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3B3bS9wd20tZXA5M3h4LmMgYi9kcml2ZXJzL3B3bS9wd20tZXA5M3h4LmMKaW5kZXggMzYxOTg0
ZWY0YzBiLi5hYzA4YmQwZTc1NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1lcDkzeHgu
YworKysgYi9kcml2ZXJzL3B3bS9wd20tZXA5M3h4LmMKQEAgLTI3LDggKzI3LDYgQEAKIAogI2lu
Y2x1ZGUgPGFzbS9kaXY2NC5oPgogCi0jaW5jbHVkZSA8bGludXgvc29jL2NpcnJ1cy9lcDkzeHgu
aD4JLyogZm9yIGVwOTN4eF9wd21fe2FjcXVpcmUscmVsZWFzZX1fZ3BpbygpICovCi0KICNkZWZp
bmUgRVA5M1hYX1BXTXhfVEVSTV9DT1VOVAkweDAwCiAjZGVmaW5lIEVQOTNYWF9QV014X0RVVFlf
Q1lDTEUJMHgwNAogI2RlZmluZSBFUDkzWFhfUFdNeF9FTkFCTEUJMHgwOApAQCAtNDUsMjAgKzQz
LDYgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZXA5M3h4X3B3bSAqdG9fZXA5M3h4X3B3bShzdHJ1
Y3QgcHdtX2NoaXAgKmNoaXApCiAJcmV0dXJuIGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgZXA5
M3h4X3B3bSwgY2hpcCk7CiB9CiAKLXN0YXRpYyBpbnQgZXA5M3h4X3B3bV9yZXF1ZXN0KHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKLXsKLQlzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGNoaXAtPmRldik7Ci0KLQly
ZXR1cm4gZXA5M3h4X3B3bV9hY3F1aXJlX2dwaW8ocGRldik7Ci19Ci0KLXN0YXRpYyB2b2lkIGVw
OTN4eF9wd21fZnJlZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpw
d20pCi17Ci0Jc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2Rldmlj
ZShjaGlwLT5kZXYpOwotCi0JZXA5M3h4X3B3bV9yZWxlYXNlX2dwaW8ocGRldik7Ci19Ci0KIHN0
YXRpYyBpbnQgZXA5M3h4X3B3bV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBw
d21fZGV2aWNlICpwd20sCiAJCQkgICAgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCiB7
CkBAIC0xNTcsOCArMTQxLDYgQEAgc3RhdGljIGludCBlcDkzeHhfcHdtX2FwcGx5KHN0cnVjdCBw
d21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIH0KIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBwd21fb3BzIGVwOTN4eF9wd21fb3BzID0gewotCS5yZXF1ZXN0ID0gZXA5M3h4X3B3
bV9yZXF1ZXN0LAotCS5mcmVlID0gZXA5M3h4X3B3bV9mcmVlLAogCS5hcHBseSA9IGVwOTN4eF9w
d21fYXBwbHksCiAJLm93bmVyID0gVEhJU19NT0RVTEUsCiB9OwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9zb2MvY2lycnVzL2VwOTN4eC5oIGIvaW5jbHVkZS9saW51eC9zb2MvY2lycnVzL2Vw
OTN4eC5oCmluZGV4IDQzYjFmMTE1MjZlNC4uZWQ5NGU0MzkwYjk4IDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L3NvYy9jaXJydXMvZXA5M3h4LmgKKysrIGIvaW5jbHVkZS9saW51eC9zb2MvY2ly
cnVzL2VwOTN4eC5oCkBAIC0xMiw4ICsxMiw2IEBAIHN0cnVjdCByZWdtYXA7CiAjZGVmaW5lIEVQ
OTNYWF9DSElQX1JFVl9FMgk3CiAKICNpZiBkZWZpbmVkKENPTkZJR19FUDkzWFhfU09DX0NPTU1P
TikKLWludCBlcDkzeHhfcHdtX2FjcXVpcmVfZ3BpbyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KTsKLXZvaWQgZXA5M3h4X3B3bV9yZWxlYXNlX2dwaW8oc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldik7CiBpbnQgZXA5M3h4X2lkZV9hY3F1aXJlX2dwaW8oc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldik7CiB2b2lkIGVwOTN4eF9pZGVfcmVsZWFzZV9ncGlvKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpOwogaW50IGVwOTN4eF9pMnNfYWNxdWlyZSh2b2lkKTsKQEAgLTIxLDgg
KzE5LDYgQEAgdm9pZCBlcDkzeHhfaTJzX3JlbGVhc2Uodm9pZCk7CiB1bnNpZ25lZCBpbnQgZXA5
M3h4X2NoaXBfcmV2aXNpb24odm9pZCk7CiAKICNlbHNlCi1zdGF0aWMgaW5saW5lIGludCBlcDkz
eHhfcHdtX2FjcXVpcmVfZ3BpbyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7IHJldHVy
biAwOyB9Ci1zdGF0aWMgaW5saW5lIHZvaWQgZXA5M3h4X3B3bV9yZWxlYXNlX2dwaW8oc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikge30KIHN0YXRpYyBpbmxpbmUgaW50IGVwOTN4eF9pZGVf
YWNxdWlyZV9ncGlvKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsgcmV0dXJuIDA7IH0K
IHN0YXRpYyBpbmxpbmUgdm9pZCBlcDkzeHhfaWRlX3JlbGVhc2VfZ3BpbyhzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KSB7fQogc3RhdGljIGlubGluZSBpbnQgZXA5M3h4X2kyc19hY3F1aXJl
KHZvaWQpIHsgcmV0dXJuIDA7IH0KCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
