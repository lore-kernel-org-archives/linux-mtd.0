Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SP-0004Xh-Ls
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:41:26 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 40/42] mkfs.ubifs: Enable support for building without crypto
Date: Thu, 18 Oct 2018 16:37:16 +0200
Message-Id: <20181018143718.26298-41-richard@nod.at>
In-Reply-To: <20181018143718.26298-1-richard@nod.at>
References: <20181018143718.26298-1-richard@nod.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 Makefile.am                         |  4 ++
 configure.ac                        | 27 ++++++++++--
 ubifs-utils/Makemodule.am           | 10 +++--
 ubifs-utils/mkfs.ubifs/crypto.h     | 11 +++--
 ubifs-utils/mkfs.ubifs/fscrypt.h    | 65 +++++++++++++++++++++++++----
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 56 ++++++++++++++++++++++---
 6 files changed, 148 insertions(+), 25 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 391edef4ee31..1bc4684b191d 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -14,6 +14,10 @@ if WITH_SELINUX
 AM_CPPFLAGS +=3D -DWITH_SELINUX
 endif
=20
+if WITH_CRYPTO
+AM_CPPFLAGS +=3D -DWITH_CRYPTO
+endif
+
 sbin_PROGRAMS =3D
 sbin_SCRIPTS =3D
 check_PROGRAMS =3D
diff --git a/configure.ac b/configure.ac
index 346fcbd26328..d5abb14263b5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -69,7 +69,7 @@ need_lzo=3D"no"
 need_xattr=3D"no"
 need_cmocka=3D"no"
 need_selinux=3D"no"
-
+need_openssl=3D"no"
=20
 AM_COND_IF([UNIT_TESTS], [
 	need_cmocka=3D"yes"
@@ -115,8 +115,6 @@ AC_ARG_ENABLE([lsmtd],
 	esac],
 	[AM_CONDITIONAL([BUILD_LSMTD], [true])])
=20
-AC_CHECK_HEADER(openssl/rand.h)
-
 AC_ARG_WITH([jffs],
 	[AS_HELP_STRING([--without-jffs], [Disable jffsX utilities])],
 	[case "${withval}" in
@@ -140,6 +138,7 @@ AM_COND_IF([BUILD_UBIFS], [
 	need_xattr=3D"yes"
 	need_zlib=3D"yes"
 	need_lzo=3D"yes"
+	need_openssl=3D"yes"
 ])
=20
 AM_COND_IF([BUILD_JFFSX], [
@@ -174,6 +173,15 @@ AC_ARG_WITH([selinux],
 	*) AC_MSG_ERROR([bad value ${withval} for --with-selinux]) ;;
 	esac])
=20
+AC_ARG_WITH([crypto],
+	[AS_HELP_STRING([--without-crypto],
+		[Disable support for UBIFS crypto features])],
+	[case "${withval}" in
+	yes) ;;
+	no) need_openssl=3D"no";;
+	*) AC_MSG_ERROR([bad value ${withval} for --without-crypto]) ;;
+	esac])
+
 ##### search for dependencies #####
=20
 clock_gettime_missing=3D"no"
@@ -184,6 +192,7 @@ lzo_missing=3D"no"
 xattr_missing=3D"no"
 cmocka_missing=3D"no"
 selinux_missing=3D"no"
+openssl_missing=3D"no"
=20
 if test "x$need_zlib" =3D "xyes"; then
 	PKG_CHECK_MODULES(ZLIB, [zlib], [], [zlib_missing=3D"yes"])
@@ -226,6 +235,11 @@ if test "x$need_selinux" =3D "xyes"; then
 	AC_CHECK_HEADERS([selinux/label.h], [], [selinux_missing=3D"yes"])
 fi
=20
+if test "x$need_openssl" =3D "xyes"; then
+	AC_CHECK_HEADER(openssl/rand.h)
+	PKG_CHECK_MODULES(OPENSSL, [openssl], [], [openssl_missing=3D"yes"])
+fi
+
 if test "x$need_cmocka" =3D "xyes"; then
 	PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing=3D"yes"])
 fi
@@ -281,6 +295,12 @@ if test "x$selinux_missing" =3D "xyes"; then
 	need_selinux=3D"no"
 fi
=20
+if test "x$openssl_missing" =3D "xyes"; then
+	AC_MSG_WARN([cannot find headers for OpenSSL library])
+	AC_MSG_WARN([disabling OpenSSL support])
+	need_openssl=3D"no"
+fi
+
 if test "x$cmocka_missing" =3D "xyes"; then
 	AC_MSG_WARN([cannot find CMocka library required for unit tests])
 	AC_MSG_NOTICE([unit tests can optionally be disabled])
@@ -296,6 +316,7 @@ fi
 AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" !=3D "xyes"])
 AM_CONDITIONAL([WITHOUT_XATTR], [test "x$need_xattr" !=3D "xyes"])
 AM_CONDITIONAL([WITH_SELINUX], [test "x$need_selinux" =3D=3D "xyes"])
+AM_CONDITIONAL([WITH_CRYPTO], [test "x$need_openssl" =3D=3D "xyes"])
=20
 AC_CHECK_SIZEOF([off_t])
 AC_CHECK_SIZEOF([loff_t])
diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 5905a2badbb6..b8e4075c9d2a 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -10,15 +10,19 @@ mkfs_ubifs_SOURCES =3D \
 	ubifs-utils/mkfs.ubifs/crc16.c \
 	ubifs-utils/mkfs.ubifs/lpt.c \
 	ubifs-utils/mkfs.ubifs/compr.c \
-	ubifs-utils/mkfs.ubifs/crypto.c \
-	ubifs-utils/mkfs.ubifs/fscrypt.c \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable.c \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c \
 	ubifs-utils/mkfs.ubifs/devtable.c
-mkfs_ubifs_LDADD =3D libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_L=
IBS) $(LIBSELINUX_LIBS) -lm -lssl -lcrypto
+
+if WITH_CRYPTO
+mkfs_ubifs_SOURCES +=3D ubifs-utils/mkfs.ubifs/crypto.c \
+		ubifs-utils/mkfs.ubifs/fscrypt.c
+endif
+
+mkfs_ubifs_LDADD =3D libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_L=
IBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm
 mkfs_ubifs_CPPFLAGS =3D $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(UU=
ID_CFLAGS) $(LIBSELINUX_CFLAGS)\
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs.ubif=
s/
=20
diff --git a/ubifs-utils/mkfs.ubifs/crypto.h b/ubifs-utils/mkfs.ubifs/cry=
pto.h
index f275839aa77d..b6ffad19b72d 100644
--- a/ubifs-utils/mkfs.ubifs/crypto.h
+++ b/ubifs-utils/mkfs.ubifs/crypto.h
@@ -41,19 +41,18 @@ struct cipher {
 	unsigned int fscrypt_fname_mode;
 };
=20
-
+#ifdef WITH_CRYPTO
 int crypto_init(void);
-
 void crypto_cleanup(void);
-
 ssize_t derive_key_aes(const void *deriving_key, const void *source_key,
 		       size_t source_key_len, void *derived_key);
-
 int derive_key_descriptor(const void *source_key, void *descriptor);
-
 struct cipher *get_cipher(const char *name);
-
 void list_ciphers(FILE *fp);
+#else
+static inline int crypto_init(void) { return 0;}
+static inline void crypto_cleanup(void) {}
+#endif /* WITH_CRYPTO */
=20
 #endif /* UBIFS_CRYPTO_H */
=20
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.h b/ubifs-utils/mkfs.ubifs/fs=
crypt.h
index e3cfee50290a..3b717b4359c6 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.h
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.h
@@ -97,27 +97,76 @@ struct fscrypt_symlink_data {
 #define FS_IV_SIZE 16
 #endif
=20
+#ifdef WITH_CRYPTO
 unsigned char *calc_fscrypt_subkey(struct fscrypt_context *fctx);
-
 struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_context *=
fctx);
-
 void free_fscrypt_context(struct fscrypt_context *fctx);
-
 void print_fscrypt_master_key_descriptor(struct fscrypt_context *fctx);
-
 unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx,
 					  unsigned int ilen);
-
 int encrypt_path(void **outbuf, void *data, unsigned int data_len,
 		 unsigned int max_namelen, struct fscrypt_context *fctx);
-
 int encrypt_data_node(struct fscrypt_context *fctx, unsigned int block_n=
o,
 		      struct ubifs_data_node *dn, size_t length);
-
 struct fscrypt_context *init_fscrypt_context(const char *cipher_name,
 					     unsigned int flags,
 					     const char *key_file,
 					     const char *key_descriptor);
-
+#else
+static inline struct fscrypt_context *init_fscrypt_context(
+					const char *cipher_name,
+					unsigned int flags,
+					const char *key_file,
+					const char *key_descriptor)
+{
+	(void)cipher_name;
+	(void)flags;
+	(void)key_file;
+	(void)key_descriptor;
+
+	assert(0);
+	return NULL;
+}
+
+static inline void free_fscrypt_context(struct fscrypt_context *fctx)
+{
+	(void)fctx;
+
+	assert(0);
+}
+
+static inline int encrypt_path(void **outbuf, void *data, unsigned int d=
ata_len,
+		 unsigned int max_namelen, struct fscrypt_context *fctx)
+{
+	(void)outbuf;
+	(void)data;
+	(void)data_len;
+	(void)max_namelen;
+	(void)fctx;
+
+	assert(0);
+	return -1;
+}
+
+static inline int encrypt_data_node(struct fscrypt_context *fctx, unsign=
ed int block_no,
+		      struct ubifs_data_node *dn, size_t length)
+{
+	(void)fctx;
+	(void)block_no;
+	(void)dn;
+	(void)length;
+
+	assert(0);
+	return -1;
+}
+
+static inline struct fscrypt_context *inherit_fscrypt_context(struct fsc=
rypt_context *fctx)
+{
+	(void)fctx;
+
+	assert(0);
+	return NULL;
+}
+#endif /* WITH_CRYPTO */
 #endif /* FSCRYPT_H */
=20
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index e4204dae07cb..7073bf052688 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -508,9 +508,12 @@ static int get_options(int argc, char**argv)
 {
 	int opt, i, fscrypt_flags =3D FS_POLICY_FLAGS_PAD_4;
 	const char *key_file =3D NULL, *key_desc =3D NULL;
-	const char *tbl_file =3D NULL, *cipher_name =3D "AES-128-CBC";
+	const char *tbl_file =3D NULL;
 	struct stat st;
 	char *endp;
+#ifdef WITH_CRYPTO
+	const char *cipher_name;
+#endif
=20
 	c->fanout =3D 8;
 	c->orph_lebs =3D 1;
@@ -587,8 +590,10 @@ static int get_options(int argc, char**argv)
 			exit(EXIT_SUCCESS);
 		case '?':
 			printf("%s", helptext);
+#ifdef WITH_CRYPTO
 			printf("\n\nSupported ciphers:\n");
 			list_ciphers(stdout);
+#endif
 			exit(-1);
 		case 'v':
 			verbose =3D 1;
@@ -729,7 +734,11 @@ static int get_options(int argc, char**argv)
 			break;
 		}
 		case 'C':
+#ifdef WITH_CRYPTO
 			cipher_name =3D optarg;
+#else
+			return err_msg("mkfs.ubifs was built without crypto support.");
+#endif
 			break;
 		}
 	}
@@ -748,20 +757,26 @@ static int get_options(int argc, char**argv)
 		if (c->max_leb_cnt =3D=3D -1)
 			c->max_leb_cnt =3D c->vi.rsvd_lebs;
 	}
-
 	if (key_file || key_desc) {
+#ifdef WITH_CRYPTO
 		if (!key_file)
 			return err_msg("no key file specified");
=20
 		c->double_hash =3D 1;
 		c->encrypted =3D 1;
=20
+		if (cipher_name =3D=3D NULL)
+			cipher_name =3D "AES-128-CBC";
+
 		root_fctx =3D init_fscrypt_context(cipher_name, fscrypt_flags,
 						key_file, key_desc);
 		if (!root_fctx)
 			return -1;
=20
 		print_fscrypt_master_key_descriptor(root_fctx);
+#else
+		return err_msg("mkfs.ubifs was built without crypto support.");
+#endif
 	}
=20
 	if (c->min_io_size =3D=3D -1)
@@ -1385,6 +1400,7 @@ static inline int inode_add_selinux_xattr(struct ub=
ifs_ino_node *host_ino,
 }
 #endif
=20
+#ifdef WITH_CRYPTO
 static int set_fscrypt_context(struct ubifs_ino_node *host_ino, ino_t in=
um,
 			       struct stat *host_st,
 			       struct fscrypt_context *fctx)
@@ -1421,6 +1437,31 @@ static int encrypt_symlink(void *dst, void *data, =
unsigned int data_len,
 	free(sd);
 	return link_disk_len;
 }
+#else
+static int set_fscrypt_context(struct ubifs_ino_node *host_ino, ino_t in=
um,
+			       struct stat *host_st,
+			       struct fscrypt_context *fctx)
+{
+	(void)host_ino;
+	(void)inum;
+	(void)host_st;
+	(void)fctx;
+
+	assert(0);
+	return -1;
+}
+static int encrypt_symlink(void *dst, void *data, unsigned int data_len,
+			   struct fscrypt_context *fctx)
+{
+	(void)dst;
+	(void)data;
+	(void)data_len;
+	(void)fctx;
+
+	assert(0);
+	return -1;
+}
+#endif
=20
 /**
  * add_inode - write an inode.
@@ -1582,9 +1623,11 @@ static int add_symlink_inode(const char *path_name=
, struct stat *st, ino_t inum,
=20
 static void set_dent_cookie(struct ubifs_dent_node *dent)
 {
+#ifdef WITH_CRYPTO
 	if (c->double_hash)
 		RAND_bytes((void *)&dent->cookie, sizeof(dent->cookie));
 	else
+#endif
 		dent->cookie =3D 0;
 }
=20
@@ -1981,7 +2024,8 @@ static int add_directory(const char *dir_name, ino_=
t dir_inum, struct stat *st,
=20
 		inum =3D ++c->highest_inum;
=20
-		new_fctx =3D inherit_fscrypt_context(fctx);
+		if (fctx)
+			new_fctx =3D inherit_fscrypt_context(fctx);
=20
 		if (S_ISDIR(dent_st.st_mode)) {
 			err =3D add_directory(name, inum, &dent_st, 1, new_fctx);
@@ -2006,7 +2050,8 @@ static int add_directory(const char *dir_name, ino_=
t dir_inum, struct stat *st,
 		size +=3D ALIGN(UBIFS_DENT_NODE_SZ + strlen(entry->d_name) + 1,
 			      8);
=20
-		free_fscrypt_context(new_fctx);
+		if (new_fctx)
+			free_fscrypt_context(new_fctx);
 	}
=20
 	/*
@@ -2068,7 +2113,8 @@ static int add_directory(const char *dir_name, ino_=
t dir_inum, struct stat *st,
 		size +=3D ALIGN(UBIFS_DENT_NODE_SZ + strlen(nh_elt->name) + 1, 8);
=20
 		nh_elt =3D next_name_htbl_element(ph_elt, &itr);
-		free_fscrypt_context(new_fctx);
+		if (new_fctx)
+			free_fscrypt_context(new_fctx);
 	}
=20
 	creat_sqnum =3D dir_creat_sqnum;
--=20
2.19.1
