Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0166EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 11:33:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA2F0610A3
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 11:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA2F0610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/i3L01GNMFyrR6tApQRUHCzxoltE2UqYPLEY63o5aU=; b=jP4Po4wyIOblug
	H/m0WFQpXPvXbO14tUAgHjRWhI+h2i09M1/V2c+okE2IOU0+1VumPIgCV8jTQJSRVsy+2DxLc15/X
	LCm2i1geamgsnN4uf8fXuUczxLgbYuHWfWCFYqPtVKvMPyO5M/LH8h62FNi1JNubEtWqDKyFjLbH9
	kPlyUE+Gn6PcCcXTScgQOYbkyHSxP/4gS/U+cK+KBqB0Kk9qBnAXO2Lcwh5G41Vpm8WZP2Cjxq78x
	wkA79pDmpA75BplcooZEAGYiz2V5J9q9I30bVZcy22zumSpumMKdSNymYA1ZwMyXukS2aNJfbIgrs
	Se4MhIVXvM6ULEOijygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNZLo-003VfK-NV; Tue, 07 Sep 2021 11:33:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNZLF-003Va2-9n
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 11:32:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81780610A3;
 Tue,  7 Sep 2021 11:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631014361;
 bh=48j2wsnGyat2ILyzMymL7hUEkoVXB+R33pMrIohVclo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ieWhPeVRUctXlWAZQAgqk5ogAEJYA/1Pm0X8PHvphVJ8zyCnQikZywjX8Tf6dGQvO
 CqD99DFmEhHZ5y7dZ/k2zgYK794diAKBbIB1dg+6Z2YII1ix5Ihuz3EmAAuHFJsW3d
 1Yn0gen21AeAwz9aSx1N6TVzhGcFa/TZb0sPIlDGO16UkI+KeDHfjkl5kOqUfgaL9g
 pBgILe4BHojbF+KbgG6kb9KudrIiObO66kqvCI/tWXKe1P9we8O39hDIsfrMx6b0Pp
 YzqTu6gSPHTKg3VrgrRYtnsVKpAeF3RE9qqfDb9KBKe3cddi8ukJNFM9MeDcSO86lI
 zNziePd7c0+DA==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v3 3/8] dt-bindings: net: Remove gpmc-eth.txt
Date: Tue,  7 Sep 2021 14:32:21 +0300
Message-Id: <20210907113226.31876-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907113226.31876-1-rogerq@kernel.org>
References: <20210907113226.31876-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_043241_416085_83A1DAA8 
X-CRM114-Status: GOOD (  13.55  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no GPMC Ethernet compatible or device driver. GPMC is
just a bus interface over which devices like Ethernet controller
can be to.

For SMSC 911x Ethernet chip bindings, please refer to
Documentation/devicetree/bindings/net/smsc,lan9115.yaml

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/net/gpmc-eth.txt      | 97 -------------------
 1 file changed, 97 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt

diff --git a/Documentation/devicetree/bindings/net/gpmc-eth.txt b/Documentation/devicetree/bindings/net/gpmc-eth.txt
deleted file mode 100644
index 32821066a85b..000000000000
--- a/Documentation/devicetree/bindings/net/gpmc-eth.txt
+++ /dev/null
@@ -1,97 +0,0 @@
-Device tree bindings for Ethernet chip connected to TI GPMC
-
-Besides being used to interface with external memory devices, the
-General-Purpose Memory Controller can be used to connect Pseudo-SRAM devices
-such as ethernet controllers to processors using the TI GPMC as a data bus.
-
-Ethernet controllers connected to TI GPMC are represented as child nodes of
-the GPMC controller with an "ethernet" name.
-
-All timing relevant properties as well as generic GPMC child properties are
-explained in a separate documents. Please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-
-For the properties relevant to the ethernet controller connected to the GPMC
-refer to the binding documentation of the device. For example, the documentation
-for the SMSC 911x is Documentation/devicetree/bindings/net/smsc,lan9115.yaml
-
-Child nodes need to specify the GPMC bus address width using the "bank-width"
-property but is possible that an ethernet controller also has a property to
-specify the I/O registers address width. Even when the GPMC has a maximum 16-bit
-address width, it supports devices with 32-bit word registers.
-For example with an SMSC LAN911x/912x controller connected to the TI GPMC on an
-OMAP2+ board, "bank-width = <2>;" and "reg-io-width = <4>;".
-
-Required properties:
-- bank-width: 		Address width of the device in bytes. GPMC supports 8-bit
-			and 16-bit devices and so must be either 1 or 2 bytes.
-- compatible:		Compatible string property for the ethernet child device.
-- gpmc,cs-on-ns:	Chip-select assertion time
-- gpmc,cs-rd-off-ns:	Chip-select de-assertion time for reads
-- gpmc,cs-wr-off-ns:	Chip-select de-assertion time for writes
-- gpmc,oe-on-ns:	Output-enable assertion time
-- gpmc,oe-off-ns:	Output-enable de-assertion time
-- gpmc,we-on-ns:	Write-enable assertion time
-- gpmc,we-off-ns:	Write-enable de-assertion time
-- gpmc,access-ns:	Start cycle to first data capture (read access)
-- gpmc,rd-cycle-ns:	Total read cycle time
-- gpmc,wr-cycle-ns:	Total write cycle time
-- reg:			Chip-select, base address (relative to chip-select)
-			and size of the memory mapped for the device.
-			Note that base address will be typically 0 as this
-			is the start of the chip-select.
-
-Optional properties:
-- gpmc,XXX		Additional GPMC timings and settings parameters. See
-			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-
-Example:
-
-gpmc: gpmc@6e000000 {
-	compatible = "ti,omap3430-gpmc";
-	ti,hwmods = "gpmc";
-	reg = <0x6e000000 0x1000>;
-	interrupts = <20>;
-	gpmc,num-cs = <8>;
-	gpmc,num-waitpins = <4>;
-	#address-cells = <2>;
-	#size-cells = <1>;
-
-	ranges = <5 0 0x2c000000 0x1000000>;
-
-	ethernet@5,0 {
-		compatible = "smsc,lan9221", "smsc,lan9115";
-		reg = <5 0 0xff>;
-		bank-width = <2>;
-
-		gpmc,mux-add-data;
-		gpmc,cs-on-ns = <0>;
-		gpmc,cs-rd-off-ns = <186>;
-		gpmc,cs-wr-off-ns = <186>;
-		gpmc,adv-on-ns = <12>;
-		gpmc,adv-rd-off-ns = <48>;
-		gpmc,adv-wr-off-ns = <48>;
-		gpmc,oe-on-ns = <54>;
-		gpmc,oe-off-ns = <168>;
-		gpmc,we-on-ns = <54>;
-		gpmc,we-off-ns = <168>;
-		gpmc,rd-cycle-ns = <186>;
-		gpmc,wr-cycle-ns = <186>;
-		gpmc,access-ns = <114>;
-		gpmc,page-burst-access-ns = <6>;
-		gpmc,bus-turnaround-ns = <12>;
-		gpmc,cycle2cycle-delay-ns = <18>;
-		gpmc,wr-data-mux-bus-ns = <90>;
-		gpmc,wr-access-ns = <186>;
-		gpmc,cycle2cycle-samecsen;
-		gpmc,cycle2cycle-diffcsen;
-
-		interrupt-parent = <&gpio6>;
-		interrupts = <16>;
-		vmmc-supply = <&vddvario>;
-		vmmc_aux-supply = <&vdd33a>;
-		reg-io-width = <4>;
-
-		smsc,save-mac-address;
-	};
-};
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
