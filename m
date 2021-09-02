Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD7BC432BE
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 09:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D2760724
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 09:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41D2760724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u04ViAAlyvcBoYJ5eUe2It+cMvKjn2tN+iZf7TLw0DU=; b=nBIdlgJupBT3vN
	gUL+va1bj/51Ez7dEmIZv+dKOQtwNVubYg17TlB7MI8Bx9WmIssvBQ8NbhAp3nz7tXZzEcDikIpNE
	f1Bul7EtYNoPExdtBbLOBBo/smtBTfma/2HFOFB05oAeM2mKstkxNRacagzizr0CDVon6dGXwxeYD
	ptNLH/zVA2SZSV2O0irhJ7QdfXVmZX0sxAYTX9QEXIIyz3eJxrcd3frk42npoN03aIwiCekToZa2W
	BzfoL8g1qCvXJWn5WqppcB9D9KH2/LTfgQr89Igzy+FNAxQhm/xOkXYyhSMpGJjfrPgavUk+xspNL
	ND5xGm6qXfYqJdfQBfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLjSE-009B1U-Oz; Thu, 02 Sep 2021 09:56:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLjSC-009B0q-65
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 09:56:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5860560525;
 Thu,  2 Sep 2021 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630576575;
 bh=Z8WT93iMfPtGcY/7MRMgThZsMD/TOvlbUhTRN5F/47Y=;
 h=From:To:Cc:Subject:Date:From;
 b=D6nx9d14dorAF1Ocl3z8akTPeHaEQj9JyJyHjd9S/r+qHN9FTXH1BN/vtD36JZeI0
 RZW205UVgX/RcfOP61931s611dmJvy7ZnMW2myA1huTvzn8OpBgccKzmYSJmFTz8Bz
 m9nsuiO37oxEwPtJQDgkjT/a2vH0kn10YESL0mpb8ZU71hYh2nMSfquedxVoeRfABN
 KzJZhU97h/NVsQETN9PCnXXeYmVC0m5GdXar40mD48jHUTcSncHj76TnohKmcYHQMy
 v/EKrAeYqgDczAIHcHJ6OOE5XcSVgSGk21Ovsd/v5v+icPrHW9zyeh3lxQ9R831SUs
 XTM355k1NuIYQ==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 0/6] dt-bindings: memory-controllers: ti,
 gpmc: Convert to yaml
Date: Thu,  2 Sep 2021 12:56:03 +0300
Message-Id: <20210902095609.16583-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_025616_298055_975BFEB3 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
v2:
- Fix all errors in dtbs_check and dt_bindings_check
- remove references to gpmc-omap.txt
- Convert ti,gpmc-nand and ti,gpmc-onenand bindings to yaml as well

Roger Quadros (6):
  ARM: dts: omap: Fixup GPMC child nodes
  dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
  dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
  dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
  dt-bindings: mtd: Remove gpmc-nor.txt
  dt-bindings: net: Remove gpmc-eth.txt

 .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
 .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 -------
 .../devicetree/bindings/mtd/gpmc-nor.txt      |  98 -----
 .../devicetree/bindings/mtd/gpmc-onenand.txt  |  48 ---
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 109 ++++++
 .../bindings/mtd/ti,gpmc-onenand.yaml         |  71 ++++
 .../devicetree/bindings/net/gpmc-eth.txt      |  97 -----
 .../boot/dts/logicpd-som-lv-baseboard.dtsi    |   2 +-
 .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |   2 +-
 .../boot/dts/logicpd-torpedo-baseboard.dtsi   |   2 +-
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi     |  62 ++-
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi     |  59 ++-
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
 29 files changed, 649 insertions(+), 659 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
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
