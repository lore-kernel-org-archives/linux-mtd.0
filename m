Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCssB-0001Za-Ly
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 12:20:43 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3LCKa7V002197
	for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2011 15:20:36 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] UBIFS: fix master node recovery
Date: Thu, 21 Apr 2011 15:23:54 +0300
Message-Id: <1303388635-28296-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303388635-28296-1-git-send-email-dedekind1@gmail.com>
References: <1303388635-28296-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch fixes the following symptoms:
1. Unmount UBIFS cleanly.
2. Start mounting UBIFS R/W and have a power cut immediately
3. Start mounting UBIFS R/O, this succeeds
4. Try to re-mount UBIFS R/W - this fails immediately or later on,
   because UBIFS will write the master node to the flash area
   which has been written before.

The analysis of the problem:

1. UBIFS is unmounted cleanly, both copies of the master node are clean.
2. UBIFS is being mounter R/W, starts changing master node copy 1, and
   a power cut happens. The copy N1 becomes corrupted.
3. UBIFS is being mounted R/O. It notices the copy N1 is corrupted and
   reads copy N2. Copy N2 is clean.
4. Because of R/O mode, UBIFS cannot recover copy 1.
5. The mount code (ubifs_mount()) sees that the master node is clean,
   so it decides that no recovery is needed.
6. We are re-mounting R/W. UBIFS believes no recovery is needed and
   starts updating the master node, but copy N1 is still corrupted
   and was not recovered!

Fix this problem by marking the master node as dirty every time we
recover it and we are in R/O mode. This forces further recovery and
the UBIFS cleans-up the corruptions and recovers the copy N1 when
re-mounting R/W later.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: stable@kernel.org
---
 fs/ubifs/recovery.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 936f2cb..3dbad6f 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -317,6 +317,32 @@ int ubifs_recover_master_node(struct ubifs_info *c)
 			goto out_free;
 		}
 		memcpy(c->rcvrd_mst_node, c->mst_node, UBIFS_MST_NODE_SZ);
+
+		/*
+		 * We had to recover the master node, which means there was an
+		 * unclean reboot. However, it is possible that the master node
+		 * is clean at this point, i.e., %UBIFS_MST_DIRTY is not set.
+		 * E.g., consider the following chain of events:
+		 *
+		 * 1. UBIFS was cleanly unmounted, so the master node is clean
+		 * 2. UBIFS is being mounted R/W and starts changing the master
+		 *    node in the first (%UBIFS_MST_LNUM). A power cut happens,
+		 *    so this LEB ends up with some amount of garbage at the
+		 *    end.
+		 * 3. UBIFS is being mounted R/O. We reach this place and
+		 *    recover the master node from the second LEB
+		 *    (%UBIFS_MST_LNUM + 1). But we cannot update the media
+		 *    because we are being mounted R/O. We have to defer the
+		 *    operation.
+		 * 4. However, this master node (@c->mst_node) is marked as
+		 *    clean (since the step 1). And if we just return, the
+		 *    mount code will be confused and won't recover the master
+		 *    node when it is re-mounter R/W later.
+		 *
+		 *    Thus, to force the recovery by marking the master node as
+		 *    dirty.
+		 */
+		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_DIRTY);
 	} else {
 		/* Write the recovered master node */
 		c->max_sqnum = le64_to_cpu(mst->ch.sqnum) - 1;
-- 
1.7.2.3
