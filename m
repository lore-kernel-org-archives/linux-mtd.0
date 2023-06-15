Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D31EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 04:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH0zkOCu2BhCtiGOls+nw44+UOqGTuKc2nK6yN1yHyU=; b=vbBwe4PIL+2R4L
	sPHDmI0PHThsKJ/KdSDeNm+/LSkNqGh6pTtCNYI61A6BfwbcM3H0jZ+8Ob/Zaeit7/jDRs2fMO5La
	hRoq6v7z7Oy82yyNvq47ejvBu1TadBH8XWU2wWGu+/acLH7KKLoxHN4K9h2IevkE82TC5Ex1g5HEj
	vIomOdEBbxzMePAbVwvNt/Ai1N06nL+3zjk0MLw8q6TlG6EbSLulDePEO0GNHRMcrHm+Gssdj3Gzx
	sBqtfVm41/+Egj2931QhSziTJDsg71Ebh9OznFTIwxKAcSs3enwwecKjCa3ybwH8ib/TuJAInc9Nx
	FKoncICS+45XgxGU6W0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9eEZ-00DXqT-16;
	Thu, 15 Jun 2023 04:05:19 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9eEM-00DXm6-2b
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 04:05:08 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4D0082C0301;
	Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1686801894;
	bh=6UwyZP/DLulVGE0G/SWUR+rzLZIItqQDkNcjzH/kgXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oDdFYjOlYcPMxU7uWllLqPY//WHqEuBde5HvT2MgPiYtMoa3DKYYuol5clcDupbXn
	 VkZ+kCpf9StvkWNocrS1qtYrGlFjYVFjduwVXq59TKXzhyq2RJO82SYgZx0iG9HXhs
	 XxRK6e5DWai4xbLfVCufmUXTwHQsU6GS7QFRzcw2jdaanMNP6opoL5XSlWU+1UJa9D
	 AGR0rR64GtkW27R2AHkN7vrE0WVM1an3goDCx4DJe14cpLJewrV3Fjs122XE/QBxbE
	 /v30KuTkUjyicwyrmBFiyP4QGYRGXyJeia0QcQ744Ry3p/D+QN4stu3PwRKZzMjvTh
	 DyvqN1j6d6I+Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B648a8de60001>; Thu, 15 Jun 2023 16:04:54 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2CE4113ED5B;
	Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 2C1B32815D4; Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vadym Kochan <vadym.kochan@plvision.eu>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 1/3] arm64: dts: marvell: cp11x: Fix nand_controller node name according to YAML
Date: Thu, 15 Jun 2023 16:04:45 +1200
Message-Id: <20230615040447.3484564-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=of4jigFt-DYA:10 a=g8kJ_gb0AAAA:8 a=P-IC7800AAAA:8 a=meJC3iukd72GVYD95wIA:9 a=ecSNLfPMzbq-p5zXJZOg:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_210507_014498_13134F8E 
X-CRM114-Status: GOOD (  10.64  )
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
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Notes:
    Changes in v9:
    - None
    Changes in v8:
    - Add r-by from Miquel

 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 7d0043824f2a..982b180b33e6 100644
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
