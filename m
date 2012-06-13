Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel23-00076i-TI
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:38 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/21] UBI: Fastmap: enhance find_early_wl_entry()
Date: Wed, 13 Jun 2012 12:41:58 +0200
Message-Id: <1339584138-69914-2-git-send-email-richard@nod.at>
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

Select always the PEB with the lowest pnum and ec.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 2325d3d..8f6321a 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -418,11 +418,13 @@ static struct ubi_wl_entry *find_early_wl_entry(struct rb_root *root,
 {
 	struct rb_node *p;
 	struct ubi_wl_entry *e, *victim = NULL;
+	int max_ec = UBI_MAX_ERASECOUNTER;
 
 	ubi_rb_for_each_entry(p, e, root, u.rb) {
-		if (e->pnum < max_pnum) {
+		if (e->pnum < max_pnum && e->ec < max_ec) {
 			victim = e;
 			max_pnum = e->pnum;
+			max_ec = e->ec;
 		}
 	}
 
-- 
1.7.6.5
