Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A774C47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 12:47:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51EA761130
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 12:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51EA761130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEZS5TeA2GZciOFXcUfCnW6ES7irB2Bhl8rKlYZGtf0=; b=ks5kBfWP1G3kJF
	STeLD8zMNCnX82aMizNo6zCobZuCV0ufLdwgyGucBvfpLgQGf7xhklpDBVDat+pmp1AhO6Lz6OTSY
	o64aM7WAW3k/hPHuEWrKiPfVCq4dtq98wlKXjVBGdjUXBxZKSp7iX0cFV8GgFZpjiRKCTksjC6IdW
	3E7iW9KeUl1NgBQQI0BenZn85i2j/SasUuI/GBBzDWlUtP3m5x+aRpSijNuIYps4lfzr3Q3zkfh2v
	55wVMoAm/5QzuZxUU+qOwsTU33+YK2gqDjBcMPsftRLT71pA72dBQNzG5W/c9dL6r8IK71DlhyRdc
	qnk+qKirXEpV6XVSI8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqEec-003alD-A8; Mon, 07 Jun 2021 12:46:54 +0000
Received: from [211.157.147.131] (helo=lucky1.263xmail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqEbG-003ZHY-5t; Mon, 07 Jun 2021 12:43:36 +0000
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id EF557BA627;
 Mon,  7 Jun 2021 20:43:13 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P32529T140357073352448S1623069785962833_; 
 Mon, 07 Jun 2021 20:43:14 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c87c119b8c5f0a37605fad5fad079433>
X-RL-SENDER: jon.lin@rock-chips.com
X-SENDER: jon.lin@rock-chips.com
X-LOGIN-NAME: jon.lin@rock-chips.com
X-FST-TO: linux-spi@vger.kernel.org
X-RCPT-COUNT: 17
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Jon Lin <jon.lin@rock-chips.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v5 4/8] clk: rockchip: Add support for hclk_sfc on rk3036
Date: Mon,  7 Jun 2021 20:42:59 +0800
Message-Id: <20210607124303.22393-5-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607124303.22393-1-jon.lin@rock-chips.com>
References: <20210607124303.22393-1-jon.lin@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_054326_458178_778D56B6 
X-CRM114-Status: GOOD (  13.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the bus clock for the serial flash controller on the
rk3036. Taken from the Rockchip BSP kernel but not tested on real
hardware (as I lack a 3036 based SoC to test).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None
Changes in v1: None

 drivers/clk/rockchip/clk-rk3036.c      | 2 +-
 include/dt-bindings/clock/rk3036-cru.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 91d56ad45817..ebb628733f6d 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -403,7 +403,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(HCLK_OTG0, "hclk_otg0", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 13, GFLAGS),
 	GATE(HCLK_OTG1, "hclk_otg1", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(7), 3, GFLAGS),
 	GATE(HCLK_I2S, "hclk_i2s", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 2, GFLAGS),
-	GATE(0, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
+	GATE(HCLK_SFC, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
 	GATE(HCLK_MAC, "hclk_mac", "hclk_peri", 0, RK2928_CLKGATE_CON(3), 5, GFLAGS),
 
 	/* pclk_peri gates */
diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
index 35a5a01f9697..a96a9870ad59 100644
--- a/include/dt-bindings/clock/rk3036-cru.h
+++ b/include/dt-bindings/clock/rk3036-cru.h
@@ -81,6 +81,7 @@
 #define HCLK_OTG0		449
 #define HCLK_OTG1		450
 #define HCLK_NANDC		453
+#define HCLK_SFC		454
 #define HCLK_SDMMC		456
 #define HCLK_SDIO		457
 #define HCLK_EMMC		459
-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
