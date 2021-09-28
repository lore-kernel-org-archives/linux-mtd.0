Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96E0C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 14:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81FE1610E6
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 14:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81FE1610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YiUOUzpxDTHCIz+QoMRKWOMwQP+SaaRV5JPoMCUkEMM=; b=Ht1Bc4PE2V9trL
	Mo2iID/5DGSzS4gQ/h3fIDJ7omUMnpQxnU4+g+tFUU1EVh6QsSiRwiQ8myWbJhkTS8W/jbSKU0I3z
	rCRFvGodlq0m4H4JEjzm0g4/F+wlE1j/nFO4faNbGYi0RjFZRYpp6DAyCEyfXEL559RoE/BzLmU4p
	8jOaCg2CvHfzRC1U86Nu2PnPSr4bemmN0Y8JKUmx6Qm47WNiYi+N5Xnoj5OeJiTJUi642ExdZvpjh
	CTVj0xA/QeijY88p43Nq+NP0ttETTlDT/1Rh8sR5KZ7B3/ephbWzEXXcvJle07f1ZWL7vw6XtYXV5
	2qOtxEWOs8aAAtUM50aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDlh-007UA7-TX; Tue, 28 Sep 2021 14:07:38 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDle-007U8R-DO
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 14:07:36 +0000
X-IronPort-AV: E=Sophos;i="5.85,329,1624287600"; d="scan'208";a="95435599"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 28 Sep 2021 23:07:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id A762140061B4;
 Tue, 28 Sep 2021 23:07:28 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] Add SPI Multi I/O Bus Controller support for RZ/G2L
Date: Tue, 28 Sep 2021 15:07:15 +0100
Message-Id: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_070734_591593_E2ABAD66 
X-CRM114-Status: UNSURE (   9.94  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi All,

This patch series adds a couple of fixes for rpc-if driver and
adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
is identical to the RPC-IF block found on R-Car Gen3 SoC's.

Note: patch applies on top of [1].

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/
20210922091007.5516-1-wsa+renesas@sang-engineering.com/

Cheers,
Prabhakar

Lad Prabhakar (6):
  dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
  dt-bindings: memory: renesas,rpc-if: Add optional interrupts property
  spi: spi-rpc-if: Check return value of rpcif_sw_init()
  mtd: hyperbus: rpc-if: Check return value of rpcif_sw_init()
  memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
  memory: renesas-rpc-if: Add support for RZ/G2L

 .../memory-controllers/renesas,rpc-if.yaml    | 52 +++++++++----
 drivers/memory/renesas-rpc-if.c               | 73 +++++++++++++++----
 drivers/mtd/hyperbus/rpc-if.c                 |  8 +-
 drivers/spi/spi-rpc-if.c                      |  8 +-
 include/memory/renesas-rpc-if.h               |  8 +-
 5 files changed, 116 insertions(+), 33 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
