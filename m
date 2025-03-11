Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6577BC28B30
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Mar 2025 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FTdmiFyW8wDqw8KpX+uxRIdqZHFZL45ZgMvUkQJn6OE=; b=UZc1gI69kiau6v
	aVkkzJlesJB68Npq13uj+0eZRLh4CedFqdWLpn21VK4nV/E/0uL1e1ayPJOAFsrepp7IMvKFpOJM1
	lJTpIfTpwWTQ12BbstFkHFnlHl3AlIJ5yndwFMkLUGTUn5jI2KpsXD/Jv/KApvCvgFKWB5GHjdSUp
	s4wMB6acz93qjKvN3HTZQ4wOqvimARdnedIc3aup/uHllHQPUbTRAeSbC8UR6mrIPrldqhO4qFQmp
	lviSVbwNGwgW0nDVLlJEnxf0rAC8tyoY7WSO+T28b4NmHvkZttKZmjGq3y76T5BDtQAsmWC6SDSX3
	2m2ZGUu2fTAsGrjkgdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryve-00000005h3h-2mm7;
	Tue, 11 Mar 2025 12:41:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryjR-00000005e5t-1Ilo;
	Tue, 11 Mar 2025 12:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741696153; x=1773232153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N5EXNlqtL69VGYYDyrDYpntJcNL/9MeXJc8QaKRw7gU=;
  b=zm2va2+cZlJlPcf+6Upzzv97sX/51clkFX5JmcYElED6BDARJnjMPAmu
   VePXu8yno4WGI1UAZt2AVMhEt+wosjqhcW4K0RFQe1lkHvwFDX3cZxG/8
   Dk257Ssa8oK49QmPbaojCcpUk0sjK8NsDonTLL67/XySMOvCxnyc0Zmwb
   1A/w1aJ5aBsPVCN7+ZnyDkjIttp4vKVCgboh8783jZPRIUi7oDa+g+Wzx
   4aS90Lhm7nl1xaOL3uyaMNiuhp/7mwpEupVqfXz2kbQlyDr4+kablONf5
   xHYcYzykc6pPXAWvtT9CRZAzbVBe13zJevTtS32wvun+UOhi3Yv2LMwe0
   g==;
X-CSE-ConnectionGUID: baDVeSDOToyF+0WNRKcbNA==
X-CSE-MsgGUID: ka0iJvLtR023JNL7dOig9g==
X-IronPort-AV: E=Sophos;i="6.14,239,1736838000"; 
   d="scan'208";a="206334035"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Mar 2025 05:29:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 05:29:01 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 05:28:55 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <balamanikandan.gunasundar@microchip.com>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] dt-bindings: mtd: microchip-nand: convert txt to yaml
Date: Tue, 11 Mar 2025 17:58:44 +0530
Message-ID: <20250311122847.90081-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_052913_529023_86AE7C5F 
X-CRM114-Status: GOOD (  12.63  )
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

Convert microchip nand controllers from text to yaml

This patch is a respin of
https://lore.kernel.org/all/20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com/

Summary of changes:

[PATCH v2 1/3] dt-bindings: mtd: microchip-nand: convert txt to yaml
- Change the filename to match the compatible string
- Drop items and oneOf in the compatible property as it is just an enum
- Remove the if in the #address-cells and #size-cells
- Remove the unwanted comments that refers to .txt files
- Fix reg property description
- Define the properties in a list and add constraints
- Fix DT coding style and droped unused labels

[PATCH v2 2/3] dt-bindings: mtd: microchip-nand: add atmel pmecc
- Rename filename to match compatible string
- Add constraints for sam9x7
- Droped unused dt labels 

[PATCH v2 3/3] dt-bindings: mtd: atmel-nand: add legacy nand
- Filename matching the compatibles
- Remove "bindings" from the subject
- Remove "deprecated" as these are the only bindings available for the devices
- Add missing constraints.
- Add default for nand-ecc-mode
- Add 32 in pmecc-cap for sama5d2
- Add default for sector-size, pmecc-lookup-table-offset, nand-bus-width

Balamanikandan Gunasundar (3):
  dt-bindings: mtd: microchip-nand: convert txt to yaml
  dt-bindings: mtd: microchip-nand: add atmel pmecc
  dt-bindings: mtd: atmel-nand: add legacy nand controllers

 .../devicetree/bindings/mtd/atmel-nand.txt    | 227 ------------------
 .../devicetree/bindings/mtd/atmel-nand.yaml   | 163 +++++++++++++
 .../mtd/microchip,nand-controller.yaml        | 175 ++++++++++++++
 .../bindings/mtd/microchip,pmecc.yaml         |  67 ++++++
 4 files changed, 405 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
