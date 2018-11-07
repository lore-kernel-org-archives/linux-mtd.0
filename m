Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKVwk-0005Rs-34
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 22:05:11 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org, Russell Senior <russell@personaltelco.net>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH v2] ubifs: Handle re-linking of inodes correctly while recovery
Date: Wed,  7 Nov 2018 23:04:43 +0100
Message-Id: <20181107220443.29573-1-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS's recovery code strictly assumes that a deleted inode will never
come back, therefore it removes all data which belongs to that inode
as soon it faces an inode with link count 0 in the replay list.
Before O_TMPFILE this assumption was perfectly fine. With O_TMPFILE
it can lead to data loss upon a power-cut.

Consider a journal with entries like:
0: inode X (nlink =3D 0) /* O_TMPFILE was created */
1: data for inode X /* Someone writes to the temp file */
2: inode X (nlink =3D 0) /* inode was changed, xattr, chmod, =E2=80=A6 */
3: inode X (nlink =3D 1) /* inode was re-linked via linkat() */

Upon replay of entry #2 UBIFS will drop all data that belongs to inode X,
this will lead to an empty file after mounting.

As solution for this problem, scan the replay list for a re-link entry
before dropping data.

Fixes: 474b93704f32 ("ubifs: Implement O_TMPFILE")
Cc: stable@vger.kernel.org
Cc: Russell Senior <russell@personaltelco.net>
Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
Reported-by: Russell Senior <russell@personaltelco.net>
Reported-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/replay.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 75f961c4c044..cb1f23459553 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -212,6 +212,38 @@ static int trun_remove_range(struct ubifs_info *c, s=
truct replay_entry *r)
 	return ubifs_tnc_remove_range(c, &min_key, &max_key);
 }
=20
+/**
+ * inode_still_linked - check whether inode in question will be re-linke=
d.
+ * @c: UBIFS file-system description object
+ * @rino: replay entry to test
+ *
+ * O_TMPFILE files can be re-linked, this means link count goes from 0 t=
o 1.
+ * This case needs special care, otherwise all references to the inode w=
ill
+ * be removed upon the first replay entry of an inode with link count 0
+ * is found.
+ */
+static bool inode_still_linked(struct ubifs_info *c, struct replay_entry=
 *rino)
+{
+	struct replay_entry *r;
+
+	ubifs_assert(c, rino->deletion);
+	ubifs_assert(c, key_type(c, &rino->key) =3D=3D UBIFS_INO_KEY);
+
+	/*
+	 * Find the most recent entry for the inode behind @rino and check
+	 * whether it is a deletion.
+	 */
+	list_for_each_entry_reverse(r, &c->replay_list, list) {
+		ubifs_assert(c, r->sqnum >=3D rino->sqnum);
+		if (key_inum(c, &r->key) =3D=3D key_inum(c, &rino->key))
+			return r->deletion =3D=3D 0;
+
+	}
+
+	ubifs_assert(c, 0);
+	return false;
+}
+
 /**
  * apply_replay_entry - apply a replay entry to the TNC.
  * @c: UBIFS file-system description object
@@ -239,6 +271,11 @@ static int apply_replay_entry(struct ubifs_info *c, =
struct replay_entry *r)
 			{
 				ino_t inum =3D key_inum(c, &r->key);
=20
+				if (inode_still_linked(c, r)) {
+					err =3D 0;
+					break;
+				}
+
 				err =3D ubifs_tnc_remove_ino(c, inum);
 				break;
 			}
--=20
2.19.1
