Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BFFC53219
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 04:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VqZEQ2h02l3Paq6BtSnJGZwm5NK5QiawOdekruie278=; b=up+G9OtSdzRFdA
	5vZrtN4GmC7rWyfmPffyEWzhpzG7j1jJx7Dh6bIA9XYn8WBXvRV5vBkxPbPn6DaSeEPy7XPusRYT+
	xekwpo1Qujjg9xIMIzM1OjMiIVWUMSCApzI0KJTDyT7GpnQEtXxeh595zoK5FtKc79r4CslrAue3P
	ZI13irVaBKW35HFKMc9Hev4Nt194HtUG8N+toaAaSFEu1mZO6AA31U+WKnpv93n2E71iVniqRBBVx
	zF0uXqkwKw2LjDjyvHAY2Q+JlggqA2wz2ZWbgAAbtYk7PktlvSQd4de47lhkDTe+8UBn65xK92+sh
	u45AefBq1/uZtU2Gb0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovwS-00000006pLp-2rbv;
	Wed, 29 Jul 2026 04:30:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovwM-00000006pLN-2Tk6;
	Wed, 29 Jul 2026 04:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785299446; x=1816835446;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6ZLh78q8Jaw0bAiBJiGm3g23mqhcGsqF49qC1ZG3cCU=;
  b=q5yeN0n1AQv6fDoFVKh9doGlnyCI6vEz80hIPC2RbsYkxntLlrZLPAaV
   j5eSjYH6Ci4tLd6MbY8nbaR3DRI/XAgTE4qZX0d+P5jxM+2R2+ENjyZwC
   W2zcgdNM+1LK4/7zHjLYhQEhgspLibf67zu39lXlGOChJjDsmm3VHZmnN
   OXKLhy8UMgOCsUe+o1XWElDQlGdRBf7b3mISLO07fFU6xdMl2d/z10420
   ILe7eVpKvvxlDiqD0u59bvwWZpuH5uVdRZdhtSlENBa2Wmgi2ApZkU/JV
   ibzGqBJ5c00x7VAyvykae+xQMXIZqjtV1fEtzi0AyxOLaROtcWfAmgBdt
   g==;
X-CSE-ConnectionGUID: B4BuE8L6TnWO95OPcfEFFQ==
X-CSE-MsgGUID: ZWaCPhS6TJK1TB+xBrF68A==
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="60446878"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 21:30:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Tue, 28 Jul 2026 21:30:43 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 28 Jul 2026 21:30:35 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v6 0/7] Read MAC address from SST vendor specific SFDP region
Date: Wed, 29 Jul 2026 10:00:19 +0530
Message-ID: <20260729043026.1811147-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_213047_116782_2BAEC66F 
X-CRM114-Status: GOOD (  16.00  )
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

Some Microchip/SST QSPI flashes (e.g. the SST26VF064BEUI) are factory
programmed with globally unique, write-protected EUI-48 and EUI-64
identifiers stored in a vendor-specific SFDP parameter table. On boards
that have no on-board EEPROM (sama5d27_wlsom1, sama5d29 curiosity,
sam9x75 curiosity) this is a reliable source for an Ethernet MAC address,
instead of relying on a U-Boot-provided or random address.

The series exposes the SFDP as a generic NVMEM framework with no vendor
code in the SPI NOR core:
 - The SPI NOR core exposes the entire SFDP as a generic read-only NVMEM
   device, rooted at a new "sfdp" child node of the flash.
 - A new NVMEM layout driver (drivers/nvmem/layouts/) locates the
   Microchip vendor parameter table at runtime and presents the EUI-48 as
   a "mac-address" cell.
 - Arbitrary parameters can be read with a standard fixed-layout
   (known offset) or with an nvmem-layout parser (location discovered at runtime).

Changes in v6:
 - 3/7 - Move the SFDP NVMEM registration from sfdp.c into core.c, since
         sfdp.c is only for parsing the tables;use of_get_compatible_child()
		 instead of the open-coded child-node lookup.
 - 2/7, 6/7, 7/7 - Add Reviewed-by: Linus Walleij.

Changes in v5:
 - 1/7 and 5/7 - Add R-b tags
 - 3/7- Rework the comments, function name and commit message.Check all the nodes
        (for_each_available_child) for the right compatible "jedec,sfdp" instead
		of node name.

Changes in v4:
 - Rework per v3 review: remove the vendor-specific SFDP handling from the
   SPI NOR core; expose the whole SFDP as a generic read-only NVMEM device
   and move the EUI extraction into an nvmem-layout driver.
 - Introduce a new nvmem-layout driver to discover the vendor-table location
   at runtime; no offset hardcoded in the device tree.
 - Describe the SFDP via a dedicated "sfdp" subnode (compatible
   "jedec,sfdp"), which also resolves the v3 dtbs_check "Unevaluated
   properties ('nvmem-layout')" warning.
 - Reverse the stored EUI bytes into canonical MAC order.
 - Enable the layout in sama5_defconfig.

 Changes in v3:
 - 2/3 - add support to update the QSPI partition into 'fixed-partition'
   binding in sama5d27_wlsom1
 - 3/3 - add nvmem-layout in qspi node for EUI48 MAC Address and nvmem cell
   properties for macb node in sama5d27_wlsom1

Changes in v2:
 - 1/3 - parse the SST vendor table, read and store the addresses
  into a resource - managed space. Register the addresses
  into NVMEM framework
 - 2/3 - add support to update the QSPI partition into 'fixed-partition'
  binding

v5: https://lore.kernel.org/linux-devicetree/20260721052859.171341-1-manikandan.m@microchip.com/

Manikandan Muralidharan (7):
  dt-bindings: mtd: jedec,spi-nor: allow the SFDP to be exposed via
    NVMEM
  dt-bindings: nvmem: layouts: add Microchip/SST SFDP EUI layout
  mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device
  nvmem: layouts: add Microchip/SST SFDP EUI layout driver
  ARM: dts: microchip: sama5d27_wlsom1: use fixed-partitions for QSPI
    flash
  ARM: dts: microchip: sama5d27_wlsom1: read MAC address from QSPI SFDP
  ARM: configs: sama5: enable Microchip/SST SFDP EUI NVMEM layout

 .../bindings/mtd/jedec,spi-nor.yaml           |  18 ++
 .../layouts/microchip,sst26vf-sfdp-eui.yaml   |  60 ++++++
 .../bindings/nvmem/layouts/nvmem-layout.yaml  |   1 +
 MAINTAINERS                                   |   6 +
 .../dts/microchip/at91-sama5d27_wlsom1.dtsi   |  61 +++---
 .../dts/microchip/at91-sama5d27_wlsom1_ek.dts |   2 +
 arch/arm/configs/sama5_defconfig              |   1 +
 drivers/mtd/spi-nor/core.c                    |  91 +++++++++
 drivers/nvmem/layouts/Kconfig                 |  10 +
 drivers/nvmem/layouts/Makefile                |   1 +
 drivers/nvmem/layouts/sst26vf-sfdp-eui.c      | 182 ++++++++++++++++++
 11 files changed, 411 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml
 create mode 100644 drivers/nvmem/layouts/sst26vf-sfdp-eui.c


base-commit: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
