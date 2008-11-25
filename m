Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n76-00064D-4s
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:16 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 16/20] [MTD] Make init_sharpsl symbol static
Date: Tue, 25 Nov 2008 02:55:07 +0200
Message-Id: <1227574511-23879-17-git-send-email-dmitri.vorobiev@movial.fi>
In-Reply-To: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
References: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function init_sharpsl is needlessly defined global.
Make it static by adding the needed keyword to the file
drivers/mtd/maps/sharpsl-flash.c, where the function is
defined.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/sharpsl-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/sharpsl-flash.c b/drivers/mtd/maps/sharpsl-flash.c
index 026eab0..b392f09 100644
--- a/drivers/mtd/maps/sharpsl-flash.c
+++ b/drivers/mtd/maps/sharpsl-flash.c
@@ -47,7 +47,7 @@ static struct mtd_partition sharpsl_partitions[1] = {
 	}
 };
 
-int __init init_sharpsl(void)
+static int __init init_sharpsl(void)
 {
 	struct mtd_partition *parts;
 	int nb_parts = 0;
-- 
1.5.3
