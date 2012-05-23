Received: from arrakis.dune.hu ([78.24.191.176])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXJyz-0004d8-On
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 22:24:42 +0000
From: Gabor Juhos <juhosg@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: block2mtd: fix recursive call of mtd_writev
Date: Thu, 24 May 2012 00:17:23 +0200
Message-Id: <1337811443-2603-1-git-send-email-juhosg@openwrt.org>
Cc: Gabor Juhos <juhosg@openwrt.org>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The 'mtd_writev' interface calls the function assigned
to the '_write' field of a given mtd device if that is
not NULL. The block2mtd driver sets the '_writev' field
to the 'mtd_writev' function itself and thus causes a
endless loop.

This is caused by 1dbebd32562b3c2caeca35960e5cb00bfcc12900
(mtd: harmonize mtd_writev usage).

Remove the assignment from the block2mtd driver to fix the
issue.

Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org

---
An identical patch has been tested on 3.3.7, but the actual
one is not even compile tested.
---
 drivers/mtd/devices/block2mtd.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index a4a80b7..7d7000d 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -271,7 +271,6 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 	dev->mtd.flags = MTD_CAP_RAM;
 	dev->mtd._erase = block2mtd_erase;
 	dev->mtd._write = block2mtd_write;
-	dev->mtd._writev = mtd_writev;
 	dev->mtd._sync = block2mtd_sync;
 	dev->mtd._read = block2mtd_read;
 	dev->mtd.priv = dev;
-- 
1.7.2.1
