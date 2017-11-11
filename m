Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eDMt6-0007Yb-Ry
 for linux-mtd@lists.infradead.org; Sat, 11 Nov 2017 03:55:23 +0000
Received: by mail-qt0-x233.google.com with SMTP id d43so3457247qte.13
 for <linux-mtd@lists.infradead.org>; Fri, 10 Nov 2017 19:54:56 -0800 (PST)
Received: from bear.localnet (pool-96-241-56-252.washdc.fios.verizon.net.
 [96.241.56.252])
 by smtp.gmail.com with ESMTPSA id v40sm7435414qtj.81.2017.11.10.19.54.54
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Nov 2017 19:54:54 -0800 (PST)
Message-ID: <5a06748e.2b1ac80a.cc211.e761@mx.google.com>
From: Frank Mori Hess <fmh6jj@gmail.com>
Date: Fri, 10 Nov 2017 22:34:18 -0500
Subject: [PATCH] Avoid passing uninitialized wbuf_dwork to
 cancel_delayed_work_sync during jffs2 sync.
Resent-Message-ID: <201711102254.49989.>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 fs/jffs2/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 153f1c6eb169..4da67675e7ca 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -101,7 +101,8 @@ static int jffs2_sync_fs(struct super_block *sb, int wait)
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
-	cancel_delayed_work_sync(&c->wbuf_dwork);
+	if (c->wbuf != NULL)
+		cancel_delayed_work_sync(&c->wbuf_dwork);
 #endif
 
 	mutex_lock(&c->alloc_sem);
-- 
2.11.0
