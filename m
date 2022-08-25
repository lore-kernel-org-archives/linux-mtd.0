Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC2ECAAA2
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ua7exFS8XDRNrHoY0cABo5KQ17oeeRqApwGrDFp4c5U=; b=mkXa6WFTTClUxl
	gfUs5MOex/WbZL9pv2u9i0uOeN7DvXS2anlrRZKDFgrB5i516lijVkDpwQ+N/7Lc23aJj4cDTbvQf
	P5CxvGgp5KK2N0Zvg1yHMLQIrgZrTc5xuGwhHteaKfUSLkhMcr84c2H9EKJfZo0yWvRgwVoilYVEz
	P+Tu5QpiuNrCTRiFWE48Kp8zH3RQgLEcenPbSNkSzPw2ME9miU7D8lNIW0D733+mgba9Og5CouAuo
	3tkHxfFig7Ku4/lqqJ16fBqLLydo03MJGk+bfK6jwP4J9gyOVoZ++5S8GH5l0LL6kG2nxixOlfiQ1
	EEFyQuRWQnly6E8n171g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKgc-003Yd8-TO; Thu, 25 Aug 2022 21:46:50 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKeW-003XQp-Df; Thu, 25 Aug 2022 21:44:43 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A48467F2D;
	Thu, 25 Aug 2022 23:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661463876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3M/JEtjOWHXcAAVISD2wWeYzWC5769Xb3W2JMAix6aw=;
	b=EMYs8YloD0YG9HprcuieuNQJQ1NTu5wI0/7jZYVFyDVrsE/g5X/r1iCaH33yCCT0XIywNf
	TzZpiXAfnXr+nAlfHYKbXxV/4qGvz5ChdIKqNVxqwg8G32XmigPolWF4yI6pKjWcR0K+iP
	Frl2YK5gxW/H4elSZ9Ysp7Xim1feXqXEYuQlwA90VRkJXrA6kJ7Ezg1I9PnqlFPWuwYAKI
	zlEcUkC9wYqXIrEP7iXyxPKMlTUI6owAS8nVoEiazFfp9V3djTcn3ZFHLgcvakE3eskORk
	wLrB2eMkE81vD4hEEaL+MFcqoixh6S2qgk6G3Ppih8/QrIXw0HQcIRSDSwzVow==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v1 00/14] nvmem: core: introduce NVMEM layouts
Date: Thu, 25 Aug 2022 23:44:09 +0200
Message-Id: <20220825214423.903672-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_144440_687142_358B7DE1 
X-CRM114-Status: GOOD (  19.54  )
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

This is now the third attempt to fetch the MAC addresses from the VPD
for the Kontron sl28 boards. Previous discussions can be found here:
https://lore.kernel.org/lkml/20211228142549.1275412-1-michael@walle.cc/


NVMEM cells are typically added by board code or by the devicetree. But
as the cells get more complex, there is (valid) push back from the
devicetree maintainers to not put that handling in the devicetree.

Therefore, introduce NVMEM layouts. They operate on the NVMEM device and
can add cells during runtime. That way it is possible to add complex
cells than it is possible right now with the offset/length/bits
description in the device tree. For example, you can have post processing
for individual cells (think of endian swapping, or ethernet offset
handling). You can also have cells which have no static offset, like the
ones in an u-boot environment. The last patches will convert the current
u-boot environment driver to a NVMEM layout and lifting the restriction
that it only works with mtd devices. But as it will change the required
compatible strings, it is marked as RFC for now. It also needs to have
its device tree schema update which is left out here.

For now, the layouts are selected by a specifc compatible string in a
device tree. E.g. the VPD on the kontron sl28 do (within a SPI flash node):
  compatible = "kontron,sl28-vpd", "user-otp";
or if you'd use the u-boot environment (within an MTD patition):
  compatible = "u-boot,env", "nvmem";

The "user-otp" (or "nvmem") will lead to a NVMEM device, the
"kontron,sl28-vpd" (or "u-boot,env") will then apply the specific layout
on top of the NVMEM device.

NVMEM layouts as modules?
While possible in principle, it doesn't make any sense because the NVMEM
core can't be compiled as a module. The layouts needs to be available at
probe time. (That is also the reason why they get registered with
subsys_initcall().) So if the NVMEM core would be a module, the layouts
could be modules, too.

Michael Walle (14):
  net: add helper eth_addr_add()
  of: base: add of_parse_phandle_with_optional_args()
  nvmem: core: add an index parameter to the cell
  nvmem: core: drop the removal of the cells in nvmem_add_cells()
  nvmem: core: add nvmem_add_one_cell()
  nvmem: core: introduce NVMEM layouts
  nvmem: core: add per-cell post processing
  dt-bindings: mtd: relax the nvmem compatible string
  dt-bindings: nvmem: add YAML schema for the sl28 vpd layout
  nvmem: layouts: add sl28vpd layout
  nvmem: core: export nvmem device size
  nvmem: layouts: rewrite the u-boot-env driver as a NVMEM layout
  nvmem: layouts: u-boot-env: add device node
  arm64: dts: ls1028a: sl28: get MAC addresses from VPD

 .../devicetree/bindings/mtd/mtd.yaml          |   7 +-
 .../nvmem/layouts/kontron,sl28-vpd.yaml       |  52 +++++
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts     |   8 +
 .../fsl-ls1028a-kontron-sl28-var1.dts         |   2 +
 .../fsl-ls1028a-kontron-sl28-var2.dts         |   4 +
 .../fsl-ls1028a-kontron-sl28-var4.dts         |   2 +
 .../freescale/fsl-ls1028a-kontron-sl28.dts    |  13 ++
 drivers/nvmem/Kconfig                         |   2 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/core.c                          | 183 +++++++++++----
 drivers/nvmem/imx-ocotp.c                     |   4 +-
 drivers/nvmem/layouts/Kconfig                 |  22 ++
 drivers/nvmem/layouts/Makefile                |   7 +
 drivers/nvmem/layouts/sl28vpd.c               | 144 ++++++++++++
 drivers/nvmem/layouts/u-boot-env.c            | 147 ++++++++++++
 drivers/nvmem/u-boot-env.c                    | 218 ------------------
 include/linux/etherdevice.h                   |  14 ++
 include/linux/nvmem-consumer.h                |  11 +
 include/linux/nvmem-provider.h                |  47 +++-
 include/linux/of.h                            |  25 ++
 20 files changed, 649 insertions(+), 264 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
 create mode 100644 drivers/nvmem/layouts/Kconfig
 create mode 100644 drivers/nvmem/layouts/Makefile
 create mode 100644 drivers/nvmem/layouts/sl28vpd.c
 create mode 100644 drivers/nvmem/layouts/u-boot-env.c
 delete mode 100644 drivers/nvmem/u-boot-env.c

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
