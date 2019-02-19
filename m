Return-Path: <SRS0=Ei3U=Q2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66866C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 06:37:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 291DD217D7
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 06:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qsg0cPZG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ylZVwDpS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 291DD217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0mh0kzJr/aoxswiERKQ2eQJvlhYhyRtCpxXDBkJ0Vs=; b=Qsg0cPZGMVmNY5
	ynpILM+wQGv5hysCSQ6H3aKpQHXoSXb/G94C/z4RRr+j7/1Mq7rXRVFAyFoz2FEg5UKCNUYHnpMlS
	HXtKKcXqpNqEwLj9/CasJtkVPlF4o98dLCNd4v/iH0hEM4z3NUFeAVIClyrQTQlH46vCZhYXANUyR
	SBwL1uPAyy8E47ZOpUXkjj/Dqa65s5xHhFe/jMaNNnetRConeWoKZhfg10zLPFiXam6HTaO9DsZG3
	RoaWTM5B7nop3zpnYhAaY03FLn47LALwUgsa2064fECzKPZFZVaEVxP7SxDVQHbHh35DiqTUXC8WK
	cZwDvU+pja3l1s9xaN5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvz21-0003Ri-L3; Tue, 19 Feb 2019 06:37:29 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvz0M-0001Kb-Tp; Tue, 19 Feb 2019 06:35:50 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1J6Ze5k073518;
 Tue, 19 Feb 2019 00:35:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1550558140;
 bh=7EoVC1/Iq3nKhsxWQ6HTvD37zMQjRm0VyR+29BNY/o8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ylZVwDpSxme31f3nCfxsaK9Zmsg7b0sfn8me63BeOekSWdBH/a8K4RO3QEdykSq/Q
 OSM9YTLUz15Nr8R/Hd1UHynDi8MP+lsQnmTnpqvoPcY+EvAgGYuJU6r0kPSIZLA3Bv
 brh7NW9Xj3G3d9NdroosiIB/KgbjmWmxYT/Gv17g=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1J6Zelh021977
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Feb 2019 00:35:40 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 19
 Feb 2019 00:35:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 19 Feb 2019 00:35:39 -0600
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1J6ZCt2025516;
 Tue, 19 Feb 2019 00:35:35 -0600
From: Vignesh R <vigneshr@ti.com>
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 Hyperbus memory controller
Date: Tue, 19 Feb 2019 12:06:06 +0530
Message-ID: <20190219063607.29949-5-vigneshr@ti.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219063607.29949-1-vigneshr@ti.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_223547_351377_6C026353 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add binding documentation for TI's Hyperbus memory controller present on
AM654 SoC.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 27 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt

diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
new file mode 100644
index 000000000000..b70fd1795fc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
@@ -0,0 +1,27 @@
+Bindings for Hyperbus Memory Controller on TI's K3 family of SoCs
+
+Required properties:
+- compatible : "ti,am654-hbmc" for AM654 SoC
+- reg : Two entries:
+	First entry pointed to the register space of HBMC controller
+	Second entry pointing to the memory map region dedicated for
+	MMIO access to attached flash devices
+- ranges : Address range allocated for each Chipselect in the MMIO space
+
+Example:
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
+		flash@0{
+			compatible = "cypress,hyperflash";
+			reg = <0x0 0x4000000>;
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 0808c22807bc..a9760c5e33f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7149,6 +7149,7 @@ S:	Supported
 F:	drivers/mtd/hyperbus/
 F:	include/linux/mtd/hyperbus.h
 F:	Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
+F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
 
 HYPERVISOR VIRTUAL CONSOLE DRIVER
 L:	linuxppc-dev@lists.ozlabs.org
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
