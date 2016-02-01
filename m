Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQMZ3-0007tn-0K
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 22:03:18 +0000
Received: by mail-lb0-x233.google.com with SMTP id dx2so83418230lbd.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 14:02:55 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@arm.linux.org.uk>,
 Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH] mtd: map: fix .set_vpp() documentation
Date: Mon,  1 Feb 2016 23:02:48 +0100
Message-Id: <1454364168-1342-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As of commit 876fe76d793d03077eb61ba3afab4a383f46c554
"mtd: maps: physmap: Add reference counter to set_vpp()"
the comment in the header file is incorrect and misleading.
Fix it up.

Cc: Russell King <linux@arm.linux.org.uk>
Cc: Paul Parsons <lost.distance@yahoo.com>
Fixes: 876fe76d793d ("mtd: maps: physmap: Add reference counter to set_vpp()")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/mtd/map.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 58f3ba709ade..5e0eb7ccabd4 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -240,8 +240,11 @@ struct map_info {
 	   If there is no cache to care about this can be set to NULL. */
 	void (*inval_cache)(struct map_info *, unsigned long, ssize_t);
 
-	/* set_vpp() must handle being reentered -- enable, enable, disable
-	   must leave it enabled. */
+	/* This will be called with 1 as parameter when the first map user
+	 * needs VPP, and called with 0 when the last user exits. The map
+	 * core maintains a reference counter, and assumes that VPP is a
+	 * global resource applying to all mapped flash chips on the system.
+	 */
 	void (*set_vpp)(struct map_info *, int);
 
 	unsigned long pfow_base;
-- 
2.4.3
