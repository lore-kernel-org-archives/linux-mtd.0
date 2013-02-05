Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2Z4r-0001tD-Bv
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 03:20:10 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 1/2] mtd: torturetest: rewrite the erase-write-verify process
 into one block unit.
Date: Tue, 5 Feb 2013 10:20:19 +0800
Message-ID: <1360030820-21491-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rewrite the torture cycle, do the erase-write-verify process in
one block unit, not in several blocks unit.

This patch makes preparations for adding the rand data pattern support.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/tests/mtd_torturetest.c |   29 +++++++----------------------
 1 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index c4cde1e..516cf66 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -313,21 +313,18 @@ static int __init tort_init(void)
 		int i;
 		void *patt;
 
-		/* Erase all eraseblocks */
 		for (i = eb; i < eb + ebcnt; i++) {
 			if (bad_ebs[i - eb])
 				continue;
+
+			/* Erase all eraseblocks */
 			err = erase_eraseblock(i);
 			if (err)
 				goto out;
 			cond_resched();
-		}
 
-		/* Check if the eraseblocks contain only 0xFF bytes */
-		if (check) {
-			for (i = eb; i < eb + ebcnt; i++) {
-				if (bad_ebs[i - eb])
-					continue;
+			/* Check if the eraseblocks contain only 0xFF bytes */
+			if (check) {
 				err = check_eraseblock(i, patt_FF);
 				if (err) {
 					pr_info("verify failed"
@@ -336,12 +333,8 @@ static int __init tort_init(void)
 				}
 				cond_resched();
 			}
-		}
 
-		/* Write the pattern */
-		for (i = eb; i < eb + ebcnt; i++) {
-			if (bad_ebs[i - eb])
-				continue;
+			/* Write the pattern */
 			if ((eb + erase_cycles) & 1)
 				patt = patt_5A5;
 			else
@@ -350,17 +343,9 @@ static int __init tort_init(void)
 			if (err)
 				goto out;
 			cond_resched();
-		}
 
-		/* Verify what we wrote */
-		if (check) {
-			for (i = eb; i < eb + ebcnt; i++) {
-				if (bad_ebs[i - eb])
-					continue;
-				if ((eb + erase_cycles) & 1)
-					patt = patt_5A5;
-				else
-					patt = patt_A5A;
+			/* Verify what we wrote */
+			if (check) {
 				err = check_eraseblock(i, patt);
 				if (err) {
 					pr_info("verify failed for %s"
-- 
1.7.0.4
