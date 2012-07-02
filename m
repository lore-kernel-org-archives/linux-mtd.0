Received: from ns.pmeerw.net ([87.118.82.44] helo=pmeerw.net)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SloK7-00068I-Aa
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 21:38:24 +0000
From: Peter Meerwald <pmeerw@pmeerw.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: spelling of detach in debug output
Date: Mon,  2 Jul 2012 23:38:17 +0200
Message-Id: <1341265097-1445-1-git-send-email-pmeerw@pmeerw.net>
Cc: adrian.hunter@intel.com, Peter Meerwald <pmeerw@pmeerw.net>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
---
 drivers/mtd/ubi/cdev.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index acec85d..fb55678 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1026,7 +1026,7 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 	{
 		int ubi_num;
 
-		dbg_gen("dettach MTD device");
+		dbg_gen("detach MTD device");
 		err = get_user(ubi_num, (__user int32_t *)argp);
 		if (err) {
 			err = -EFAULT;
-- 
1.7.9.5
