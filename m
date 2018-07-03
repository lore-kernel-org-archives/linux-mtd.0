Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faFyh-0005Ue-VN
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 07:44:01 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: cfi_cmdset_0002: remove redundant variable timeo
Date: Tue,  3 Jul 2018 08:43:39 +0100
Message-Id: <20180703074339.29989-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Variable is_local is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'timeo' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1b64ac8c5bc8..72428b6bfc47 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1216,7 +1216,6 @@ static inline int do_read_secsi_onechip(struct map_info *map,
 					size_t grouplen)
 {
 	DECLARE_WAITQUEUE(wait, current);
-	unsigned long timeo = jiffies + HZ;
 
  retry:
 	mutex_lock(&chip->mutex);
@@ -1229,7 +1228,6 @@ static inline int do_read_secsi_onechip(struct map_info *map,
 
 		schedule();
 		remove_wait_queue(&chip->wq, &wait);
-		timeo = jiffies + HZ;
 
 		goto retry;
 	}
-- 
2.17.1
