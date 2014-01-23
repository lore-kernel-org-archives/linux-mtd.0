Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6QLZ-0003Y8-JF
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 19:53:54 +0000
Date: Thu, 23 Jan 2014 20:53:31 +0100
From: Fabian Frederick <fabf@skynet.be>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] mtd: block2mtd: check device size
Message-Id: <20140123205331.03314c6f82f24a6bb4b8ef53@skynet.be>
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

fixme applied : check device size is a multiple of erasesize.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 drivers/mtd/devices/block2mtd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 8071596..f0fd4fc 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -209,7 +209,6 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 }
 
 
-/* FIXME: ensure that mtd->size % erase_size == 0 */
 static struct block2mtd_dev *add_device(char *devname, int erase_size)
 {
 	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
@@ -250,6 +249,11 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 		goto devinit_err1;
 	}
 
+	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
+		pr_err("erasesize muse be a divisor of device size\n");
+		goto devinit_err1;
+	}
+
 	mutex_init(&dev->write_mutex);
 
 	/* Setup the MTD structure */
-- 
1.8.1.4
