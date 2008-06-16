Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8FjS-0006uU-Pe
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 14:30:58 +0000
Date: Mon, 16 Jun 2008 23:32:22 +0900 (JST)
Message-Id: <20080616.233222.112854616.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
	joern@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On "partition is out of reach" path, i.e. slave's offset was bigger
than the master's size, slave's erasesize will not be calculated and
it leads division by zero on following boundary checking.  This patch
makes calculation of the slave's erasesize more robust.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
This is broken-out patch from "[PATCH RESEND] mtdpart: Avoid
divide-by-zero on out-of-reach path" on Sat, 14 Jun 2008 23:45:40

 drivers/mtd/mtdpart.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 07c7011..a7a82c7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -452,7 +452,9 @@ int add_mtd_partitions(struct mtd_info *master,
 			for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
 				;
 
-			for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
+			i--;
+			slave->mtd.erasesize = regions[i].erasesize;
+			for (; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
 				if (slave->mtd.erasesize < regions[i].erasesize) {
 					slave->mtd.erasesize = regions[i].erasesize;
 				}
