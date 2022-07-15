Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13FBC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xrs0fDTiTirBcTi2zWxGLMdKIx7p+lpV5yNCh6vs6h0=; b=CyNlvfmxTNWdX9
	viyRGkdoeFAL06MMIJI8sIh+Nst7MubWcF1L61iL03rwMR3dNH15CYI0Z8mbarkesb5lqRnxlcKvd
	yTHGd7SSojys/b+NsS5zBd2dRbcMt8f3SpavpjBdfqVpq4ORu0xWh/MCnJAr52Ifvbru51wn/gMgg
	WAw1CfRbkpNx+tDn5l3mUvNVz5kTRU+zs71gcoIMO8EXXh2Gnb41Ly6I+mA571FwiZ2I/MEJy7ZO+
	bk02C+WtX2qsIrbawWDdv1k27Iis7MassI+esidPKd2DQw5TQiSU4c77iZUkrnnLaD9BIgzi8DElY
	JU03uZAvSd4GM3MZFWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ0v-006S3D-8g; Fri, 15 Jul 2022 10:57:41 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJ0k-006Ry8-4Y; Fri, 15 Jul 2022 10:57:32 +0000
X-IronPort-AV: E=Sophos;i="5.92,273,1650898800"; 
   d="scan'208";a="127981296"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jul 2022 19:57:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.160])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E8DAF4251BF2;
	Fri, 15 Jul 2022 19:57:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Michael Walle <michael@walle.cc>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] Add Renesas AT25QL128A serial nor flash
Date: Fri, 15 Jul 2022 11:57:14 +0100
Message-Id: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_035730_307391_E0291C92 
X-CRM114-Status: UNSURE (   6.49  )
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

This patch series aims to add support for Renesas AT25QL128A serial nor flash

Details of flash chip can be found here [1]

[1] https://www.dialog-semiconductor.com/sites/default/files/2022-04/DS-AT25QL128A-129F-022022.pdf

v1->v2:
 * Add support for SNOR_ID3 macro
 * Added flash definitions into Atmel table.

RFC->v1:
 * Moved the flash definitions to atmel.c
 * Remove macro related to locking as it is untested.
 * Replaced INFO macro with SNOR_ID3
 
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220501185512.51158-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  mtd: spi-nor: add support for SNOR_ID3 macro
  mtd: spi-nor: Add Renesas AT25QL128A serial nor flash

 drivers/mtd/spi-nor/atmel.c | 1 +
 drivers/mtd/spi-nor/core.h  | 9 +++++++++
 2 files changed, 10 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
