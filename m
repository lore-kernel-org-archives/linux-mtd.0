Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18C0EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 04:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuQ0NvpZNoUc0qzn1lpP0tJR+ShwytpvCFERhk0Jd3o=; b=hHi4zagXyUbfgD
	NFmykG9c3tDuiAlqiZ1eJamLzWT02qiilA88iLIYo3AGbo5R0Fx+Paf6EFTm0l2J+Uz3taJYYf+Sk
	leDostcnlzHrrQGHjOFsL/EQ/VH349JBIlOyS4EszjQoDcY3HsXG0SCS3HBkoPdfXXLk58nmrzqtF
	iZwymdU8vzL8267/TgkeNYgknWiQ1qtvn/PwT35EwTmfpOeQp+5duESDp5Ueh9G6e+kRWMhgg/qNx
	rz9/5dUynw04YgmI/0WZ6cjeCP4dOYapPQBRkQweKlIrm81ISVvY+RKoxd9emmTz6vNu18EuplSJf
	8aJTsuU1F8gYKepDCBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9eEg-00DXtE-29;
	Thu, 15 Jun 2023 04:05:26 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9eEN-00DXj9-0F
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 04:05:09 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6EFC52C0384;
	Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1686801894;
	bh=brRwJmGWxsIgAeWWrc4opZFfZN44SwSxhn4XIF05bQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HQtP0CQ4Xa8AK8PQ/xrCxznBnqIWdkngVt/cNi2Pd+x/Tly3Q1m0qjDKXcEeO0MNi
	 sIgsvr4BHMuX6kh+v/cYjj/0xn1a9aptuBKKR8ZrwIEnDP6mHDeprQymDd1Jm4LZAp
	 2DfVkhmI/cpXto+QRfURnzbQwhf8z81Yei36estZyFZ1hSppiqRS7SPS1G4BFBN6KB
	 WDyoQBCCqIdeaiRa3WynwAHLA02M0L3JKAjan7CB26nMwGIp1aOGM39pOzikwZFrM7
	 Cs3OuX8XbjSXo13oFTYX2a6f81coDQd1Q0R1Z3zbmp6c4NnIDJgmuXFyqFdJgvIVZa
	 xGWyuw+2zCd4Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B648a8de60002>; Thu, 15 Jun 2023 16:04:54 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4B1AB13ED5B;
	Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 477EC2815D4; Thu, 15 Jun 2023 16:04:54 +1200 (NZST)
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
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 2/3] ARM: dts: mvebu: align MTD partition nodes to dtschema
Date: Thu, 15 Jun 2023 16:04:46 +1200
Message-Id: <20230615040447.3484564-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NPqrBHyg c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=of4jigFt-DYA:10 a=P-IC7800AAAA:8 a=nIxSuVNCFVl6EelTsckA:9 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_210507_313284_26204C93 
X-CRM114-Status: UNSURE (   8.97  )
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

Update the node names for the SPI NOR and NAND partitions to conform to
the partition properties in the relevant dtschema.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Notes:
    Changes in v9:
    - None
    Changes in v8:
    - Add r-by from Miquel

 arch/arm/boot/dts/armada-385-atl-x530.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-atl-x530.dts b/arch/arm/boot/dts/armada-385-atl-x530.dts
index 241f5d7c80e9..5a9ab8410b7b 100644
--- a/arch/arm/boot/dts/armada-385-atl-x530.dts
+++ b/arch/arm/boot/dts/armada-385-atl-x530.dts
@@ -179,19 +179,19 @@ partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			partition@u-boot {
+			partition@0 {
 				reg = <0x00000000 0x00100000>;
 				label = "u-boot";
 			};
-			partition@u-boot-env {
+			partition@100000 {
 				reg = <0x00100000 0x00040000>;
 				label = "u-boot-env";
 			};
-			partition@unused {
+			partition@140000 {
 				reg = <0x00140000 0x00e80000>;
 				label = "unused";
 			};
-			partition@idprom {
+			partition@fc0000 {
 				reg = <0x00fc0000 0x00040000>;
 				label = "idprom";
 			};
@@ -216,16 +216,16 @@ partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			partition@user {
+			partition@0 {
 				reg = <0x00000000 0x0f000000>;
 				label = "user";
 			};
-			partition@errlog {
+			partition@f000000 {
 				/* Maximum mtdoops size is 8MB, so set to that. */
 				reg = <0x0f000000 0x00800000>;
 				label = "errlog";
 			};
-			partition@nand-bbt {
+			partition@f800000 {
 				reg = <0x0f800000 0x00800000>;
 				label = "nand-bbt";
 			};
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
