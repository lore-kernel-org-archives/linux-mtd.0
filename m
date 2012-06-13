Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel28-00079G-Q8
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/21] UBI: Fastmap: Adjust comment above ubi_wl_flush()
Date: Wed, 13 Jun 2012 12:42:08 +0200
Message-Id: <1339584138-69914-12-git-send-email-richard@nod.at>
In-Reply-To: <1339584138-69914-1-git-send-email-richard@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 tim.bird@am.sony.com
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
 drivers/mtd/ubi/fastmap.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index b42f81c..20b016e 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1387,8 +1387,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	/* Ensure that the PEBs of the old fastmap got erased and added to the
 	 * free list before we write the fastmap. Otherwise fastmp does not
 	 * see these PEBs and we leak them.
-	 * FIXME: Rewrite ubi_wl_flush() such that we can flush only the
-	 * erase work instead of all work.
+	 * We need the flush also to ensure that no to be scrubbed PEBs are in
+	 * flight.
 	 */
 	ubi_wl_flush(ubi);
 
-- 
1.7.6.5
