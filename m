Return-Path: <SRS0=vJsE=D3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5A7C433E7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 03:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C95CF223BF
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 03:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AhWMLgUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C95CF223BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=In9AI1aP0pEYYfeEAFBT2UZzF6rIX3JBfgtNn37vFyw=; b=AhWMLgUWWQgvPJ0IZ11AhIbcqq
	9vNhDxX0+YLOoGQxidhGuQoyPzGVSutyAmNrSHlUXM0GmnTreJJfHebk1UZjwh7fVzkyCz2lb9TSA
	JtrUwTsxFr+zUL1Yfn8nmKy6sXrngXkmucrjaBXzK1Z/fES5zoHugVCMQNUg+uI9iYYUxlKR5VoLR
	OB+vv1WkaHs2vJXQWk5yPmaqz1b6uA+K4qZXEOvHbSdnQl0rKGtc+oosbUPXeOi77JxyIR57Rd8QI
	rMldPHmRMYc4jzpTVIKyeww9eqy/jiPEJAeyTzeA+JHqdDimxaGBXrWV7CdpiiKeuJOc2Bvx23GWj
	mFJ4avcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUiCn-0006wM-TY; Tue, 20 Oct 2020 03:20:58 +0000
Received: from lucky1.263xmail.com ([211.157.147.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUiAR-0005T4-SL; Tue, 20 Oct 2020 03:18:33 +0000
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id CAC1FB6ADB;
 Tue, 20 Oct 2020 11:18:28 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P2981T139638909118208S1603163896309471_; 
 Tue, 20 Oct 2020 11:18:28 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <937ef06e8a7788a759873616a6b11989>
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
Subject: [PATCH v12 7/8] arm: dts: rockchip: Add NFC node for RK2928 and other
 SoCs
Date: Tue, 20 Oct 2020 11:18:13 +0800
Message-Id: <20201020031814.17939-3-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020031814.17939-1-yifeng.zhao@rock-chips.com>
References: <20201020031733.17883-1-yifeng.zhao@rock-chips.com>
 <20201020031814.17939-1-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_231832_191239_18A2519E 
X-CRM114-Status: GOOD (  10.31  )
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

Add NAND FLASH Controller(NFC) node for RK2928, RK3066, RK3168
and RK3188 SoCs.

Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
---

(no changes since v1)

 arch/arm/boot/dts/rk3xxx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 859a7477909f..97415180d5bb 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -276,6 +276,15 @@
 		status = "disabled";
 	};
 
+	nfc: nand-controller@10500000 {
+		compatible = "rockchip,rk2928-nfc";
+		reg = <0x10500000 0x4000>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC0>;
+		clock-names = "ahb";
+		status = "disabled";
+	};
+
 	pmu: pmu@20004000 {
 		compatible = "rockchip,rk3066-pmu", "syscon", "simple-mfd";
 		reg = <0x20004000 0x100>;
-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
