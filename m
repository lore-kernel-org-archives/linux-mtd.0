Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7445EC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aXlEnaBKtmQW2gWSVAq5dno9kVTXKjPXBsksdzyKw/g=; b=O1Jsx+lnTuvnLG
	aohAB7/YZwkXaJsi6YiE8XAqBKvZeNULrGjzD9W4n/EG4nlq0Rzfte0kpAYZwglUJXlUDuh992vSj
	lgj83tZNqYxGghunIE/qppxGMPXFzizOckcWs8Iw4O/wFhPmUGzO4GJb5pN+MmqRw4iCPTdArtA/M
	knPQ7fJhpEAOsvkd4EslxdcB5F75X6SLCqhzht1FX5hNZfdD0cCvs4vOALklkdv5KE69XBqwWnGfk
	9vPoVLH7Ibr60LpZqCd1mQvMFL0Q/pYvybWJnhOnqKpWfDx4p5gzp58uYn3bmr0wuYd9iFrFX033S
	Kqsy3UX6fWVZKTLkex5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqz5-0008Qr-LK; Wed, 23 Nov 2022 14:44:19 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqwS-0007Wj-EG
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 14:41:40 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:881b:815b:474d:c3fd])
	by albert.telenet-ops.be with bizsmtp
	id nqhS2800949U0Rd06qhSTc; Wed, 23 Nov 2022 15:41:30 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwH-001Rqf-F7; Wed, 23 Nov 2022 15:41:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwH-0012HA-00; Wed, 23 Nov 2022 15:41:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc cleanups
Date: Wed, 23 Nov 2022 15:41:16 +0100
Message-Id: <cover.1669213027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_064136_692096_505166E8 
X-CRM114-Status: GOOD (  20.75  )
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

	Hi all,

The Renesas RPC-IF provides either HyperFlash or SPI host access.
To handle this, three drivers are used:
  1. The RPC-IF core diver,
  2. An HyperFlash child driver,
  3. An SPI child driver.

Currently this driver collection suffers from a sub-optimal division of
roles and reponsibilities, leading to (un)bind issues: after manually
unbinding the child driver, rebinding the child driver fails with
-EBUSY.

This patch series aims to fix this, by splitting off private data and
making the RPC-IF core driver responsible for resource acquisition.
After that, a few customary cleanups are provided.

This has been tested on the Salvator-X(S) and Ebisu-4D (HyperFlash) and
White-Hawk (QSPI FLASH) development boards.

Changes compared to v1[1]:
  - Move the two fixes forward and add Fixes-tags to ease backporting,
    as requested by Krzysztof,
  - Add Acked-by,
  - Rebased cleanups,
  - Remove Runtime PM wrappers,
  - Drop patch to add system suspend/resume support to the RPC-IF core
    driver, as this is apparently not needed on R-Car M3-N and R-Car E3,
    nor fixes the issue on R-Car H3 ES2.0.  I will reply to the original
    patch with my latest investigation results.

Thanks for your comments!

[1] [PATCH 0/7] memory: renesas-rpc-if: Rebind and s2ram fixes
    https://lore.kernel.org/r/cover.1656341824.git.geert+renesas@glider.be

Geert Uytterhoeven (6):
  memory: renesas-rpc-if: Split-off private data from struct rpcif
  memory: renesas-rpc-if: Move resource acquisition to .probe()
  memory: renesas-rpc-if: Always use dev in rpcif_probe()
  memory: renesas-rpc-if: Improve Runtime PM handling
  memory: renesas-rpc-if: Pass device instead of rpcif to rpcif_*()
  memory: renesas-rpc-if: Remove Runtime PM wrappers

 drivers/memory/renesas-rpc-if.c | 152 ++++++++++++++++++++------------
 drivers/mtd/hyperbus/rpc-if.c   |  18 ++--
 drivers/spi/spi-rpc-if.c        |  14 +--
 include/memory/renesas-rpc-if.h |  34 +------
 4 files changed, 118 insertions(+), 100 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
