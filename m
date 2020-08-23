Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A123C433E1
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:24:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8782072D
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qfXrub5z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7c5SyZZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8782072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKiqJFdQ5F/J8+vIoXxBuxMENZJlhaQARQmd3nX/sZ4=; b=qfXrub5zWCVvpyRbKk2RAUz2Af
	KaGvmubwBQExioj2iJcymkCltwUj7NI/Gurkk/6MuYh1q0nEhuxkJRr0CEAGNXPcYFF2KDfmE2Jk6
	Vx1Q3MI4juvV3noIKxH9lrz2UJ/aSzP3H/I8OgyKQksNs2wH9ppCE5GSStiwCCkqv0YV0+osaYRP4
	pPAwU4Q4nZkKxgl4mRoX+arrVZTvRzRlvrz9/r1SUt2nLewPrjpRtfiPvrX1a2fzxA2owKL+0vmsL
	HVsnv9DvNAl9641C906Emhblh9RUJpTZRRv/iOQHKHvh+PTECzYSqDhnxQJkI6cmIkZ1dvUOIH+Hn
	dPQQnVyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9smN-0000Mx-9E; Sun, 23 Aug 2020 16:23:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sgG-0004b9-M3; Sun, 23 Aug 2020 16:17:17 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B598F20767;
 Sun, 23 Aug 2020 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199435;
 bh=IcWdUIpZPLrTFhfMFn5K5VkjUKVluLTxZ3P2v5TWsEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g7c5SyZZT6Zq8zJcs7lELf9ENGqIJrTY1K8TN0SnqUBmDOtVgzwuLqzGeDHKGyVRQ
 lj9S8EE9fqkp5cgD2AX3lCDtvNKRKtootihwVhEMWPId8da+rT2m3wXQtkwVclHGWe
 +3LUdG7rGfwqnbJILBO4DM5BJs/DnK/O2os08ITE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 17/22] arm64: dts: imx8mq-evk: Add hog suffix to wl-reg-on
Date: Sun, 23 Aug 2020 18:15:45 +0200
Message-Id: <20200823161550.3981-17-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
References: <20200823161550.3981-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121717_161079_28B09AF5 
X-CRM114-Status: GOOD (  14.93  )
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Anson Huang <Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

According to device tree specification, device node names should be
somewhat generic and reflecting the function of the device so add the
"hog" suffix to wl-reg-on GPIO hog.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 8aa9cd8e495a..a088831d2e24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -157,7 +157,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wifi_reset>;
 
-	wl-reg-on {
+	wl-reg-on-hog {
 		gpio-hog;
 		gpios = <29 GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
