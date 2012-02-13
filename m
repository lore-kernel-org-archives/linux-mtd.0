Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rwxa9-0000rG-8j
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 15:12:46 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] trivial/mtd: simplify return logic in do_map_probe()
Date: Mon, 13 Feb 2012 16:12:24 +0100
Message-Id: <1329145944-10068-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Jiri Kosina <trivial@kernel.org>,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/chips/chipreg.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/chipreg.c b/drivers/mtd/chips/chipreg.c
index da1f96f..0bbc61b 100644
--- a/drivers/mtd/chips/chipreg.c
+++ b/drivers/mtd/chips/chipreg.c
@@ -76,10 +76,7 @@ struct mtd_info *do_map_probe(const char *name, struct map_info *map)
 	*/
 	module_put(drv->module);
 
-	if (ret)
-		return ret;
-
-	return NULL;
+	return ret;
 }
 /*
  * Destroy an MTD device which was created for a map device.
-- 
1.7.9
