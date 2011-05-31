From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Tue, 31 May 2011 07:03:21 +0300
Subject: [PATCH] UBIFS: fix shrinker object count reports
Message-ID: <mailman.5.1307113874.24103.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Sometimes VM asks the shrinker to return amount of objects it can shrink,
and we return the ubifs_clean_zn_cnt in that case. However, it is possible
that this counter is negative for a short period of time, due to the way
UBIFS TNC code updates it. And I can observe the following warnings sometimes:

shrink_slab: ubifs_shrinker+0x0/0x2b7 [ubifs] negative objects to delete nr=-8541616642706119788

This patch makes sure UBIFS never returns negative count of objects.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: stable at kernel.org
---
 fs/ubifs/shrinker.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/shrinker.c b/fs/ubifs/shrinker.c
index ca953a9..9e1d056 100644
--- a/fs/ubifs/shrinker.c
+++ b/fs/ubifs/shrinker.c
@@ -284,7 +284,11 @@ int ubifs_shrinker(struct shrinker *shrink, struct shrink_control *sc)
 	long clean_zn_cnt = atomic_long_read(&ubifs_clean_zn_cnt);
 
 	if (nr == 0)
-		return clean_zn_cnt;
+		/*
+		 * Due to the way UBIFS updates the clean znode counter it may
+		 * temporarily be negative.
+		 */
+		return clean_zn_cnt >= 0 ? clean_zn_cnt : 1;
 
 	if (!clean_zn_cnt) {
 		/*
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
