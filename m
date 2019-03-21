Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC51C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 17:46:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F3B42190A
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 17:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rXAJ7W9Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CwoLCM7i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F3B42190A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4bYtDtQ3V47D78dCLjE3A47HZmwJGWts9TUHrAdHcc=; b=rXAJ7W9QESNzQL
	vWLvtVW50cD5G2LGqN6CW+ZHMPa/QUNCePGGc5819f8VK2pVDojlNkjgL3UPXQTMeehnqad9HONsB
	J4EvG52rHqnZ9EeY0Qu26zs0H69vNK0VgIa6nEEzuWcUVZQHaFug4SYz6paEusy1hPmMTrZC9YsuV
	QA+a8lXo0h9iijWMaFnjHV9eCmoe5jOdyiDIzaO9fzTMcu25K5+iMXmULQ05JbmCiC4ewr5Atra+9
	QidmfO5o6U7R9GxyZP0UocQvnroXYrSjou9mQNRFNrrZNkX7LkT05jeJ0QTw3nOf7/gM4JDuDDIxA
	5jylCj3ldAc3Tcq3GBhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h71lj-0001qW-7s; Thu, 21 Mar 2019 17:46:19 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h71ks-0000cm-4j; Thu, 21 Mar 2019 17:45:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LHjGIJ124718;
 Thu, 21 Mar 2019 12:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553190316;
 bh=vES1CqZujTVsVSPl7PutxIgMhsDxYtRCeOwMTK/GBnk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=CwoLCM7iHF+qW7lUzvjYWLbYTYf8noPhB1kPlo87YRAldsDCX2oTpcr+XXwwygdyK
 e1g7tg2OHabhJWsPpMKCqdUiJ/u8h+Ta+XunEWlDGVJVS/3H5kzXkvyDTRo68byvMP
 3jp712XGaNsCdhgGokUNKVJKYTa5xuZED4P2+A+I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LHjGKD117636
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Mar 2019 12:45:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 21
 Mar 2019 12:45:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend Transport;
 Thu, 21 Mar 2019 12:45:16 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LHiq2Y018392;
 Thu, 21 Mar 2019 12:45:12 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 Hyperbus memory controller
Date: Thu, 21 Mar 2019 23:15:47 +0530
Message-ID: <20190321174548.9288-5-vigneshr@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190321174548.9288-1-vigneshr@ti.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_104527_203960_E4EC45CF 
X-CRM114-Status: GOOD (  19.02  )
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
Cc: devicetree@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Arnd Bergmann <arnd@arndb.de>, tudor.ambarus@microchip.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add binding documentation for TI's Hyperbus memory controller present on
AM654 SoC.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
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
index 48f1f227f65b..3453f397ad87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7194,6 +7194,7 @@ S:	Supported
 F:	drivers/mtd/hyperbus/
 F:	include/linux/mtd/hyperbus.h
 F:	Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
+F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
 
 HYPERVISOR VIRTUAL CONSOLE DRIVER
 L:	linuxppc-dev@lists.ozlabs.org
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
