Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxPOu-0002CH-KD
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2012 20:55:04 +0000
From: Richard Weinberger <rw@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH 2/7] MTD: UBI: Add checkpoint struct to ubi_device
Date: Tue, 14 Feb 2012 21:06:41 +0100
Message-Id: <1329250006-22944-3-git-send-email-rw@linutronix.de>
In-Reply-To: <1329250006-22944-1-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
Cc: tglx@linutronix.de, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Richard Weinberger <rw@linutronix.de>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct ubi_checkpoint describes the currently used checkpoint.
Upon checkpoint recreation all currently used PEBs will be returned
to the wl subsystem.

struct ubi_cp_pool describes a checkpoint pool.
All PEBs within this pool have to be rescanned after reading the checkpoint.
The pools are needed to handle the three types of PEBs which can be obtained
from the wl subsystem.
Longterm, shortterm and unknown.

Signed-off-by: Richard Weinberger <rw@linutronix.de>
---
 drivers/mtd/ubi/ubi.h |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index d51d75d..4fe3638 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -196,6 +196,22 @@ struct ubi_rename_entry {
 
 struct ubi_volume_desc;
 
+#ifdef CONFIG_MTD_UBI_CHECKPOINT
+struct ubi_checkpoint {
+	int peb[UBI_CP_MAX_BLOCKS];
+	unsigned int ec[UBI_CP_MAX_BLOCKS];
+	size_t size;
+	int used_blocks;
+};
+
+struct ubi_cp_pool {
+	int pebs[UBI_CP_MAX_POOL_SIZE];
+	int used;
+	int size;
+	int max_size;
+};
+#endif
+
 /**
  * struct ubi_volume - UBI volume description data structure.
  * @dev: device object to make use of the the Linux device model
@@ -425,7 +441,12 @@ struct ubi_device {
 	spinlock_t ltree_lock;
 	struct rb_root ltree;
 	struct mutex alc_mutex;
-
+#ifdef CONFIG_MTD_UBI_CHECKPOINT
+	struct ubi_checkpoint *cp;
+	struct ubi_cp_pool long_pool;
+	struct ubi_cp_pool short_pool;
+	struct ubi_cp_pool unk_pool;
+#endif
 	/* Wear-leveling sub-system's stuff */
 	struct rb_root used;
 	struct rb_root erroneous;
-- 
1.7.7
