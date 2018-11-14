Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN3aM-0003RZ-At
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2018 22:24:35 +0000
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Sasha Levin <sashal@kernel.org>, linux-mtd@lists.infradead.org
Subject: [PATCH AUTOSEL 4.18 29/59] mtd: nand: Fix nanddev_pos_next_page()
 kernel-doc header
Date: Wed, 14 Nov 2018 17:23:01 -0500
Message-Id: <20181114222335.99339-29-sashal@kernel.org>
In-Reply-To: <20181114222335.99339-1-sashal@kernel.org>
References: <20181114222335.99339-1-sashal@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@bootlin.com>

[ Upstream commit 98ee3fc7ef8395f8b7a379e6608aee91efc66d48 ]

Function name is wrong in the kernel-doc header.

Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAND devices")
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/mtd/nand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index abe975c87b90..ad8f0325c027 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -569,7 +569,7 @@ static inline void nanddev_pos_next_eraseblock(struct nand_device *nand,
 }
 
 /**
- * nanddev_pos_next_eraseblock() - Move a position to the next page
+ * nanddev_pos_next_page() - Move a position to the next page
  * @nand: NAND device
  * @pos: the position to update
  *
-- 
2.17.1
