Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBE3EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jun 2023 20:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sApRyWZM2rlk+wlJkZ6L8j4YJ2nAQt+qn7o3FfDvc78=; b=Mh1HuqMIEmdHvY
	lGTtcRS5AOxSI+Ti000jLPpu6p4S/i05NVslfTfrN/sawAjiRdzaH5QiUJtb5i4rPA3qmZXq8Guvh
	m3rpGoN4wHo2FSsoet8fbK7ETprPb+DVUWe0A1rB5oe1TFd4/bz36O9ZIaxCo7g0nRc4ibyWhuYeS
	fDUgmjkkhvDEmQURuYjfJi+xrQT1x0uW5KkvbsSneU9JuZXF8Qw05LsfYHmYv/qhdbuBsxFcp43AD
	som/yeIM6jSBIR35UgDi6kshkDfAh1Dzn8/PJMhizhJLRr9ijGV+pBeAz5ZX0ezF0cZVIjs2Pyv/c
	l6i+wP1BO8g1t5ipnu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnTq-004UiO-2v;
	Fri, 23 Jun 2023 20:34:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCnTm-004Ugl-39;
	Fri, 23 Jun 2023 20:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552444; x=1719088444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+/HQhcHBxeFox5idw381gGM3I1gJzj1ra4FhcdQBIWA=;
  b=0/CDT82gci5rkj6xHBtQ8ZUIxh0Fnj/JJPYnTVRLkRjcHhv4D4ZRnOLP
   VDrHHHyZN7F5Sq9qKWC/x2zmmS4g79xWeentG6N/Vbibc6CxCeBX95Yqj
   YAHU9+icEtBJV/eyFfTwCmwM3UqL7e/zbNvHTC8xqlZAkO27U1fGgIssV
   iAwNz4b+xlVuB//egXgUMoje+6RuD5l6gxHi3JlDqusV0FulfurkThYQH
   +QF0PjreFum86rpF+zEQkzKQ92JbgES69B0MPpzTeyd65AihhGZ227aRW
   Gs4E+a1zwZgDCOfFgfiIzDhsd1zFy312W72oMP4S5CQ0Ge+cRG65SZge1
   g==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="220216091"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:34:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:33:57 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:33:29 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <vkoul@kernel.org>, <tglx@linutronix.de>,
	<maz@kernel.org>, <lee@kernel.org>, <ulf.hansson@linaro.org>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<olivia@selenic.com>, <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<linux@armlinux.org.uk>, <sre@kernel.org>, <jerry.ray@microchip.com>,
	<horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
	<varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
	<alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
	<mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <manikandan.m@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>
Subject: [PATCH v2 05/45] ARM: at91: pm: add support for sam9x7 SoC family
Date: Sat, 24 Jun 2023 02:00:16 +0530
Message-ID: <20230623203056.689705-6-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_133403_059854_0F67F53C 
X-CRM114-Status: GOOD (  11.49  )
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

Add support and pm init config for sam9x7 SoC.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/mach-at91/generic.h |  2 ++
 arch/arm/mach-at91/pm.c      | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/mach-at91/generic.h b/arch/arm/mach-at91/generic.h
index 0c3960a8b3eb..acf0b3c82a30 100644
--- a/arch/arm/mach-at91/generic.h
+++ b/arch/arm/mach-at91/generic.h
@@ -12,6 +12,7 @@
 extern void __init at91rm9200_pm_init(void);
 extern void __init at91sam9_pm_init(void);
 extern void __init sam9x60_pm_init(void);
+extern void __init sam9x7_pm_init(void);
 extern void __init sama5_pm_init(void);
 extern void __init sama5d2_pm_init(void);
 extern void __init sama7_pm_init(void);
@@ -19,6 +20,7 @@ extern void __init sama7_pm_init(void);
 static inline void __init at91rm9200_pm_init(void) { }
 static inline void __init at91sam9_pm_init(void) { }
 static inline void __init sam9x60_pm_init(void) { }
+static inline void __init sam9x7_pm_init(void) { }
 static inline void __init sama5_pm_init(void) { }
 static inline void __init sama5d2_pm_init(void) { }
 static inline void __init sama7_pm_init(void) { }
diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 60dc56d8acfb..43a77ae0c38c 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -232,6 +232,17 @@ static const struct of_device_id sama7g5_ws_ids[] = {
 	{ /* sentinel */ }
 };
 
+static const struct of_device_id sam9x7_ws_ids[] = {
+	{ .compatible = "microchip,sam9x60-rtc",	.data = &ws_info[1] },
+	{ .compatible = "atmel,at91rm9200-ohci",	.data = &ws_info[2] },
+	{ .compatible = "usb-ohci",			.data = &ws_info[2] },
+	{ .compatible = "atmel,at91sam9g45-ehci",	.data = &ws_info[2] },
+	{ .compatible = "usb-ehci",			.data = &ws_info[2] },
+	{ .compatible = "microchip,sam9x60-rtt",	.data = &ws_info[4] },
+	{ .compatible = "microchip,sam9x7-gem",		.data = &ws_info[5] },
+	{ /* sentinel */ }
+};
+
 static int at91_pm_config_ws(unsigned int pm_mode, bool set)
 {
 	const struct wakeup_source_info *wsi;
@@ -1133,6 +1144,7 @@ static const struct of_device_id gmac_ids[] __initconst = {
 	{ .compatible = "atmel,sama5d2-gem" },
 	{ .compatible = "atmel,sama5d29-gem" },
 	{ .compatible = "microchip,sama7g5-gem" },
+	{ .compatible = "microchip,sam9x7-gem" },
 	{ },
 };
 
@@ -1360,6 +1372,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
 	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
 	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
 	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
+	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
 	{ /* sentinel */ },
 };
 
@@ -1497,6 +1510,28 @@ void __init sam9x60_pm_init(void)
 	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
 }
 
+void __init sam9x7_pm_init(void)
+{
+	static const int modes[] __initconst = {
+		AT91_PM_STANDBY, AT91_PM_ULP0,
+	};
+
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_SOC_SAM9X7))
+		return;
+
+	at91_pm_modes_validate(modes, ARRAY_SIZE(modes));
+	ret = at91_dt_ramc(false);
+	if (ret)
+		return;
+
+	at91_pm_init(NULL);
+
+	soc_pm.ws_ids = sam9x7_ws_ids;
+	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
+}
+
 void __init at91sam9_pm_init(void)
 {
 	int ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
