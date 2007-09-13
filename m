Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVmea-0001bp-UG
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 07:14:39 -0400
Subject: Re: UBI : Atomic change LEB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <6b5362aa0709130102o5042412fgab0e0558edc895c0@mail.gmail.com>
References: <6b5362aa0709130102o5042412fgab0e0558edc895c0@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 13 Sep 2007 14:13:52 +0300
Message-Id: <1189682032.14370.117.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2007-09-13 at 13:32 +0530, Brijesh Singh wrote:
> I think there is a problem in atomic change LEB.
> I was trying to think how ubi will behave when device is full.
> Suppose device is full.And
> LEBn maps to pebn
>            i.e. Ln->pn
> If we used automic_change_leb, wear-levelling has no free blocks as
> all lebs are mapped to pebs.And no change in LEB is possible to any
> LEB.
> I think  we will need atleast one extra block at any instance of time
> to avoid this situation.
> This is similar to block movement situation where we need extra block
> for block movement.

yeah, you are right, thank you! The below patch should fix the problem.
Comments?

>From f02c2e8a10838d80c763f6ccd65398cccd3cfac0 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 13 Sep 2007 14:28:14 +0300
Subject: [PATCH] UBI: fix atomic LEB change problems

When the UBI device is nearly full, i.e. all LEBs are mapped, we have
only one spare LEB left - the one we reserved for WL purposes. Well,
I do not count the LEBs which were reserved for bad PEB handling -
suppose NOR flash for simplicity. If an "atomic LEB change operation"
is run, and the WL unit is moving a LEB, we have no spare LEBs to
finish the operation and fail, which is not good. Moreover, if there
are 2 or more simultanious "atomic LEB change" requests, only one of
them has chances to succeed, the other will fail with -ENOSPC. Not
good either.

This patch does 2 things:
1. Reserves one PEB for the "atomic LEB change" operation.
2. Serealize the operations so that only on of them may run
   at a time (by means of a mutex).

Pointed-to-by: Brijesh Singh <brijesh.s.singh@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/eba.c |   48 +++++++++++++++++++++++++++++----------------=
---
 drivers/mtd/ubi/ubi.h |    6 ++++--
 2 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 81bb6a3..7b7add6 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -46,6 +46,9 @@
 #include <linux/err.h>
 #include "ubi.h"
=20
+/* Number of physical eraseblocks reserved for atomic LEB change operation=
 */
+#define EBA_RESERVED_PEBS 1
+
 /**
  * struct ltree_entry - an entry in the lock tree.
  * @rb: links RB-tree nodes
@@ -827,6 +830,9 @@ write_error:
  * data, which has to be aligned. This function guarantees that in case of=
 an
  * unclean reboot the old contents is preserved. Returns zero in case of
  * success and a negative error code in case of failure.
+ *
+ * UBI reserves one LEB for the "atomic LEB change" operation, so only one
+ * LEB change may be done at a time. This is ensured by @ubi->alc_mutex.
  */
 int ubi_eba_atomic_leb_change(struct ubi_device *ubi, int vol_id, int lnum=
,
 			      const void *buf, int len, int dtype)
@@ -843,11 +849,10 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi,=
 int vol_id, int lnum,
 	if (!vid_hdr)
 		return -ENOMEM;
=20
+	mutex_lock(&ubi->alc_mutex);
 	err =3D leb_write_lock(ubi, vol_id, lnum);
-	if (err) {
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
-	}
+	if (err)
+		goto out_mutex;
=20
 	vid_hdr->sqnum =3D cpu_to_be64(next_sqnum(ubi));
 	vid_hdr->vol_id =3D cpu_to_be32(vol_id);
@@ -864,9 +869,8 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, i=
nt vol_id, int lnum,
 retry:
 	pnum =3D ubi_wl_get_peb(ubi, dtype);
 	if (pnum < 0) {
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		leb_write_unlock(ubi, vol_id, lnum);
-		return pnum;
+		err =3D pnum;
+		goto out_leb_unlock;
 	}
=20
 	dbg_eba("change LEB %d:%d, PEB %d, write VID hdr to PEB %d",
@@ -888,17 +892,18 @@ retry:
=20
 	if (vol->eba_tbl[lnum] >=3D 0) {
 		err =3D ubi_wl_put_peb(ubi, vol->eba_tbl[lnum], 1);
-		if (err) {
-			ubi_free_vid_hdr(ubi, vid_hdr);
-			leb_write_unlock(ubi, vol_id, lnum);
-			return err;
-		}
+		if (err)
+			goto out_leb_unlock;
 	}
=20
 	vol->eba_tbl[lnum] =3D pnum;
+
+out_leb_unlock:
 	leb_write_unlock(ubi, vol_id, lnum);
+out_mutex:
+	mutex_unlock(&ubi->alc_mutex);
 	ubi_free_vid_hdr(ubi, vid_hdr);
-	return 0;
+	return err;
=20
 write_error:
 	if (err !=3D -EIO || !ubi->bad_allowed) {
@@ -908,17 +913,13 @@ write_error:
 		 * mode just in case.
 		 */
 		ubi_ro_mode(ubi);
-		leb_write_unlock(ubi, vol_id, lnum);
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
+		goto out_leb_unlock;
 	}
=20
 	err =3D ubi_wl_put_peb(ubi, pnum, 1);
 	if (err || ++tries > UBI_IO_RETRIES) {
 		ubi_ro_mode(ubi);
-		leb_write_unlock(ubi, vol_id, lnum);
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
+		goto out_leb_unlock;
 	}
=20
 	vid_hdr->sqnum =3D cpu_to_be64(next_sqnum(ubi));
@@ -1122,6 +1123,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct =
ubi_scan_info *si)
 	dbg_eba("initialize EBA unit");
=20
 	spin_lock_init(&ubi->ltree_lock);
+	mutex_init(&ubi->alc_mutex);
 	ubi->ltree =3D RB_ROOT;
=20
 	if (ubi_devices_cnt =3D=3D 0) {
@@ -1183,6 +1185,14 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct=
 ubi_scan_info *si)
 		ubi->rsvd_pebs  +=3D ubi->beb_rsvd_pebs;
 	}
=20
+	if (ubi->avail_pebs < EBA_RESERVED_PEBS) {
+		ubi_err("no enough physical eraseblocks (%d, need %d)",
+			ubi->avail_pebs, EBA_RESERVED_PEBS);
+		goto out_free;
+	}
+	ubi->avail_pebs -=3D EBA_RESERVED_PEBS;
+	ubi->rsvd_pebs +=3D EBA_RESERVED_PEBS;
+
 	dbg_eba("EBA unit is initialized");
 	return 0;
=20
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index cc01011..5e941a6 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -221,14 +221,15 @@ struct ubi_wl_entry;
  * @vtbl_slots: how many slots are available in the volume table
  * @vtbl_size: size of the volume table in bytes
  * @vtbl: in-RAM volume table copy
+ * @vtbl_mutex: protects on-flash volume table
  *
  * @max_ec: current highest erase counter value
  * @mean_ec: current mean erase counter value
  *
- * global_sqnum: global sequence number
+ * @global_sqnum: global sequence number
  * @ltree_lock: protects the lock tree and @global_sqnum
  * @ltree: the lock tree
- * @vtbl_mutex: protects on-flash volume table
+ * @alc_mutex: serializes "atomic LEB change" operations
  *
  * @used: RB-tree of used physical eraseblocks
  * @free: RB-tree of free physical eraseblocks
@@ -308,6 +309,7 @@ struct ubi_device {
 	unsigned long long global_sqnum;
 	spinlock_t ltree_lock;
 	struct rb_root ltree;
+	struct mutex alc_mutex;
=20
 	/* Wear-leveling unit's stuff */
 	struct rb_root used;
--=20
1.5.0.6

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
