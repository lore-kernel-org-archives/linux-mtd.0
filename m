Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVYaM-0006Lw-7z
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 08:37:26 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
 Deepa Dinamani <deepa.kernel@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: tnc: use monotonic znode timestamp
Date: Wed, 20 Jun 2018 10:29:11 +0200
Message-Id: <20180620082937.719067-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The tnc uses get_seconds() based timestamps to check the age of a znode,
which has two problems: on 32-bit architectures this may overflow in
2038 or 2106, and it gives incorrect information when the system time
is updated using settimeofday().

Using montonic timestamps with ktime_get_seconds() solves both thes
problems.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/shrinker.c | 2 +-
 fs/ubifs/tnc.c      | 4 ++--
 fs/ubifs/tnc_misc.c | 2 +-
 fs/ubifs/ubifs.h    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/shrinker.c b/fs/ubifs/shrinker.c
index 9a9fb94a41c6..9d10cbdec2cc 100644
--- a/fs/ubifs/shrinker.c
+++ b/fs/ubifs/shrinker.c
@@ -71,7 +71,7 @@ static int shrink_tnc(struct ubifs_info *c, int nr, int age, int *contention)
 {
 	int total_freed = 0;
 	struct ubifs_znode *znode, *zprev;
-	int time = get_seconds();
+	time64_t time = ktime_get_seconds();
 
 	ubifs_assert(mutex_is_locked(&c->umount_mutex));
 	ubifs_assert(mutex_is_locked(&c->tnc_mutex));
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 4a21e7f75e7a..6c497fb48b98 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1179,7 +1179,7 @@ int ubifs_lookup_level0(struct ubifs_info *c, const union ubifs_key *key,
 {
 	int err, exact;
 	struct ubifs_znode *znode;
-	unsigned long time = get_seconds();
+	time64_t time = ktime_get_seconds();
 
 	dbg_tnck(key, "search key ");
 	ubifs_assert(key_type(c, key) < UBIFS_INVALID_KEY);
@@ -1315,7 +1315,7 @@ static int lookup_level0_dirty(struct ubifs_info *c, const union ubifs_key *key,
 {
 	int err, exact;
 	struct ubifs_znode *znode;
-	unsigned long time = get_seconds();
+	time64_t time = ktime_get_seconds();
 
 	dbg_tnck(key, "search and dirty key ");
 
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index 93f5b7859e6f..49f647bc88f0 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -435,7 +435,7 @@ struct ubifs_znode *ubifs_load_znode(struct ubifs_info *c,
 
 	zbr->znode = znode;
 	znode->parent = parent;
-	znode->time = get_seconds();
+	znode->time = ktime_get_seconds();
 	znode->iip = iip;
 
 	return znode;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 04bf84d71e7b..54fb6b1cd042 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -758,7 +758,7 @@ struct ubifs_znode {
 	struct ubifs_znode *parent;
 	struct ubifs_znode *cnext;
 	unsigned long flags;
-	unsigned long time;
+	time64_t time;
 	int level;
 	int child_cnt;
 	int iip;
-- 
2.9.0
