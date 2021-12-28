Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D72C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Dec 2021 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Akw3nNvE33A+oI0GNOLFKZVmh0gZvPbRmKWoR1cZsEg=; b=SP5MGp/1NcmoNH
	Tn52y40n74vYqGPchTUbEqf1CghAAPp4D+NAgCFRtth2BCQgPM6ek9kSB62jG8kHblPnoFtPPJn6E
	P5HOaQAPFclhnQVMNTlPqdgvEd4eUn+9P+EiJYOlV6Q7Go3p6wDVlsZXP5Vvdl+cJ3Ih67R+Cqlpf
	GGRRfn5tX0nw8E6Cop0DNj8pkJAoU/6LCIXVM8MdtDFph68oQ1WnNYsxDJTQlRTeI8MO6NIsIB9Gc
	aGER0hkpj3PlwJPHtHbaDJk3P87NAwd/jBL7jMh20iZIBbyRTY1dg3uZJSyeYIoFW4ngnZA7wKbAA
	fRhKpUlzlXz6I4y4fKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2DTy-0018J3-Le; Tue, 28 Dec 2021 14:29:42 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2DQl-00170H-2q; Tue, 28 Dec 2021 14:26:25 +0000
Received: from mwalle01.kontron.local. (unknown
 [IPv6:2a02:810b:4340:43bf:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DF2472241C;
 Tue, 28 Dec 2021 15:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640701579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OrseTTWvtyVFTxdghVtaPYrtFfiTNlPYeSkoXqXNEbs=;
 b=v3r4VrsvSgI43d+5gtBBGUJ2w97Ail9pvJhQUqDDsJtnimXD3TjZLbsLiEQz9zoXX5K9JG
 dDSUjHPcLxkhM3FW8e6kkASPi+XJDQ9xybP3mOfLRVPRgfsz0eHpTaCgaakD+XdEvkfM10
 8/7qTFv/0fAPHL1LsYi+112of85UHMg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 7/8] arm64: dts: ls1028a: sl28: get MAC addresses from VPD
Date: Tue, 28 Dec 2021 15:25:48 +0100
Message-Id: <20211228142549.1275412-8-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211228142549.1275412-1-michael@walle.cc>
References: <20211228142549.1275412-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_062623_490004_968DDA51 
X-CRM114-Status: GOOD (  11.37  )
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

Now that it is finally possible to get the MAC addresses from the OTP
memory, use it to set the addresses of the network devices.

There are 8 reserved MAC addresses in total per board. Distribute them
as follows:

+----------+------+------+------+------+------+
|          | var1 | var2 | var3 | var4 | kbox |
+----------+------+------+------+------+------+
| enetc #0 |   +0 |      |      |   +0 |   +0 |
| enetc #1 |      |      |   +0 |   +1 |   +1 |
| enetc #2 | rand | rand | rand | rand | rand |
| enetc #3 |      |      |      |      |      |
| felix p0 |      |   +0 |      |      |   +4 |
| felix p1 |      |   +1 |      |      |   +5 |
| felix p2 |      |      |      |      |   +6 |
| felix p3 |      |      |      |      |   +7 |
| felix p4 |      |      |      |      |      |
| felix p5 |      |      |      |      |      |
+----------+------+------+------+------+------+

An empty cell means, the port is not available and thus doesn't need an
ethernet address.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts       |  8 ++++++++
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts |  2 ++
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts |  4 ++++
 .../freescale/fsl-ls1028a-kontron-sl28-var4.dts |  2 ++
 .../dts/freescale/fsl-ls1028a-kontron-sl28.dts  | 17 +++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dts
index 0bcf97772995..6f08d3442309 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dts
@@ -76,6 +76,8 @@ &mscc_felix_port0 {
 	managed = "in-band-status";
 	phy-handle = <&qsgmii_phy0>;
 	phy-mode = "qsgmii";
+	nvmem-cells = <&base_mac_address 4>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
 
@@ -84,6 +86,8 @@ &mscc_felix_port1 {
 	managed = "in-band-status";
 	phy-handle = <&qsgmii_phy1>;
 	phy-mode = "qsgmii";
+	nvmem-cells = <&base_mac_address 5>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
 
@@ -92,6 +96,8 @@ &mscc_felix_port2 {
 	managed = "in-band-status";
 	phy-handle = <&qsgmii_phy2>;
 	phy-mode = "qsgmii";
+	nvmem-cells = <&base_mac_address 6>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
 
@@ -100,6 +106,8 @@ &mscc_felix_port3 {
 	managed = "in-band-status";
 	phy-handle = <&qsgmii_phy3>;
 	phy-mode = "qsgmii";
+	nvmem-cells = <&base_mac_address 7>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dts
index 7cd29ab970d9..1f34c7553459 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dts
@@ -55,5 +55,7 @@ &enetc_port0 {
 &enetc_port1 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
+	nvmem-cells = <&base_mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dts
index 330e34f933a3..0ed0d2545922 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dts
@@ -48,6 +48,8 @@ &mscc_felix_port0 {
 	managed = "in-band-status";
 	phy-handle = <&phy0>;
 	phy-mode = "sgmii";
+	nvmem-cells = <&base_mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
 
@@ -56,6 +58,8 @@ &mscc_felix_port1 {
 	managed = "in-band-status";
 	phy-handle = <&phy1>;
 	phy-mode = "sgmii";
+	nvmem-cells = <&base_mac_address 1>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dts
index 9b5e92fb753e..a4421db3784e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dts
@@ -43,5 +43,7 @@ vddh: vddh-regulator {
 &enetc_port1 {
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
+	nvmem-cells = <&base_mac_address 1>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
index 63e005dd5aae..81b5f735d22e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
@@ -108,6 +108,8 @@ &enetc_port0 {
 	phy-handle = <&phy0>;
 	phy-mode = "sgmii";
 	managed = "in-band-status";
+	nvmem-cells = <&base_mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	status = "okay";
 };
 
@@ -170,6 +172,21 @@ partition@3e0000 {
 				label = "bootloader environment";
 			};
 		};
+
+		otp-1 {
+			compatible = "kontron,sl28-vpd", "user-otp";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			serial@2 {
+				reg = <2 15>;
+			};
+
+			base_mac_address: base-mac-address@17 {
+				#nvmem-cell-cells = <1>;
+				reg = <17 6>;
+			};
+		};
 	};
 };
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
