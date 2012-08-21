Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3mHi-0006je-RP
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 11:06:12 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 1/3] UBIFS: remove stale commentary
Date: Tue, 21 Aug 2012 14:05:58 +0300
Message-Id: <1345547160-31958-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1345547160-31958-1-git-send-email-dedekind1@gmail.com>
References: <1345547160-31958-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/super.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index c3fa6c5..71a197f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1157,9 +1157,6 @@ static int check_free_space(struct ubifs_info *c)
  *
  * This function mounts UBIFS file system. Returns zero in case of success and
  * a negative error code in case of failure.
- *
- * Note, the function does not de-allocate resources it it fails half way
- * through, and the caller has to do this instead.
  */
 static int mount_ubifs(struct ubifs_info *c)
 {
-- 
1.7.7.6
