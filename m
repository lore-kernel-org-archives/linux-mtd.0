Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F77C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 22:31:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D876143A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 22:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D876143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tY0HgfgyMZTo8+qq6JAGpkWmNLyGkLKpLo3UR39GgUc=; b=aO7vvu3skxSYoQoe0H9djWP1q
	EAUU0LS6F1lzb6tvZW9zm/IL6lmse90uXaSXHMcACRJi9B3b0iCkfFX26R7jJ/aC+LAR0RuqOQG28
	kEvy1NEnTZOsBnk3zYDofWMzZxAHYt0g/6OIOE3Y6qcCUVrUrFYMXMLE23XmnNNvr1BBYBFR3+xGy
	9s6syxKkfgdoO+RqKE9/tUY3QuUO23V/9Rq246TRXEG48UlNPcTOByfcIWj7CCzDEcBU9cRFS76Lu
	WDrQgPRtH7V7hFBLDlZqiw7oMida5ahOHynarmr3WB8S+JOHUtO4rdmPsienv5bqihWe5ooitSCAW
	tX/KGVXnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbsi5-004Nqj-F3; Wed, 28 Apr 2021 22:31:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbsh1-004Nka-0c; Wed, 28 Apr 2021 22:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FXNmoOdGQvZXjS2zMVB6CHDT+viJClLA7O4INRIKxok=; b=4K+IhGFD9XeY7ZttfoUyU82XvI
 XRjje6CgUUWx9nj0laOZX/BQZI1KH2/IgXUww6M2a/mCEFOCaUSLY4w+biSwqXQqmAysReq0SdGRN
 ra/SoCJ4YS4F5MnCoPcsW8LCeN+yKl0tBUjxNmhfRhPcByx4+HQY4GDuaJh35mC0ztKIZlcOrV8ds
 aNLscqXCHjf3PJMtFrRqNflT7b3KLD0CZx70L9Lvbs7ZzcpK6pDhYTIeM8+x6LZNofRCv3mxfqBhz
 Z3AqRkHXN649qjqXIDv5IoiBuD1pR8yinSRDfiUyl4n0V9wWg+VoI+QKJyvdQ9AxTHzTyQ6T+HEIh
 9cnyMAKg==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbsgy-000EAI-4v; Wed, 28 Apr 2021 22:30:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id CB09B1F42CA9
Received: by jupiter.universe (Postfix, from userid 1000)
 id A85244800C3; Thu, 29 Apr 2021 00:29:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel@collabora.com
Subject: [PATCHv2 1/5] rtc: m41t80: add support for fixed clock
Date: Thu, 29 Apr 2021 00:29:49 +0200
Message-Id: <20210428222953.235280-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428222953.235280-1-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_153000_346087_B371CAB8 
X-CRM114-Status: GOOD (  16.47  )
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

Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
modules SQW clock output defaults to 32768 Hz. This behaviour is
used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
the clock is disabled and all i.MX6 functionality depending on
the 32 KHz clock has undefined behaviour. For example when using
the hardware watchdog the system will likely do arbitrary reboots.

Referencing the m41t62 directly results in a deadlock. The kernel
will see, that i.MX6 system clock needs the RTC clock and do probe
deferral. But the i.MX6 I2C module never becomes usable without the
i.MX6 CKIL clock and thus the RTC's clock will not be probed. So
from the kernel's perspective this is a chicken-and-egg problem.

Technically everything is fine by not touching anything, since
the RTC clock correctly enables the clock on reset (i.e. on
battery backup power loss) and also the bootloader enables it
in case an something (e.g. an unpatched kernel) disabled this
incorrectly.

A workaround for this issue is describing the square wave pin
as fixed-clock, which is registered early and basically how
this pin is used on the i.MX6.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt |  9 +++++++++
 drivers/rtc/rtc-m41t80.c                             | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
index c746cb221210..cdd196b1e9bd 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
@@ -21,10 +21,19 @@ Optional properties:
                       clock name
 - wakeup-source: Enables wake up of host system on alarm
 
+Optional child node:
+- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
+
 Example:
 	rtc@68 {
 		compatible = "st,m41t80";
 		reg = <0x68>;
 		interrupt-parent = <&UIC0>;
 		interrupts = <0x9 0x8>;
+
+		clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
 	};
diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 89128fc29ccc..b3ece42b6f90 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -544,10 +544,22 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
 {
 	struct i2c_client *client = m41t80->client;
 	struct device_node *node = client->dev.of_node;
+	struct device_node *fixed_clock;
 	struct clk *clk;
 	struct clk_init_data init;
 	int ret;
 
+	fixed_clock = of_get_child_by_name(node, "clock");
+	if (fixed_clock) {
+		/*
+		 * skip registering square wave clock when a fixed
+		 * clock has been registered. The fixed clock is
+		 * registered automatically when being referenced.
+		 */
+		of_node_put(fixed_clock);
+		return 0;
+	}
+
 	/* First disable the clock */
 	ret = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
 	if (ret < 0)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
