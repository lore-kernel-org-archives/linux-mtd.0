Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2834DC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 23:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYJCTkiWB4FESIH4d2Ht8aztFGlGIeLDQ9tb06g8WRs=; b=OkMnbfI4EtNeAa
	TBwOpsxUUxea+eJJRSKEvN0Pf/hrsBwg0+GuBuj+gOJIpgouKMLoNkaQFcZ26AbFeraZ8Y9bGKbOw
	WbI2TF/05SQXRgd6Iiv3xbj9nio3mApV4RMnk0ESCL86bMG9IHZKCwg73iHoPA5w0PeADnGRpoGzn
	Fb9NUCgAPcZ0WTZx+livU10FF4cCU6dVYA/ltGh7RRuzov7TBSJDk7bh9KzejHugt6RLRQlNlkfJm
	i0hEOtvlCFEdMuxPsiLa1uBC2zAxOsG5dMLDfbvlA0PQHnc6CzKno9RGnC/xHCcjrK6UnihH5qjUf
	uGoXK1DkAAc6yhiVM+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q49BR-00FX9R-2D;
	Tue, 30 May 2023 23:55:21 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q49BD-00FX26-2o
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 23:55:11 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BE6F22C05CC;
	Wed, 31 May 2023 11:55:04 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685490904;
	bh=MZ7YBEWJ2Mhd+Qk1GxIEC4t0MfhKhq1id7+zT7JKrCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O2Zo0jV4tOky/MGHPI3d/5FZG55ngXns3VNPIjYxIoQ3gIIaiiq6+BFguUwX7bS0t
	 ca078Fze3/P0cAWftMm9Ps3x96xofjYr85gmoPiE96cgVsskq8o7ZJPjim2FtGANdZ
	 X4XLH77BZ138xyo7WW35KlGeZpnLO9XpKyR/Iu6Zogme7xmKvk/JfQzdt4/J01Y5mb
	 oIpzFvZuYOXJDGA81wUUbWoLlcCIe0lTfb+iE0XnLPLKkV9vztAJHDHCchQ/aC9atc
	 YNEAMLMLe+nPnq9wDQ33uIIVW1K4viancTF9Memg2QlCEakQhrQkZ5I/ojs5T8NCmY
	 Fcia4/nxqBREQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64768cd80002>; Wed, 31 May 2023 11:55:04 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 8B04313EDD5;
	Wed, 31 May 2023 11:55:04 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 89E06280AFE; Wed, 31 May 2023 11:55:04 +1200 (NZST)
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
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 2/4] ARM: dts: mvebu: align MTD partition nodes to dtschema
Date: Wed, 31 May 2023 11:54:54 +1200
Message-Id: <20230530235456.1009082-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=nIxSuVNCFVl6EelTsckA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_165508_466375_B3DC5AD7 
X-CRM114-Status: UNSURE (   8.77  )
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
---
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
