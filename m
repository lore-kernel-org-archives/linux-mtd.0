Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n78-0006Et-CA
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:18 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 09/20] [MTD] Make ipaq_mtd_init function static
Date: Tue, 25 Nov 2008 02:55:00 +0200
Message-Id: <1227574511-23879-10-git-send-email-dmitri.vorobiev@movial.fi>
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

The symbol ipaq_mtd_init is not used anywhere outside of
drivers/mtd/maps/ipaq-flash.c, so make it static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/ipaq-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/ipaq-flash.c b/drivers/mtd/maps/ipaq-flash.c
index ed58f6a..748c85f 100644
--- a/drivers/mtd/maps/ipaq-flash.c
+++ b/drivers/mtd/maps/ipaq-flash.c
@@ -202,7 +202,7 @@ static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
 static int __init h1900_special_case(void);
 
-int __init ipaq_mtd_init(void)
+static int __init ipaq_mtd_init(void)
 {
 	struct mtd_partition *parts = NULL;
 	int nb_parts = 0;
-- 
1.5.3
