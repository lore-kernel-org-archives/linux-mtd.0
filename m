Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BF7C4828F
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 00:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UjB66fxsvsOVkTN8l4bOFaxM3J0zETa9JBVbEutjNz0=; b=s48UjVIYXL6RlF
	L4nzIiOhwAq4RHYzWagn0AY3SVmi7NdfeUvsN3T52rONC91USVdglgXjpolMSk5AGy8C9LVPvbEqh
	f/pLQbb3st0tGdEKlnips3zuGkjhz4r/bcAgEyyNhtmPeQfwh6K4gEeyepLBgbsPoScquunPzwfzE
	imxoNQPkQiwhywgEPVeXWQc9SbAkNM+F5v6B2QPkhsJGOESxi3cgqi+18p44zauWkQR5VUeLpUHHy
	lZiszlHIMCvTRONJpUQRHyVUvtYA5gDn527TbjG14bynMWDKwS9qTmyy1m/CrI7UG2BLOJwOFzszp
	XnoLqmCiqHEubJA77aeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3u3-0000000DwGv-3B9W;
	Sat, 03 Feb 2024 00:29:03 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3u0-0000000DwGL-20ir;
	Sat, 03 Feb 2024 00:29:02 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4E384C001668;
	Fri,  2 Feb 2024 16:28:55 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4E384C001668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1706920135;
	bh=6IQ2jaFQHup3JsKNrVAd3gd6vlUrscEJfijinF/hldk=;
	h=From:To:Cc:Subject:Date:From;
	b=nVoSGtgI+VGLYpVsku7u3qKIEEu4jKfcDFkG2JnJsn4rlXIIN5mS1AfXg8E8LcarT
	 Q/0Df0cBhKderf+SST47yI3qWo1UUUtqD5TILU0ZZ31pgGC4Tju4NJCRKOCSjWWc0V
	 IHcwbKjELiKVZxpvTXPlpbQrFaEoB2G3AbhtaSzk=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id C3D4A18041CAC4;
	Fri,  2 Feb 2024 16:28:53 -0800 (PST)
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
	Shawn Guo <shawnguo@kernel.org>,
	David Regan <dregan@broadcom.com>,
	devicetree@vger.kernel.org,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 00/12] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
Date: Fri,  2 Feb 2024 16:28:21 -0800
Message-Id: <20240203002834.171462-1-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_162900_884422_BC8B2CE0 
X-CRM114-Status: GOOD (  21.27  )
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

In addition there is a bug fix for exec_op helper functions and log
level adjustment on uncorrectable ECC error.

[1] https://lore.kernel.org/lkml/20230606231252.94838-1-william.zhang@broadcom.com/

Changes in v4:
- Split the yaml changes into three patches.
- Move the WP pin property to a new patch and change it to boolean type.
- Move ecc strap property to a new patch and remove some non-binding 
related text from the description
- Add a new patch for bcm4908 based router board dts update
- Move the board related dts setting from SoC dtsi to board dts
- Update the comments for ecc setting selection
- Use the new brcm,wp-not-connected property based on the dts binding
change
- Fix the commit id in the fixes tag
- Revert the log level change for correctable ecc error

Changes in v3:
- Update brcm,nand-use-wp description
- Revert the description change to BCM63168 SoC-specific NAND controller
- Updated bcmbca_read_data_bus comment

Changes in v2:
- Revert the new compatible string nand-bcmbca
- Drop the BCM63168 compatible fix to avoid any potential ABI
Incompatibility issue
- Simplify the explanation for brcm,nand-use-wp
- Keep the interrupt name requirement when interrupt number is specified
- Add nand controller node label for 4908 so it is consistent with other
SoC's and can be referenced by board dts file
- Drop the is_param argument to the read data bus function now that we
have the exec_op API to read the parameter page and ONFI data
- Minor cosmetic fixes
- Added patches 8, 9, 10 to patch series

David Regan (2):
  mtd: rawnand: brcmnand: exec_op helper functions return type fixes
  mtd: rawnand: brcmnand: update log level messages

William Zhang (10):
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

 .../bindings/mtd/brcm,brcmnand.yaml           |  29 +++-
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
 drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c |  99 --------------
 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c   | 126 ++++++++++++++++++
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      | 126 +++++++++++++++---
 drivers/mtd/nand/raw/brcmnand/brcmnand.h      |   2 +
 40 files changed, 623 insertions(+), 134 deletions(-)
 delete mode 100644 drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c
 create mode 100644 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c

-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
