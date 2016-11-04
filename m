Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bwL-0005cT-Bq
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 11/22] mtd: nand: brcmnand: return error code of
 nand_scan_ident/tail() on error
Date: Fri,  4 Nov 2016 19:42:59 +0900
Message-Id: <1478256190-7452-12-git-send-email-yamada.masahiro@socionext.com>
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

The nand_scan_ident/tail() returns an appropriate error value when
it fails.  Use it instead of the fixed error code -ENXIO.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/brcmnand/brcmnand.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 9d2424b..42ebd73 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2209,8 +2209,9 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	nand_writereg(ctrl, cfg_offs,
 		      nand_readreg(ctrl, cfg_offs) & ~CFG_BUS_WIDTH);
 
-	if (nand_scan_ident(mtd, 1, NULL))
-		return -ENXIO;
+	ret = nand_scan_ident(mtd, 1, NULL);
+	if (ret)
+		return ret;
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 	/*
@@ -2234,8 +2235,9 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	if (ret)
 		return ret;
 
-	if (nand_scan_tail(mtd))
-		return -ENXIO;
+	ret = nand_scan_tail(mtd);
+	if (ret)
+		return ret;
 
 	return mtd_device_register(mtd, NULL, 0);
 }
-- 
1.9.1
