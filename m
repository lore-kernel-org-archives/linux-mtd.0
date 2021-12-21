Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF79C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 21:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/7ApA0YcNF/dvWENHHbHClR6wM/jooqI4FJsuofVAcw=; b=sb65JxDcthkug/
	mdzqqUzCw/Jr7sHlf/npKl/k9rBPZ8lpI/AXMNw32e6dfl2/pynKwTVYrSPehm8MQ9n8mUTWhMlF5
	BPAfCtuK0tCk9tmHvR+DVNFUKwOPJ6dE+U1C3VqQQX2XwvP5+xIlSDb8MbSiN0gbwoOJd1lh5c8Gg
	pIRHBG/NARkLic+ZVz728JTIFEpqt9n8V9XyJFD1dEaz1P58drvOTWhRUluhJVZNegM/poBS5VrKi
	6nIuhtmruLx4LRtSQtDWDsrgFgRq5iXZGPs+a3nTmsNsJrEPayOpRoiSrQ6pKzdk11aFkO6HzFKBE
	nQCYAlIMOFW/7FLzBKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzmfN-008XKO-P0; Tue, 21 Dec 2021 21:27:25 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzmf8-008XHv-P8
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 21:27:12 +0000
X-IronPort-AV: E=Sophos;i="5.88,224,1635174000"; d="scan'208";a="104266469"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 22 Dec 2021 06:27:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id CC3E141082DC;
 Wed, 22 Dec 2021 06:27:03 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] mtd: nand: Use platform_get_irq*() variants to fetch IRQ's
Date: Tue, 21 Dec 2021 21:26:07 +0000
Message-Id: <20211221212609.31290-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_132710_946204_E411084B 
X-CRM114-Status: UNSURE (   6.83  )
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

This patch series aims to drop using platform_get_resource*() for IRQ
types in preparation for removal of static setup of IRQ resource from
DT core code.

Dropping usage of platform_get_resource*() was agreed based on
the discussion [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note: I have just build tested the patches.

Cheers,
Prabhakar

Lad Prabhakar (2):
  mtd: rawnand: omap_elm: Use platform_get_irq() to get the interrupt
  mtd: rawnand: gpmi: Use platform_get_irq_byname() to get the interrupt

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 11 ++++-------
 drivers/mtd/nand/raw/omap_elm.c            | 16 +++++++---------
 2 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
