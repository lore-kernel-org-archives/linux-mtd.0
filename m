Message-ID: <49AE3384.6040008@nokia.com>
Date: Wed, 04 Mar 2009 09:53:40 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtdoops: fix a bit of spin lock usage
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- do not leave spin lock locked
- initialise spin lock

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/mtdoops.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 0a0dad6..3f63fad 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -358,8 +358,10 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 	spin_lock_irqsave(&cxt->writecount_lock, flags);
 
 	/* Check ready status didn't change whilst waiting for the lock */
-	if (!cxt->ready)
+	if (!cxt->ready) {
+		spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 		return;
+	}
 
 	if (cxt->writecount == 0) {
 		u32 *stamp = cxt->oops_buf;
@@ -417,6 +419,7 @@ static int __init mtdoops_console_init(void)
 
 	cxt->mtd_index = -1;
 	cxt->oops_buf = vmalloc(OOPS_PAGE_SIZE);
+	spin_lock_init(&cxt->writecount_lock);
 
 	if (!cxt->oops_buf) {
 		printk(KERN_ERR "Failed to allocate mtdoops buffer workspace\n");
-- 
1.5.6.3
