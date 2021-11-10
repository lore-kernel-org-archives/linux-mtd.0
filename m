Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0628EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 15:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C788D61051
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 15:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C788D61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9j3cGawWabdzpqMx0lMND60fp+jKAf0R1FUcv5QSLbI=; b=QR+xdaZJC3dKJ3
	zD2bZHbak4GQlRxMv9c7i/3Bwyn/MpMeSq+2T0hZmjajxGZe0J7ybcPpE/Px+AwS+cSVcy7JvCkP5
	v2SNI9oSj11SUcpVdtnjqGtJHgPiYZ3PgE84Zijhisplrt1I2LRbFw307B9PazHCqhDvOmLTXoDRs
	54Izc8pg1Mkq9TWucCrU1odI5q65t2koKRHOlbX+vqVgyX854CdTQa9IzLJ3VlgWwuxOQuk7aiD8K
	0BMMELV8EagwEDE8buU0tMM3aTtfkF6CXkjwCXtl7h8bFzY6aDERSet9WWbEfg9jTmXsEhaS9Dhtr
	Dkei4E23TO/2HmwhXGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkp7v-005gFE-QW; Wed, 10 Nov 2021 15:03:03 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkp7M-005g0b-Ll; Wed, 10 Nov 2021 15:02:31 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AAAj9pe017944;
 Wed, 10 Nov 2021 16:01:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=N5V+BbtvYrsb+kqmfbPEbma9cqG0GoeZx3DzAXMNF24=;
 b=IB2xpbz84oqAquUfdJaKwITkZVLAMk1Rp7HR3B0qfOJN5/kJ0nUP+gl31WA/m5xXIfYO
 aRJgliij5QJMLPFqHzYqYStiVGzCIOpp8NfpWy4LShFpRkbPzkwXtNQ9qpMZzDdVVGQX
 AcUF7IlqlPtP4R0Q7FTHzqMq2ZRPaKab5KpswqmoTpKsA0uJyZ56QQ1cXrPTwV0ZURPf
 nqEfS0GhBdFrW+KwiPp8t6pmqS8nN+55TjdoM0Yac0/bZNO+zmaWcQmB7oFoBA7sqRRZ
 w7sSQ7lvhpXQN3BMtIaZcuQwXG2p0uHBFnlLroDS3GZcwMobyCtv3Bj30BEM5uc2ssk3 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c7ufnfufu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 16:01:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AD52100034;
 Wed, 10 Nov 2021 16:01:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79616207568;
 Wed, 10 Nov 2021 16:01:52 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 10 Nov 2021 16:01:51
 +0100
From: <patrice.chotard@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, maxime coquelin
 <mcoquelin.stm32@gmail.com>,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 michael turquette <mturquette@baylibre.com>,
 stephen boyd <sboyd@kernel.org>, herbert xu <herbert@gondor.apana.org.au>,
 "david s . miller" <davem@davemloft.net>,
 david airlie <airlied@linux.ie>, daniel vetter <daniel@ffwll.ch>,
 thierry reding <thierry.reding@gmail.com>, sam ravnborg <sam@ravnborg.org>,
 yannick fertre <yannick.fertre@foss.st.com>, "philippe
 cornu" <philippe.cornu@foss.st.com>, benjamin gaignard
 <benjamin.gaignard@linaro.org>,
 vinod koul <vkoul@kernel.org>, ohad ben-cohen <ohad@wizery.com>,
 bjorn andersson <bjorn.andersson@linaro.org>, baolin wang
 <baolin.wang7@gmail.com>, jonathan cameron <jic23@kernel.org>, "lars-peter
 clausen" <lars@metafoo.de>, olivier moysan <olivier.moysan@foss.st.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Lee Jones <lee.jones@linaro.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Matt Mackall <mpm@selenic.com>, "Alessandro
 Zummo" <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Patrice Chotard
 <patrice.chotard@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <viresh.kumar@linaro.org>, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Jagan Teki <jagan@amarulasolutions.com>, "dillon
 min" <dillon.minfei@gmail.com>, Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, pascal Paillet
 <p.paillet@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Jose
 Abreu" <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dmaengine@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
Subject: [PATCH v3 3/5] dt-bindings: media: Update maintainers for st,
 stm32-cec.yaml
Date: Wed, 10 Nov 2021 16:01:42 +0100
Message-ID: <20211110150144.18272-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110150144.18272-1-patrice.chotard@foss.st.com>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_05,2021-11-08_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_070229_056012_D2F08A5B 
X-CRM114-Status: GOOD (  16.78  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Benjamin has left the company, remove his name from maintainers.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 Documentation/devicetree/bindings/media/st,stm32-cec.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
index d75019c093a4..33e47e371941 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: STMicroelectronics STM32 CEC bindings
 
 maintainers:
-  - Benjamin Gaignard <benjamin.gaignard@st.com>
   - Yannick Fertre <yannick.fertre@st.com>
 
 properties:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
