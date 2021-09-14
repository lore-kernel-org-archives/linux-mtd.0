Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BF0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 12:28:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2193B60F92
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 12:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2193B60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vMUhpxcn2vD+nJVfnaxYZdk3H5d3vc+3JDOu8keUy0=; b=x7/tg98C+77CSj
	Ks2jCgk3luXTqYSnYJmfx9cCWbDF4NmJiuYs3tsRjEOWXiYZlJaZn1A9OL8CMEvwjhdnAs16EqUP7
	hqPlGwZNYQZVuRIj2Xp4VEWmDNyUBYNFr2Jl5KB7jqsfT660AlZpyyTNCpUazT9wHSUPDX5ZRytxf
	NUE+2FTUrGim2HoX4Sd7/PY6gSvzQzaAH+K7c1LWKnoANUUwKwsZHCjV6Df7r2H1t2al6sXz315Od
	IjbAYbZwvLm+QAgRKf3TDdIqe3BaooLRGNQaA1arzUd6QQK+NvEa+b+w5nUDd7ScNIlDYP1La+DwI
	7i0jAb3ZGJTG6uQZj42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7XL-005eqA-JG; Tue, 14 Sep 2021 12:27:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7Wv-005elC-S6
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 12:27:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C7F160F92;
 Tue, 14 Sep 2021 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631622437;
 bh=xjXBwJevs5XgLWRG+LQGWP4p8XpWIa5UPqlENQ7qU0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hvqOs+epK6SjV1/7ci9IV2frgC1Aqw0VEISQ1/QbFtw6yyDN4vDQsBwDVLXCoWD8U
 9fU7KnhKMEuogiBpJgWBm0EjDK1G5J/OiB9KKRo9+COT7ZGtMa3l3VvSuxfP5ndzSN
 sN0dPnzf7tabjpVSLUloF/I81exQCMXobPQqegjpKP4ZW/LyZgfZcqkM1rTi/Lxjs+
 M85f1kbM3/rvqTLHELwbFxfduvFMH9aERqnR0Bc1LMJx8A2nmE3IGN+CgEJYqlI0Eo
 MLvyJdiqvu8S8Z0Cf8t3fMw/CvkgXKCuJPOy4Mo8jiNQIZ5srUyhqRsNKbtlAy0wzu
 mSltRwwHfOzzg==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 2/8] dt-bindings: mtd: Remove gpmc-nor.txt
Date: Tue, 14 Sep 2021 15:26:59 +0300
Message-Id: <20210914122705.15421-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914122705.15421-1-rogerq@kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_052718_011000_E28C4E8D 
X-CRM114-Status: GOOD (  11.64  )
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

There is no GPMC NOR compatible or device driver. GPMC is just
a bus interface over which standard (CFI/JEDC) NOR Flash chips
can be attached.

For NOR chip bindings, please refer to
Documentation/devicetree/bindings/mtd/mtd-physmap.yaml

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../devicetree/bindings/mtd/gpmc-nor.txt      | 98 -------------------
 1 file changed, 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
deleted file mode 100644
index c8567b40fe13..000000000000
--- a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
+++ /dev/null
@@ -1,98 +0,0 @@
-Device tree bindings for NOR flash connect to TI GPMC
-
-NOR flash connected to the TI GPMC (found on OMAP boards) are represented as
-child nodes of the GPMC controller with a name of "nor".
-
-All timing relevant properties as well as generic GPMC child properties are
-explained in a separate documents. Please refer to
-Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-
-Required properties:
-- bank-width: 		Width of NOR flash in bytes. GPMC supports 8-bit and
-			16-bit devices and so must be either 1 or 2 bytes.
-- compatible:		Documentation/devicetree/bindings/mtd/mtd-physmap.txt
-- gpmc,cs-on-ns:		Chip-select assertion time
-- gpmc,cs-rd-off-ns:	Chip-select de-assertion time for reads
-- gpmc,cs-wr-off-ns:	Chip-select de-assertion time for writes
-- gpmc,oe-on-ns:	Output-enable assertion time
-- gpmc,oe-off-ns:	Output-enable de-assertion time
-- gpmc,we-on-ns		Write-enable assertion time
-- gpmc,we-off-ns:	Write-enable de-assertion time
-- gpmc,access-ns:	Start cycle to first data capture (read access)
-- gpmc,rd-cycle-ns:	Total read cycle time
-- gpmc,wr-cycle-ns:	Total write cycle time
-- linux,mtd-name:	Documentation/devicetree/bindings/mtd/mtd-physmap.txt
-- reg:			Chip-select, base address (relative to chip-select)
-			and size of NOR flash. Note that base address will be
-			typically 0 as this is the start of the chip-select.
-
-Optional properties:
-- gpmc,XXX		Additional GPMC timings and settings parameters. See
-			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-
-Optional properties for partition table parsing:
-- #address-cells: should be set to 1
-- #size-cells: should be set to 1
-
-Example:
-
-gpmc: gpmc@6e000000 {
-	compatible = "ti,omap3430-gpmc", "simple-bus";
-	ti,hwmods = "gpmc";
-	reg = <0x6e000000 0x1000>;
-	interrupts = <20>;
-	gpmc,num-cs = <8>;
-	gpmc,num-waitpins = <4>;
-	#address-cells = <2>;
-	#size-cells = <1>;
-
-	ranges = <0 0 0x10000000 0x08000000>;
-
-	nor@0,0 {
-		compatible = "cfi-flash";
-		linux,mtd-name= "intel,pf48f6000m0y1be";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0 0 0x08000000>;
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
-		partition@0 {
-			label = "bootloader-nor";
-			reg = <0 0x40000>;
-		};
-		partition@40000 {
-			label = "params-nor";
-			reg = <0x40000 0x40000>;
-		};
-		partition@80000 {
-			label = "kernel-nor";
-			reg = <0x80000 0x200000>;
-		};
-		partition@280000 {
-			label = "filesystem-nor";
-			reg = <0x240000 0x7d80000>;
-		};
-	};
-};
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
