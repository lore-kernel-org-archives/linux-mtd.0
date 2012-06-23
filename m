Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiQ05-0001CI-LD
 for linux-mtd@lists.infradead.org; Sat, 23 Jun 2012 13:03:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/7] UBI: Fastmap: Fix ubi_assert()
Date: Sat, 23 Jun 2012 15:03:19 +0200
Message-Id: <1340456602-46050-5-git-send-email-richard@nod.at>
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

An EC value of zero is allowed

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 8b2af8f4..5f6e81e 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -905,7 +905,7 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *fm_e,
 	 */
 	if (!e) {
 		e = fm_e;
-		ubi_assert(e->ec);
+		ubi_assert(e->ec >= 0);
 		ubi->lookuptbl[pnum] = e;
 	} else {
 		e->ec = fm_e->ec;
-- 
1.7.6.5
