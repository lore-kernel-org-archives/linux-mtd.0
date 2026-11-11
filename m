Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E5606A334
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1IU9zUjO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=oiYou3WK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VzIs3DgKbJ3y1F/HNAemm5mlMuWgbjS5pIRzfZC0hRc=; b=1IU9zUjOU4PGdzACS5TZPwGmgL
	nUKAqYBKnDejaSbAUP5YH1+/InvG4SASWqKtTD47yAbVAoC2HJOlSTACyLSQqBtr46yBeNYFGSiFp
	CBT6LR7iU2UG7Z9BIb+rl5qV8S+z+aHOHLkB4sDXI6ZLXRZ280Zp8tto+ZEs7LpcwXI0B9czjUWie
	6sHAhgjaVbQRb95vZpEC079IOtFubzmHeepPtvb+bU1LnO7TRU9Lu4QRS1x8SWJk4eOg28CQZzmPd
	ixHoj5LrQKz7DtADEwSbuYb7j7qqE2OqGEHuLzunFBYVDnAuVyYxxvFylsibNX33tsGXqddDGuK/z
	Fs1pz3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6vo-00000006ZIM-3aSs;
	Wed, 11 Nov 2026 11:56:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6vm-00000006ZHm-10gg;
	Wed, 11 Nov 2026 11:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794398158; x=1825934158;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iAo/MtDhNKHmBSnZPURm1ePfYky+B/A+M0UcnkNs04Y=;
  b=oiYou3WKbRfiEy0NpgYtJWYYQH2hpQfxLTVtl8MmpfamfzBPtMI0fjKj
   4VIu/Gj/AuEGOBXffcZdpuIurcVRXDr3DtanIicsoKob0VpukoklYcAXl
   OzKN4CJGB1Kf2btDPBvQhrixQ8Wqe8ZtcMr+7FtjQbzxBefdIdd5kC0AC
   PpKDa+ETBrKd8pdYqZUMiTKYvEpPvbiQUWZClzWAfGR7Dxx/z2nSpNcXV
   EUqOGE+/CiO3Mr/AsSp1p4UAFW8fCKIBlgamFGbmo/9YcFEmv1A/0m9mN
   NQs6dSzrP+/OP/tQD+ZeZbrI/5SMju1gc2oT95Q40COFxvMV4Lmaeaml4
   A==;
X-CSE-ConnectionGUID: LYG/GoI+QpaP1PxmQQ3/0A==
X-CSE-MsgGUID: /ghRVTySTreVrSckWNpD8Q==
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="65385184"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:55:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Wed, 11 Nov 2026 04:55:55 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 04:55:46 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <enelsonmoore@gmail.com>, <aaro.koskinen@iki.fi>,
	<pengpeng@iscas.ac.cn>, <mathieu.dubois-briand@bootlin.com>,
	<gregkh@linuxfoundation.org>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v10 0/8] Read MAC address from SST vendor specific SFDP region
Date: Wed, 11 Nov 2026 17:25:32 +0530
Message-ID: <cover.1794391660.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035558_561383_F78F5AD0 
X-CRM114-Status: GOOD (  21.20  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Changes in v10:
 - Rebased on v7.4-rc1 merge window.
 - 3/8 - Rebased on the nvmem SRCU rework; of_node_put() moves into the
         reworked nvmem_release(). No functional change.
 - 4/8 - Commit message wording only;
 - 5/8 - Drop the read_post_process() callback: the EUI-48 is already
         stored in canonical MAC order (24-bit OUI followed by the 24-bit
         extension identifier), so the cell is exposed as-is.
Changes in v9:
 - 3/8 - Add Reviewed-by: Miquel Raynal, Reviewed-by: Michael Walle.
 - 4/8 - Add Reviewed-by: Miquel Raynal, Reviewed-by: Michael Walle.
         Drop the early return after of_get_compatible_child(). Updated the
		 comments and commit message to match.
 - 5/8 - Move the Makefile entry for sst26vf-sfdp-eui.o to the end.
         Move the ETH_ALEN check to the top of sfdp_eui_read_post_process()
		 and bail out early.
		 Compute nph as hdr.nph+1 and loop for the 0-based parameter-header count.
         Cosmetic fixes.

Changes in v8:
 - New 3/8 - nvmem: core: take a reference on dev.of_node in
             nvmem_register(). v7's 3/8 (now 4/8) called of_node_put() right
			 after devm_nvmem_register(), which left nvmem->dev.of_node backed by
			 no reference at all once the caller's own reference was dropped.
			 Fixing it at the nvmem_register() by taking  its own of_node_get()
			 when assigning nvmem->dev.of_node and released in nvmem_release().
 - 6/8 - drop the #address-cells/#size-cells from the qspi1_flash node.

Changes in v7:
 - 1/7 - Add blank lines in the "sfdp" schema per review;
 		 Add Reviewed-by: Rob Herring.
 - 2/7 - Add Reviewed-by: Rob Herring.
 - 3/7 - Drop the spi_nor_sfdp_nvmem_put_np() helper and
 		 call of_node_put() right after devm_nvmem_register().
 - 6/7 - Note in the commit message that the sama5d27_wlsom1 SoM ships the
         factory-programmed SST26VF064BEUI, so the EUI-48 "mac-address"
         cell is always present.

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

v9: https://lore.kernel.org/all/cover.1792145382.git.manikandan.m@microchip.com/
v8: https://lore.kernel.org/all/cover.1790847519.git.manikandan.m@microchip.com/

Manikandan Muralidharan (8):
  dt-bindings: mtd: jedec,spi-nor: allow the SFDP to be exposed via
    NVMEM
  dt-bindings: nvmem: layouts: add Microchip/SST SFDP EUI layout
  nvmem: core: take a reference on dev.of_node in nvmem_register()
  mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device
  nvmem: layouts: add Microchip/SST SFDP EUI layout driver
  ARM: dts: microchip: sama5d27_wlsom1: use fixed-partitions for QSPI
    flash
  ARM: dts: microchip: sama5d27_wlsom1: read MAC address from QSPI SFDP
  ARM: configs: sama5: enable Microchip/SST SFDP EUI NVMEM layout

 .../bindings/mtd/jedec,spi-nor.yaml           |  20 +++
 .../layouts/microchip,sst26vf-sfdp-eui.yaml   |  60 +++++++
 .../bindings/nvmem/layouts/nvmem-layout.yaml  |   1 +
 MAINTAINERS                                   |   6 +
 .../dts/microchip/at91-sama5d27_wlsom1.dtsi   |  63 ++++---
 .../dts/microchip/at91-sama5d27_wlsom1_ek.dts |   2 +
 arch/arm/configs/sama5_defconfig              |   1 +
 drivers/mtd/spi-nor/core.c                    |  75 +++++++++
 drivers/nvmem/core.c                          |   5 +-
 drivers/nvmem/layouts/Kconfig                 |  10 ++
 drivers/nvmem/layouts/Makefile                |   1 +
 drivers/nvmem/layouts/sst26vf-sfdp-eui.c      | 158 ++++++++++++++++++
 12 files changed, 376 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml
 create mode 100644 drivers/nvmem/layouts/sst26vf-sfdp-eui.c


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
