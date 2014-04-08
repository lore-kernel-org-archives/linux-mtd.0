Received: from smtp.outflux.net ([2001:19d0:2:6:c0de:0:736d:7470])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXNus-0005jd-QZ
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 04:45:47 +0000
Date: Mon, 7 Apr 2014 21:44:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH] ubi: avoid workqueue format string leak
Message-ID: <20140408044407.GA13141@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When building the name for the workqueue thread, make sure a format
string cannot leak in from the disk name.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/ubi/block.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 7ff473c871a9..8d659e6a1b4c 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -431,7 +431,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	 * Create one workqueue per volume (per registered block device).
 	 * Rembember workqueues are cheap, they're not threads.
 	 */
-	dev->wq = alloc_workqueue(gd->disk_name, 0, 0);
+	dev->wq = alloc_workqueue("%s", 0, 0, gd->disk_name);
 	if (!dev->wq)
 		goto out_free_queue;
 	INIT_WORK(&dev->work, ubiblock_do_work);
-- 
1.7.9.5


-- 
Kees Cook
Chrome OS Security
