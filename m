Received: from mgw2.diku.dk ([130.225.96.92])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkfxK-0000bT-H0
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 16:53:23 +0000
From: Julia Lawall <julia@diku.dk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] drivers/mtd/maps/ts5500_flash.c: avoid calling map_destroy on
	NULL
Date: Wed,  2 Feb 2011 18:13:36 +0100
Message-Id: <1296666816-21610-1-git-send-email-julia@diku.dk>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

map_destroy dereferences its argument.  The call is furthermore only
reachable when this argument is NULL.  Thus the call is dropped.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
@@

*if (x == NULL)
{ ...
* map_destroy(x);
  ...
  return ...;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/ts5500_flash.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/ts5500_flash.c b/drivers/mtd/maps/ts5500_flash.c
index e2147bf..e02dfa9 100644
--- a/drivers/mtd/maps/ts5500_flash.c
+++ b/drivers/mtd/maps/ts5500_flash.c
@@ -94,7 +94,6 @@ static int __init init_ts5500_map(void)
 	return 0;
 
 err1:
-	map_destroy(mymtd);
 	iounmap(ts5500_map.virt);
 err2:
 	return rc;
