Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n75-00064A-Pv
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:16 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 15/20] [MTD] Make init_sbc8240_mtd function static
Date: Tue, 25 Nov 2008 02:55:06 +0200
Message-Id: <1227574511-23879-16-git-send-email-dmitri.vorobiev@movial.fi>
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

The function init_sbc8240_mtd is not called from outside the
module drivers/mtd/maps/sbc8240.c where it is defined, so it
can become static. Add the needed keyword.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/sbc8240.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/sbc8240.c b/drivers/mtd/maps/sbc8240.c
index 6e1e99c..d5374cd 100644
--- a/drivers/mtd/maps/sbc8240.c
+++ b/drivers/mtd/maps/sbc8240.c
@@ -136,7 +136,7 @@ static struct mtd_part_def sbc8240_part_banks[NUM_FLASH_BANKS];
 #endif	/* CONFIG_MTD_PARTITIONS */
 
 
-int __init init_sbc8240_mtd (void)
+static int __init init_sbc8240_mtd (void)
 {
 	static struct _cjs {
 		u_long addr;
-- 
1.5.3
