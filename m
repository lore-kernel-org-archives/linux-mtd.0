Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F57EE49A6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 03:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aBikjwVIUHBtAS9ebhJq17s/BxLpXhz8DR3AOuiGWI=; b=O48OdcNicnqfBS
	SGwwjDRO2TyfU27SXLo+Yqi8KCghHvauyHqiUfFeeNjFkZaWjgBoLsAV2bOQzPUoRJ0vNl+yehUx5
	7H8+qv//7MQbAVo8xQDLwF4xUKiBww+sa2qHOXZrRI8zGbkhPTJy6b20kkKwN6v3zsqBwW7NaB+tk
	z90S4y91k+7jd4tpRFPmUP+3wiX2d+GehdXLacQ3l6f+xnZbwukammYYBx3LYYKoBjHxyquu3tbsn
	BdfGKzxi9CsBXUC9So4GN51sV2+kG2FSURJRwHjpupg3gQUFGzDQ4lmL40WprYTe2m2yY7e8dWsaH
	cfKBL70Ux8ZXm/ZcE8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvR5-00CwkT-1V;
	Mon, 21 Aug 2023 03:18:35 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvQc-00CwTD-0j;
	Mon, 21 Aug 2023 03:18:10 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RTcyX4WfwztS5x;
	Mon, 21 Aug 2023 11:14:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:17:53 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <lizetao1@huawei.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
	<paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
	<richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
	<wens@csie.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next v3 00/12] mtd: Use devm_clk_get_*() helper function to simplify the drivers.
Date: Mon, 21 Aug 2023 11:17:25 +0800
Message-ID: <20230821031737.1973183-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818101004.4f2cd343@xps-13>
References: <20230818101004.4f2cd343@xps-13>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_201806_724718_BD9B406A 
X-CRM114-Status: UNSURE (   8.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks") provides a new helper function for prepared and
enabled clocks when a driver keeps a clock prepared (or enabled) during
the whole lifetime of the driver. So where drivers get clocks and enable
them immediately, it can be combined into a single function
devm_clk_get_*(). Moreover, the unprepare and disable function
has been registered to devm_clk_state, and before devm_clk_state is
released, the clocks will be unprepareed and disable, so it is unnecessary
to unprepare and disable clocks explicitly when remove drivers or in the
error handling path.

Change log:

v3:
 - Modify the syntax error in the commit message.

v2: https://lore.kernel.org/all/20230818074642.308166-1-lizetao1@huawei.com
 - Modify the format of the reference commit, use "since" instead of
 "after".
 - Drop the helper functions mtk_nfc_enable_clk() and
 mtk_nfc_disable_clk(), because both of them now have a single user.
 - Add a new patch, replace devm_clk_get_optional() +
 clk_prepare_enable() with devm_clk_get_optional_enabled().

v1: https://lore.kernel.org/all/20230817024509.3951629-1-lizetao1@huawei.com

Li Zetao (12):
  mtd: spear_smi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: arasan: Use helper function devm_clk_get_enabled()
  mtd: rawnand: fsmc: Use helper function devm_clk_get_enabled()
  mtd: rawnand: intel: Use helper function devm_clk_get_enabled()
  mtd: rawnand: lpc32xx_slc: Use helper function devm_clk_get_enabled()
  mtd: rawnand: mpc5121: Use helper function devm_clk_get_enabled()
  mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
  mtd: rawnand: stm32_fmc2: Use helper function devm_clk_get_enabled()
  mtd: rawnand: sunxi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: vf610_nfc: Use helper function devm_clk_get_enabled()
  mtd: spi-nor: nxp-spifi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: orion: Use helper function
    devm_clk_get_optional_enabled()

 drivers/mtd/devices/spear_smi.c               | 15 +----
 drivers/mtd/nand/raw/arasan-nand-controller.c | 29 ++-------
 drivers/mtd/nand/raw/fsmc_nand.c              | 12 +---
 drivers/mtd/nand/raw/intel-nand-controller.c  | 15 +----
 drivers/mtd/nand/raw/lpc32xx_slc.c            | 12 +---
 drivers/mtd/nand/raw/mpc5121_nfc.c            | 11 +---
 drivers/mtd/nand/raw/mtk_nand.c               | 62 ++++++-------------
 drivers/mtd/nand/raw/orion_nand.c             | 22 ++-----
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 17 ++---
 drivers/mtd/nand/raw/sunxi_nand.c             | 29 ++-------
 drivers/mtd/nand/raw/vf610_nfc.c              | 29 +++------
 drivers/mtd/spi-nor/controllers/nxp-spifi.c   | 33 ++--------
 12 files changed, 67 insertions(+), 219 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
