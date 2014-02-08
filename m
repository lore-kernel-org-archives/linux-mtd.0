Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBxTb-0005QW-45
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2014 02:17:04 +0000
Message-ID: <52F59365.5090001@huawei.com>
Date: Sat, 8 Feb 2014 10:16:05 +0800
From: Li Zefan <lizefan@huawei.com>
MIME-Version: 1.0
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] jffs2: remove wait queue after schedule()
References: <52F592F2.6010008@huawei.com>
In-Reply-To: <52F592F2.6010008@huawei.com>
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

@wait is a local variable, so if we don't remove it from the wait queue
list, later wake_up() may end up accessing invalid memory.

This was spotted by eyes.

Cc: <stable@vger.kernel.org>
Signed-off-by: Li Zefan <lizefan@huawei.com>
---
 fs/jffs2/nodemgmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index fb30161..610a22c 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -179,6 +179,7 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 					spin_unlock(&c->erase_completion_lock);
 
 					schedule();
+					remove_wait_queue(&c->erase_wait, &wait);
 				} else
 					spin_unlock(&c->erase_completion_lock);
 			} else if (ret)
-- 
1.8.0.2
