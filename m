Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqWjl-0006hP-SO
 for linux-mtd@lists.infradead.org; Sat, 31 May 2014 00:01:26 +0000
Date: Sat, 31 May 2014 02:01:07 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: dedekind1@gmail.com, hujianyang@huawei.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v5] ubifs: respect MS_SILENT mount flag
Message-ID: <20140531000054.GA12737@earthship.lan>
References: <20140530232039.GH3599@ld-irv-0074>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <20140530232039.GH3599@ld-irv-0074>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When attempting to mount a non-ubifs formatted volume, lots of error
messages (including a stack dump) are thrown to the kernel log even if
the MS_SILENT mount flag is set.
Fix this by introducing adding an additional state-variable in
struct ubifs_info and suppress error messages in ubifs_read_node if
MS_SILENT is set.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: added missing semi-colon and fixed a style issue
v4: enclose conditional error printing macro by do { } while (0)
v3: use state variable in ubifs_info instead of a function parameter

 fs/ubifs/io.c    | 16 +++++++++-------
 fs/ubifs/super.c |  4 ++++
 fs/ubifs/ubifs.h | 11 +++++++++++
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index e18b988..3205929 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -988,30 +988,32 @@ int ubifs_read_node(const struct ubifs_info *c, void =
*buf, int type, int len,
 		return err;
=20
 	if (type !=3D ch->node_type) {
-		ubifs_err("bad node type (%d but expected %d)",
+		ubifs_errc(c, "bad node type (%d but expected %d)",
 			  ch->node_type, type);
 		goto out;
 	}
=20
 	err =3D ubifs_check_node(c, buf, lnum, offs, 0, 0);
 	if (err) {
-		ubifs_err("expected node type %d", type);
+		ubifs_errc(c, "expected node type %d", type);
 		return err;
 	}
=20
 	l =3D le32_to_cpu(ch->len);
 	if (l !=3D len) {
-		ubifs_err("bad node length %d, expected %d", l, len);
+		ubifs_errc(c, "bad node length %d, expected %d", l, len);
 		goto out;
 	}
=20
 	return 0;
=20
 out:
-	ubifs_err("bad node at LEB %d:%d, LEB mapping status %d", lnum, offs,
-		  ubi_is_mapped(c->ubi, lnum));
-	ubifs_dump_node(c, buf);
-	dump_stack();
+	ubifs_errc(c, "bad node at LEB %d:%d, LEB mapping status %d", lnum,
+		  offs, ubi_is_mapped(c->ubi, lnum));
+	if (!c->probing) {
+		ubifs_dump_node(c, buf);
+		dump_stack();
+	}
 	return -EINVAL;
 }
=20
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a81c7b5..e88bbb6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1149,6 +1149,8 @@ static int mount_ubifs(struct ubifs_info *c)
 	size_t sz;
=20
 	c->ro_mount =3D !!(c->vfs_sb->s_flags & MS_RDONLY);
+	c->probing =3D !!(c->vfs_sb->s_flags & MS_SILENT);
+
 	err =3D init_constants_early(c);
 	if (err)
 		return err;
@@ -1214,6 +1216,8 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_free;
=20
+	c->probing =3D 0;
+
 	/*
 	 * Make sure the compressor which is set as default in the superblock
 	 * or overridden by mount options is actually compiled in.
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index e8c8cfe..145dc6d 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -52,6 +52,16 @@
 	pr_warn("UBIFS warning (pid %d): %s: " fmt "\n",            \
 		current->pid, __func__, ##__VA_ARGS__)
=20
+/*
+ * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
+ * object as an argument.
+ */
+#define ubifs_errc(c, fmt, ...)                                    \
+	do {                                                       \
+		if (!(c)->probing)                                 \
+			ubifs_err(fmt, ##__VA_ARGS__);             \
+	} while (0)
+
 /* UBIFS file system VFS magic number */
 #define UBIFS_SUPER_MAGIC 0x24051905
=20
@@ -1441,6 +1451,7 @@ struct ubifs_info {
 	unsigned int replaying:1;
 	unsigned int mounting:1;
 	unsigned int remounting_rw:1;
+	unsigned int probing:1;
 	struct list_head replay_list;
 	struct list_head replay_buds;
 	unsigned long long cs_sqnum;
--=20
1.9.3


--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTiRu2AAoJECBgbL4bcbCQKoAH/R6mIO6S+Xquva6/4zVJeUZ7
mz47Wv/4gBdJRabhoU//hca2qj5rfywtwWSakat5Sv4JiNpTmq2vu6e4e4YQlEfs
915+5VL9v73ZZgHDzrcvuxO+GZv/2fOQSghrsn4QDUh0LPZdXMaLKv3NyTQPgnDL
I1wUcvAiKOEJimOZU8wa61pE5H21zDLhqHEKu8yREEgMH01TUs/Y8EH+pnUplQWj
PCJ921OlsWwFU+2lmL6H8gYQHXmxhEHTdQqX9GhRux/9jC3nEwfQ49HmZBxwJxjE
VP9MbDS9jiBuEqlA2mriOkLMhf6pCSEAMxPgk3D/iSlzZhLK1h5k+1NpX0N5+Pc=
=z1vZ
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
