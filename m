Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Naxwa-0008Ky-3O
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 21:00:00 +0000
Subject: [PATCHv3 8/9] mtd: Raise limit on block device minor numbers
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain
Date: Fri, 29 Jan 2010 20:59:53 +0000
Message-Id: <1264798793.2785.40.camel@achroite.uk.solarflarecom.com>
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
days of 8-bit minor numbers.  Instead, check against MINORMASK and the
limits of the partition naming scheme.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/mtd_blkdevs.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 85a52b3..2f8c202 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -242,9 +242,12 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (new->devnum == -1)
 		new->devnum = last_devnum+1;
 
-	if ((new->devnum << tr->part_bits) > 256) {
+	/* Check that the device and any partitions will get valid
+	 * minor numbers and that the disk naming code below can cope
+	 * with this number. */
+	if (new->devnum > (MINORMASK >> tr->part_bits) ||
+	    (tr->part_bits && new->devnum >= 27 * 26))
 		return -EBUSY;
-	}
 
 	list_add_tail(&new->list, &tr->devs);
  added:
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
