Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cghMU-0001LM-Fu
 for linux-mtd@lists.infradead.org; Thu, 23 Feb 2017 00:34:24 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: fix spelling mistake: "requestied" -> "requested"
Date: Thu, 23 Feb 2017 00:34:00 +0000
Message-Id: <20170223003400.9617-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in JFFS2_ERROR message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/jffs2/readinode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 06a71db..40f3fd4 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1366,7 +1366,7 @@ int jffs2_do_read_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 		jffs2_add_ino_cache(c, f->inocache);
 	}
 	if (!f->inocache) {
-		JFFS2_ERROR("requestied to read an nonexistent ino %u\n", ino);
+		JFFS2_ERROR("requested to read an nonexistent ino %u\n", ino);
 		return -ENOENT;
 	}
 
-- 
2.10.2
