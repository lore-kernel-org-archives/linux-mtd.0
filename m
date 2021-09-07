Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA8CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 11:34:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F38960E8B
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 11:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F38960E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMAWxcJuGcscwygx0obyIFntpy49rrLzDz1eGe77Uzw=; b=ExliUUhxnv3kPA
	eth1gjFrKtaEg0q+PQarWZFuTvc1FUfmUls+b+n9M8EiCOsi8BjgrDpkG5hkdbpC1lUmFAf3IrVVg
	f71padhmMlqcdytUd+NhRNV5k/KUnpmpU5KlL/OikRvSibMU7B/rb8zATQEBKFBzdMX0tAa42eC61
	lik5+SETMHs5AMCn1wQAUwchh3y3wazby4kvqhw91lcindsGR2JrvyUq5WWNAuW+yIWX/UNv/XndJ
	B+q0jmarhGXggYCfzDu9o3u9dbJY2t5zhivFMsdZNVlDee8b77bxtkKC651AXdfgtPEBCpeqaxPGx
	mJGdSrZV0GOMTqxsif8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNZM8-003VmQ-TI; Tue, 07 Sep 2021 11:33:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNZLI-003VaW-6u
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 11:32:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BEFA61106;
 Tue,  7 Sep 2021 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631014363;
 bh=JMgLRg+MPLZHv1ymCIZfvsiF/0iGq/teBN4f3Hmfbr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vRryJnk66iiHkP3VbaA7KMFb/3mL0t45pwA+cgDo3rekOxFLZ2r26dF5b+tFRG0/s
 THiAw7L5NFHjSwFNZSJ30+BeIECf//ivr+8X2IsaQ3GVqM/jJvTLKUhk6wxBxR7yKR
 q+N8uYSWtZWmgAiSrsMRQeLgfP+L7MiCtO6KDet0xVKAf4E7A22ozS/rC4Zzq20oDN
 EaY0CtuUAWOhNMSQrCoIUlV3R+xQSFJsRFAFuIjVl/wI0yIRC1cTHA5oBkkwwbEzPO
 zmrYMmPiEHadlQte++TR6zcKLOAU/sbtBHOooFfsComLn934PkMTKwYsHizZh9Gx8G
 hvUacKC3o99cQ==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v3 4/8] dt-bindings: memory-controllers: Introduce ti,
 gpmc-child
Date: Tue,  7 Sep 2021 14:32:22 +0300
Message-Id: <20210907113226.31876-5-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907113226.31876-1-rogerq@kernel.org>
References: <20210907113226.31876-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_043244_330892_26817A51 
X-CRM114-Status: GOOD (  16.47  )
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

This binding is meant for the child nodes of the TI GPMC node. The node
represents any device connected to the GPMC bus. It may be a Flash chip,
RAM chip or Ethernet controller, etc. These properties are meant for
configuring the GPMC settings/timings and will accompany the bindings
supported by the respective device.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 .../memory-controllers/ti,gpmc-child.yaml     | 245 ++++++++++++++++++
 1 file changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
new file mode 100644
index 000000000000..6e3995bb1630
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -0,0 +1,245 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ti,gpmc-child.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: device tree bindings for children of the Texas Instruments GPMC
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+  - Roger Quadros <rogerq@kernel.org>
+
+description:
+  This binding is meant for the child nodes of the GPMC node. The node
+  represents any device connected to the GPMC bus. It may be a Flash chip,
+  RAM chip or Ethernet controller, etc. These properties are meant for
+  configuring the GPMC settings/timings and will accompany the bindings
+  supported by the respective device.
+
+properties:
+  reg: true
+
+# GPMC Timing properties for child nodes. All are optional and default to 0.
+  gpmc,sync-clk-ps:
+    description: Minimum clock period for synchronous mode
+    default: 0
+
+# Chip-select signal timings corresponding to GPMC_CONFIG2:
+  gpmc,cs-on-ns:
+    description: Assertion time
+    default: 0
+
+  gpmc,cs-rd-off-ns:
+    description: Read deassertion time
+    default: 0
+
+  gpmc,cs-wr-off-ns:
+    description: Write deassertion time
+    default: 0
+
+# ADV signal timings corresponding to GPMC_CONFIG3:
+  gpmc,adv-on-ns:
+    description: Assertion time
+    default: 0
+
+  gpmc,adv-rd-off-ns:
+    description: Read deassertion time
+    default: 0
+
+  gpmc,adv-wr-off-ns:
+    description: Write deassertion time
+    default: 0
+
+  gpmc,adv-aad-mux-on-ns:
+    description: Assertion time for AAD
+    default: 0
+
+  gpmc,adv-aad-mux-rd-off-ns:
+    description: Read deassertion time for AAD
+    default: 0
+
+  gpmc,adv-aad-mux-wr-off-ns:
+    description: Write deassertion time for AAD
+    default: 0
+
+# WE signals timings corresponding to GPMC_CONFIG4:
+  gpmc,we-on-ns:
+    description: Assertion time
+    default: 0
+
+  gpmc,we-off-ns:
+    description: Deassertion time
+    default: 0
+
+# OE signals timings corresponding to GPMC_CONFIG4:
+  gpmc,oe-on-ns:
+    description: Assertion time
+    default: 0
+
+  gpmc,oe-off-ns:
+    description: Deassertion time
+    default: 0
+
+  gpmc,oe-aad-mux-on-ns:
+    description: Assertion time for AAD
+    default: 0
+
+  gpmc,oe-aad-mux-off-ns:
+    description: Deassertion time for AAD
+    default: 0
+
+# Access time and cycle time timings (in nanoseconds) corresponding to
+# GPMC_CONFIG5:
+  gpmc,page-burst-access-ns:
+    description: Multiple access word delay
+    default: 0
+
+  gpmc,access-ns:
+    description: Start-cycle to first data valid delay
+    default: 0
+
+  gpmc,rd-cycle-ns:
+    description: Total read cycle time
+    default: 0
+
+  gpmc,wr-cycle-ns:
+    description: Total write cycle time
+    default: 0
+
+  gpmc,bus-turnaround-ns:
+    description: Turn-around time between successive accesses
+    default: 0
+
+  gpmc,cycle2cycle-delay-ns:
+    description: Delay between chip-select pulses
+    default: 0
+
+  gpmc,clk-activation-ns:
+    description: GPMC clock activation time
+    default: 0
+
+  gpmc,wait-monitoring-ns:
+    description: Start of wait monitoring with regard to valid data
+    default: 0
+
+# Boolean timing parameters. If property is present, parameter is enabled
+# otherwise disabled.
+  gpmc,adv-extra-delay:
+    description: ADV signal is delayed by half GPMC clock
+    type: boolean
+
+  gpmc,cs-extra-delay:
+    description: CS signal is delayed by half GPMC clock
+    type: boolean
+
+  gpmc,cycle2cycle-diffcsen:
+    description: |
+      Add "cycle2cycle-delay" between successive accesses
+      to a different CS
+    type: boolean
+
+  gpmc,cycle2cycle-samecsen:
+    description: |
+      Add "cycle2cycle-delay" between successive accesses
+      to the same CS
+    type: boolean
+
+  gpmc,oe-extra-delay:
+    description: OE signal is delayed by half GPMC clock
+    type: boolean
+
+  gpmc,we-extra-delay:
+    description: WE signal is delayed by half GPMC clock
+    type: boolean
+
+  gpmc,time-para-granularity:
+    description: Multiply all access times by 2
+    type: boolean
+
+# The following two properties are applicable only to OMAP3+ and AM335x:
+  gpmc,wr-access-ns:
+    description: |
+      In synchronous write mode, for single or
+      burst accesses, defines the number of
+      GPMC_FCLK cycles from start access time
+      to the GPMC_CLK rising edge used by the
+      memory device for the first data capture.
+    default: 0
+
+  gpmc,wr-data-mux-bus-ns:
+    description: |
+      In address-data multiplex mode, specifies
+      the time when the first data is driven on
+      the address-data bus.
+    default: 0
+
+# GPMC chip-select settings properties for child nodes. All are optional.
+  gpmc,burst-length:
+    description: Page/burst length.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 4, 8, 16]
+    default: 0
+
+  gpmc,burst-wrap:
+    description: Enables wrap bursting
+    type: boolean
+
+  gpmc,burst-read:
+    description: Enables read page/burst mode
+    type: boolean
+
+  gpmc,burst-write:
+    description: Enables write page/burst mode
+    type: boolean
+
+  gpmc,device-width:
+    description: |
+      Total width of device(s) connected to a GPMC
+      chip-select in bytes. The GPMC supports 8-bit
+      and 16-bit devices and so this property must be
+      1 or 2.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+    default: 1
+
+  gpmc,mux-add-data:
+    description: |
+      Address and data multiplexing configuration.
+      Valid values are
+      0 for Non multiplexed mode
+      1 for address-address-data multiplexing mode and
+      2 for address-data multiplexing mode.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+
+  gpmc,sync-read:
+    description: |
+      Enables synchronous read. Defaults to asynchronous
+      is this is not set.
+    type: boolean
+
+  gpmc,sync-write:
+    description: |
+      Enables synchronous writes. Defaults to asynchronous
+      is this is not set.
+    type: boolean
+
+  gpmc,wait-pin:
+    description: |
+      Wait-pin used by client. Must be less than "gpmc,num-waitpins".
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  gpmc,wait-on-read:
+    description: Enables wait monitoring on reads.
+    type: boolean
+
+  gpmc,wait-on-write:
+    description: Enables wait monitoring on writes.
+    type: boolean
+
+required:
+  - reg
+
+# the GPMC child will have its own native properties
+additionalProperties: true
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
