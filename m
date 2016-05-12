Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0wFr-0004Ye-2I
 for linux-mtd@lists.infradead.org; Thu, 12 May 2016 19:26:39 +0000
Received: by mail-wm0-x243.google.com with SMTP id n129so17694811wmn.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 May 2016 12:26:18 -0700 (PDT)
Sender: Salah TRIKI <salah.triki@gmail.com>
From: Salah Triki <salah.triki@acm.org>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 salah.triki@acm.org
Subject: [PATCH] fs: jffs2: initialize the field fs_flags
Date: Thu, 12 May 2016 20:25:55 +0100
Message-Id: <1463081155-7961-1-git-send-email-salah.triki@acm.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2 requires device, so the field fs_flags of the structure
file_system_type must be initialized to FS_REQUIRES_DEV.

Signed-off-by: Salah Triki <salah.triki@acm.org>
---
 fs/jffs2/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 0a9a114..fd24af9 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -353,6 +353,7 @@ static struct file_system_type jffs2_fs_type = {
 	.name =		"jffs2",
 	.mount =	jffs2_mount,
 	.kill_sb =	jffs2_kill_sb,
+	.fs_fags =	FS_REQUIRES_DEV 
 };
 MODULE_ALIAS_FS("jffs2");
 
-- 
1.9.1
