Return-Path: <SRS0=P+6h=ND=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A835C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 13:55:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED6AE60FD7
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 13:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED6AE60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jI1f6lowxEzsuIW/56bvBe8LlGsy9B2JwuVA0AWKD3Q=; b=vbkgClxCVZs2Aw
	/pqFBUdx9Iq8kUsxR2MnObJJTVcqC8WSGOu+hQddijkoDoUBi/Yy7QOzLMqwnMASKZBgJNbtWeIUY
	Cl3W5f4Tp/Q33Ub8SgriJGAuhTCbSpRxlhADw0+mzNlc/YsYohKSt+85zE5NWaO5Yp1jhgaHNn6ip
	5fV7bvblAmFUHYXTCwlEbHbKb+Rkh05Mdvym+e/rLBilWd01pQJ3cjKLaqTmUO0Ps94/OOLoO9D8t
	AOVaLwUBdjNu24hnWFDNSgPVH4Kvpt1GOJzfCbfR6jgxlPwAV9t4BvkzgY2fjK/g7LgLkRi516i7v
	Pmjs6mhLdITqeMColrPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEBAW-00ALBo-0E; Thu, 12 Aug 2021 13:54:48 +0000
Received: from lucky1.263xmail.com ([211.157.147.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEB2t-00AI9j-QR; Thu, 12 Aug 2021 13:46:57 +0000
Received: from localhost (unknown [192.168.167.70])
 by lucky1.263xmail.com (Postfix) with ESMTP id 4849AD652A;
 Thu, 12 Aug 2021 21:46:52 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P4989T139771043112704S1628776006486981_; 
 Thu, 12 Aug 2021 21:46:50 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8dcded2026158dda55856874c75d1131>
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
Subject: [PATCH v13 6/6] arm64: dts: rockchip: Enable SFC for Odroid Go Advance
Date: Thu, 12 Aug 2021 21:46:39 +0800
Message-Id: <20210812134639.31586-2-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812134639.31586-1-jon.lin@rock-chips.com>
References: <20210812134546.31340-1-jon.lin@rock-chips.com>
 <20210812134639.31586-1-jon.lin@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_064656_175143_0F9EDF3E 
X-CRM114-Status: GOOD (  11.87  )
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

This enables the Rockchip Serial Flash Controller for the Odroid Go
Advance. Note that while the attached SPI NOR flash and the controller
both support quad read mode, only 2 of the required 4 pins are present.
The rx bus width is set to 2 for this reason, and tx bus width is set
to 1 for compatibility reasons.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

Changes in v13: None
Changes in v12: None
Changes in v11:
- The tx is set to 1 for Odroid Go Advance device

Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None
Changes in v1: None

 .../boot/dts/rockchip/rk3326-odroid-go2.dts      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index 7fc674a99a6c..35218c2771a2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -517,6 +517,22 @@
 	status = "okay";
 };
 
+&sfc {
+	pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus2>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <108000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
 &tsadc {
 	status = "okay";
 };
-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
