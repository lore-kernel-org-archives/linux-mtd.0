Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B89C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 14:52:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9995601FA
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 14:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9995601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djYGY1k0iTm7kdhhFO+AgVO3ToCZP8DbtsVPhNMszFA=; b=iHQjsKRmCY0vOY
	rVH27Px2h65wV3Tp9NpMECYLk23xvzpFL8Y4C2JvtB5Uvra5D+WeLYpWpPkUepJ869ogaWOomZ4sg
	KzcNdbdgdACmbyt9F7R0ziulgbWJeu6zHmF6yYbtcTcncMENLuJxG9SnHxzpMdFY6TWHN0obbZ39B
	75IpvsZYqB3rIh+4zs3j1w1UfWnGvlQfACjQJqaq9gPR69+9pdEgBHf2IPtCacOb9mVsA+WSlY0MI
	it6be4WmuawalcX4+DSQb/J3ixeMfXfwUcU2cEaAOodJEaZHSrcKxdM5FaZ2Z7dZVlgl4JNNOfsti
	jwEmIvhJq/nokBVrWlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlXuR-00Auvt-IF; Fri, 12 Nov 2021 14:52:07 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlXiD-00AqEA-Bv
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 14:39:30 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPA id 6B79840006;
 Fri, 12 Nov 2021 14:39:27 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 1/4] mtd: rawnand: Fix nand_erase_op delay
Date: Fri, 12 Nov 2021 15:38:52 +0100
Message-Id: <20211112143855.2678989-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112143855.2678989-1-herve.codina@bootlin.com>
References: <20211112143855.2678989-1-herve.codina@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_063929_584275_095F4C49 
X-CRM114-Status: UNSURE (   9.62  )
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

NAND_OP_CMD() expect a delay parameter in nanoseconds.
The delay value is wrongly given in milliseconds.

This patch fixes the conversion macro used in order
to set this delay in nanoseconds.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3d6c6e880520..5c6b065837ef 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1837,7 +1837,7 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 			NAND_OP_CMD(NAND_CMD_ERASE1, 0),
 			NAND_OP_ADDR(2, addrs, 0),
 			NAND_OP_CMD(NAND_CMD_ERASE2,
-				    NAND_COMMON_TIMING_MS(conf, tWB_max)),
+				    NAND_COMMON_TIMING_NS(conf, tWB_max)),
 			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tBERS_max),
 					 0),
 		};
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
