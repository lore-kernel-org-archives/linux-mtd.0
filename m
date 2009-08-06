Message-Id: <200908062305.n76N5X6G004952@imap1.linux-foundation.org>
Subject: [patch 4/8] mtd: sst25l, fix lock imbalance
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:05:33 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	jirislaby@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jiri Slaby <jirislaby@gmail.com>

Add an omitted unlock to one sst25l_erase fail path.

Signed-off-by: Jiri Slaby <jirislaby@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/devices/sst25l.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -puN drivers/mtd/devices/sst25l.c~mtd-sst25l-fix-lock-imbalance drivers/mtd/devices/sst25l.c
--- a/drivers/mtd/devices/sst25l.c~mtd-sst25l-fix-lock-imbalance
+++ a/drivers/mtd/devices/sst25l.c
@@ -180,8 +180,10 @@ static int sst25l_erase(struct mtd_info 
 	mutex_lock(&flash->lock);
 
 	err = sst25l_wait_till_ready(flash);
-	if (err)
+	if (err) {
+		mutex_unlock(&flash->lock);
 		return err;
+	}
 
 	while (addr < end) {
 		err = sst25l_erase_sector(flash, addr);
_
