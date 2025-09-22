Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CECCAC5AD
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UkShfx4Q8FKRsENM/8pZaQ0SNFU27+T4MAH0axrb/ls=; b=PBRCJoQvzD18/z
	GS7Q/HoaLvWoeSrsubm/UdF94WF43I5CtY/lCsBXwSFq+MQalAM2djG2PcHwCycs147bDVErwowXv
	r+rMJcw3QHAfHkRW9VfuSYtz/ilELS7d/MXotPasOzXpGvp3APDGzp7semAP+Jpx9YFyqGQgGe4NQ
	AESlpi8r0FhqRBTdq5fQwFDjwadMekLtLES9XhetJUWOH2vfuPilp4NosCFLNbbypSSmBYsbPuPfw
	c+8roACyhixg1MwwSiiq+QbHjRgxvOW9W3/479d8A9xDzhE3aTalhTjhwtsntACZpq9Tqx/iU0JIl
	zboo/+m9j+0SnN7R0U8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWM-0000000AoNI-30Uc;
	Mon, 22 Sep 2025 15:32:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWJ-0000000AoJP-1pql
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC0AC43F84;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85656C4CEF0;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555122;
	bh=Si41+E/+ERxwR66glrdhy5Z3+iC7P4jh0qsSv0inztQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QAuu0+fNDDiJ4/5ZUcZWC9LYypnflhf2/1hkeTpYZmk6iO1ryM1rMJFjJdHnRvu8a
	 KsnCX5q1KSKmiUaFfNtWy+ndRJmUjgI+jCYpHUxM0qM+GNTxd09wADBO9hV2g55tIB
	 TXkAZ/WKfSvO0NN+TgMQqL58dmAdCNZ6HLUDF1JUruO4JwaCS8Y1Um60uN7YzfovNF
	 UclLTi027l5fS4XWLEeYy95DAMOHv5cknN1sl1JLH+5Ngs3e8VZcPI3hdwCNigPHGJ
	 JwfB4pvwOeh8poT13e0p5s/8wb8rftCFAh4ld9NWF4PiR/5dk+gZ26H7P5U54PQ+hM
	 AF+BvEp0JFwTA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWB-000000004He-3sPh;
	Mon, 22 Sep 2025 17:31:55 +0200
From: Johan Hovold <johan@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/8] mtd: drop unused module aliases
Date: Mon, 22 Sep 2025 17:30:59 +0200
Message-ID: <20250922153107.16381-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083203_503093_72ABD770 
X-CRM114-Status: UNSURE (   7.47  )
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

When fixing a device leak in the omap2 rawnand driver I noticed it had
a no longer used platform module alias.

This series drops unused module aliases from mtd drivers that never
supported anything but OF probing or that no longer do.

Johan


Johan Hovold (8):
  mtd: hyperbus: hbmc-am654: drop unused module alias
  mtd: onenand: omap2: drop unused module alias
  mtd: rawnand: atmel: drop unused module alias
  mtd: rawnand: omap2: drop unused module alias
  mtd: rawnand: pl353: drop unused module alias
  mtd: rawnand: rockchip: drop unused module alias
  mtd: rawnand: stm32_fmc2: drop unused module alias
  mtd: rawnand: sunxi: drop unused module alias

 drivers/mtd/hyperbus/hbmc-am654.c               | 1 -
 drivers/mtd/nand/onenand/onenand_omap2.c        | 1 -
 drivers/mtd/nand/raw/atmel/pmecc.c              | 1 -
 drivers/mtd/nand/raw/omap2.c                    | 1 -
 drivers/mtd/nand/raw/pl35x-nand-controller.c    | 1 -
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 1 -
 drivers/mtd/nand/raw/stm32_fmc2_nand.c          | 1 -
 drivers/mtd/nand/raw/sunxi_nand.c               | 1 -
 8 files changed, 8 deletions(-)

-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
