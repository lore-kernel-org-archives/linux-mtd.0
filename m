Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEDEF3ED67
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Apr 2026 00:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YCfp4W/wSPj3ZAEz28cN+mOTBvNfWfjYsP/vTuxmKgI=; b=rO7sy5enqe2ugl
	kaqyDzssSoVYk9EByKRi0WtEIcHZppo+cqwCHjb3B7roY/ZQu7uHTmRMNPvZmqjkhKbkB4hAbQC3L
	K/Juq1XP1qTH4E80YVgUd18bftVd7P/K3HDRfqX54pTT1WxptGBrTZFAw6vJ313hF6t8aKhddWitq
	xNqNLAKOvNjvSPusSH00AVoiywA9DU38NwqHdtm3TzD2Ks07JIKwQnA0XhMGfOcrWO6xJd8FuX4Ni
	PMZqyZ56NF+/2tvUBwaQevwtsI7GvFJF4felYSvt97NOSGO0ZZxKv4jncFBoQtlAH/NsGJA/kUWSV
	Ojfe273c99LFps0hud3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBiKY-0000000DtyA-0C4Z;
	Sun, 12 Apr 2026 00:05:38 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBiKV-0000000DtxC-0jK5
	for linux-mtd@lists.infradead.org;
	Sun, 12 Apr 2026 00:05:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wBiKL-000000005c9-2I2c;
	Sun, 12 Apr 2026 00:05:25 +0000
Date: Sun, 12 Apr 2026 01:05:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: bbt: clamp GENMASK high bit to word boundary
Message-ID: <2a62dc1a58f2f8467d95444fa4b37a0af27aeb45.1775951973.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_170535_237354_915FADFA 
X-CRM114-Status: UNSURE (   9.88  )
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

When a BBT entry straddles an unsigned long boundary, the GENMASK in
nanddev_bbt_set_block_status() can potentially overflow because
offs + bits_per_block - 1 can theoretically exceed BITS_PER_LONG - 1.
Clamp the high bit so only bits within the current word are masked.
The cross-word portion is already handled by the pos[1] block below.

Discovered by UBSAN: shift-out-of-bounds in
drivers/mtd/nand/bbt.c:116:13
shift exponent 18446744073709551614 is too large for 64-bit type
'long unsigned int'

Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAND devices")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/nand/bbt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
index db4f93a903e48..dfe4a6a991c15 100644
--- a/drivers/mtd/nand/bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -113,7 +113,8 @@ int nanddev_bbt_set_block_status(struct nand_device *nand, unsigned int entry,
 	if (entry >= nanddev_neraseblocks(nand))
 		return -ERANGE;
 
-	pos[0] &= ~GENMASK(offs + bits_per_block - 1, offs);
+	pos[0] &= ~GENMASK(min(offs + bits_per_block - 1,
+			       BITS_PER_LONG - 1), offs);
 	pos[0] |= val << offs;
 
 	if (bits_per_block + offs > BITS_PER_LONG) {
-- 
2.53.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
