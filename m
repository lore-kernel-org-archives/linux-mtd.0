Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUpsw-0001fg-8F
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 23:10:55 +0000
Subject: [PATCHv2 7/7] mtd: Raise limit on block device minor numbers
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 12 Jan 2010 23:10:46 +0000
Message-Id: <1263337846.3011.28.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add_mtd_blktrans_dev() imposes a maximum of 257 devices per block
translator.  This was presumably meant to prevent overflow back in the
days of 8-bit minor numbers.  Since we now have 20-bit minor numbers
and can have more than 32 MTDs, change the maximum to MINORMASK.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/mtd_blkdevs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 85a52b3..5e88b49 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -242,7 +242,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (new->devnum == -1)
 		new->devnum = last_devnum+1;
 
-	if ((new->devnum << tr->part_bits) > 256) {
+	if ((new->devnum << tr->part_bits) > MINORMASK) {
 		return -EBUSY;
 	}
 
-- 
1.5.5

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
