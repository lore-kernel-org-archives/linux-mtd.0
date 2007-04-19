Received: from rdrz.de ([217.160.107.209])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeYb1-0001KN-H3
	for linux-mtd@lists.infradead.org; Thu, 19 Apr 2007 11:30:56 -0400
Date: Thu, 19 Apr 2007 17:30:50 +0200
From: Raphael Zimmerer <killekulla@rdrz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Utils: Support 1k page & 32 bytes oob with nandwrite
Message-ID: <20070419153050.GA30241@rdrz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some chips have a page size of 1024 bytes with 32 bytes oob.

Signed-off-by: Raphael Zimmerer <killekulla@rdrz.de>
---
 nandwrite.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index f74581d..52ab580 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -243,6 +243,7 @@ int main(int argc, char **argv)
 
 	/* Make sure device page sizes are valid */
 	if (!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
+			!(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
 			!(meminfo.oobsize == 8 && meminfo.writesize == 256) &&
 			!(meminfo.oobsize == 64 && meminfo.writesize == 2048)) {
 		fprintf(stderr, "Unknown flash (not normal NAND)\n");
-- 
1.4.4.4
