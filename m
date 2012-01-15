Received: from ogre.sisk.pl ([217.79.144.158])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RmQJa-0000dh-R2
 for linux-mtd@lists.infradead.org; Sun, 15 Jan 2012 13:40:07 +0000
From: "Rafael J. Wysocki" <rjw@sisk.pl>
To: Linux PM list <linux-pm@vger.kernel.org>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] PM / MTD: Fix regressions related to mtd_suspend()
Date: Sun, 15 Jan 2012 14:43:30 +0100
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201201151443.30897.rjw@sisk.pl>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafael J. Wysocki <rjw@sisk.pl>

Commit 3fe4bae88460869a8e553397cd9057a4ee7ca341 (mtd: introduce
mtd_suspend interface) introduced the mtd_suspend() routine
which didn't check whether or not mtd and mtd->suspend were
both valid pointers.  Later commit 079c985e7a6f4ce60f931cebfdd5ee3c3
(mtd: do not use mtd->suspend and mtd->resume directly) added the
check for mtd->suspend, but still it failed to check mtd.  Moreover,
it caused mtd_suspend() to return an error code for NULL
mtd->suspend, which makes system suspend fail on one of my test
systems on every attempt and which is a regression from v3.2.

Fix mtd_suspend() by making it check if mtd is not NULL and
return 0 if mtd or mtd->suspend is NULL, which shouldn't prevent
the system from suspending.

Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
---
 include/linux/mtd/mtd.h |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

Index: linux/include/linux/mtd/mtd.h
===================================================================
--- linux.orig/include/linux/mtd/mtd.h
+++ linux/include/linux/mtd/mtd.h
@@ -427,9 +427,7 @@ static inline int mtd_is_locked(struct m
 
 static inline int mtd_suspend(struct mtd_info *mtd)
 {
-	if (!mtd->suspend)
-		return -EOPNOTSUPP;
-	return mtd->suspend(mtd);
+	return mtd && mtd->suspend ? mtd->suspend(mtd) : 0;
 }
 
 static inline void mtd_resume(struct mtd_info *mtd)
