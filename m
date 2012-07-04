Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmKdr-0006tN-9b
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2012 08:08:56 +0000
Received: by wgbds1 with SMTP id ds1so4106146wgb.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2012 01:08:49 -0700 (PDT)
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 4/5] ubi: trivial: fix comment of ubi_calculate_reserved()
Date: Wed,  4 Jul 2012 11:06:03 +0300
Message-Id: <1341389164-24409-5-git-send-email-shmulik.ladkani@gmail.com>
In-Reply-To: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function name within the comment was not aligned with the actual
function name.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
 drivers/mtd/ubi/misc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index e9dcb83..25b564f 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -92,7 +92,7 @@ int ubi_check_volume(struct ubi_device *ubi, int vol_id)
 }
 
 /**
- * ubi_calculate_rsvd_pool - calculate how many PEBs must be reserved for bad
+ * ubi_calculate_reserved - calculate how many PEBs must be reserved for bad
  * eraseblock handling.
  * @ubi: UBI device description object
  */
-- 
1.7.9
