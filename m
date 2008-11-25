Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n78-0006Hk-QA
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:19 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 19/20] [MTD] Make the function init_vmax301 static
Date: Tue, 25 Nov 2008 02:55:10 +0200
Message-Id: <1227574511-23879-20-git-send-email-dmitri.vorobiev@movial.fi>
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

The function init_vmax301 is needlessly defined global in
drivers/mtd/maps/vmax301.c, and this patch makes it static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/vmax301.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/vmax301.c b/drivers/mtd/maps/vmax301.c
index 5a0c9a3..6d452dc 100644
--- a/drivers/mtd/maps/vmax301.c
+++ b/drivers/mtd/maps/vmax301.c
@@ -146,7 +146,7 @@ static void __exit cleanup_vmax301(void)
 	iounmap((void *)vmax_map[0].map_priv_1 - WINDOW_START);
 }
 
-int __init init_vmax301(void)
+static int __init init_vmax301(void)
 {
 	int i;
 	unsigned long iomapadr;
-- 
1.5.3
