Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A08DC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 23:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cZ/kuxLPuswR/+ZwSAplFyb3H1nKntso3Rauujzfng=; b=nBNE3rLm62lWBB
	5spRUgN5su1cABDb0mINDylfn6Kebr4rZF8kj86c2KvUmzGzA9f7pmnak2isECWYWwKLIthIfsbXl
	SB13pE4bB1+L7Nxo9rAFUIZvVmCIDMRupfaJRFZnHywgvQFEQ1Or8NV8X7jwqGQAR59l+TDaj90pm
	Un9w3hP6RWdBfoV+GITlaC+nxRjpYWObG+2Mjoa7aZlv0rCmj1oyanuXgsbpsdGEoupiVW5Tlowc6
	6OCH8WZSPTKXjvGEXaLWPVaQrW4mfAaYjFu4qkmeTnt9O6uE6c4WsqY9FiN/Ze6wtqaCo1cSo7RJn
	HRMaLMq1dCThmCfkF6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49BI-00FX65-1p;
	Tue, 30 May 2023 23:55:12 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49BD-00FX24-2o
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 23:55:09 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 934BC2C0596;
	Wed, 31 May 2023 11:55:04 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685490904;
	bh=CXHc14wOkGFB3ru5MP+zwp9GpkkiRXC27fcKcbXH3uA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZuAL0brIATL26Ys4fXAZbB+sIC/jNDbJDsvK2c9Z29oqBfl16waWYUU28Q4zH5Lcq
	 SVQEL4wsrXGZA1t/mM117gMQGTBK9r4fE8O4deZS9GytfmOy3L72MV5D5m3/YrLN5n
	 TVKZ+pM7b2JS66aHfpat+Jd+2nqVfFoNoyv6YAWr99rM8rbS9LjUcqA+EWQiQw+mJ6
	 W5wzO90sncBjLrxYdqq5RW3PAft0eRUU5fnfWpiMzpcfNvy+PwhcvdbgGGy7PFvQe/
	 0SA5H7AFllX7pD8578u3MbZyHRAbLBLFx1JgBhBb2vro3PD60r2SUPj7f5J4xzaCw9
	 wxbQU/Pwngp/Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64768cd80001>; Wed, 31 May 2023 11:55:04 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 6F3C013EDD5;
	Wed, 31 May 2023 11:55:04 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 6DF1D280AFE; Wed, 31 May 2023 11:55:04 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	enachman@marvell.com,
	Vadym Kochan <vadym.kochan@plvision.eu>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 1/4] arm64: dts: marvell: cp11x: Fix nand_controller node name according to YAML
Date: Wed, 31 May 2023 11:54:53 +1200
Message-Id: <20230530235456.1009082-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=g8kJ_gb0AAAA:8 a=GKaKEI1dGHIjLaXU8GMA:9 a=ecSNLfPMzbq-p5zXJZOg:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_165508_426215_CC53B549 
X-CRM114-Status: GOOD (  10.56  )
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

From: Vadym Kochan <vadym.kochan@plvision.eu>

Marvell NAND controller has now YAML to validate it's DT bindings, so
change the node name of cp11x DTSI as it is required by nand-controller.yaml

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 0cc9ee9871e7..4ec1aae0a3a9 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -468,7 +468,7 @@ CP11X_LABEL(uart3): serial@702300 {
 			status = "disabled";
 		};
 
-		CP11X_LABEL(nand_controller): nand@720000 {
+		CP11X_LABEL(nand_controller): nand-controller@720000 {
 			/*
 			 * Due to the limitation of the pins available
 			 * this controller is only usable on the CPM
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
