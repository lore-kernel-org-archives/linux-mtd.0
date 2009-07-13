Received: from server1.wserver.cz ([82.113.45.157])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQT49-0008GX-Q6
	for linux-mtd@lists.infradead.org; Mon, 13 Jul 2009 21:28:12 +0000
From: Jiri Slaby <jirislaby@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] MTD: sst25l, fix lock imbalance
Date: Mon, 13 Jul 2009 23:22:04 +0200
Message-Id: <1247520124-31875-1-git-send-email-jirislaby@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jiri Slaby <jirislaby@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an omitted unlock to one sst25l_erase fail path.

Signed-off-by: Jiri Slaby <jirislaby@gmail.com>
---
 drivers/mtd/devices/sst25l.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 1648685..5022ab2 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -180,8 +180,10 @@ static int sst25l_erase(struct mtd_info *mtd, struct erase_info *instr)
 	mutex_lock(&flash->lock);
 
 	err = sst25l_wait_till_ready(flash);
-	if (err)
+	if (err) {
+		mutex_unlock(&flash->lock);
 		return err;
+	}
 
 	while (addr < end) {
 		err = sst25l_erase_sector(flash, addr);
-- 
1.6.3.2
