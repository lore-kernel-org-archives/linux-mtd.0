Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3FP-0004WX-Fd
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:05:04 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 3/6] UBI: Fastmap: Set used_ebs only for static volumes
Date: Sun, 30 Nov 2014 13:04:27 +0100
Message-Id: <1417349070-8894-4-git-send-email-richard@nod.at>
In-Reply-To: <1417349070-8894-1-git-send-email-richard@nod.at>
References: <1417349070-8894-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we set it for dynamic ones we might confuse various self checks.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 5db41a5..749e2e4 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -136,14 +136,15 @@ static struct ubi_ainf_volume *add_vol(struct ubi_attach_info *ai, int vol_id,
 	if (!av)
 		goto out;
 
-	av->highest_lnum = av->leb_count = 0;
+	av->highest_lnum = av->leb_count = av->used_ebs = 0;
 	av->vol_id = vol_id;
-	av->used_ebs = used_ebs;
 	av->data_pad = data_pad;
 	av->last_data_size = last_eb_bytes;
 	av->compat = 0;
 	av->vol_type = vol_type;
 	av->root = RB_ROOT;
+	if (av->vol_type == UBI_STATIC_VOLUME)
+		av->used_ebs = used_ebs;
 
 	dbg_bld("found volume (ID %i)", vol_id);
 
-- 
1.8.4.5
