Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921C6FD0048
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2026 01:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=isHPzn3rhA3JAfD96MiuHj9kbOIYo6xbL0JrvOTtqhA=; b=2FJjBKf8sTDhoq
	a4p7nukRSgKJr4WwtGknxnfk+GMmGRLMT2Ey+IuOQTKhRKd4OY65z8+41Wdfz8BdM+VTpDqTOryfY
	nkzf8QyVwGYXh2wkCt0H6poX8MERRCrBaQHTys8RjvqNYHtvzVsj0PJNcLwfwuCKm99Ec8gk/9wuq
	F8WcJtEFaei8v0D0eacILvxHsa4b+tw5IS2OA6zvcETAZqaa0BDZ7rlLne8FpnTiliE30GX0tk6Qj
	s1v9LhMBASMf0nNIrmyPw7m/MpF8BIUXoslI+lGBeEcNweOhESAbsltH4B8r3vcKjyzN2RW/CmlQS
	e3tW65NxLsOifLcYQxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVs4-0000000AdmK-2D9J;
	Sun, 01 Mar 2026 01:45:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVs2-0000000AdkU-1xb4
	for linux-mtd@lists.infradead.org;
	Sun, 01 Mar 2026 01:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E40D160123;
	Sun,  1 Mar 2026 01:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E897C19421;
	Sun,  1 Mar 2026 01:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329521;
	bh=n+/nQGD9ODs1+LImW5f6+WtyZz61xcL9SGXk7Aqsp+g=;
	h=From:To:Cc:Subject:Date:From;
	b=BJ7VIynNH+E7LW3BsnOdP1KYGXBfw1xXETNI8C3iGylnrGZW9sd3HNOKb4ax9ni1R
	 JPvjw/3+/DRZKXbDUNxmYt+3TJ/jREscULtUgqTCjU4CH6L+lqwVZAD9S/vfI1tvSp
	 gBnepwQZh7NFgQ2BaDk3xWoBtYY50pjSp+wBvysesQ1E0LH/xSgK4tcVz1CaHz8+rR
	 untJjb9cSMI/S7p9ucM5mWXb9nP9JUSyrVKmshID6a8TtdnTKZuG8HHHq0HZX05BOy
	 bM0XzLHybpiKHf7RhllBxzR6X/HUo/RvTM4hix9gHfX8JGitfQ14bAIu8eeWv4yZkI
	 h4AqKohGZzcFA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	andrea.scian@dave.eu
Cc: stable@kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: FAILED: Patch "mtd: rawnand: pl353: Fix software ECC support" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:45:19 -0500
Message-ID: <20260301014519.1707904-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 89b831ebdaca0df4ca3b226f7e7a1d1db1629060 Mon Sep 17 00:00:00 2001
From: Andrea Scian <andrea.scian@dave.eu>
Date: Wed, 4 Feb 2026 18:41:44 +0100
Subject: [PATCH] mtd: rawnand: pl353: Fix software ECC support

We need to set also write_page_raw in ecc structure to allow
choosing SW ECC instead of HW one, otherwise write operation fail.

Fixes: 08d8c62164a322 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
Cc: stable@kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 11bd90e3f18cb..7f012b7c3eaec 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -976,6 +976,7 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
-- 
2.51.0





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
