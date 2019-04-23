Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C092CC10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 10:50:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895FD206A3
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 10:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtXHy9Gr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y55PkXVp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 895FD206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7LMczAxqUqHqML8XlE51SEDdF5Y73PadHAlEnwPLiI=; b=rtXHy9GrKHQDFr
	tt7OenUhL1Lisrdt9W4Fdf0u0/S9VENNiJHxcNxk8bH95E/ttxJB3yuVPnwa7nwXMGAGz+kbp0nfB
	lEdqHZFobqkotYE4Wl4rhfdtMlztMdpqUlDExD1tn9GW5SNctuIXNr2+HN7dc0cZfk6MRulA1SuBW
	rvt6VPbBj3dZTwo6pXNxbr4+1N6cgVwTMeFCRAkC8nSTqctvLEQWywp25MwIpjRL1YVuPUqpgo4IU
	Tc8khdCY3G/yO0c6djVCR35GU27SnENkzuiv9BOTcHzRg1RXNyMW5qx1g7pws2rTzjCEv8Q8k6ND9
	VturctRsei47+0l/bDXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIt0H-0003aW-Oa; Tue, 23 Apr 2019 10:50:21 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIsyz-0000nG-L7; Tue, 23 Apr 2019 10:49:08 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3NAmmFf034828;
 Tue, 23 Apr 2019 05:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1556016528;
 bh=kQyf6FnbfiD7sma8OiX4MuuRRQutQumr/9IDXDmisyg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=y55PkXVpYe5hTf/JB9KjotBpV2VxcZPbQMhKovSfKMCk2GQcBFubGn5ixnf6cvhaY
 fhj7gsZJa7OD5i7GehzUPRvflIlrDlHDPFDppI36k5/9baT2Sbk8WtWMl1FWt3d86o
 vg6c7cgpH7C/wO3wQKq0taxpLmYQ3PBeMCCm+wRI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3NAmmvF024111
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Apr 2019 05:48:48 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 23
 Apr 2019 05:48:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 23 Apr 2019 05:48:48 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3NAmNNR070020;
 Tue, 23 Apr 2019 05:48:43 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 4/5] dt-bindings: mtd: Add bindings for TI's AM654 HyperBus
 memory controller
Date: Tue, 23 Apr 2019 16:18:13 +0530
Message-ID: <20190423104814.5762-5-vigneshr@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423104814.5762-1-vigneshr@ti.com>
References: <20190423104814.5762-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_034902_416612_C7B208CB 
X-CRM114-Status: GOOD (  18.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
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
 .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 32 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt

diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
new file mode 100644
index 000000000000..fc87c7918389
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
@@ -0,0 +1,32 @@
+Bindings for HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
+
+Required properties:
+- compatible : "ti,am654-hbmc" for AM654 SoC
+- reg : Two entries:
+	First entry pointed to the register space of HBMC controller
+	Second entry pointing to the memory map region dedicated for
+	MMIO access to attached flash devices
+- ranges : Address range allocated for each chipselect in the MMIO space
+
+Optional properties:
+- mux-controls : phandle to the multiplexer that controls selection of
+		 HBMC vs OSPI. Mux state of 1 indicates HBMC is selected.
+
+Example:
+
+	hbmc: hbmc@47034000 {
+		compatible = "ti,am654-hbmc";
+		reg = <0x0 0x47034000 0x0 0x100>,
+			<0x5 0x00000000 0x1 0x0000000>;
+		power-domains = <&k3_pds 55>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
+			 <0x1 0x5 0x04000000 0x4000000>; /* CS1 - 64MB
+
+		/* Slave flash node */
+		flash@0 {
+			compatible = "cypress,hyperflash";
+			reg = <0x0 0x4000000>;
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index a5f22f85c848..1ade81f9a32a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7258,6 +7258,7 @@ S:	Supported
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
