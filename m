Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52787C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Dec 2021 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7PBsp9HaXEvz8IxzY+oygWsCHvcjUvluHya8gFtQRBU=; b=nBHdwYOA0TIBx7
	wBVIFjPFuBreACtAwSKwD4OZkOQdQ4EWZH7kyKwLbqYZW9MSrsKqQxv23t4w5xQJ3XhfjJ+5307eI
	CavXSXlPxaB4HArh2SkBLLxbv40sA0TJTfir5KvKLV3zmOLh7dpKTkKKV0K8fG+Kg5bC8XRnPLwIX
	5tPypAMnvyqGnqbGoZRDLTrtxd2AkYSHvcp3Ayb8Zq66FhzLI2jPOesw2GloIFMlkpembM6Y8MRX0
	7jQbSyWuc02WHCbP9FMPelEGq4EmcQEogwqucd+b1brdKaeTXyYdojCyX8kDF3qgLmJhKAqF7qLzX
	x2VrtWZjJXSShf5nnNOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2DR4-001795-65; Tue, 28 Dec 2021 14:26:42 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2DQh-0016yL-GB; Tue, 28 Dec 2021 14:26:21 +0000
Received: from mwalle01.kontron.local. (unknown
 [IPv6:2a02:810b:4340:43bf:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 759F122246;
 Tue, 28 Dec 2021 15:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640701574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=R7nzXrrSsFrUHRSgijOJS8QeBq0JY35WUr2whTQ6JzM=;
 b=Mdr6LWqzC3IcHb3GPTOPvu6mLduLfAc1d91yRwpVrPDM3N1JMBc9TFFErc3tdNqHi8WSVR
 /634D2XTLXxZlujv0T7ReIQoXRFDx5uTdST3fuARDna6iOoZ1WVWlfe8nT2PO+aa7aD2uu
 wAHqRd6bUXoMDoYzRB8oWR2jUxT3+D8=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 0/8] nvmem: add ethernet address offset support
Date: Tue, 28 Dec 2021 15:25:41 +0100
Message-Id: <20211228142549.1275412-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_062619_741359_4BA441BD 
X-CRM114-Status: GOOD (  16.48  )
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

This is my second attempt to solve the use case where there is only the
base MAC address stored in an EEPROM or similar storage provider. This
is the case for the Kontron sl28 board and multiple openwrt supported
boards.

Introduce an NVMEM transformation op. This can then be used to parse or
swap bytes of the NVMEM cell value. A transformation might also have
multiple output values, like in the base mac address case. It reads the mac
address from the nvmem storage and generates multiple individual addresses,
i.e. on our board we reserve 8 consecutive addresses. These addresses then
can be assigned to different network interfaces. To make it possible to
reference different values we need to introduce an argument to the phandle.
This additional argument is then an index which is can be used by the
transformation op.

Previous discussion can be found here:
https://lore.kernel.org/linux-devicetree/20211123134425.3875656-1-michael@walle.cc/

Michael Walle (8):
  of: base: add of_parse_phandle_with_optional_args()
  dt-bindings: nvmem: add transformation bindings
  nvmem: core: add an index parameter to the cell
  nvmem: core: add transformations support
  net: add helper eth_addr_add()
  nvmem: transformations: ethernet address offset support
  arm64: dts: ls1028a: sl28: get MAC addresses from VPD
  arm64: defconfig: enable NVMEM transformations

 .../devicetree/bindings/mtd/mtd.yaml          |  7 +-
 .../bindings/nvmem/nvmem-transformations.yaml | 46 ++++++++++++
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts     |  8 ++
 .../fsl-ls1028a-kontron-sl28-var1.dts         |  2 +
 .../fsl-ls1028a-kontron-sl28-var2.dts         |  4 +
 .../fsl-ls1028a-kontron-sl28-var4.dts         |  2 +
 .../freescale/fsl-ls1028a-kontron-sl28.dts    | 17 +++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/nvmem/Kconfig                         |  7 ++
 drivers/nvmem/Makefile                        |  1 +
 drivers/nvmem/core.c                          | 44 ++++++++---
 drivers/nvmem/imx-ocotp.c                     |  4 +-
 drivers/nvmem/transformations.c               | 73 +++++++++++++++++++
 drivers/of/base.c                             | 23 ++++++
 include/linux/etherdevice.h                   | 14 ++++
 include/linux/nvmem-provider.h                | 13 +++-
 include/linux/of.h                            | 12 +++
 17 files changed, 260 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
 create mode 100644 drivers/nvmem/transformations.c

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
