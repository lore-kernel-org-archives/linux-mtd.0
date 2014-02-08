Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBxSR-0005Of-0y
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2014 02:15:53 +0000
Message-ID: <52F592F2.6010008@huawei.com>
Date: Sat, 8 Feb 2014 10:14:10 +0800
From: Li Zefan <lizefan@huawei.com>
MIME-Version: 1.0
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] jffs2: fix unbalanced locking
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This was found by our internal debugging feature on runtime, but this
bug won't lead to deadlock, as the structure that this lock is embedded
in is freed on error.

Cc: <stable@vger.kernel.org>
Signed-off-by: Li Zefan <lizefan@huawei.com>
---
 fs/jffs2/readinode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 386303d..8261021 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1143,6 +1143,7 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 		JFFS2_ERROR("cannot read nodes for ino %u, returned error is %d\n", f->inocache->ino, ret);
 		if (f->inocache->state == INO_STATE_READING)
 			jffs2_set_inocache_state(c, f->inocache, INO_STATE_CHECKEDABSENT);
+		mutex_unlock(&f->sem);
 		return ret;
 	}
 
@@ -1159,6 +1160,7 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 			jffs2_free_tmp_dnode_info(rii.mdata_tn);
 			rii.mdata_tn = NULL;
 		}
+		mutex_unlock(&f->sem);
 		return ret;
 	}
 
@@ -1183,6 +1185,7 @@ static int jffs2_do_read_inode_internal(struct jffs2_sb_info *c,
 			if (!rii.fds) {
 				if (f->inocache->state == INO_STATE_READING)
 					jffs2_set_inocache_state(c, f->inocache, INO_STATE_CHECKEDABSENT);
+				mutex_unlock(&f->sem);
 				return -EIO;
 			}
 			JFFS2_NOTICE("but it has children so we fake some modes for it\n");
-- 
1.8.0.2
