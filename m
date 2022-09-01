Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA70C54EE9
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pi5fSELJi2qzUVxg2tJRIGQ/IVZ0qCbV3mpY1BFsBpg=; b=tY+Hd6eKrUqwJR
	DCs8qUM6ZnRw1Ak56wkRQ+tGqsoZwvfPpzxXDUDkpXpb07XQCU0WLZNOHK8hCHCeqGwtrXvIsH1mr
	6CVW9/KH1ymbYF7d6KVokmj1Jx5D5E9Qi9Gf7zBfm5qETg+F5Eq0d4nTyYxuce+0d49f1/Qhe+dKi
	FxGyQPV6UKTLLrM3Kj/ycMmE7b1jAZrPCeUiaLNVqdR9Ld/x2z+XkVjbgT6vwlNTgr7prKXO/qCGa
	JEY6hjJlyuEUxN+1MQ9LqAirBw66PvdAId4Cgjg/LI7mqzqgXb4pvMuXXE/bbiiH6yql5IvcuU/sC
	o+5EO2s6rqmFdO33sU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsXy-00FFQQ-D6; Thu, 01 Sep 2022 22:20:26 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWq-00FEX6-V5; Thu, 01 Sep 2022 22:19:20 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 87CBE1289;
	Fri,  2 Sep 2022 00:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nio5VShjR36b7TNhjr6zMAaYgoDj7l1SrZJTJgFGB7c=;
	b=1f3mCveFHUvdTH1jA4jGLzsgo2CvDgXYFTqOjEGEEdhh2daSMOgbqnyp4BEVdlC8m5KIXt
	mvhSwTppEScHSESXoREW2Hcqgm1kkpWHhu/vicu4Mc1A/f/88kYoFL+vM5saBE5cxEdy0G
	t+Efgla6IJr3X+XiUWAhKY4kWzSeC/F+I7ZSGhDIOafwwmbeCLGKyoETJWY5YzND+5hBwt
	yP083TZsAVWYMBSLLJSJgS/FQ8LWgutgwIpzD0MPVwUPGDU10n10sOkg7DxNwhmZFTFJ1x
	UZvPap5/IzIaCFRMY7LBpFa/ESthVvNTic6o6Plwu0Iho1esP3KKuvvW5gSJiQ==
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
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 00/20] nvmem: core: introduce NVMEM layouts
Date: Fri,  2 Sep 2022 00:18:37 +0200
Message-Id: <20220901221857.2600340-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151917_186292_BE873444 
X-CRM114-Status: GOOD (  22.47  )
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
can add cells during runtime. That way it is possible to add more complex
cells than it is possible right now with the offset/length/bits
description in the device tree. For example, you can have post processing
for individual cells (think of endian swapping, or ethernet offset
handling).

The imx-ocotp driver is the only user of the global post processing hook,
convert it to nvmem layouts and drop the global post pocessing hook. Please
note, that this change is only compile-time tested.

You can also have cells which have no static offset, like the
ones in an u-boot environment. The last patches will convert the current
u-boot environment driver to a NVMEM layout and lifting the restriction
that it only works with mtd devices. But as it will change the required
compatible strings, it is marked as RFC for now. It also needs to have
its device tree schema update which is left out here. These two patches
are not expected to be applied, but rather to show another example of
how to use the layouts.

For now, the layouts are selected by a specific compatible string in a
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

Michael Walle (20):
  net: add helper eth_addr_add()
  of: base: add of_parse_phandle_with_optional_args()
  nvmem: core: add an index parameter to the cell
  nvmem: core: move struct nvmem_cell_info to nvmem-provider.h
  nvmem: core: drop the removal of the cells in nvmem_add_cells()
  nvmem: core: add nvmem_add_one_cell()
  nvmem: core: use nvmem_add_one_cell() in nvmem_add_cells_from_of()
  nvmem: core: introduce NVMEM layouts
  nvmem: core: add per-cell post processing
  nvmem: core: allow to modify a cell before adding it
  nvmem: imx-ocotp: replace global post processing with layouts
  nvmem: cell: drop global cell_post_process
  nvmem: core: drop priv pointer in post process callback
  dt-bindings: mtd: relax the nvmem compatible string
  dt-bindings: nvmem: add YAML schema for the sl28 vpd layout
  nvmem: layouts: add sl28vpd layout
  nvmem: core: export nvmem device size
  arm64: dts: ls1028a: sl28: get MAC addresses from VPD
  RFC nvmem: layouts: rewrite the u-boot-env driver as a NVMEM layout
  RFC nvmem: layouts: u-boot-env: add device node

 .../devicetree/bindings/mtd/mtd.yaml          |   7 +-
 .../nvmem/layouts/kontron,sl28-vpd.yaml       |  67 +++++
 Documentation/driver-api/nvmem.rst            |  15 ++
 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts     |   8 +
 .../fsl-ls1028a-kontron-sl28-var1.dts         |   2 +
 .../fsl-ls1028a-kontron-sl28-var2.dts         |   4 +
 .../fsl-ls1028a-kontron-sl28-var4.dts         |   2 +
 .../freescale/fsl-ls1028a-kontron-sl28.dts    |  13 +
 drivers/nvmem/Kconfig                         |   4 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/core.c                          | 251 +++++++++++++-----
 drivers/nvmem/imx-ocotp.c                     |  32 ++-
 drivers/nvmem/layouts/Kconfig                 |  22 ++
 drivers/nvmem/layouts/Makefile                |   7 +
 drivers/nvmem/layouts/sl28vpd.c               | 144 ++++++++++
 drivers/nvmem/layouts/u-boot-env.c            | 146 ++++++++++
 drivers/nvmem/u-boot-env.c                    | 218 ---------------
 include/linux/etherdevice.h                   |  14 +
 include/linux/nvmem-consumer.h                |  16 +-
 include/linux/nvmem-provider.h                |  90 ++++++-
 include/linux/of.h                            |  25 ++
 21 files changed, 775 insertions(+), 313 deletions(-)
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
