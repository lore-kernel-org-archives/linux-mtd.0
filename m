Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD598C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 17:13:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7956764E77
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 17:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7956764E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GlBQEfQHd9FAieXAo81xv3/mbEVm+K5BQRipDqNFZZo=; b=TlmVWF7v1TW92+WlZmsQ7xmOg
	RadPze6WiksbQayHtilsaCS0YRlSZICRI0S/XWg7uUm2x3fSDk9JQi1KZ6uHJxTMyK3ZASOWS1IK1
	raZROw9kLPtfwzSbGFktqYlo1hUzv8yb1K7QDD4TMNliPi0R0qGq2MthPA1E0Ju1R8KKCIz71dIU1
	xtaV64cCn21OM0B9nE5cwTArhRy604ScviagiGRL0wbTsqfqphMXgKbL6PnZV7re9nDLUaTIqvid4
	P8g+jRITy/pMxIxRBUYWdkVliCZMtK7BSdfGLQ7m/qZboh8Ak1opwyJSg8czut58g3krF/6ztncqx
	T4TnrQ6ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEElk-0008DB-Nc; Mon, 22 Feb 2021 17:13:12 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEEld-00089x-T5; Mon, 22 Feb 2021 17:13:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id BC0EB1F451E2
Received: by jupiter.universe (Postfix, from userid 1000)
 id 4E8464800D9; Mon, 22 Feb 2021 18:12:51 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Date: Mon, 22 Feb 2021 18:12:42 +0100
Message-Id: <20210222171247.97609-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222171247.97609-1-sebastian.reichel@collabora.com>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_121306_059286_B59C5BDD 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
modules SQW clock output defaults to 32768 Hz. This behaviour is
used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
the clock is disabled and all i.MX6 functionality depending on
the 32 KHz clock has undefined behaviour. On systems using hardware
watchdog it seems to likely trigger a lot earlier than configured.

The proper solution would be to describe this dependency in DT,
but that will result in a deadlock. The kernel will see, that
i.MX6 system clock needs the RTC clock and do probe deferral.
But the i.MX6 I2C module never becomes usable without the i.MX6
CKIL clock and thus the RTC's clock will not be probed. So from
the kernel's perspective this is a chicken-and-egg problem.

Technically everything is fine by not touching anything, since
the RTC clock correctly enables the clock on reset (i.e. on
battery backup power loss) and also the bootloader enables it
in case a kernel without this support has been booted.

The 'protected-clocks' property is already in use for some clocks
that may not be touched because of firmware limitations and is
described in Documentation/devicetree/bindings/clock/clock-bindings.txt.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt | 1 +
 drivers/rtc/rtc-m41t80.c                             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
index c746cb221210..ea4bbf5c4282 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
@@ -19,6 +19,7 @@ Optional properties:
 - interrupts: rtc alarm interrupt.
 - clock-output-names: From common clock binding to override the default output
                       clock name
+- protected-clocks: Bool, if set operating system should not handle clock.
 - wakeup-source: Enables wake up of host system on alarm
 
 Example:
diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 160dcf68e64e..3296583853a8 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -546,6 +546,9 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
 	struct clk_init_data init;
 	int ret;
 
+	if (of_property_read_bool(node, "protected-clocks"))
+		return 0;
+
 	/* First disable the clock */
 	ret = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
 	if (ret < 0)
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
