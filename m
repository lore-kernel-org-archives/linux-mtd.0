Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NnzMR-0007kV-Dz
	for linux-mtd@lists.infradead.org; Sat, 06 Mar 2010 19:08:28 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [mtd, nandsim] Fix typo: struct nandsin_geometry
Date: Sat, 06 Mar 2010 20:08:00 +0100
Message-ID: <87aaul1d67.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Actually, this embedded struct (together with nandsim_regs) could as well
remain nameless...

Signed-off-by: Ferenc Wagner <wferi@niif.hu>
---
 drivers/mtd/nand/nandsim.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 7281000..803ae12 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -312,7 +312,7 @@ struct nandsim {
 	union ns_mem buf;
 
 	/* NAND flash "geometry" */
-	struct nandsin_geometry {
+	struct nandsim_geometry {
 		uint64_t totsz;     /* total flash size, bytes */
 		uint32_t secsz;     /* flash sector (erase block) size, bytes */
 		uint pgsz;          /* NAND flash page size, bytes */
-- 
1.5.6.5
