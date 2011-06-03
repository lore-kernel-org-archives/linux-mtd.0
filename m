Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSNaa-00086u-Mx
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 06:10:33 +0000
Received: by pwi8 with SMTP id 8so1171539pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 23:10:28 -0700 (PDT)
Subject: [PATCH] mtd: mtdblock: Use DEFINE_MUTEX() for mtdblks_lock
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 14:10:22 +0800
Message-ID: <1307081422.6450.2.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Matthias Kaehlcke <matthias@kaehlcke.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdblks_lock can be initialized automatically with
DEFINE_MUTEX() rather than explicitly calling mutex_init().

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/mtdblock.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 3326615..1976b6c 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -44,7 +44,7 @@ struct mtdblk_dev {
 	enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } cache_state;
 };
 
-static struct mutex mtdblks_lock;
+static DEFINE_MUTEX(mtdblks_lock);
 
 /*
  * Cache stuff...
@@ -389,8 +389,6 @@ static struct mtd_blktrans_ops mtdblock_tr = {
 
 static int __init init_mtdblock(void)
 {
-	mutex_init(&mtdblks_lock);
-
 	return register_mtd_blktrans(&mtdblock_tr);
 }
 
-- 
1.7.4.1
