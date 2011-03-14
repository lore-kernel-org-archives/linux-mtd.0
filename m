Received: from ebb06.tieto.com ([131.207.168.38])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pywms-0004zv-Ek
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 01:41:36 +0000
Date: Mon, 14 Mar 2011 09:50:56 +0800
From: Yang Ruirui <ruirui.r.yang@tieto.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
	<Artem.Bityutskiy@nokia.com>, <ext-jani.1.nikula@nokia.com>,
	<ext-phil.2.carmody@nokia.com>, <ruirui.r.yang@tietoenator.com>
Subject: [PATCH 01/02] mtdswap: kill strip error handling option
Message-ID: <20110314015056.GA6819@darkstar>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Yang Ruirui<ruirui.r.yang@tieto.com>

As Artem Bityutskiy's suggestion, The strict erase error handling option
does not make much sense.

Here kill the option, and still keep the retry times as before.

Signed-off-by: Yang Ruirui<ruirui.r.yang@tieto.com>
---
 drivers/mtd/Kconfig   |    8 --------
 drivers/mtd/mtdswap.c |    8 +-------
 2 files changed, 1 insertion(+), 15 deletions(-)

--- mtd-2.6-fc2ff59.orig/drivers/mtd/mtdswap.c	2011-03-12 01:49:31.000000000 +0800
+++ mtd-2.6-fc2ff59/drivers/mtd/mtdswap.c	2011-03-14 09:36:09.283329099 +0800
@@ -156,12 +156,6 @@ struct mtdswap_oobdata {
 #define MTDSWAP_ERASE_RETRIES	3 /* Before marking erase block bad */
 #define MTDSWAP_IO_RETRIES	3
 
-#ifdef CONFIG_MTD_SWAP_STRICT
-#define MTDSWAP_STRICT		1
-#else
-#define MTDSWAP_STRICT		0
-#endif
-
 enum {
 	MTDSWAP_SCANNED_CLEAN,
 	MTDSWAP_SCANNED_DIRTY,
@@ -575,7 +569,7 @@ retry:
 
 	ret = mtd->erase(mtd, &erase);
 	if (ret) {
-		if (retries++ < MTDSWAP_ERASE_RETRIES && !MTDSWAP_STRICT) {
+		if (retries++ < MTDSWAP_ERASE_RETRIES) {
 			dev_warn(d->dev,
 				"erase of erase block %#llx on %s failed",
 				erase.addr, mtd->name);
--- mtd-2.6-fc2ff59.orig/drivers/mtd/Kconfig	2011-03-12 01:49:31.000000000 +0800
+++ mtd-2.6-fc2ff59/drivers/mtd/Kconfig	2011-03-14 09:36:45.269995898 +0800
@@ -335,14 +335,6 @@ config MTD_SWAP
 	  The driver provides wear leveling by storing erase counter into the
 	  OOB.
 
-config MTD_SWAP_STRICT
-       bool "Strict erase error handling"
-       depends on MTD_SWAP
-       help
-	 Enables strict tolerance on failed erasures, marking erase blocks bad
-	 right after the first failed operation. With non-strict mode the
-	 erase operation is retried.
-
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
