Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrs7X-0005zj-Fl
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 14:22:12 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] romfs: switch to new MTD API
Date: Mon, 30 Jan 2012 16:24:06 +0200
Message-Id: <1327933447-17356-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1327933447-17356-1-git-send-email-dedekind1@gmail.com>
References: <1327933447-17356-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We have changed the MTD API and now ROMFS should use 'mtd_read()' instead
of mtd->read().

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/romfs/storage.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/romfs/storage.c b/fs/romfs/storage.c
index 71e2b4d..f86f51f 100644
--- a/fs/romfs/storage.c
+++ b/fs/romfs/storage.c
@@ -19,7 +19,7 @@
 #endif
 
 #ifdef CONFIG_ROMFS_ON_MTD
-#define ROMFS_MTD_READ(sb, ...) ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__))
+#define ROMFS_MTD_READ(sb, ...) mtd_read((sb)->s_mtd, ##__VA_ARGS__)
 
 /*
  * read data from an romfs image on an MTD device
-- 
1.7.7.6
