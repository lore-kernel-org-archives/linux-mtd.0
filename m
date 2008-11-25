Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n7A-0006Mq-4t
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:20 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 08/20] [MTD] Make init_impa7 static
Date: Tue, 25 Nov 2008 02:54:59 +0200
Message-Id: <1227574511-23879-9-git-send-email-dmitri.vorobiev@movial.fi>
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

The function init_impa7 does not need to be global, and
this patch makes it static by adding the needed keyword
to drivers/mtd/maps/impa7.c.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/impa7.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index 2682ab5..998a27d 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -70,7 +70,7 @@ static struct mtd_partition *mtd_parts[NUM_FLASHBANKS];
 
 static const char *probes[] = { "cmdlinepart", NULL };
 
-int __init init_impa7(void)
+static int __init init_impa7(void)
 {
 	static const char *rom_probe_types[] = PROBETYPES;
 	const char **type;
-- 
1.5.3
