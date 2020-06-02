Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7756DC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 14:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B87C206C3
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 14:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lbQjUSq4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B87C206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aYlAuq72S7ECjCFvUziY2KAn6Stpcb7MrBRr7F5CGFw=; b=lbQjUSq4X8urTj
	Biy8JAmRv3MTsx7Yriux0VymOFcX1nPk2IObsgsMLUgNyHtIgzbM39CllFNew4EhXt/ZlGMryY8Eb
	dFCytciFvnXB0sGTjbv4Die6ACmvdsZuUtSDtgqbRLtk1eXLiUKw8uosRH9DM4NDnBrOvL+jHI8y2
	CRUcRWgV0WjSm3Doai+ABwFojz7ZCk5AZq1iQfe4St6Oi9u2oh4Svk+T2NSTb9KSw6YCh8cAK9qdT
	EFMvphfcRMoJlfztaRlXd2Gj9FEjGmnxMcVwS0rhFdefT1YVPvJ3oHTwGYYYHvrVixhsnN8649pLr
	WacLKTA/t+97ZhipU43A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg7xl-0001rV-3b; Tue, 02 Jun 2020 14:32:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg7wy-00016S-Az; Tue, 02 Jun 2020 14:31:34 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0B25EC0003;
 Tue,  2 Jun 2020 14:31:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v9 0/9] Preparation to the generic ECC engine abstraction
Date: Tue,  2 Jun 2020 16:31:15 +0200
Message-Id: <20200602143124.29553-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_073132_510393_8097D611 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Julien Su <juliensu@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a respin of the end of my previous series, just the patches which needed to be fixed.

Changes in v9:
* This time sending the additional patchs, not just the old ones with
  corrections. v8 should be ignored, sorry for the noise.

Changes in v8:
* Split "Convert generic NAND bits to ECC framework" into several peaces:
  > added two helpers
  > converted SPI-NAND then raw-NAND.
* Fixed a comment.
* Used the _ooblayout suffix instead of _layout.


Miquel Raynal (9):
  mtd: nand: Create a helper to extract the ECC configuration
  mtd: spinand: Use nanddev_get_ecc_conf() when relevant
  mtd: nand: Create a helper to extract the ECC requirements
  mtd: rawnand: Use nanddev_get_ecc_requirements() when relevant
  mtd: nand: Convert generic NAND bits to use the ECC framework
  mtd: rawnand: Hide the generic OOB layout objects behind helpers
  mtd: rawnand: Write a compatibility layer
  mtd: rawnand: Move generic OOB layouts to the ECC framework
  mtd: rawnand: Move the user input parsing bits to the ECC framework

 drivers/mtd/nand/ecc.c                        | 314 ++++++++++++++
 drivers/mtd/nand/raw/Kconfig                  |   1 +
 drivers/mtd/nand/raw/arasan-nand-controller.c |   2 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c  |  15 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      |   8 +-
 drivers/mtd/nand/raw/davinci_nand.c           |   3 +-
 drivers/mtd/nand/raw/denali.c                 |   3 +
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  13 +-
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |   6 +-
 drivers/mtd/nand/raw/marvell_nand.c           |   8 +-
 drivers/mtd/nand/raw/mtk_nand.c               |   6 +-
 drivers/mtd/nand/raw/nand_base.c              | 395 ++++--------------
 drivers/mtd/nand/raw/nand_esmt.c              |  14 +-
 drivers/mtd/nand/raw/nand_hynix.c             |  43 +-
 drivers/mtd/nand/raw/nand_jedec.c             |   7 +-
 drivers/mtd/nand/raw/nand_micron.c            |  17 +-
 drivers/mtd/nand/raw/nand_onfi.c              |  14 +-
 drivers/mtd/nand/raw/nand_samsung.c           |  21 +-
 drivers/mtd/nand/raw/nand_toshiba.c           |  15 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |   9 +-
 drivers/mtd/nand/raw/tegra_nand.c             |  15 +-
 drivers/mtd/nand/raw/vf610_nfc.c              |   2 +-
 drivers/mtd/nand/spi/core.c                   |  10 +-
 drivers/mtd/nand/spi/macronix.c               |   7 +-
 drivers/mtd/nand/spi/toshiba.c                |   6 +-
 include/linux/mtd/nand.h                      |  40 +-
 include/linux/mtd/rawnand.h                   |  17 +-
 27 files changed, 587 insertions(+), 424 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
