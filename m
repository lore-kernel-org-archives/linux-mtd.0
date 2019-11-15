Return-Path: <SRS0=wpvZ=ZH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AF2C432C3
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2019 09:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 727C420732
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2019 09:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bB0T0QrW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 727C420732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=d9DqNB3ckfGD/SOta1Tg4mDe14EaYzwC9wBU3smZ7SY=; b=bB0
	T0QrW2Xryk4fSVNgmbpcubTNYheT1iOiNyoESXiIrrOA9UdbzTo3KTZv96DhDAnj1e6JTvBLtcVUb
	fbgkzNHiVfXtJVupef9QM6+CiwgLh3yS1aEguKvZn5f2HD3J+z1Oef4py4FAvpWUvPJbQUqn55AKk
	EKfY/LmqKYHqlrrVjL96LpzdgWtO7qvbq/b1wGbJARZ3pupfjk5AjUf3tMDwRFrqMK8ewxnNy+RTR
	JTSkNFrvPUetNyPJTvwgamrnjotIYMA3nyHmqer0SEExncVhZz0yDWlMmAIZs6VIzFurDUhdcYLZb
	IAcqHBQNLqvr58tOwgv3njEaS3WuzHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVXS8-0005tg-Q6; Fri, 15 Nov 2019 08:59:40 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXRy-0005l1-CQ
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2019 08:59:32 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id xAF8wWGt046218;
 Fri, 15 Nov 2019 16:58:32 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, vigneshr@ti.com, bbrezillon@kernel.org,
 tudor.ambarus@microchip.com
Subject: [PATCH 0/4] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Date: Fri, 15 Nov 2019 16:58:04 +0800
Message-Id: <1573808288-19365-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com xAF8wWGt046218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_005930_700343_C590A247 
X-CRM114-Status: UNSURE (   7.07  )
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
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This is repost of patchset from Boris Brezillon's
[RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].

Background from cover letter for RFC[1].

The trend has been around Octal NOR Flash lately and the latest mainline
already supports 1-1-8 and 1-8-8 modes.

Boris opened a discussion on how we should support stateful modes (X-X-X
and XD-XD-XD, where X is the bus width and D means Double Transfer Rate).

JESD216C has defined specification for Octal 8-8-8 and 8D-8D-8D.
It defined command and command extension in
JEDEC Basic Flash Parameter Table(18th DWORD) as well as how to
enable 8-8-8/8D-8D-8D mode sequences (Write CFG Reg 2).

The first set of patches is according to JESD216C adding Double Transfer
Rate(DTR) fields, extension command and command bytes number to the
spi_mem_op struct.

The second set of patches define the relevant macrons and enum in spi-nor
layer for Octal 8-8-8 and 8D-8D-8D mode operation.

The last set of patches in the series are modifying spi_nor_fixups hook to
tweak flash parameters for spi_nor_read/pp_setting() and then in a
chip-specific way to enter 8-8-8 or 8D-8D-8D modes on a Macronix chip.

Also patched spi-mxic driver for testing on Macronix's Zynq PicoZed board
with Macronix's SPI controller (spi-mxic.c) and mx25uw51245g Octal flash.

[1] https://patchwork.ozlabs.org/cover/982926/

thnaks for your time and review.
best regards,
Mason


Mason Yang (4):
  spi: spi-mem: Add support for Octal 8D-8D-8D mode
  mtd: spi-nor: Add support for Octal 8D-8D-8D mode
  mtd: spi-nor: Add Octal 8D-8D-8D mode support for Macronix
    mx25uw51245g
  spi: mxic: Add support for Octal 8D-8D-8D mode

 drivers/mtd/spi-nor/spi-nor.c | 273 +++++++++++++++++++++++++++++++++++++++++-
 drivers/spi/spi-mem.c         |   8 +-
 drivers/spi/spi-mxic.c        |  98 ++++++++++-----
 include/linux/mtd/spi-nor.h   |  61 +++++++++-
 include/linux/spi/spi-mem.h   |  13 ++
 5 files changed, 410 insertions(+), 43 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
