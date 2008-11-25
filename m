Received: from smtp.movial.fi ([62.236.91.34])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1L4n79-000505-Ka
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:25 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 13/20] [MTD] Make init_redwood_flash function static
Date: Tue, 25 Nov 2008 02:55:04 +0200
Message-Id: <1227574511-23879-14-git-send-email-dmitri.vorobiev@movial.fi>
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

The function init_redwood_flash is needlessly defined global,
make it static by this patch.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/redwood.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/redwood.c b/drivers/mtd/maps/redwood.c
index de002eb..933c0b6 100644
--- a/drivers/mtd/maps/redwood.c
+++ b/drivers/mtd/maps/redwood.c
@@ -122,7 +122,7 @@ struct map_info redwood_flash_map = {
 
 static struct mtd_info *redwood_mtd;
 
-int __init init_redwood_flash(void)
+static int __init init_redwood_flash(void)
 {
 	int err;
 
-- 
1.5.3
