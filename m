Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n78-0006Eg-Al
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:18 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 05/20] [MTD] Make the init_edb7312nor function static
Date: Tue, 25 Nov 2008 02:54:56 +0200
Message-Id: <1227574511-23879-6-git-send-email-dmitri.vorobiev@movial.fi>
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

The init_edb7312nor function is needlessly defined global in
drivers/mtd/maps/edb7312.c, and this patch makes it static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/edb7312.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/edb7312.c b/drivers/mtd/maps/edb7312.c
index 9433738..be9e90b 100644
--- a/drivers/mtd/maps/edb7312.c
+++ b/drivers/mtd/maps/edb7312.c
@@ -71,7 +71,7 @@ static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
 static int                   mtd_parts_nb = 0;
 static struct mtd_partition *mtd_parts    = 0;
 
-int __init init_edb7312nor(void)
+static int __init init_edb7312nor(void)
 {
 	static const char *rom_probe_types[] = PROBETYPES;
 	const char **type;
-- 
1.5.3
