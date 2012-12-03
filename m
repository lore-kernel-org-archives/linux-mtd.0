Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tfc9O-0007qa-IX
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 19:58:00 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/2] ubi: Dont call ubi_self_check_all_ff() in __wl_get_peb()
Date: Mon,  3 Dec 2012 20:57:47 +0100
Message-Id: <1354564667-9549-3-git-send-email-richard@nod.at>
In-Reply-To: <1354564667-9549-1-git-send-email-richard@nod.at>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 zsadecki@itwatchdogs.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As ubi_self_check_all_ff() might sleep we are not allowed
to call it from atomic context.
For now we call it only from ubi_wl_get_peb().
There are some code paths where it would also make sense,
but these paths are currently atomic and only enabled
when fastmap is used.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 1f9f5f7..2144f61 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -498,7 +498,7 @@ out:
  * @ubi: UBI device description object
  *
  * This function returns a physical eraseblock in case of success and a
- * negative error code in case of failure. Might sleep.
+ * negative error code in case of failure.
  */
 static int __wl_get_peb(struct ubi_device *ubi)
 {
@@ -540,13 +540,6 @@ retry:
 	 * ubi_wl_get_peb() after removing e from the pool. */
 	prot_queue_add(ubi, e);
 #endif
-	err = ubi_self_check_all_ff(ubi, e->pnum, ubi->vid_hdr_aloffset,
-				    ubi->peb_size - ubi->vid_hdr_aloffset);
-	if (err) {
-		ubi_err("new PEB %d does not contain all 0xFF bytes", e->pnum);
-		return err;
-	}
-
 	return e->pnum;
 }
 
@@ -690,12 +683,19 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 
 int ubi_wl_get_peb(struct ubi_device *ubi)
 {
-	int peb;
+	int peb, err;
 
 	spin_lock(&ubi->wl_lock);
 	peb = __wl_get_peb(ubi);
 	spin_unlock(&ubi->wl_lock);
 
+	err = ubi_self_check_all_ff(ubi, peb, ubi->vid_hdr_aloffset,
+				    ubi->peb_size - ubi->vid_hdr_aloffset);
+	if (err) {
+		ubi_err("new PEB %d does not contain all 0xFF bytes", peb);
+		return err;
+	}
+
 	return peb;
 }
 #endif
-- 
1.8.0
