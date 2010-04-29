Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7Hl2-0003Zn-Gy
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 00:37:37 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Wed, 28 Apr 2010 17:26:01 -0700
Subject: [PATCH] mtd: cfi_cmdset_0002: Fix trivial merge conflict
Message-Id: <02d08adf6882611e6c0121481e70a61d20a10acf@localhost.localdomain>
To: <dwmw2@infradead.org>, <dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stefani Seibold's patch changed chip->mutex, once a spinlock, into a
mutex.  This patch applies the same change to cfi_amdstd_reset(), part
of the new reboot notifier code.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d356827..c16b8ce 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1945,7 +1945,7 @@ static int cfi_amdstd_reset(struct mtd_info *mtd)
 
 		chip = &cfi->chips[i];
 
-		spin_lock(chip->mutex);
+		mutex_lock(&chip->mutex);
 
 		ret = get_chip(map, chip, chip->start, FL_SHUTDOWN);
 		if (!ret) {
@@ -1954,7 +1954,7 @@ static int cfi_amdstd_reset(struct mtd_info *mtd)
 			put_chip(map, chip, chip->start);
 		}
 
-		spin_unlock(chip->mutex);
+		mutex_unlock(&chip->mutex);
 	}
 
 	return 0;
-- 
1.6.3.1
