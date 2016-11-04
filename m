Received: from conuserg-07.nifty.com ([210.131.2.74])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bwo-00037n-8v
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:42:10 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 21/22] mtd: nand: nandsim: remove unneeded checks for
 nand_scan_ident/tail()
Date: Fri,  4 Nov 2016 19:43:09 +0900
Message-Id: <1478256190-7452-22-git-send-email-yamada.masahiro@socionext.com>
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

The nand_scan_ident/tail() never returns a positive value when it
fails.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/nandsim.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 1eb9344..c76287a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2313,8 +2313,6 @@ static int __init ns_init_module(void)
 	retval = nand_scan_ident(nsmtd, 1, NULL);
 	if (retval) {
 		NS_ERR("cannot scan NAND Simulator device\n");
-		if (retval > 0)
-			retval = -ENXIO;
 		goto error;
 	}
 
@@ -2350,8 +2348,6 @@ static int __init ns_init_module(void)
 	retval = nand_scan_tail(nsmtd);
 	if (retval) {
 		NS_ERR("can't register NAND Simulator\n");
-		if (retval > 0)
-			retval = -ENXIO;
 		goto error;
 	}
 
-- 
1.9.1
