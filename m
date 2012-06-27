Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjudC-0008SG-Kx
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 15:58:16 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/16] UBI: Fastmap: Rename self_check_fastmap()
Date: Wed, 27 Jun 2012 17:57:44 +0200
Message-Id: <1340812676-14460-5-git-send-email-richard@nod.at>
In-Reply-To: <1340812676-14460-1-git-send-email-richard@nod.at>
References: <1340812676-14460-1-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/fastmap.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index ba547e2..a596cef 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -462,7 +462,11 @@ out:
 	return ret;
 }
 
-static int self_check_fastmap(struct ubi_attach_info *ai)
+/**
+ * count_fastmap_pebs - Counts the PEBs found by fastmap.
+ * @ai: The UBI attach info object
+ */
+static int count_fastmap_pebs(struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb;
 	struct ubi_ainf_volume *av;
@@ -1006,7 +1010,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	 * We do this here because in ubi_wl_init() it's too late
 	 * and we cannot fall back to scanning.
 	 */
-	if (WARN_ON(self_check_fastmap(ai) != ubi->peb_count -
+	if (WARN_ON(count_fastmap_pebs(ai) != ubi->peb_count -
 		    ai->bad_peb_count - used_blocks)) {
 		ret = UBI_BAD_FASTMAP;
 		kfree(fm);
-- 
1.7.6.5
