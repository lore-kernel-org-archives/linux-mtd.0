Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bw1-0005Ow-Md
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:27 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 02/22] mtd: nand: cmx270: return error code of nand_scan() on
 error
Date: Fri,  4 Nov 2016 19:42:50 +0900
Message-Id: <1478256190-7452-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_scan() returns an appropriate error value when it fails.
Use it instead of the fixed error code -ENXIO.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/cmx270_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 4913378..226ac0b 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -195,9 +195,9 @@ static int __init cmx270_init(void)
 	this->write_buf = cmx270_write_buf;
 
 	/* Scan to find existence of the device */
-	if (nand_scan (cmx270_nand_mtd, 1)) {
+	ret = nand_scan(cmx270_nand_mtd, 1);
+	if (ret) {
 		pr_notice("No NAND device\n");
-		ret = -ENXIO;
 		goto err_scan;
 	}
 
-- 
1.9.1
