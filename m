Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619F5C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 12:28:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B1276112D
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 12:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B1276112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JxvF/Uzk6UNm1KSm52kEdOrGzc0LTNgNPeYIhPT8h+E=; b=PldWV/EFRIhaAm
	2OVehq3kdknYFF8igTpMuJLaOaOBQ21sM63XDgU9VwrZ71D4P6m+nVWrBkbJxsFfhwo6VppINaruQ
	xFOOFifs3caSqKqZJhGT/W7+FhVKPeWdwDJ15X8z+gdHGW3jglGoTaQzl9Yva0H/1Z3Qfj8PZBw60
	qQPnJdj6MGLLii8V7jjKxlXRzpFtRZ5enh1I6k8nzply132TBcKiJklxeWkS3U5F6i6VrY8IKAE6w
	56ubI+O/MM2FKNUUq/KeYo403VPQCeAMI72Czvmpf/XkDCNYou9qULDFRIjwkl0zxpZxLOBTXfNZH
	HbDk1hyShmYJ4Ru4MhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7Wv-005ekj-AM; Tue, 14 Sep 2021 12:27:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7Wq-005ejt-Mf
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 12:27:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CE2560F92;
 Tue, 14 Sep 2021 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631622431;
 bh=3MW75SNryOfQxZCpvZDbF5g/YNXNSo6pjaNk3Uj8TZM=;
 h=From:To:Cc:Subject:Date:From;
 b=m/GC6/fpHAzTqnRWpOG5YN7GJxQ4QrtqsYu/qs3kCJc4M392bHpMjo4ZfJYlXAtzp
 bhRNS7w+BBQg0ojOICjv3zdsC6T5r9irOsm65Gsf8J24/7vwcsOaKbr8rxFGU0w2rA
 vouWmy2N1cnnln2PtW67EMy8XoIvJE/FH3O62bTytMyjhWx+mKOZTSo8Md4I2URkTp
 YXU+BwlSdzkyln4DkC3+bK3R7tpEzJPZ3hOigu0gMPLkzQPAePOxQivzurxm4/ZecI
 E7ZfMnEXkZcK2tpGGLMCutrCTysKaPh2NkRDkUaB08OuyjgYB+9Z4vL4wZAmeOhWq8
 Eqv+gzsxL09Sg==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 0/8] dt-bindings: memory-controllers: ti,
 gpmc: Convert to yaml
Date: Tue, 14 Sep 2021 15:26:57 +0300
Message-Id: <20210914122705.15421-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_052712_828072_EB7BB5CF 
X-CRM114-Status: GOOD (  10.65  )
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

Hi,

This series converts ti,gpmc memory controller and ti,gpmc-nand and
ti,gpmc-onenand MTD controller bindings to yaml.

cheers,
-roger

Changelog:
v4
- reference partition.yaml in ti,gpmc-nand.yaml and ti,gpmc-onenenc.yaml
- use address-cells/size-cells: true instead of absolute size.

v3:
- fix indentation
- split GPMC child timings/settings into ti,gpmc-child.yaml
This allows us to refer to it at 3 places and avoid use of
'additionalProperties: true' at 2 places.
- specify defaults where applicable
- reordered patches
- added patch for making "gpmc,device-width" optional with defaults.
- address all review comments.

v2:
- Fix all errors in dtbs_check and dt_bindings_check
- remove references to gpmc-omap.txt
- Convert ti,gpmc-nand and ti,gpmc-onenand bindings to yaml as well

Roger Quadros (8):
  ARM: dts: omap: Fixup GPMC child nodes
  dt-bindings: mtd: Remove gpmc-nor.txt
  dt-bindings: net: Remove gpmc-eth.txt
  dt-bindings: memory-controllers: Introduce ti,gpmc-child
  dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
  dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
  dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
  memory: gpmc-omap: "gpmc,device-width" DT property is optional

 .../bindings/memory-controllers/omap-gpmc.txt | 157 -----------
 .../memory-controllers/ti,gpmc-child.yaml     | 245 ++++++++++++++++++
 .../bindings/memory-controllers/ti,gpmc.yaml  | 172 ++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 -----------
 .../devicetree/bindings/mtd/gpmc-nor.txt      |  98 -------
 .../devicetree/bindings/mtd/gpmc-onenand.txt  |  48 ----
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 121 +++++++++
 .../bindings/mtd/ti,gpmc-onenand.yaml         |  81 ++++++
 .../devicetree/bindings/net/gpmc-eth.txt      |  97 -------
 .../boot/dts/logicpd-som-lv-baseboard.dtsi    |   2 +-
 .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |   2 +-
 .../boot/dts/logicpd-torpedo-baseboard.dtsi   |   2 +-
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi     |  62 +++--
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi     |  59 ++---
 arch/arm/boot/dts/omap-zoom-common.dtsi       |  16 +-
 arch/arm/boot/dts/omap2430-sdp.dts            |   6 +-
 arch/arm/boot/dts/omap3-cm-t3x30.dtsi         |   6 +-
 .../arm/boot/dts/omap3-devkit8000-common.dtsi |   4 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts          |   1 +
 arch/arm/boot/dts/omap3-evm-common.dtsi       |   9 -
 .../boot/dts/omap3-evm-processor-common.dtsi  |   5 +-
 arch/arm/boot/dts/omap3-evm.dts               |   1 +
 arch/arm/boot/dts/omap3-igep0020-common.dtsi  |   5 +-
 arch/arm/boot/dts/omap3-ldp.dts               |   5 +-
 arch/arm/boot/dts/omap3-n900.dts              |   2 +-
 .../dts/omap3-overo-chestnut43-common.dtsi    |   6 +-
 .../arm/boot/dts/omap3-overo-tobi-common.dtsi |   6 +-
 .../boot/dts/omap3-overo-tobiduo-common.dtsi  |   8 +-
 arch/arm/boot/dts/omap3-sb-t35.dtsi           |   4 +-
 arch/arm/boot/dts/omap4-duovero-parlor.dts    |   6 +-
 drivers/memory/omap-gpmc.c                    |  41 +--
 31 files changed, 750 insertions(+), 674 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
