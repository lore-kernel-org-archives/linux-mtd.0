Received: from mailrelay006.isp.belgacom.be ([195.238.6.172])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6QI1-0003Ky-V5
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 19:50:14 +0000
Date: Thu, 23 Jan 2014 20:49:47 +0100
From: Fabian Frederick <fabf@skynet.be>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: block2mtd: char mtd major check
Message-Id: <20140123204947.fc1c03dc0a1624d3347b3837@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, rdunlap@infradead.org, joern@lazybastard.org,
 linux-kernel@vger.kernel.org, ezequiel.garcia@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Deny use of a char mtd device to map as a block device.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 drivers/mtd/devices/block2mtd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index d9fd87a..0efee5b 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -244,7 +244,8 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 	}
 	dev->blkdev = bdev;
 
-	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
+	if ((MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) ||
+	    (MAJOR(bdev->bd_dev) == MTD_CHAR_MAJOR)) {
 		pr_err("attempting to use an MTD device as a block device\n");
 		goto devinit_err;
 	}
-- 
1.8.1.4
