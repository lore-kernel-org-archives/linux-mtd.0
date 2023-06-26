Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A7BEB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 03:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/iAcQLo4G7agiaFAf0xBOsHmL1zmuYSCc1U5LtL6F8=; b=BXw256EyfUBKYG
	1dQzxfNwYiqksP2W4Z5Ob/krEssSZJaN3KIT5MUUBSD0qcfB2l28O411VNnoxAsgX5aAS0rpMz8KB
	AvsbZ6scerm5mq9yNLfUMdSIHnJbm/YKPRUKUXxepsjX0xyitfibF5ibWLPr27glpSZoxkgeQqZfm
	EplwKCA3K+S57XCzczSuIUpK+ckmW/MeQE6AfBkJ/YSxvJKzaBTQnJvIEMZVTP1umlfNC8tUmt4RS
	zwYFDG1apn+5zXq/hKp/S+dF1nVDnrnyJhzAGypsDE+bBaekAgHh7urXxfOQmNDXETVNeKYIL9oEl
	Ec7nrei+hOUrM/AK+Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDceY-009DGX-1d;
	Mon, 26 Jun 2023 03:12:34 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDceT-009DDN-2I
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 03:12:31 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 039782C055E;
	Mon, 26 Jun 2023 15:12:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1687749141;
	bh=qyuUI+GTbigVnLlHtbXT9nNOWssZWdbxI7Bqwiieak8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TY67yQ5BxL4sg46haJEXGpozSvX91Y9otoDTdYdGTAgQK9k7JKEi0shHHL1nD0QBL
	 lRpxpsXG4qUu/NhcZi2ZZUWUX+wIDDwc7duAFdNAqpxYokrq8Erf0u2VP4FFkIk5GT
	 pnjMPpOv+Fwsqv+1XOA3QYQwDh1DM9GmUBWA82ejx04A0+7MDrx6qZmNppfaUJj0YC
	 0B5A+1nBwo/NFTK4U9lAuG1zac9mvZ8uWa8etqpX5a/CnimYlEERbuFq5IM/g6ygtr
	 EffuJplMzPQZu48Q/K38rVjS7ecvNpGfKCKONNCzu+AqCQhx3laxdXtnWAjBvxJKHs
	 bB3VYsojSPXRw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B649902140002>; Mon, 26 Jun 2023 15:12:20 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A24D013EE63;
	Mon, 26 Jun 2023 15:12:20 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id A2BC6283B3E; Mon, 26 Jun 2023 15:12:20 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregory.clement@bootlin.com,
	pierre.gondois@arm.com,
	arnd@arndb.de,
	f.fainelli@gmail.com
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/3] arm64: dts: marvell: Add NAND flash controller to AC5
Date: Mon, 26 Jun 2023 15:12:16 +1200
Message-ID: <20230626031217.870938-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626031217.870938-1-chris.packham@alliedtelesis.co.nz>
References: <20230626031217.870938-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=of4jigFt-DYA:10 a=AWclJRrDGzD0f9BZm7oA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_201229_919339_645ED94F 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

The AC5/AC5X SoC has a NAND flash controller (NFC). Add this to
the base SoC dtsi file as a disabled node. The NFC integration
on the AC5/AC5X only supports SDR timing modes up to 3 so requires a
dedicated compatible property so this limitation can be enforced.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - New.

 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index 8bce64069138..74d644e0c29e 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -296,6 +296,16 @@ spi1: spi@805a8000 {
 			status = "disabled";
 		};
 
+		nand: nand-controller@805b0000 {
+			compatible = "marvell,ac5-nand-controller";
+			reg =  <0x0 0x805b0000 0x0 0x00000054>;
+			#address-cells = <0x1>;
+			#size-cells = <0x0>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cnm_clock>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@80600000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
