Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDC0C05052
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juWIwCnca6nnPU6OYnD1iAthwE/m6nPAv4AHo+LEl3M=; b=cGn45y+Gkr5o/O
	Ddj1S8nwXsBTxnl1H+MLOYkNhkKObgj5EZIvEcLT9bEo4emGIDNnJKKTLn0n+oW9Z1VRNQ6lwK/Zs
	t+0ZWEt6iQt2xlOvhMpamczm6bghdPNu6J1l3psHL4Dbnx/5zZ6jHH6o1dkKKSbOk+7IyjATp3Nod
	k7OyHzUq5uRRLFV5QN+S5o19sq8RLwPKG+0wUnpDJKxE2hsJQ4xepuWYRd9CN4JgoXZ/PycBdpaEC
	F9DeeJkMHy1b4bsIBo/pBaX3pNiYzq2hAgcxK5l2HH7LiZISDQUnhOe3P93jy2k68gkMc05E4AN35
	mF1PXOBP2PUcM8Ke3i8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCb-007uHG-0s;
	Fri, 18 Aug 2023 07:47:25 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCR-007uCD-36;
	Fri, 18 Aug 2023 07:47:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv751dK3zkX6d;
	Fri, 18 Aug 2023 15:45:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:46:59 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <martin.blumenstingl@googlemail.com>,
	<matthias.bgg@gmail.com>, <mcoquelin.stm32@gmail.com>, <michael@walle.cc>,
	<michal.simek@amd.com>, <miquel.raynal@bootlin.com>,
	<nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
	<pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
	<rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
	<tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
	<vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next v2 00/12] mtd: Use devm_clk_get_*() helper function to simplify the drivers.
Date: Fri, 18 Aug 2023 15:46:30 +0800
Message-ID: <20230818074642.308166-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_004716_510207_1B8CBB42 
X-CRM114-Status: UNSURE (   8.21  )
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
to unprepare and disable clock explicitly when remove drivers or in the
error handling path.

Change log:

v2:
 - Modify the format of the reference commit, use "since" instead of
 "after".
 - Drop the helper functions mtk_nfc_enable_clk() and
 mtk_nfc_disable_clk(), because both of them now have a single user.
 - Add a new patch, replace devm_clk_get_optional() +
 clk_prepare_enable() with devm_clk_get_optional_enabled().

v1: https://lore.kernel.org/all/20230817024509.3951629-1-lizetao1@huawei.com/

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
