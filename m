Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiQ05-0001CA-KI
 for linux-mtd@lists.infradead.org; Sat, 23 Jun 2012 13:03:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/7] UBI: Fastmap: Fix WARN_ON()
Date: Sat, 23 Jun 2012 15:03:17 +0200
Message-Id: <1340456602-46050-3-git-send-email-richard@nod.at>
In-Reply-To: <1340456602-46050-1-git-send-email-richard@nod.at>
References: <1340456602-46050-1-git-send-email-richard@nod.at>
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

ubi->bad_peb_count is not jet valid, use ai->

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 4793ba8..2ff0681 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1005,7 +1005,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	 * and we cannot fall back to scanning.
 	 */
 	if (WARN_ON(self_check_fastmap(ai) != ubi->peb_count -
-		    ubi->bad_peb_count - used_blocks)) {
+		    ai->bad_peb_count - used_blocks)) {
 		ret = UBI_BAD_FASTMAP;
 		kfree(fm);
 		goto free_hdr;
-- 
1.7.6.5
