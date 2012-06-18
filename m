Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgeg5-0000hF-GS
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:47 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/22] UBI: Fastmap: Fix and explain duplicated PEBs
Date: Mon, 18 Jun 2012 18:19:04 +0200
Message-Id: <1340036345-96726-22-git-send-email-richard@nod.at>
In-Reply-To: <1340036345-96726-1-git-send-email-richard@nod.at>
References: <1340036345-96726-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, shmulik.ladkani@gmail.com,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
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
 drivers/mtd/ubi/fastmap.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index bea9446..45f70db 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -714,6 +714,15 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 	}
 
+	/*
+	 * Sort out dups. We are allowed to have duplicates here because
+	 * the fastmap can be written without refilling all pools.
+	 * E.g. If PEB X is in a pool fastmap may detect it as empty and
+	 * puts it into the free list. But ff PEB X is in the pool, get's
+	 * used and returned (e.g. by schedule_erase()) it remains in
+	 * the erase or free list too.
+	 * We could also sort out these dups while creating the fastmap.
+	 */
 	if (list_empty(&free))
 		goto out;
 
@@ -729,6 +738,18 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		}
 	}
 
+	list_for_each_entry(aeb, &ai->erase, u.list) {
+		list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
+			if (aeb->pnum == tmp_aeb->pnum) {
+				aeb->scrub = tmp_aeb->scrub;
+				aeb->ec = tmp_aeb->ec;
+				list_del(&tmp_aeb->u.list);
+				kfree(tmp_aeb);
+				continue;
+			}
+		}
+	}
+
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
 		list_del(&tmp_aeb->u.list);
 		list_add_tail(&tmp_aeb->u.list, &ai->free);
-- 
1.7.6.5
