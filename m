Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoH1U-00009K-MG
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2015 20:27:13 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH] UBI: Remove in vain semicolon
Date: Mon, 19 Oct 2015 22:26:43 +0200
Message-Id: <1445286403-25726-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...found while browsing.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index c5a1fa3..f09bc1b 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -949,7 +949,7 @@ static long ubi_cdev_ioctl(struct file *file, unsigned int cmd,
 		if (!req) {
 			err = -ENOMEM;
 			break;
-		};
+		}
 
 		err = copy_from_user(req, argp, sizeof(struct ubi_rnvol_req));
 		if (err) {
-- 
1.8.4.5
