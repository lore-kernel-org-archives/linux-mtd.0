Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKW7q-0003xA-R0
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 22:16:39 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, thomas.roeder@harman.com,
 juergen.lachmann@harman.com, Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/2] ubi: Introduce in_pq()
Date: Wed,  7 Nov 2018 23:16:18 +0100
Message-Id: <20181107221619.32498-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This function works like in_wl_tree() but checks whether an ubi_wl_entry
is currently in the protection queue.
We need this function to query the current state of an ubi_wl_entry.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 6f2ac865ff05..ca1b31385eb5 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -277,6 +277,27 @@ static int in_wl_tree(struct ubi_wl_entry *e, struct=
 rb_root *root)
 	return 0;
 }
=20
+/**
+ * in_pq - check if a wear-leveling entry is present in the protection q=
ueue.
+ * @ubi: UBI device description object
+ * @e: the wear-leveling entry to check
+ *
+ * This function returns non-zero if @e is in the protection queue and z=
ero
+ * if it is not.
+ */
+static inline int in_pq(const struct ubi_device *ubi, struct ubi_wl_entr=
y *e)
+{
+	struct ubi_wl_entry *p;
+	int i;
+
+	for (i =3D 0; i < UBI_PROT_QUEUE_LEN; ++i)
+		list_for_each_entry(p, &ubi->pq[i], u.list)
+			if (p =3D=3D e)
+				return 1;
+
+	return 0;
+}
+
 /**
  * prot_queue_add - add physical eraseblock to the protection queue.
  * @ubi: UBI device description object
@@ -1848,16 +1869,11 @@ static int self_check_in_wl_tree(const struct ubi=
_device *ubi,
 static int self_check_in_pq(const struct ubi_device *ubi,
 			    struct ubi_wl_entry *e)
 {
-	struct ubi_wl_entry *p;
-	int i;
-
 	if (!ubi_dbg_chk_gen(ubi))
 		return 0;
=20
-	for (i =3D 0; i < UBI_PROT_QUEUE_LEN; ++i)
-		list_for_each_entry(p, &ubi->pq[i], u.list)
-			if (p =3D=3D e)
-				return 0;
+	if (in_pq(ubi, e))
+		return 0;
=20
 	ubi_err(ubi, "self-check failed for PEB %d, EC %d, Protect queue",
 		e->pnum, e->ec);
--=20
2.19.1
