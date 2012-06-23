Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiQ06-0001CR-AD
 for linux-mtd@lists.infradead.org; Sat, 23 Jun 2012 13:03:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/7] UBI: Fastmap: Reuse all fastmap PEB if no free PEBs are
 available
Date: Sat, 23 Jun 2012 15:03:21 +0200
Message-Id: <1340456602-46050-7-git-send-email-richard@nod.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |   42 ++++++++++++++++++++++++++++++++----------
 1 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index acd0561..ecbed52 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1423,7 +1423,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		tmp_e = ubi_wl_get_fm_peb(ubi, 0);
 		spin_unlock(&ubi->wl_lock);
 
-		if (!tmp_e) {
+		if (!tmp_e && !old_fm) {
 			int j;
 			ubi_err("could not get any free erase block");
 
@@ -1432,10 +1432,28 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 			ret = -ENOSPC;
 			goto err;
-		}
+		} else if (!tmp_e && old_fm) {
+			ret = erase_block(ubi, old_fm->e[i]->pnum);
+			if (ret < 0) {
+				int j;
+
+				for (j = 1; j < i; j++)
+					ubi_wl_put_fm_peb(ubi, new_fm->e[j], 0);
+
+				ubi_err("could not erase old fastmap PEB");
+				goto err;
+			}
 
-		new_fm->e[i]->pnum = tmp_e->pnum;
-		new_fm->e[i]->ec = tmp_e->ec;
+			new_fm->e[i]->pnum = old_fm->e[i]->pnum;
+			new_fm->e[i]->ec = old_fm->e[i]->ec;
+		} else {
+			new_fm->e[i]->pnum = tmp_e->pnum;
+			new_fm->e[i]->ec = tmp_e->ec;
+
+			if (old_fm)
+				ubi_wl_put_fm_peb(ubi, old_fm->e[i],
+						  old_fm->to_be_tortured[i]);
+		}
 	}
 
 	spin_lock(&ubi->wl_lock);
@@ -1447,7 +1465,11 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		if (!tmp_e) {
 			ret = erase_block(ubi, old_fm->e[0]->pnum);
 			if (ret < 0) {
+				int i;
 				ubi_err("could not erase old anchor PEB");
+
+				for (i = 1; i < new_fm->used_blocks; i++)
+					ubi_wl_put_fm_peb(ubi, new_fm->e[i], 0);
 				goto err;
 			}
 
@@ -1461,14 +1483,14 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			new_fm->e[0]->pnum = tmp_e->pnum;
 			new_fm->e[0]->ec = tmp_e->ec;
 		}
-
-		/* return all other fastmap block to the wl system */
-		for (i = 1; i < old_fm->used_blocks; i++)
-			ubi_wl_put_fm_peb(ubi, old_fm->e[i],
-					  old_fm->to_be_tortured[i]);
 	} else {
 		if (!tmp_e) {
-			ubi_err("could not find an anchor PEB");
+			int i;
+			ubi_err("could not find any anchor PEB");
+
+			for (i = 1; i < new_fm->used_blocks; i++)
+				ubi_wl_put_fm_peb(ubi, new_fm->e[i], 0);
+
 			ret = -ENOSPC;
 			goto err;
 		}
-- 
1.7.6.5
