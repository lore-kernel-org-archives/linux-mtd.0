Received: from mgw1.diku.dk ([130.225.96.91])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KzDtC-0006NZ-6c
	for linux-mtd@lists.infradead.org; Sun, 09 Nov 2008 17:15:54 +0000
Date: Sun, 9 Nov 2008 17:55:49 +0100 (CET)
From: Julia Lawall <julia@diku.dk>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 5/8] drivers/mtd/maps/nettel.c: use ARRAY_SIZE
Message-ID: <Pine.LNX.4.64.0811091755280.32509@ask.diku.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <julia@diku.dk>

ARRAY_SIZE is more concise to use when the size of an array is divided by
the size of its type or the size of its first element.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@i@
@@

#include <linux/kernel.h>

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(E[...]))
+ ARRAY_SIZE(E)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/nettel.c     |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
index 965e6c6..f38e92c 100644
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -362,8 +362,7 @@ static int __init nettel_init(void)
 
 	intel_mtd->owner = THIS_MODULE;
 
-	num_intel_partitions = sizeof(nettel_intel_partitions) /
-		sizeof(nettel_intel_partitions[0]);
+	num_intel_partitions = ARRAY_SIZE(nettel_intel_partitions);
 
 	if (intelboot) {
 		/*
