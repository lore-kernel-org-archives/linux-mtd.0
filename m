Received: from mtagate5.de.ibm.com ([195.212.29.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HVp1p-0006ly-Lc
	for linux-mtd@lists.infradead.org; Mon, 26 Mar 2007 14:14:30 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.8/8.13.8) with ESMTP id l2QDAJ3a059124
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 13:10:19 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l2QDAJWH1994848
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 15:10:19 +0200
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l2QDAJqF030605
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 15:10:19 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem.Bityutskiy@nokia.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] UBI: simplify wl.c
Date: Mon, 26 Mar 2007 15:10:10 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703261510.10287.alexs@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch simplifies the wear leveling a little bit by reusing the
find_wl_entry function and removing some duplicated code.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/wl.c |   69 +++++++++++++++------------------------------------
 1 files changed, 21 insertions(+), 48 deletions(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/wl.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/wl.c
@@ -492,51 +492,6 @@ static struct ubi_wl_entry *find_wl_entr
 }
 
 /**
- * pick_unknown - select an "unknown" physical eraseblock.
- * @ubi: UBI device description object
- *
- * This function returns a physical eraseblock for "unknown" data. The wl->lock
- * must be locked. The @wl->free list must not be empty.
- */
-static struct ubi_wl_entry *pick_unknown(struct ubi_device *ubi)
-{
-	int medium_ec;
-	struct rb_node *p;
-	struct ubi_wl_entry *first, *last, *e;
-
-	/*
-	 * For unknown data we are trying to pick a physical eraseblock with
-	 * medium erase counter. But we by no means can pick a physical
-	 * eraseblock with erase counter greater or equivalent then the the
-	 * lowest erase counter plus %WL_FREE_MAX_DIFF.
-	 */
-
-	first = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry, rb);
-	last = rb_entry(rb_last(&ubi->free), struct ubi_wl_entry, rb);
-
-	if (last->ec - first->ec < WL_FREE_MAX_DIFF)
-		return rb_entry(ubi->free.rb_node, struct ubi_wl_entry, rb);
-
-	medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
-	e = first;
-
-	p = ubi->free.rb_node;
-	while (p) {
-		struct ubi_wl_entry *e1;
-
-		e1 = rb_entry(p, struct ubi_wl_entry, rb);
-		if (e1->ec >= medium_ec)
-			p = p->rb_left;
-		else {
-			p = p->rb_right;
-			e = e1;
-		}
-	}
-
-	return e;
-}
-
-/**
  * ubi_wl_get_peb - get a physical eraseblock.
  * @ubi: UBI device description object
  * @dtype: type of data which will be stored in this physical eraseblock
@@ -546,8 +501,8 @@ static struct ubi_wl_entry *pick_unknown
  */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
 {
-	int err, protect;
-	struct ubi_wl_entry *e;
+	int err, protect, medium_ec;
+	struct ubi_wl_entry *e, *first, *last;
 	struct ubi_wl_prot_entry *pe;
 
 	ubi_assert(dtype == UBI_DATA_LONGTERM || dtype == UBI_DATA_SHORTTERM ||
@@ -589,7 +544,25 @@ retry:
 			protect = LT_PROTECTION;
 			break;
 		case UBI_DATA_UNKNOWN:
-			e = pick_unknown(ubi);
+			/*
+			 * For unknown data we pick a physical eraseblock with
+			 * medium erase counter. But we by no means can pick a
+			 * physical eraseblock with erase counter greater or
+			 * equivalent than the lowest erase counter plus
+			 * %WL_FREE_MAX_DIFF.
+			 */
+			first = rb_entry(rb_first(&ubi->free),
+					 struct ubi_wl_entry, rb);
+			last = rb_entry(rb_last(&ubi->free),
+					struct ubi_wl_entry, rb);
+
+			if (last->ec - first->ec < WL_FREE_MAX_DIFF)
+				e = rb_entry(ubi->free.rb_node,
+						struct ubi_wl_entry, rb);
+			else {
+				medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
+				e = find_wl_entry(&ubi->free, medium_ec);
+			}
 			protect = U_PROTECTION;
 			break;
 		case UBI_DATA_SHORTTERM:
