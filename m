Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9l85-0008Ez-HS
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 22:32:42 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] drivers/mtd: docg3 increase write/erase timeout
Date: Mon, 19 Mar 2012 23:32:20 +0100
Message-Id: <1332196342-21545-3-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
References: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After several tries with ubifs, it appears empirically that constructor
provided figures for erase/write timeouts are underestimated. A timeout
of 100ms seems to work with a 5 years worn chip, and no timeouts occur
anymore.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 09d039d..f33c130 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1115,10 +1115,10 @@ static int doc_get_op_status(struct docg3 *docg3)
  */
 static int doc_write_erase_wait_status(struct docg3 *docg3)
 {
-	int status, ret = 0;
+	int i, status, ret = 0;
 
-	if (!doc_is_ready(docg3))
-		usleep_range(3000, 3000);
+	for (i = 0; !doc_is_ready(docg3) && i < 5; i++)
+		msleep(20);
 	if (!doc_is_ready(docg3)) {
 		doc_dbg("Timeout reached and the chip is still not ready\n");
 		ret = -EAGAIN;
-- 
1.7.5.4
