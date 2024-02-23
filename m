Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A367C54798
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 03:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SEEtK3oP6Zo9rw6EKMh/QDb4JcMCmBCKRaNefQJDK7E=; b=2unGrgfSRvHfkm
	EYEzeOXPqAPYqRKD1197efRaWi+Bo7pIWaH8e181ju1haGbXkuo3HDc2uZc6RpPyizdswDXCQGWnP
	MxO2nVvzFgmyjHtDBVJ2uugyBsm9Vo5TiWdaBH7pQxxI3cFNuUab3nZP2iQ3wyH1qBzc/xbMHfFpL
	ICinTXmMvp8I2au3CFL8YaRJJuAKrLMzWA+a562mBoYikCwVL4YqYv8dzKErJqDRAybT3cms8x/CW
	7rixC4mD1A8G3tmezcW2lwl3AF7ZCXC7kJeMBmwGPWsTn+dLnS1cYuZkU+QBdIMX3e/PrvlQg+wlA
	DjmPGvxmNp8UxB2LSS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMYT-00000007jjL-16mG;
	Fri, 23 Feb 2024 03:48:57 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMXo-00000007jZs-2PFI;
	Fri, 23 Feb 2024 03:48:26 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8F2CFC0000F9;
	Thu, 22 Feb 2024 19:48:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8F2CFC0000F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708660093;
	bh=ooziB8P9zJffFtDpTAHnbnxh1CvjB0PlrPh67/eGxOI=;
	h=From:To:Cc:Subject:Date:From;
	b=lROlEqp2tRShOPLi2z1Lzdbxdo7RGGFvvBWHKsbXsggJabg6dZ59ceumlJnlNmu0u
	 kikVcOk10mddRt56shzKVLe2BHZNXCdOeq0QrhJ8U9NtbcQSL5euGlZ4QORAbl8ljf
	 nhLojOnHouriL5bS8IwTAFfBuWQui+ZfHGOyusDQ=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id D5FBF18041CAC4;
	Thu, 22 Feb 2024 19:48:11 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	David Regan <dregan@broadcom.com>,
	devicetree@vger.kernel.org,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v6 00/13] mtd: rawnand: brcmnand: driver and doc updates
Date: Thu, 22 Feb 2024 19:47:45 -0800
Message-Id: <20240223034758.13753-1-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_194822_115664_F0D5C72A 
X-CRM114-Status: GOOD (  25.84  )
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

This patch series is an update from the previous version [1] after
exex_op support and fixes (patch 1 to 4 from the previous version.)

It updates all the BCMBCA SoC to support the nand controller and add
functions to handle BCMBCA specific needs on ECC and Write Protection
usage. The device tree document is also updated accordingly with the new
properties needed by the driver.

In addition there is a bug fix for exec_op helper functions, log level
adjustment on uncorrectable ECC error and some coding style fixes.

[1] https://lore.kernel.org/lkml/20230606231252.94838-1-william.zhang@broadcom.com/

Changes in v6:
- Moved style fixes to a separate patch
- Fix style issue
- Add reviewed-by tags
- Add other nand ecc properties to the exclude check list
- Update the brcm,nand-ecc-use-strap property description
- Combine the ecc step size and ecc strength into one get function
- Treat it as error condition if both brcm,nand-ecc-use-strap and nand
ecc dts properties are set
- Add intermediate steps to get the sector size bitfield

Changes in v5:
- Update the commit message
- Add reviewed-by tag
- Update the description of this new property
- Update the description for this ecc strap property
- Add check to make sure brcm,nand-ecc-use-strap and
  nand-ecc-strength/brcm,nand-oob-sector-size can not be used at the
  same time

Changes in v4:
- Fix the commit id in the fixes tag
- Revert the log level change for correctable ecc error
- Split the yaml changes into three patches. This is the first one
- Move the WP pin property to this separate patch and change it to
boolean type.
- Move ecc strap property to this separate patch and remove some
non-binding related text from the description
- Move the board related dts setting from SoC dtsi to board dts
- Move the board related dts setting from SoC dtsi to board dts
- Update the comments for ecc setting selection
- Use the new brcm,wp-not-connected property based on the dts binding
change

Changes in v3:
- Update brcm,nand-use-wp description
- Revert the description change to BCM63168 SoC-specific NAND controller
- Updated bcmbca_read_data_bus comment

Changes in v2:
- Added to patch series
- Added to patch series
- Revert the new compatible string nand-bcmbca
- Drop the BCM63168 compatible fix to avoid any potential ABI
incompatibility issue
- Simplify the explanation for brcm,nand-use-wp
- Keep the interrupt name requirement when interrupt number is specified
- Add nand controller node label for 4908 so it is consistent with other
SoCs and can be referenced by board dts file
- Drop the is_param argument to the read data bus function now that we
have the exec_op API to read the parameter page and ONFI data
- Remove be32_to_cpu from brcmnand_read_data_bus
- Minor cosmetic fixes

David Regan (2):
  mtd: rawnand: brcmnand: exec_op helper functions return type fixes
  mtd: rawnand: brcmnand: update log level messages

William Zhang (11):
  mtd: rawnand: brcmnand: fix style issues
  dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
  dt-bindings: mtd: brcmnand: Add WP pin connection property
  dt-bindings: mtd: brcmnand: Add ecc strap property
  ARM: dts: broadcom: bcmbca: Add NAND controller node
  arm64: dts: broadcom: bcmbca: Add NAND controller node
  arm64: dts: broadcom: bcmbca: Update router boards
  mtd: rawnand: brcmnand: Rename bcm63138 nand driver
  mtd: rawnand: brcmnand: Add BCMBCA read data bus interface
  mtd: rawnand: brcmnand: Add support for getting ecc setting from strap
  mtd: rawnand: brcmnand: Support write protection setting from dts

 .../bindings/mtd/brcm,brcmnand.yaml           |  44 +++++-
 arch/arm/boot/dts/broadcom/bcm47622.dtsi      |  14 ++
 arch/arm/boot/dts/broadcom/bcm63138.dtsi      |   7 +-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi      |  14 ++
 arch/arm/boot/dts/broadcom/bcm63178.dtsi      |  14 ++
 arch/arm/boot/dts/broadcom/bcm6756.dtsi       |  14 ++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi       |  14 ++
 arch/arm/boot/dts/broadcom/bcm6855.dtsi       |  14 ++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi       |  14 ++
 arch/arm/boot/dts/broadcom/bcm947622.dts      |  10 ++
 arch/arm/boot/dts/broadcom/bcm963138.dts      |  10 ++
 arch/arm/boot/dts/broadcom/bcm963138dvt.dts   |  14 +-
 arch/arm/boot/dts/broadcom/bcm963148.dts      |  10 ++
 arch/arm/boot/dts/broadcom/bcm963178.dts      |  10 ++
 arch/arm/boot/dts/broadcom/bcm96756.dts       |  10 ++
 arch/arm/boot/dts/broadcom/bcm96846.dts       |  10 ++
 arch/arm/boot/dts/broadcom/bcm96855.dts       |  10 ++
 arch/arm/boot/dts/broadcom/bcm96878.dts       |  10 ++
 .../bcmbca/bcm4906-netgear-r8000p.dts         |   5 +
 .../bcmbca/bcm4906-tplink-archer-c2300-v1.dts |   5 +
 .../bcmbca/bcm4908-asus-gt-ac5300.dts         |   6 +-
 .../boot/dts/broadcom/bcmbca/bcm4908.dtsi     |   4 +-
 .../boot/dts/broadcom/bcmbca/bcm4912.dtsi     |  14 ++
 .../boot/dts/broadcom/bcmbca/bcm63146.dtsi    |  14 ++
 .../boot/dts/broadcom/bcmbca/bcm63158.dtsi    |  14 ++
 .../boot/dts/broadcom/bcmbca/bcm6813.dtsi     |  14 ++
 .../boot/dts/broadcom/bcmbca/bcm6856.dtsi     |  14 ++
 .../boot/dts/broadcom/bcmbca/bcm6858.dtsi     |  14 ++
 .../boot/dts/broadcom/bcmbca/bcm94908.dts     |  10 ++
 .../boot/dts/broadcom/bcmbca/bcm94912.dts     |  10 ++
 .../boot/dts/broadcom/bcmbca/bcm963146.dts    |  10 ++
 .../boot/dts/broadcom/bcmbca/bcm963158.dts    |  10 ++
 .../boot/dts/broadcom/bcmbca/bcm96813.dts     |  10 ++
 .../boot/dts/broadcom/bcmbca/bcm96856.dts     |  10 ++
 .../boot/dts/broadcom/bcmbca/bcm96858.dts     |  10 ++
 drivers/mtd/nand/raw/brcmnand/Makefile        |   2 +-
 drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c |  99 ------------
 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c   | 126 +++++++++++++++
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      | 148 ++++++++++++++----
 drivers/mtd/nand/raw/brcmnand/brcmnand.h      |   2 +
 40 files changed, 650 insertions(+), 144 deletions(-)
 delete mode 100644 drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c
 create mode 100644 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c

-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
