Received: from mailrelay010.isp.belgacom.be ([195.238.6.177])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6QMx-0003bR-6H
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 19:55:19 +0000
Date: Thu, 23 Jan 2014 20:54:56 +0100
From: Fabian Frederick <fabf@skynet.be>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: block2mtd: mutex_init moved
Message-Id: <20140123205456.10e45ea0baff94cf3f785a21@skynet.be>
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

mutex_init declared when mtd structure is available

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 drivers/mtd/devices/block2mtd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index f0fd4fc..5b9b145 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -254,16 +254,15 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 		goto devinit_err1;
 	}
 
+	name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
+	if (!name)
+		goto devinit_err1;
+
 	mutex_init(&dev->write_mutex);
 
 	/* Setup the MTD structure */
 	/* make the name contain the block device in */
-	name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
-	if (!name)
-		goto devinit_err2;
-
 	dev->mtd.name = name;
-
 	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.writesize = 1;
-- 
1.8.1.4
