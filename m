Received: from smtp.mujha-vel.cz ([81.30.225.246])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIj00-00084l-IQ
	for linux-mtd@lists.infradead.org; Thu, 10 Dec 2009 13:24:09 +0000
From: Jiri Slaby <jslaby@suse.cz>
To: dwmw2@infradead.org
Subject: [PATCH 1/1] MTD: cfi chip, fix lock imbalance
Date: Thu, 10 Dec 2009 14:23:57 +0100
Message-Id: <1260451437-29645-1-git-send-email-jslaby@suse.cz>
Cc: linux-mtd@lists.infradead.org, jirislaby@gmail.com,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stanse found a double unlock in get_chip. get_chip is called with
chip->mutex held and caller is responsible for unlocking it too.

Do not unlock the lock in get_chip on a fail path. This would mean
a double unlock.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1d49e18..f3600e8 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -569,7 +569,6 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 
 			if (time_after(jiffies, timeo)) {
 				printk(KERN_ERR "Waiting for chip to be ready timed out.\n");
-				spin_unlock(chip->mutex);
 				return -EIO;
 			}
 			spin_unlock(chip->mutex);
-- 
1.6.5.5
