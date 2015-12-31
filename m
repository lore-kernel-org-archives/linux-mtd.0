Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEjpN-0002Ut-Lg
 for linux-mtd@lists.infradead.org; Thu, 31 Dec 2015 20:28:06 +0000
Subject: [PATCH 3/3] mtd-rfd_ftl: Refactoring for erase_block()
To: linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56858E3A.7000706@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Julia Lawall <julia.lawall@lip6.fr>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <56858FBC.70103@users.sourceforge.net>
Date: Thu, 31 Dec 2015 21:27:40 +0100
MIME-Version: 1.0
In-Reply-To: <56858E3A.7000706@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Dec 2015 21:06:27 +0100

This issue was detected by using the Coccinelle software.

* Return directly if a memory allocation failed.

* Drop the explicit initialisation for the variable "rc"
  at the beginning then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 9b59423..8379447 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -326,11 +326,11 @@ static void erase_callback(struct erase_info *erase)
 static int erase_block(struct partition *part, int block)
 {
 	struct erase_info *erase;
-	int rc = -ENOMEM;
+	int rc;
 
 	erase = kmalloc(sizeof(struct erase_info), GFP_KERNEL);
 	if (!erase)
-		goto err;
+		return -ENOMEM;
 
 	erase->mtd = part->mbd.mtd;
 	erase->callback = erase_callback;
@@ -349,8 +349,6 @@ static int erase_block(struct partition *part, int block)
 				(unsigned long long)erase->len, part->mbd.mtd->name);
 		kfree(erase);
 	}
-
-err:
 	return rc;
 }
 
-- 
2.6.3
