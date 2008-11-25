Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n78-0006D3-7D
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:18 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 06/20] [MTD] Make init_fortunet function static
Date: Tue, 25 Nov 2008 02:54:57 +0200
Message-Id: <1227574511-23879-7-git-send-email-dmitri.vorobiev@movial.fi>
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

The symbol init_fortunet is needlessly defined global in
drivers/mtd/maps/fortunet.c. Make it static and clean up
the kernel global namespace.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/fortunet.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/fortunet.c b/drivers/mtd/maps/fortunet.c
index a8e3fde..1e43124 100644
--- a/drivers/mtd/maps/fortunet.c
+++ b/drivers/mtd/maps/fortunet.c
@@ -181,7 +181,7 @@ __setup("MTD_Partition=", MTD_New_Partition);
 /* Backwards-spelling-compatibility */
 __setup("MTD_Partion=", MTD_New_Partition);
 
-int __init init_fortunet(void)
+static int __init init_fortunet(void)
 {
 	int	ix,iy;
 	for(iy=ix=0;ix<MAX_NUM_REGIONS;ix++)
-- 
1.5.3
