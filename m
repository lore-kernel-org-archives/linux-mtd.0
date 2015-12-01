Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3ifz-0001cs-Hm
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 11:00:53 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v1 1/7] mtd: nandsim: remove the abuse of reference to globle
 variable.
Date: Tue, 1 Dec 2015 18:52:31 +0800
Message-ID: <1448967157-17423-2-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1448967157-17423-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1448967157-17423-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function of do_bit_flips() is working on struct nandsim, where
we can not see struct mtd_info which in a higher level of view.

This patch remove reference to nsmtd in do_bit_flips(). If you want
to get the same information of it, please print it in the mtd level.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/nand/nandsim.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 95d0cc4..d4a94c4 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1456,9 +1456,8 @@ static void do_bit_flips(struct nandsim *ns, int num)
 			int pos = prandom_u32() % (num * 8);
 			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
 			NS_WARN("read_page: flipping bit %d in page %d "
-				"reading from %d ecc: corrected=%u failed=%u\n",
-				pos, ns->regs.row, ns->regs.column + ns->regs.off,
-				nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
+				"reading from %d\n",
+				pos, ns->regs.row, ns->regs.column + ns->regs.off);
 		}
 	}
 }
-- 
1.8.4.2
