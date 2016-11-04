Received: from conuserg-07.nifty.com ([210.131.2.74])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bwQ-000631-CV
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:48 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 17/22] mtd: nand: vf610: return error code of
 nand_scan_ident/tail() on error
Date: Fri,  4 Nov 2016 19:43:05 +0900
Message-Id: <1478256190-7452-18-git-send-email-yamada.masahiro@socionext.com>
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

 drivers/mtd/nand/vf610_nfc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 3ad514c..3ea4bb1 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -717,10 +717,9 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	vf610_nfc_preinit_controller(nfc);
 
 	/* first scan to find the device and get the page size */
-	if (nand_scan_ident(mtd, 1, NULL)) {
-		err = -ENXIO;
+	err = nand_scan_ident(mtd, 1, NULL);
+	if (err)
 		goto error;
-	}
 
 	vf610_nfc_init_controller(nfc);
 
@@ -775,10 +774,9 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	}
 
 	/* second phase scan */
-	if (nand_scan_tail(mtd)) {
-		err = -ENXIO;
+	err = nand_scan_tail(mtd);
+	if (err)
 		goto error;
-	}
 
 	platform_set_drvdata(pdev, mtd);
 
-- 
1.9.1
