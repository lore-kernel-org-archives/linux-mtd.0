Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0075C38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 806F22080C
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YZL/+XxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 806F22080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6WFLFZe4KrFT7ZjU4iFx3AUQ8qCXrInPgpsCYCVD9xg=; b=YZL/+XxBWsd0Z2
	AvP6Hh2m+Z2ork1AmBXWGt5WgOj8WN2qQAS5ui34/GuBWCIevGuTwBKgCit+yLnLU4dy+bKwLYuz+
	Tdwo6zNQzZfWHJtz9Jv9qydi3ThPfxu9YkWYUIbbAE9WO4UzDhfs72o0GDnFj7696cIMBn18e7oY2
	tJYWP3EtQjmQBvVkZzdtSbpL1laaPMB8a3No0o7g3EiUhkjLmyNvIRz3rPGlytjSRrpXy+zjxeOdm
	0fOycVarcbho5KNV3/HuFxPSzcVTPfjJOFUzWCpVvKsloJbZu/tAKZf5U3hYEF4QjNmnupiiiPzzp
	Yovn0nBfeaS+0EOJcTcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXl5J-0002FT-80; Sun, 10 May 2020 12:29:33 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXl0W-0003if-Qo
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 12:24:39 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 75C9CC0002;
 Sun, 10 May 2020 12:24:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] MAINTAINERS: Remove Piotr Sroka and mark Cadence NFC as
 orphaned
Date: Sun, 10 May 2020 14:24:29 +0200
Message-Id: <20200510122430.19105-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_052437_032829_23FA96B1 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Piotr's address is bouncing, remove him from MAINTAINERS and mark the
driver he was maintaining, Cadence's, as orphaned.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f2c83ead00b..fdd6e96a689b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3749,9 +3749,8 @@ F:	Documentation/devicetree/bindings/media/cdns,*.txt
 F:	drivers/media/platform/cadence/cdns-csi2*
 
 CADENCE NAND DRIVER
-M:	Piotr Sroka <piotrs@cadence.com>
+S:	Orphan
 L:	linux-mtd@lists.infradead.org
-S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
 F:	drivers/mtd/nand/raw/cadence-nand-controller.c
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
