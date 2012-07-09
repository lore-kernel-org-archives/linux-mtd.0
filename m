Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoCvg-0003qK-Gs
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 12:19:06 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/7] UBI: Fastmap: Get rid of find_fastmap switch
Date: Mon,  9 Jul 2012 14:18:38 +0200
Message-Id: <1341836323-43916-3-git-send-email-richard@nod.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 106aa01..02505ff 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -817,8 +817,7 @@ out_unlock:
  * successfully handled and a negative error code in case of failure.
  */
 static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
-		    int pnum, int *vid, unsigned long long *sqnum,
-		    int find_fastmap)
+		    int pnum, int *vid, unsigned long long *sqnum)
 {
 	long long uninitialized_var(ec);
 	int err, bitflips = 0, vol_id = -1, ec_err = 0;
@@ -997,15 +996,18 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	if (sqnum)
 		*sqnum = be64_to_cpu(vidh->sqnum);
 
-	if (!find_fastmap &&
-	   (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID)) {
+	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
 		int lnum = be32_to_cpu(vidh->lnum);
 
 		/* Unsupported internal volume */
 		switch (vidh->compat) {
 		case UBI_COMPAT_DELETE:
-			ubi_msg("\"delete\" compatible internal volume %d:%d"
-				" found, will remove it", vol_id, lnum);
+			if (vol_id != UBI_FM_SB_VOLUME_ID
+			    && vol_id != UBI_FM_DATA_VOLUME_ID) {
+				ubi_msg("\"delete\" compatible internal volume"
+					" %d:%d found, will remove it",
+					vol_id, lnum);
+			}
 			err = add_to_list(ai, pnum, vol_id, lnum,
 					  ec, 1, &ai->erase);
 			if (err)
@@ -1247,7 +1249,7 @@ static int scan_all(struct ubi_device *ubi, struct ubi_attach_info *ai, int star
 		cond_resched();
 
 		dbg_gen("process PEB %d", pnum);
-		err = scan_peb(ubi, ai, pnum, NULL, NULL, 0);
+		err = scan_peb(ubi, ai, pnum, NULL, NULL);
 		if (err < 0)
 			goto out_vidh;
 	}
@@ -1332,7 +1334,7 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		cond_resched();
 
 		dbg_gen("process PEB %d", pnum);
-		err = scan_peb(ubi, ai, pnum, &vol_id, &sqnum, 1);
+		err = scan_peb(ubi, ai, pnum, &vol_id, &sqnum);
 		if (err < 0)
 			goto out_vidh;
 
-- 
1.7.6.5
