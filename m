Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UMyOf-0006hz-9b
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2013 10:24:58 +0000
Received: by mail-we0-f177.google.com with SMTP id o45so196997wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2013 03:24:55 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: cosmetic: correct mount message
Date: Tue,  2 Apr 2013 12:24:37 +0200
Message-Id: <1364898277-30146-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When mounting an UBIFS R/W volume, we have the message:
UBIFS: mounted UBI device 0, volume 1, name "rootfs"(null)
With this patch, we'll have:
UBIFS: mounted UBI device 0, volume 1, name "rootfs"
Which is, I think, what was intended.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 fs/ubifs/super.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index ac838b8..d03ead8 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1412,7 +1412,7 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	ubifs_msg("mounted UBI device %d, volume %d, name \"%s\"%s",
 		  c->vi.ubi_num, c->vi.vol_id, c->vi.name,
-		  c->ro_mount ? ", R/O mode" : NULL);
+		  c->ro_mount ? ", R/O mode" : "");
 	x = (long long)c->main_lebs * c->leb_size;
 	y = (long long)c->log_lebs * c->leb_size + c->max_bud_bytes;
 	ubifs_msg("LEB size: %d bytes (%d KiB), min./max. I/O unit sizes: %d bytes/%d bytes",
-- 
1.7.2.5
