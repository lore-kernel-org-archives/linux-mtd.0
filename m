Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvznP-00039X-0j
 for linux-mtd@lists.infradead.org; Wed, 03 Dec 2014 02:36:03 +0000
Message-ID: <547E7357.9040606@cn.fujitsu.com>
Date: Wed, 3 Dec 2014 10:20:07 +0800
From: Gu Zheng <guz.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: [RESEND PATCH 2/3] mtd: move the enum definition out of struct
 mtdblk_dev
References: <1417052709-22026-1-git-send-email-guz.fnst@cn.fujitsu.com>
In-Reply-To: <1417052709-22026-1-git-send-email-guz.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Gu Zheng <guz.fnst@cn.fujitsu.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move the enum definition out of struct mtdblk_dev, just cleanup.

Signed-off-by: Gu Zheng <guz.fnst@cn.fujitsu.com>
---
 drivers/mtd/mtdblock.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index bb4c14f..acc00f1 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -34,6 +34,11 @@
 #include <linux/mutex.h>
 #include <linux/major.h>
 
+enum CACHE_STATES {
+	STATE_EMPTY,
+	STATE_CLEAN,
+	STATE_DIRTY
+};
 
 struct mtdblk_dev {
 	struct mtd_blktrans_dev mbd;
@@ -42,7 +47,7 @@ struct mtdblk_dev {
 	unsigned char *cache_data;
 	unsigned long cache_offset;
 	unsigned int cache_size;
-	enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } cache_state;
+	enum CACHE_STATES cache_state;
 };
 
 /*
-- 
1.7.7

.
