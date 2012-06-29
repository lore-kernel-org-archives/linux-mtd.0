Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkcuB-0006Rp-VW
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:14:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/11] UBI: Fastmap: Remove unused variable
Date: Fri, 29 Jun 2012 17:14:24 +0200
Message-Id: <1340982869-77042-7-git-send-email-richard@nod.at>
In-Reply-To: <1340982869-77042-1-git-send-email-richard@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 6bf5349..8e2592d 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -393,8 +393,6 @@ struct ubi_wl_entry;
  * @fm_mutex: serializes ubi_update_fastmap()
  * @fm_sem: allows ubi_update_fastmap() to block EBA table changes
  * @fm_work: fastmap work queue
- * @attached_by_scanning: this UBI device was attached by the old scanning
- *			  methold. All fastmap volumes have to be deleted.
  *
  * @used: RB-tree of used physical eraseblocks
  * @erroneous: RB-tree of erroneous used physical eraseblocks
@@ -494,7 +492,6 @@ struct ubi_device {
 	struct rw_semaphore fm_sem;
 	struct mutex fm_mutex;
 	struct work_struct fm_work;
-	int attached_by_scanning;
 
 	/* Wear-leveling sub-system's stuff */
 	struct rb_root used;
-- 
1.7.6.5
