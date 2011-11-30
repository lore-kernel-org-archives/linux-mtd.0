Received: from hqemgate04.nvidia.com ([216.228.121.35])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVj2t-00019I-W0
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2011 12:13:52 +0000
From: Bhavesh Parekh <bparekh@nvidia.com>
To: dedekind1@gmail.com
Subject: [PATCH] [MTD:UBI] Missing scrub when there is a bit-flip
Date: Wed, 30 Nov 2011 17:43:42 +0530
Message-Id: <1322655222-28348-2-git-send-email-bparekh@nvidia.com>
In-Reply-To: <1322655222-28348-1-git-send-email-bparekh@nvidia.com>
References: <1322655222-28348-1-git-send-email-bparekh@nvidia.com>
Cc: linux-mtd@lists.infradead.org, Bhavesh Parekh <bparekh@nvidia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Under some cases, when scrubbing the PEB if we didnot get the lock on
the PEB it fails to scrub. Add that PEB again to the scrub list

Signed-off-by: Bhavesh Parekh <bparekh@nvidia.com>
---
 drivers/mtd/ubi/eba.c |    2 +-
 drivers/mtd/ubi/ubi.h |    3 +++
 drivers/mtd/ubi/wl.c  |    5 ++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index fb7f19b..fb808d6 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1033,7 +1033,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	err = leb_write_trylock(ubi, vol_id, lnum);
 	if (err) {
 		dbg_wl("contention on LEB %d:%d, cancel", vol_id, lnum);
-		return MOVE_CANCEL_RACE;
+		return MOVE_RETRY;
 	}
 
 	/*
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index dc64c76..15aba00 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -120,6 +120,8 @@ enum {
  *                     PEB
  * MOVE_CANCEL_BITFLIPS: canceled because a bit-flip was detected in the
  *                       target PEB
+ * MOVE_RETRY: Retry scrubbing the given PEB, as we didnot got lock last-time on
+ *                it
  */
 enum {
 	MOVE_CANCEL_RACE = 1,
@@ -127,6 +129,7 @@ enum {
 	MOVE_TARGET_RD_ERR,
 	MOVE_TARGET_WR_ERR,
 	MOVE_CANCEL_BITFLIPS,
+	MOVE_RETRY,
 };
 
 /**
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 42c684c..277c429 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -795,7 +795,10 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 			protect = 1;
 			goto out_not_moved;
 		}
-
+		if (err == MOVE_RETRY) {
+			scrubbing = 1;
+			goto out_not_moved;
+		}
 		if (err == MOVE_CANCEL_BITFLIPS || err == MOVE_TARGET_WR_ERR ||
 		    err == MOVE_TARGET_RD_ERR) {
 			/*
-- 
1.7.0.4
