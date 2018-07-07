Received: from mail-yb0-x24a.google.com ([2607:f8b0:4002:c09::24a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbe35-0003kk-8A
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 03:38:16 +0000
Received: by mail-yb0-x24a.google.com with SMTP id y10-v6so11182610ybj.20
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2018 20:38:03 -0700 (PDT)
MIME-Version: 1.0
Date: Sat,  7 Jul 2018 05:37:22 +0200
Message-Id: <20180707033722.219468-1-jannh@google.com>
Subject: [PATCH] mtdchar: fix overflows in adjustment of `count`
From: Jann Horn <jannh@google.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, jannh@google.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The first checks in mtdchar_read() and mtdchar_write() attempt to limit
`count` such that `*ppos + count <= mtd->size`. However, they ignore the
possibility of `*ppos > mtd->size`, allowing the calculation of `count` to
wrap around. `mtdchar_lseek()` prevents seeking beyond mtd->size, but the
pread/pwrite syscalls bypass this.

I haven't found any codepath on which this actually causes dangerous
behavior, but it seems like a sensible change anyway.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/mtd/mtdchar.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index cd67c85cc87d..02389528f622 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -160,8 +160,12 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 
 	pr_debug("MTD_read\n");
 
-	if (*ppos + count > mtd->size)
-		count = mtd->size - *ppos;
+	if (*ppos + count > mtd->size) {
+		if (*ppos < mtd->size)
+			count = mtd->size - *ppos;
+		else
+			count = 0;
+	}
 
 	if (!count)
 		return 0;
@@ -246,7 +250,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 
 	pr_debug("MTD_write\n");
 
-	if (*ppos == mtd->size)
+	if (*ppos >= mtd->size)
 		return -ENOSPC;
 
 	if (*ppos + count > mtd->size)
-- 
2.18.0.203.gfac676dfb9-goog
