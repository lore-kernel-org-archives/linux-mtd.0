Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXq7h-0001mq-JJ
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 15:11:03 +0000
Subject: [PATCH 4/5] mtd/rfd_ftl: Return directly after a failed kmalloc() in
 erase_block()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Message-ID: <7b381eef-c54f-d2c9-7281-a90d519c22f1@users.sourceforge.net>
Date: Sat, 6 Jan 2018 16:10:40 +0100
MIME-Version: 1.0
In-Reply-To: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 15:18:28 +0100

* Return directly after a call of the function "kmalloc" failed
  at the beginning.

* Delete an initialisation for the variable "rc" and the jump label "err"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index dcf1b88e1193..e3155ec4be64 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -323,11 +323,11 @@ static void erase_callback(struct erase_info *erase)
 
 static int erase_block(struct partition *part, int block)
 {
-	int rc = -ENOMEM;
+	int rc;
 	struct erase_info *erase = kmalloc(sizeof(*erase), GFP_KERNEL);
 
 	if (!erase)
-		goto err;
+		return -ENOMEM;
 
 	erase->mtd = part->mbd.mtd;
 	erase->callback = erase_callback;
@@ -346,8 +346,6 @@ static int erase_block(struct partition *part, int block)
 				(unsigned long long)erase->len, part->mbd.mtd->name);
 		kfree(erase);
 	}
-
-err:
 	return rc;
 }
 
-- 
2.15.1
