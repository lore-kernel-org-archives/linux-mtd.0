Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16E0C4743D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 06:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A099F61184
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 06:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A099F61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVMCytIfHfNM5cMJI3T7VgX46JGrea8r1j9SosKjXk8=; b=gYIMBlQVFYmB9z
	xFfvPC0gq8c2QYhqUor3m7kEP0W4JbnKm2IiZ0dKdV8RSL36qlk5hB5ltNVxSY6vGp7VQCnavCGKV
	bYyNBHy0UEPnXSLGCDMiGRHEPSwPYzOCNeEsZOIdp1BgSsknpzTuMO2YWQVpjHQa+M9b93Sh0eLQJ
	MAYmDJEGM+MyPO6+l3maoVSLVcjYgU2hBScsL/kFM14O/8SsyTs+vxhASYhvZY7RqFS5H37TGIh0W
	Dl4G6MG9LfUJGWfm1hVGM8Nasibh+sfVmJ0ghrcmd/pMuoY5/w3cs02n0oz3y8HYTcvoLb17q5pnp
	qCMIcRNkx1g8Bjw/R3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lraZP-003q6L-RK; Fri, 11 Jun 2021 06:23:08 +0000
Received: from lucky1.263xmail.com ([211.157.147.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lraP5-003m0e-Nb; Fri, 11 Jun 2021 06:12:29 +0000
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id BAA29CD706;
 Fri, 11 Jun 2021 14:12:25 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P16485T139917350926080S1623391944380017_; 
 Fri, 11 Jun 2021 14:12:26 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6adbc98c6760e07664df5430c73bf6c0>
X-RL-SENDER: jon.lin@rock-chips.com
X-SENDER: jon.lin@rock-chips.com
X-LOGIN-NAME: jon.lin@rock-chips.com
X-FST-TO: linux-spi@vger.kernel.org
X-RCPT-COUNT: 20
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
 mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v8 5/9] clk: rockchip: Add support for hclk_sfc on rk3036
Date: Fri, 11 Jun 2021 14:12:18 +0800
Message-Id: <20210611061222.31644-1-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210611061134.31369-1-jon.lin@rock-chips.com>
References: <20210611061134.31369-1-jon.lin@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_231227_990208_DF5DA24C 
X-CRM114-Status: GOOD (  14.10  )
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

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None
Changes in v1: None

 drivers/clk/rockchip/clk-rk3036.c      | 2 +-
 include/dt-bindings/clock/rk3036-cru.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 1986856d94b2..828af715d92e 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -404,7 +404,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(HCLK_OTG0, "hclk_otg0", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 13, GFLAGS),
 	GATE(HCLK_OTG1, "hclk_otg1", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(7), 3, GFLAGS),
 	GATE(HCLK_I2S, "hclk_i2s", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 2, GFLAGS),
-	GATE(0, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
+	GATE(HCLK_SFC, "hclk_sfc", "hclk_peri", 0, RK2928_CLKGATE_CON(3), 14, GFLAGS),
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
