Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Us8eG-0003RX-RO
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 09:37:53 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: RE: xattr patches from feb?
Date: Thu, 27 Jun 2013 09:37:18 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCA8176@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCA20D3@post.tritech.se>,
 <51C837D9.5060007@pengutronix.de>
In-Reply-To: <51C837D9.5060007@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marc,=0A=
=0A=
Thanks for your response! it was held captive by the spam filter for a whil=
e (my fault) so I didn't notice it.=0A=
I know about customers and changing priorities ;)=0A=
=0A=
I havn't received any patches from you yet (also a mail program issue?).=0A=
I have only adopted 1/5 "xattr: protect ui_size and data_len by ui_mutex" a=
nd 2/5 "fix couple bugs in=0A=
UBIFS extended attribute len" (appended below).=0A=
Those two seem to work well (testing still in progress) and should not be a=
ffected by the locking issue?=0A=
=0A=
BR // Mats=0A=
=0A=
---------------------------=0A=
diff -pruN a/fs/ubifs/journal.c b/fs/ubifs/journal.c=0A=
--- a/fs/ubifs/journal.c	2013-06-24 15:06:39.213689332 +0200=0A=
+++ b/fs/ubifs/journal.c	2013-06-24 15:26:36.842825120 +0200=0A=
@@ -553,7 +553,8 @@ int ubifs_jnl_update(struct ubifs_info *=0A=
 =0A=
 	dbg_jnl("ino %lu, dent '%.*s', data len %d in dir ino %lu",=0A=
 		inode->i_ino, nm->len, nm->name, ui->data_len, dir->i_ino);=0A=
-	ubifs_assert(dir_ui->data_len =3D=3D 0);=0A=
+	if (!xent)=0A=
+		ubifs_assert(dir_ui->data_len =3D=3D 0);=0A=
 	ubifs_assert(mutex_is_locked(&dir_ui->ui_mutex));=0A=
 =0A=
 	dlen =3D UBIFS_DENT_NODE_SZ + nm->len + 1;=0A=
@@ -573,6 +574,8 @@ int ubifs_jnl_update(struct ubifs_info *=0A=
 	aligned_dlen =3D ALIGN(dlen, 8);=0A=
 	aligned_ilen =3D ALIGN(ilen, 8);=0A=
 	len =3D aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ;=0A=
+	len =3D aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ +=0A=
+	      dir_ui->data_len;=0A=
 	dent =3D kmalloc(len, GFP_NOFS);=0A=
 	if (!dent)=0A=
 		return -ENOMEM;=0A=
@@ -649,7 +652,8 @@ int ubifs_jnl_update(struct ubifs_info *=0A=
 =0A=
 	ino_key_init(c, &ino_key, dir->i_ino);=0A=
 	ino_offs +=3D aligned_ilen;=0A=
-	err =3D ubifs_tnc_add(c, &ino_key, lnum, ino_offs, UBIFS_INO_NODE_SZ);=0A=
+	err =3D ubifs_tnc_add(c, &ino_key, lnum, ino_offs,=0A=
+			    UBIFS_INO_NODE_SZ + dir_ui->data_len);=0A=
 	if (err)=0A=
 		goto out_ro;=0A=
 =0A=
diff -pruN a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c=0A=
--- a/fs/ubifs/xattr.c	2013-06-24 15:06:39.233689282 +0200=0A=
+++ b/fs/ubifs/xattr.c	2013-06-24 15:12:12.196863493 +0200=0A=
@@ -143,10 +143,10 @@ static int create_xattr(struct ubifs_inf=0A=
 		err =3D -ENOMEM;=0A=
 		goto out_free;=0A=
 	}=0A=
-	inode->i_size =3D ui->ui_size =3D size;=0A=
-	ui->data_len =3D size;=0A=
 =0A=
 	mutex_lock(&host_ui->ui_mutex);=0A=
+	inode->i_size =3D ui->ui_size =3D size;=0A=
+	ui->data_len =3D size;=0A=
 	host->i_ctime =3D ubifs_current_time(host);=0A=
 	host_ui->xattr_cnt +=3D 1;=0A=
 	host_ui->xattr_size +=3D CALC_DENT_SIZE(nm->len);=0A=
@@ -208,10 +208,10 @@ static int change_xattr(struct ubifs_inf=0A=
 		err =3D -ENOMEM;=0A=
 		goto out_free;=0A=
 	}=0A=
-	inode->i_size =3D ui->ui_size =3D size;=0A=
-	ui->data_len =3D size;=0A=
 =0A=
 	mutex_lock(&host_ui->ui_mutex);=0A=
+	inode->i_size =3D ui->ui_size =3D size;=0A=
+	ui->data_len =3D size;=0A=
 	host->i_ctime =3D ubifs_current_time(host);=0A=
 	host_ui->xattr_size -=3D CALC_XATTR_BYTES(ui->data_len);=0A=
 	host_ui->xattr_size +=3D CALC_XATTR_BYTES(size);=0A=
---------------------------=0A=
