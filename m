Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1f3D-0008IQ-GB
 for linux-mtd@lists.infradead.org; Sun, 16 Sep 2018 21:57:57 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, koen.vandeputte@ncentric.com,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org
Subject: [PATCH] Revert "ubifs: xattr: Don't operate on deleted inodes"
Date: Sun, 16 Sep 2018 23:57:35 +0200
Message-Id: <20180916215735.31393-1-richard@nod.at>
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

This reverts commit 11a6fc3dc743e22fb50f2196ec55bee5140d3c52.
UBIFS wants to assert that xattr operations are only issued on files
with positive link count. The said patch made this operations return
-ENOENT for unlinked files such that the asserts will no longer trigger.
This was wrong since xattr operations are perfectly fine on unlinked
files.
Instead the assertions need to be fixed/removed.

Cc: <stable@vger.kernel.org>
Fixes: 11a6fc3dc743 ("ubifs: xattr: Don't operate on deleted inodes")
Reported-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 61afdfee4b28..f5ad1ede7990 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -152,12 +152,6 @@ static int create_xattr(struct ubifs_info *c, struct=
 inode *host,
 	ui->data_len =3D size;
=20
 	mutex_lock(&host_ui->ui_mutex);
-
-	if (!host->i_nlink) {
-		err =3D -ENOENT;
-		goto out_noent;
-	}
-
 	host->i_ctime =3D current_time(host);
 	host_ui->xattr_cnt +=3D 1;
 	host_ui->xattr_size +=3D CALC_DENT_SIZE(fname_len(nm));
@@ -190,7 +184,6 @@ static int create_xattr(struct ubifs_info *c, struct =
inode *host,
 	host_ui->xattr_size -=3D CALC_XATTR_BYTES(size);
 	host_ui->xattr_names -=3D fname_len(nm);
 	host_ui->flags &=3D ~UBIFS_CRYPT_FL;
-out_noent:
 	mutex_unlock(&host_ui->ui_mutex);
 out_free:
 	make_bad_inode(inode);
@@ -242,12 +235,6 @@ static int change_xattr(struct ubifs_info *c, struct=
 inode *host,
 	mutex_unlock(&ui->ui_mutex);
=20
 	mutex_lock(&host_ui->ui_mutex);
-
-	if (!host->i_nlink) {
-		err =3D -ENOENT;
-		goto out_noent;
-	}
-
 	host->i_ctime =3D current_time(host);
 	host_ui->xattr_size -=3D CALC_XATTR_BYTES(old_size);
 	host_ui->xattr_size +=3D CALC_XATTR_BYTES(size);
@@ -269,7 +256,6 @@ static int change_xattr(struct ubifs_info *c, struct =
inode *host,
 out_cancel:
 	host_ui->xattr_size -=3D CALC_XATTR_BYTES(size);
 	host_ui->xattr_size +=3D CALC_XATTR_BYTES(old_size);
-out_noent:
 	mutex_unlock(&host_ui->ui_mutex);
 	make_bad_inode(inode);
 out_free:
@@ -496,12 +482,6 @@ static int remove_xattr(struct ubifs_info *c, struct=
 inode *host,
 		return err;
=20
 	mutex_lock(&host_ui->ui_mutex);
-
-	if (!host->i_nlink) {
-		err =3D -ENOENT;
-		goto out_noent;
-	}
-
 	host->i_ctime =3D current_time(host);
 	host_ui->xattr_cnt -=3D 1;
 	host_ui->xattr_size -=3D CALC_DENT_SIZE(fname_len(nm));
@@ -521,7 +501,6 @@ static int remove_xattr(struct ubifs_info *c, struct =
inode *host,
 	host_ui->xattr_size +=3D CALC_DENT_SIZE(fname_len(nm));
 	host_ui->xattr_size +=3D CALC_XATTR_BYTES(ui->data_len);
 	host_ui->xattr_names +=3D fname_len(nm);
-out_noent:
 	mutex_unlock(&host_ui->ui_mutex);
 	ubifs_release_budget(c, &req);
 	make_bad_inode(inode);
@@ -561,9 +540,6 @@ static int ubifs_xattr_remove(struct inode *host, con=
st char *name)
=20
 	ubifs_assert(c, inode_is_locked(host));
=20
-	if (!host->i_nlink)
-		return -ENOENT;
-
 	if (fname_len(&nm) > UBIFS_MAX_NLEN)
 		return -ENAMETOOLONG;
=20
--=20
2.19.0
