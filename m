Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D54EC4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 09:14:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C972C2076B
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 09:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HOZld3bz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C972C2076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxjq9jdfKPfCz2vT7BAVVOIyn4rlyVb8+QdIHdHdm58=; b=HOZld3bzKlTKfMs9q9H2jEEhG1
	OPxaA4ocMHVTwmglK7NAgtrae7jaCShTSk8jGUK/P1sn9k9e9KiyJ1u3cuGRTJx24DY4ERZvwDGe0
	s77V35VMdPF7g5qnHMqzl2EKUtSOZHTPwVsVmv6Kls1p2ha2OIqWIZu2iSIKiOjd0h8vKBFi+nf3E
	YCNaoF5772YvOl3je+JjZBk/qHliZSGPJi0+Cn3daevqYDxTEpb4e4nm9qq+8zTOwBwrgssS4c5YR
	sDsbfOMHQY5jkSP3Ke9HKCBh46Tb6j+uRpEnR/GdkhNKgqKGSd5t0w5+izRkuPLR224NLgroP10hn
	Wz95xxYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNBgn-0000xs-Sc; Tue, 29 Sep 2020 09:12:50 +0000
Received: from lucky1.263xmail.com ([211.157.147.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNBfW-0000I3-5m; Tue, 29 Sep 2020 09:11:31 +0000
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id 8BA47C99A4;
 Tue, 29 Sep 2020 17:11:23 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P30218T139798784222976S1601370676801501_; 
 Tue, 29 Sep 2020 17:11:24 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4999b79e921842eae65ba625e0879f2b>
X-RL-SENDER: yifeng.zhao@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: yifeng.zhao@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Yifeng Zhao <yifeng.zhao@rock-chips.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v9 8/8] arm: dts: rockchip: Add NFC node for RK3036 SoC
Date: Tue, 29 Sep 2020 17:11:14 +0800
Message-Id: <20200929091114.21575-4-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929091114.21575-1-yifeng.zhao@rock-chips.com>
References: <20200929090807.21511-1-yifeng.zhao@rock-chips.com>
 <20200929091114.21575-1-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_051130_482724_3EBFF157 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add NAND FLASH Controller(NFC) node for RK3036 SoC.

Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
---

Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/rk3036.dtsi | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index d9a0c9a29b68..be8d46c0bbb0 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -291,6 +291,21 @@
 		status = "disabled";
 	};
 
+	nfc: nand-controller@10500000 {
+		compatible = "rockchip,rk3036-nfc",
+			     "rockchip,rk2928-nfc";
+		reg = <0x10500000 0x4000>;
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
+		clock-names = "ahb", "nfc";
+		assigned-clocks = <&cru SCLK_NANDC>;
+		assigned-clock-rates = <150000000>;
+		pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_csn0
+			     &flash_rdn &flash_rdy &flash_wrn>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
 	cru: clock-controller@20000000 {
 		compatible = "rockchip,rk3036-cru";
 		reg = <0x20000000 0x1000>;
@@ -642,6 +657,43 @@
 			};
 		};
 
+		nfc {
+			flash_ale: flash-ale {
+				rockchip,pins = <2 RK_PA0 1 &pcfg_pull_default>;
+			};
+
+			flash_bus8: flash-bus8 {
+				rockchip,pins = <1 RK_PD0 1 &pcfg_pull_default>,
+						<1 RK_PD1 1 &pcfg_pull_default>,
+						<1 RK_PD2 1 &pcfg_pull_default>,
+						<1 RK_PD3 1 &pcfg_pull_default>,
+						<1 RK_PD4 1 &pcfg_pull_default>,
+						<1 RK_PD5 1 &pcfg_pull_default>,
+						<1 RK_PD6 1 &pcfg_pull_default>,
+						<1 RK_PD7 1 &pcfg_pull_default>;
+			};
+
+			flash_cle: flash-cle {
+				rockchip,pins = <2 RK_PA1 1 &pcfg_pull_default>;
+			};
+
+			flash_csn0: flash-csn0 {
+				rockchip,pins = <2 RK_PA6 1 &pcfg_pull_default>;
+			};
+
+			flash_rdn: flash-rdn {
+				rockchip,pins = <2 RK_PA3 1 &pcfg_pull_default>;
+			};
+
+			flash_rdy: flash-rdy {
+				rockchip,pins = <2 RK_PA4 1 &pcfg_pull_default>;
+			};
+
+			flash_wrn: flash-wrn {
+				rockchip,pins = <2 RK_PA2 1 &pcfg_pull_default>;
+			};
+		};
+
 		emac {
 			emac_xfer: emac-xfer {
 				rockchip,pins = <2 RK_PB2 1 &pcfg_pull_default>, /* crs_dvalid */
-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
