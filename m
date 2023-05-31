Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F93C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 23:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8he8ztHDkQu93jEoR+l8Hew8ZliWfdmzKkNh/Th+CpQ=; b=xFR0uX5dPqKCcW
	PdpZHFHJ5684a8mcdgLV1xwsqSi4Z/LqN6I8SCjHPyKGIbUPWfON5KJUOEolON76/Kn2U6GoDyAEe
	N5a7yiCLtEFKSpQHkTnONg9RdWJKfTENNl/MSBmcZflULFNnGBwPINrCakoB9OrCOxHfo5gFT8pXZ
	Vp2r9ykSzdq1ja1neZxW0ZEosx5jO5lJgTPk//7+VgUregN8P+pwRrgdyUf9bDk0O731hAVoA4uDs
	rTOhiTaBfrLP03uzTOFyZNEs5y4f0ORIhQgIFqM44Qd4kueiPoYW7GvY7992SVuzGAiw4ixDMmQHD
	bFACeH2SGQ/GPXEWOWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VZe-001V8K-1V;
	Wed, 31 May 2023 23:49:50 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4VZQ-001V1t-1w
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 23:49:40 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 145FE2C0274;
	Thu,  1 Jun 2023 11:49:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685576970;
	bh=HSmU/jfAgtf+HDugcnKG02Sm6nrjvpVXrEaWsS9cpjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GpRt/jtSm0JDoPvT6qOVR8qaTlKfVvpUR9JRDjmbPDWzdfpw8IhZFXpcuaagv73uP
	 bzOjtq7Q/w4UedZF/PtHXezT9MlI719yHp/pOKrYBEHnNLHtbbJjlHQLzt9gEkckeK
	 pEBFissdMypw6940I4Ikdsr1sDv8BwlPE5EPmTuoMYAvq7JubA78SgQ4hx2c1j97Ap
	 8l/6OFpuHUxxTf+SznUxjKnZFUlHiFn/ouSAdoGak3y0BER/P+8i4G6HNWQzTzfDQt
	 0qaq/O6oC4TlB7qQSxecFQZfwhrQqMNBTzN1uaQeSpiJo7lbkRlXrr+O4rPmz/RWEY
	 Ysy9JET3sasng==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6477dd090001>; Thu, 01 Jun 2023 11:49:29 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id C42AD13ED2D;
	Thu,  1 Jun 2023 11:49:29 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id C50AB285285; Thu,  1 Jun 2023 11:49:29 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	conor@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	enachman@marvell.com,
	Vadym Kochan <vadym.kochan@plvision.eu>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v8 1/3] arm64: dts: marvell: cp11x: Fix nand_controller node name according to YAML
Date: Thu,  1 Jun 2023 11:49:21 +1200
Message-Id: <20230531234923.2307013-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Score: -1
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_164937_162704_EABA225C 
X-CRM114-Status: GOOD (  11.21  )
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
    Changes in v8:
    - Add r-by from Miquel

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
