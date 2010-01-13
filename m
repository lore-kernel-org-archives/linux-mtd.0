Received: from [63.146.191.166] (helo=mail0.vertical.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NV4Ya-0001fa-E6
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 14:50:53 +0000
From: Jon Ringle <jon@ringle.org>
To: linux-mtd@lists.infradead.org,
	dsaxena@mvista.com
Subject: [PATCH] [MTD] maps/ixp4xx: Fix reading from half-word boundary
Date: Wed, 13 Jan 2010 09:36:10 -0500
Message-Id: <1263393370-3561-1-git-send-email-jon@ringle.org>
Cc: Jon Ringle <jon@ringle.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ixp4xx updates:
  - Fix handling of reads that don't start on a half-word boundary.


Signed-off-by: Jon Ringle <jon@ringle.org>
---
 drivers/mtd/maps/ixp4xx.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 7214b87..6b540a5 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -107,8 +107,8 @@ static void ixp4xx_copy_from(struct map_info *map, void *to,
 		return;
 
 	if (from & 1) {
-		*dest++ = BYTE1(flash_read16(src));
-                src++;
+		*dest++ = BYTE1(flash_read16(src-1));
+		src++;
 		--len;
 	}
 
-- 
1.6.5.rc2
