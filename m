Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoCvg-0003qa-FI
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 12:19:06 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/7] UBI: Fastmap: Make sure that find_wl_entry() never
 returns NULL
Date: Mon,  9 Jul 2012 14:18:42 +0200
Message-Id: <1341836323-43916-7-git-send-email-richard@nod.at>
In-Reply-To: <1341836323-43916-1-git-send-email-richard@nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
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

If the rbtree contains only one entry and we don't have fastmap
on flash find_wl_entry() might return NULL.
This must not happen.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 79e3257..d61672d 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -376,7 +376,8 @@ static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
 	/* If no fastmap has been written and this WL entry can be used
 	 * as anchor PEB, hold it back and return the second best WL entry
 	 * such that fastmap can use the anchor PEB later. */
-	if (!ubi->fm_disabled && !ubi->fm && e->pnum < UBI_FM_MAX_START)
+	if (prev_e && !ubi->fm_disabled &&
+	    !ubi->fm && e->pnum < UBI_FM_MAX_START)
 		return prev_e;
 
 	return e;
-- 
1.7.6.5
