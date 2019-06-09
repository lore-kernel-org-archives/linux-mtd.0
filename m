Return-Path: <SRS0=Yh92=UI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4B2C28EBD
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 10:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03B22067C
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 10:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nYC2lbpt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gbt3jixQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03B22067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJtNcQ8PJnOUsU54UTNLGBv4gdKqPTx/dhu26pURFj8=; b=nYC2lbptgneahq
	4h5tPMI6gKFJIFk2C7nE14niAPuD1StpWAHpRuklv1XBYa8zq/AUt8aaU/FVwoC7c9Ex1a6SXz8Sa
	CGoNPW15zvKLpvIg++GN9zX2UtcgXfA1b+VdmRLAHbQrXNWXKAzV4PwfmukhRPTKykSeORuMqSNr/
	5im5JaVag4P+TlXBPAs6NWSLMUvoF2FTHJTUVrNJjtVcxgAr6GPcuPhnZsehQBLVL75eldA2oA/dB
	rHUVmk2U+HDpQjUaJmb8mlsWICogqXFmphkI+YR8eNtNSoFcz4e+5zt5RLUdTv6gu5dZHFvMFjs4w
	whhg5quB1jUztGw/zapw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZvA4-0003hy-Ip; Sun, 09 Jun 2019 10:34:52 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZv7V-0001Pc-DB; Sun, 09 Jun 2019 10:32:15 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x59AW4Pe056780;
 Sun, 9 Jun 2019 05:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560076324;
 bh=ie7DaeNcCAecELQoSsCy4egwk0wIoDKbgOlLaGlCp/s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=gbt3jixQVvWRO9DmL8ShQlTHEbO3Wgl5xVp/OBMDCS1/q2Jg8KAJjDfF6AdtUgtIH
 SQK+Bq61iWHDc+Rnzzj2n7ybI0vzLgrHzB4upw0C8JH3pOkqU5Ivpudod2lV7M/VPO
 nKYOU165WTdC5eWngyowVABPGXmR74bRe+MgXpHk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x59AW4vb093359
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 9 Jun 2019 05:32:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 9 Jun
 2019 05:32:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 9 Jun 2019 05:32:03 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x59AVe1h049269;
 Sun, 9 Jun 2019 05:31:59 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 4/5] dt-bindings: mtd: Add bindings for TI's AM654 HyperBus
 memory controller
Date: Sun, 9 Jun 2019 16:02:26 +0530
Message-ID: <20190609103227.24875-5-vigneshr@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609103227.24875-1-vigneshr@ti.com>
References: <20190609103227.24875-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_033213_593857_BD36C835 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: devicetree@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add binding documentation for TI's HyperBus memory controller present on
AM654 SoC.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
v5:
Update binding example to show MMIO mux
Fix reg property for flash slave.

 .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 51 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt

diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
new file mode 100644
index 000000000000..c2a2c2b42a92
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
@@ -0,0 +1,51 @@
+Bindings for HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
+
+Required properties:
+- compatible : "ti,am654-hbmc" for AM654 SoC
+- reg : Two entries:
+	First entry pointed to the register space of HBMC controller
+	Second entry pointing to the memory map region dedicated for
+	MMIO access to attached flash devices
+- ranges : Address translation from offset within CS to allocated MMIO
+	   space in SoC
+
+Optional properties:
+- mux-controls : phandle to the multiplexer that controls selection of
+		 HBMC vs OSPI inside Flash SubSystem. Default is OSPI,
+		 if property is absent.
+		 See Documentation/devicetree/bindings/mux/reg-mux.txt
+		 for mmio-mux binding details
+
+Example:
+
+	fss: fss@47000000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x0 0x47000000 0x0 0x100>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hbmc_mux: hbmc-mux {
+			compatible = "mmio-mux";
+			#mux-control-cells = <1>;
+			mux-reg-masks = <0x4 0x2>; /* 0: reg 0x4, bit 1 */
+		};
+
+		hbmc: hbmc@47034000 {
+			compatible = "ti,am654-hbmc";
+			reg = <0x0 0x47034000 0x0 0x100>,
+				<0x5 0x00000000 0x1 0x0000000>;
+			power-domains = <&k3_pds 55>;
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges = <0x0 0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
+				 <0x1 0x0 0x5 0x04000000 0x4000000>; /* CS1 - 64MB */
+			mux-controls = <&hbmc_mux 0>;
+
+			/* Slave flash node */
+			flash@0,0 {
+				compatible = "cypress,hyperflash", "cfi-flash";
+				reg = <0x0 0x0 0x4000000>;
+			};
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 258cf0d9eb8f..d6773a8e3ba2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7344,6 +7344,7 @@ S:	Supported
 F:	drivers/mtd/hyperbus/
 F:	include/linux/mtd/hyperbus.h
 F:	Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
+F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
 
 HYPERVISOR VIRTUAL CONSOLE DRIVER
 L:	linuxppc-dev@lists.ozlabs.org
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
