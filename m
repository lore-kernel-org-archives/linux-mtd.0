Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5FFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:09:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B933E6124A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B933E6124A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENA/hAQ/iOwoQYDNUli7OWWkj1lopTkfM/Gmif1dtuk=; b=aCy2jPn/EZ2cHp
	Sv5UlNDH6vSl4do0NBZyRVrqaz9e4Au/utTi3jwWSAe2HlBnvan/QH5F1rLquQbSnEdMw7nVLzT2x
	sWO82C92EImXfhi6AGH6TkXzaI7Bqo1M22gStUvarTMCZurlaQzckf3JP45rJXGwxZkCXYg1cQo91
	a5aY3zhRi4aQxVICgmkb4Tca11qCOOxJ+08VrjI18bJI6enxIp7F8wIO8B0HdlfsDPMzwc/CVTFTr
	y4+3d0zRKiKJE8bzlg2OccrhpotTs91Mj2LhKB/5KhNXVe/zlYf2EwW9EEras7RCNuJf9bfajL47b
	6CiGoGKQij9XZkA7pxGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSCU-00HBnm-UT; Thu, 07 Oct 2021 12:08:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSCS-00HBn8-1l
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 12:08:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B0E46124A;
 Thu,  7 Oct 2021 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633608515;
 bh=HGmW2Bpu1a5bINyn8Ucb9I/QzXitFICRrfHlC6pBvyo=;
 h=From:To:Cc:Subject:Date:From;
 b=qrpuaWuWYUgvFHeoxYcoGRQfTOKj/mc808W/UqinXepQ5T7choodbBwd5koV1P1FQ
 tnxk/DB1uq1ENhO4rRokT0ymGl88lECHW2GT51fIP02rcKkYyhhNsgryArkzEXyH4S
 o9+cPFdfFhGAeEe1HAB9sdqOWl4PxxvzOsrgXjAZaDFKrlLIlf2/r3yzDKecYa9Z+P
 bNjcxikeMXEjGYpLXkdn+OFirALx2Bdf6tUecjnnnR5Xn2zG8xwiLSnboBTX8L5w4c
 awGfaC0DiP4/K0utyH2X2YdWrgNL2552Efl4NUd2xl89jiynScHxKiKz2x8kcc/WET
 Sm8ViJilejvFg==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v5 0/8] dt-bindings: memory-controllers: ti,
 gpmc: Convert to yaml
Date: Thu,  7 Oct 2021 15:08:22 +0300
Message-Id: <20211007120830.17221-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_050836_145752_675D3D2B 
X-CRM114-Status: GOOD (  12.26  )
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
v5
- separated DT changes so easy to review
- dropped ethernet@gpmc label changes. I was trying to fix the dtbs_check
 warning "'ethernet@gpmc' does not match any of the regexes: '@[0-7],[a-f0-9]+$', 'pinctrl-[0-9]+'"
 but the patch causes a side effect for omap4-duovero-parlor.dts such that the
 GPMC timings specified in the board DTS wer not being used but
 being overridden by omap-gpmc-smsc911x.dtsi instead. This is not what we
 want.
- dropped patch "memory: gpmc-omap: "gpmc,device-width" DT property is optional"
 I will pick this up in another series. Don't want this patch to hold back the .yaml cleanup series.
- arranged compatibles in alphabetical order in ti,gpmc.yaml
- fixed example in ti,gpmc-onenand.yaml
- Rebased on 5.15-rc1
- Added Acks

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
  dt-bindings: mtd: Remove gpmc-nor.txt
  dt-bindings: net: Remove gpmc-eth.txt
  dt-bindings: memory-controllers: Introduce ti,gpmc-child
  dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
  dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
  dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
  ARM: dts: omap: Fix boolean properties
    gpmc,cycle2cycle-{same|diff}csen
  ARM: dts: omap: fix gpmc,mux-add-data type

 .../bindings/memory-controllers/omap-gpmc.txt | 157 -----------
 .../memory-controllers/ti,gpmc-child.yaml     | 245 ++++++++++++++++++
 .../bindings/memory-controllers/ti,gpmc.yaml  | 172 ++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 -----------
 .../devicetree/bindings/mtd/gpmc-nor.txt      |  98 -------
 .../devicetree/bindings/mtd/gpmc-onenand.txt  |  48 ----
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 121 +++++++++
 .../bindings/mtd/ti,gpmc-onenand.yaml         |  81 ++++++
 .../devicetree/bindings/net/gpmc-eth.txt      |  97 -------
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi     |   4 +-
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi     |   2 +-
 arch/arm/boot/dts/omap-zoom-common.dtsi       |   4 +-
 arch/arm/boot/dts/omap2430-sdp.dts            |   4 +-
 .../arm/boot/dts/omap3-devkit8000-common.dtsi |   4 +-
 .../boot/dts/omap3-overo-tobiduo-common.dtsi  |   2 +-
 arch/arm/boot/dts/omap3-sb-t35.dtsi           |   4 +-
 16 files changed, 631 insertions(+), 559 deletions(-)
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
