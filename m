Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n78-0006DJ-1L
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:18 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 02/20] [MTD] Make alchemy_mtd_init function static
Date: Tue, 25 Nov 2008 02:54:53 +0200
Message-Id: <1227574511-23879-3-git-send-email-dmitri.vorobiev@movial.fi>
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

The symbol alchemy_mtd_init does not need to be global, so make it
static in drivers/mtd/maps/alchemy-flash.c.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/alchemy-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/alchemy-flash.c b/drivers/mtd/maps/alchemy-flash.c
index 82811bc..845ad4f 100644
--- a/drivers/mtd/maps/alchemy-flash.c
+++ b/drivers/mtd/maps/alchemy-flash.c
@@ -111,7 +111,7 @@ static struct mtd_partition alchemy_partitions[] = {
 
 static struct mtd_info *mymtd;
 
-int __init alchemy_mtd_init(void)
+static int __init alchemy_mtd_init(void)
 {
 	struct mtd_partition *parts;
 	int nb_parts = 0;
-- 
1.5.3
