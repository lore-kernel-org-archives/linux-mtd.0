Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A3DC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 15:33:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC31D6145D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 15:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC31D6145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T8qu7gD/veLRZIP1b15GdPQxNwyz145X880PN27tn68=; b=raXidKda/YdqtZP70/r1A6ibJf
	qbZrJmsCAi9cRt4tQvsHCUCDG3Ba/lU7CvjaPtPUV/eXNK337LFpRFYCv1Y5PYRwSDhEoxDehidwJ
	ov9fg3si4yceMQIdcTIT19phiSN9k81PLi4MauDub/U8AOo9GqZeXuT/rlicFCbF9WTRdTvul04wp
	+pHJfM5AdxmFiCEiVDmxXbnahpHxzAOfXNbekrlOv6p/mW/nXuNxrgxZ61LnDYd9jJERgjoIsKG7n
	P12nNhdaJ8NrOGAVPngQVoJduYdKJeESV9l+w3Eb5uAhkgGu1hWCo/4TJwMeRBgWoYgs5imP3qujq
	YH7liagA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcV85-0086RL-PI; Fri, 30 Apr 2021 15:32:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcV83-0086Qq-2v
 for linux-mtd@desiato.infradead.org; Fri, 30 Apr 2021 15:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FCLS1GLyQlkGp3zu1BU9RazGdGYYmfQhtwc4wI/aLgg=; b=pwGm/g1vuVbDSH/KriGZPIDSvK
 70unFJOyJBDAgZ1EWbq7ZexSdVea33D37OL6X/x0WkJu+CLyJG2iXqHUClTV8YpUZ8iFAfiTZc6WZ
 pGdQ3ulVIQNQCrRnp0lHiHLB2VOJ/uXTixKSxcX/CNk95mc5ajHa9trI84wJ8uoQXM+lRnxwOZaNM
 3edJiNzNZnM7jQJ15tlk7W7MccjjAQ41k2X3lPotad4yDidTtKxa3DIj9xHfoHf9+dapIIMgKdIUP
 +xNle4mz5QDoKNzDvIcZ7ng7JAfpxga3YODda6PUQqY2rvzF/h6d+xR4y8GTFgAuRzT5s+kfE9MrJ
 PDEntwBQ==;
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcV80-001UBc-HE
 for linux-mtd@lists.infradead.org; Fri, 30 Apr 2021 15:32:29 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so59627771otf.12
 for <linux-mtd@lists.infradead.org>; Fri, 30 Apr 2021 08:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCLS1GLyQlkGp3zu1BU9RazGdGYYmfQhtwc4wI/aLgg=;
 b=niyWwwWqrY23/T4fxacL15uShJyIGd0ilZJsyq8frHOfi3s4Q4lu/1Nil+hELUfStl
 d/G+ML8ubEM3122yJymsq7yGej3pZZpKJjhtAxRFxSQK71oecmTLJB8HvDfZQg7zB3hz
 kfBaY7MCsuCMYCKQZSJBg1Qe+mTg97UQxyyVvQePDnBSWbBDNBMID/H76WyMggUn0rCc
 ljkTzBlR8/grfwiZSrix416A8IuoFYnpH9t4baa2Xd4lZ6DMvSK4MZnIEpUCEGyYdhJZ
 7AUU7vL6MEe+t/qWm21w5oIY0pMvlNOtr5zwEhkVOpIHM+WJsUsIG1FFkJcP7Jo3ndgE
 PULQ==
X-Gm-Message-State: AOAM530YoK2QCYsnQ66QHLQRQNUV8af8feWpPFUomdfYyz7hMpgPlybI
 yjGDy6JG1Zq5KLwK4cSSRg==
X-Google-Smtp-Source: ABdhPJxspi8koawi87rDZP8S4ambTTkmJXTP/reXKGk5kGoiZqXjRxtH1DFAiLza5teOv/WVW/j/Wg==
X-Received: by 2002:a9d:d0f:: with SMTP id 15mr564205oti.255.1619796747191;
 Fri, 30 Apr 2021 08:32:27 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id j22sm757610otr.0.2021.04.30.08.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 08:32:26 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mtd@lists.infradead.org,
 linux-pci@vger.kernel.org
Subject: [PATCH] dt-bindings: Remove unused Sigma Designs Tango bindings
Date: Fri, 30 Apr 2021 10:32:25 -0500
Message-Id: <20210430153225.3366000-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_083228_590863_CA42D1FC 
X-CRM114-Status: GOOD (  12.70  )
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

The Sigma Designs Tango support has been removed, but 2 binding docs
for NAND and PCIe were missed. Remove them.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-pci@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/tango-nand.txt    | 38 -------------------
 .../devicetree/bindings/pci/tango-pcie.txt    | 29 --------------
 2 files changed, 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/tango-nand.txt
 delete mode 100644 Documentation/devicetree/bindings/pci/tango-pcie.txt

diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
deleted file mode 100644
index 91c8420241af..000000000000
--- a/Documentation/devicetree/bindings/mtd/tango-nand.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Sigma Designs Tango4 NAND Flash Controller (NFC)
-
-Required properties:
-
-- compatible: "sigma,smp8758-nand"
-- reg: address/size of nfc_reg, nfc_mem, and pbus_reg
-- dmas: reference to the DMA channel used by the controller
-- dma-names: "rxtx"
-- clocks: reference to the system clock
-- #address-cells: <1>
-- #size-cells: <0>
-
-Children nodes represent the available NAND chips.
-See Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
-
-Example:
-
-	nandc: nand-controller@2c000 {
-		compatible = "sigma,smp8758-nand";
-		reg = <0x2c000 0x30>, <0x2d000 0x800>, <0x20000 0x1000>;
-		dmas = <&dma0 3>;
-		dma-names = "rxtx";
-		clocks = <&clkgen SYS_CLK>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		nand@0 {
-			reg = <0>; /* CS0 */
-			nand-ecc-strength = <14>;
-			nand-ecc-step-size = <1024>;
-		};
-
-		nand@1 {
-			reg = <1>; /* CS1 */
-			nand-ecc-strength = <14>;
-			nand-ecc-step-size = <1024>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pci/tango-pcie.txt b/Documentation/devicetree/bindings/pci/tango-pcie.txt
deleted file mode 100644
index 244683836a79..000000000000
--- a/Documentation/devicetree/bindings/pci/tango-pcie.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Sigma Designs Tango PCIe controller
-
-Required properties:
-
-- compatible: "sigma,smp8759-pcie"
-- reg: address/size of PCI configuration space, address/size of register area
-- bus-range: defined by size of PCI configuration space
-- device_type: "pci"
-- #size-cells: <2>
-- #address-cells: <3>
-- msi-controller
-- ranges: translation from system to bus addresses
-- interrupts: spec for misc interrupts, spec for MSI
-
-Example:
-
-	pcie@2e000 {
-		compatible = "sigma,smp8759-pcie";
-		reg = <0x50000000 0x400000>, <0x2e000 0x100>;
-		bus-range = <0 3>;
-		device_type = "pci";
-		#size-cells = <2>;
-		#address-cells = <3>;
-		msi-controller;
-		ranges = <0x02000000 0x0 0x00400000  0x50400000  0x0 0x3c00000>;
-		interrupts =
-			<54 IRQ_TYPE_LEVEL_HIGH>, /* misc interrupts */
-			<55 IRQ_TYPE_LEVEL_HIGH>; /* MSI */
-	};
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
