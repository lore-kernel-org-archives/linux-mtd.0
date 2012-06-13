Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel2B-0007Ab-Bk
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:47 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/21] UBI: Fastmap: Fix NULL-pointer bug
Date: Wed, 13 Jun 2012 12:42:12 +0200
Message-Id: <1339584138-69914-16-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/wl.c      |    3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 29e6d69..65cb3f1 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1342,8 +1342,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				goto err;
 			}
 
-			new_fm->e[0]->pnum = old_fm->e[0]->pnum;
-			new_fm->e[0]->ec = old_fm->e[0]->ec;
+			tmp_e->pnum = old_fm->e[0]->pnum;
+			tmp_e->ec = old_fm->e[0]->ec;
 		} else {
 			/* we've got a new early PEB, return the old one */
 			ubi_wl_put_fm_peb(ubi, old_fm->e[0], 0);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index def6a88..004ce89 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1251,9 +1251,6 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 		 * protected physical eraseblocks.
 		 */
 		serve_prot_queue(ubi);
-
-		/* And take care about wear-leveling */
-		err = ensure_wear_leveling(ubi);
 		return err;
 	}
 
-- 
1.7.6.5
