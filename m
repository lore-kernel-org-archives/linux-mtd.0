Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSek-0000nD-At
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:47:19 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 31/35] UBI: Fastmap: Wire up WL accessor functions
Date: Wed, 29 Oct 2014 13:45:54 +0100
Message-Id: <1414586758-9972-32-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-1-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the new WL accessor functions in fastmap.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 9a8cf45..344f1db 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1096,8 +1096,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	struct ubi_fm_ec *fec;
 	struct ubi_fm_volhdr *fvh;
 	struct ubi_fm_eba *feba;
-	struct rb_node *node;
-	struct ubi_wl_entry *wl_e;
+	struct ubi_wl_entry *wl_e, *tmp_wl_e;
 	struct ubi_volume *vol;
 	struct ubi_vid_hdr *avhdr, *dvhdr;
 	struct ubi_work *ubi_wrk;
@@ -1172,8 +1171,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		set_seen(ubi, ubi->fm_wl_pool.pebs[i], seen_pebs);
 	}
 
-	for (node = rb_first(&ubi->free); node; node = rb_next(node)) {
-		wl_e = rb_entry(node, struct ubi_wl_entry, u.rb);
+	ubi_for_each_free_peb(ubi, wl_e, tmp_wl_e) {
 		fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
 
 		fec->pnum = cpu_to_be32(wl_e->pnum);
@@ -1186,8 +1184,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	}
 	fmh->free_peb_count = cpu_to_be32(free_peb_count);
 
-	for (node = rb_first(&ubi->used); node; node = rb_next(node)) {
-		wl_e = rb_entry(node, struct ubi_wl_entry, u.rb);
+	ubi_for_each_used_peb(ubi, wl_e, tmp_wl_e) {
 		fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
 
 		fec->pnum = cpu_to_be32(wl_e->pnum);
@@ -1199,23 +1196,20 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		ubi_assert(fm_pos <= ubi->fm_size);
 	}
 
-	for (i = 0; i < UBI_PROT_QUEUE_LEN; i++) {
-		list_for_each_entry(wl_e, &ubi->pq[i], u.list) {
-			fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
+	ubi_for_each_protected_peb(ubi, i, wl_e) {
+		fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
 
-			fec->pnum = cpu_to_be32(wl_e->pnum);
-			set_seen(ubi, wl_e->pnum, seen_pebs);
-			fec->ec = cpu_to_be32(wl_e->ec);
+		fec->pnum = cpu_to_be32(wl_e->pnum);
+		set_seen(ubi, wl_e->pnum, seen_pebs);
+		fec->ec = cpu_to_be32(wl_e->ec);
 
-			used_peb_count++;
-			fm_pos += sizeof(*fec);
-			ubi_assert(fm_pos <= ubi->fm_size);
-		}
+		used_peb_count++;
+		fm_pos += sizeof(*fec);
+		ubi_assert(fm_pos <= ubi->fm_size);
 	}
 	fmh->used_peb_count = cpu_to_be32(used_peb_count);
 
-	for (node = rb_first(&ubi->scrub); node; node = rb_next(node)) {
-		wl_e = rb_entry(node, struct ubi_wl_entry, u.rb);
+	ubi_for_each_scrub_peb(ubi, wl_e, tmp_wl_e) {
 		fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
 
 		fec->pnum = cpu_to_be32(wl_e->pnum);
-- 
1.8.4.5
