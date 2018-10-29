Received: from mail.klickitat.com ([54.70.207.208])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH3gu-0002PJ-Pg
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 09:20:33 +0000
From: Russell Senior <russell@personaltelco.net>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 zajec5@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] ubifs: Handle re-linking of inodes correctly while
 recovery
References: <20181028214407.20965-1-richard@nod.at>
Date: Mon, 29 Oct 2018 02:18:17 -0700
In-Reply-To: <20181028214407.20965-1-richard@nod.at> (Richard Weinberger's
 message of "Sun, 28 Oct 2018 22:44:07 +0100")
Message-ID: <87ftwpqffq.fsf@husum.klickitat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reported-by: Russell Senior <russell@personaltelco.net>
Reported-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
Tested-by: Russell Senior <russell@personaltelco.net>
---
Russel, Rafa=C5=82,

please give this patch another testing.
I'll also run it on different test systems before merging.

Thanks,
//richard
---
 fs/ubifs/replay.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 4844538eb926..65a780685b82 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -209,6 +209,34 @@ static int trun_remove_range(struct ubifs_info *c, str=
uct replay_entry *r)
 	return ubifs_tnc_remove_range(c, &min_key, &max_key);
 }
=20
+/**
+ * inode_relinked - check whether inode in question will be re-linked.
+ * @c: UBIFS file-system description object
+ * @rino: replay entry to test
+ *
+ * O_TMPFILE files can be re-linked, this means link count goes from 0 to =
1.
+ * This case needs special care, otherwise all references to the inode will
+ * be removed upon the first replay entry of an inode with link count 0
+ * is found.
+ */
+static bool inode_relinked(struct ubifs_info *c, struct replay_entry *rino)
+{
+	struct replay_entry *r =3D rino;
+
+	ubifs_assert(c, rino->deletion);
+	ubifs_assert(c, key_type(c, &rino->key) =3D=3D UBIFS_INO_KEY);
+
+	list_for_each_entry_from(r, &c->replay_list, list) {
+		if (key_inum(c, &r->key) =3D=3D key_inum(c, &rino->key) &&
+		    r->deletion =3D=3D 0) {
+			ubifs_assert(c, r->sqnum > rino->sqnum);
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * apply_replay_entry - apply a replay entry to the TNC.
  * @c: UBIFS file-system description object
@@ -236,6 +264,11 @@ static int apply_replay_entry(struct ubifs_info *c, st=
ruct replay_entry *r)
 			{
 				ino_t inum =3D key_inum(c, &r->key);
=20
+				if (inode_relinked(c, r)) {
+					err =3D 0;
+					break;
+				}
+
 				err =3D ubifs_tnc_remove_ino(c, inum);
 				break;
 			}
--=20
2.19.1



--=20
Russell Senior, President
russell@personaltelco.net
