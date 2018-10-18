Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RC-00043D-OG
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:16 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 01/42] Import latest ubifs-media.h
Date: Thu, 18 Oct 2018 16:36:37 +0200
Message-Id: <20181018143718.26298-2-richard@nod.at>
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
 include/mtd/ubifs-media.h | 67 +++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 7 deletions(-)

diff --git a/include/mtd/ubifs-media.h b/include/mtd/ubifs-media.h
index a324e90a58d7..e69ba1687134 100644
--- a/include/mtd/ubifs-media.h
+++ b/include/mtd/ubifs-media.h
@@ -38,8 +38,30 @@
 /* UBIFS node magic number (must not have the padding byte first or last=
) */
 #define UBIFS_NODE_MAGIC  0x06101831
=20
-/* UBIFS on-flash format version */
-#define UBIFS_FORMAT_VERSION 4
+/*
+ * UBIFS on-flash format version. This version is increased when the on-=
flash
+ * format is changing. If this happens, UBIFS is will support older vers=
ions as
+ * well. But older UBIFS code will not support newer formats. Format cha=
nges
+ * will be rare and only when absolutely necessary, e.g. to fix a bug or=
 to add
+ * a new feature.
+ *
+ * UBIFS went into mainline kernel with format version 4. The older form=
ats
+ * were development formats.
+ */
+#define UBIFS_FORMAT_VERSION 5
+
+/*
+ * Read-only compatibility version. If the UBIFS format is changed, olde=
r UBIFS
+ * implementations will not be able to mount newer formats in read-write=
 mode.
+ * However, depending on the change, it may be possible to mount newer f=
ormats
+ * in R/O mode. This is indicated by the R/O compatibility version which=
 is
+ * stored in the super-block.
+ *
+ * This is needed to support boot-loaders which only need R/O mounting. =
With
+ * this flag it is possible to do UBIFS format changes without a need to=
 update
+ * boot-loaders.
+ */
+#define UBIFS_RO_COMPAT_VERSION 0
=20
 /* Minimum logical eraseblock size in bytes */
 #define UBIFS_MIN_LEB_SZ (15*1024)
@@ -53,6 +75,13 @@
  */
 #define UBIFS_MIN_COMPR_LEN 128
=20
+/*
+ * If compressed data length is less than %UBIFS_MIN_COMPRESS_DIFF bytes
+ * shorter than uncompressed data length, UBIFS prefers to leave this da=
ta
+ * node uncompress, because it'll be read faster.
+ */
+#define UBIFS_MIN_COMPRESS_DIFF 64
+
 /* Root inode number */
 #define UBIFS_ROOT_INO 1
=20
@@ -77,7 +106,6 @@
  */
 #define UBIFS_BLOCK_SIZE  4096
 #define UBIFS_BLOCK_SHIFT 12
-#define UBIFS_BLOCK_MASK  0x00000FFF
=20
 /* UBIFS padding byte pattern (must not be first or last byte of node ma=
gic) */
 #define UBIFS_PADDING_BYTE 0xCE
@@ -109,6 +137,13 @@
 /* The key is always at the same position in all keyed nodes */
 #define UBIFS_KEY_OFFSET offsetof(struct ubifs_ino_node, key)
=20
+/* Garbage collector journal head number */
+#define UBIFS_GC_HEAD   0
+/* Base journal head number */
+#define UBIFS_BASE_HEAD 1
+/* Data journal head number */
+#define UBIFS_DATA_HEAD 2
+
 /*
  * LEB Properties Tree node types.
  *
@@ -267,6 +302,13 @@ enum {
 /* The largest UBIFS node */
 #define UBIFS_MAX_NODE_SZ UBIFS_MAX_INO_NODE_SZ
=20
+/*
+ * xattr name of UBIFS encryption context, we don't use a prefix
+ * nor a long name to not waste space on the flash.
+ */
+#define UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT "c"
+
+
 /*
  * On-flash inode flags.
  *
@@ -276,6 +318,7 @@ enum {
  * UBIFS_APPEND_FL: writes to the inode may only append data
  * UBIFS_DIRSYNC_FL: I/O on this directory inode has to be synchronous
  * UBIFS_XATTR_FL: this inode is the inode for an extended attribute val=
ue
+ * UBIFS_CRYPT_FL: use encryption for this inode
  *
  * Note, these are on-flash flags which correspond to ioctl flags
  * (@FS_COMPR_FL, etc). They have the same values now, but generally, do=
 not
@@ -288,6 +331,7 @@ enum {
 	UBIFS_APPEND_FL    =3D 0x08,
 	UBIFS_DIRSYNC_FL   =3D 0x10,
 	UBIFS_XATTR_FL     =3D 0x20,
+	UBIFS_CRYPT_FL     =3D 0x40,
 };
=20
 /* Inode flag bits used by UBIFS */
@@ -376,12 +420,19 @@ enum {
  *
  * UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
  * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs =
needed
+ * UBIFS_FLG_DOUBLE_HASH: store a 32bit cookie in directory entry nodes =
to
+ *			  support 64bit cookies for lookups by hash
+ * UBIFS_FLG_ENCRYPTION: this filesystem contains encrypted files
  */
 enum {
 	UBIFS_FLG_BIGLPT =3D 0x02,
 	UBIFS_FLG_SPACE_FIXUP =3D 0x04,
+	UBIFS_FLG_DOUBLE_HASH =3D 0x08,
+	UBIFS_FLG_ENCRYPTION =3D 0x10,
 };
=20
+#define UBIFS_FLG_MASK (UBIFS_FLG_BIGLPT|UBIFS_FLG_SPACE_FIXUP|UBIFS_FLG=
_DOUBLE_HASH|UBIFS_FLG_ENCRYPTION)
+
 /**
  * struct ubifs_ch - common header node.
  * @magic: UBIFS node magic number (%UBIFS_NODE_MAGIC)
@@ -488,7 +539,8 @@ struct ubifs_ino_node {
  * @padding1: reserved for future, zeroes
  * @type: type of the target inode (%UBIFS_ITYPE_REG, %UBIFS_ITYPE_DIR, =
etc)
  * @nlen: name length
- * @padding2: reserved for future, zeroes
+ * @cookie: A 32bits random number, used to construct a 64bits
+ *          identifier.
  * @name: zero-terminated name
  *
  * Note, do not forget to amend 'zero_dent_node_unused()' function when
@@ -501,7 +553,7 @@ struct ubifs_dent_node {
 	__u8 padding1;
 	__u8 type;
 	__le16 nlen;
-	__u8 padding2[4]; /* Watch 'zero_dent_node_unused()' if changing! */
+	__le32 cookie;
 	__u8 name[];
 } __attribute__ ((packed));
=20
@@ -511,7 +563,7 @@ struct ubifs_dent_node {
  * @key: node key
  * @size: uncompressed data size in bytes
  * @compr_type: compression type (%UBIFS_COMPR_NONE, %UBIFS_COMPR_LZO, e=
tc)
- * @padding: reserved for future, zeroes
+ * @compr_size: compressed data size in bytes, only valid when data is e=
ncrypted
  * @data: data
  *
  * Note, do not forget to amend 'zero_data_node_unused()' function when
@@ -522,7 +574,7 @@ struct ubifs_data_node {
 	__u8 key[UBIFS_MAX_KEY_LEN];
 	__le32 size;
 	__le16 compr_type;
-	__u8 padding[2]; /* Watch 'zero_data_node_unused()' if changing! */
+	__le16 compr_size;
 	__u8 data[];
 } __attribute__ ((packed));
=20
@@ -584,6 +636,7 @@ struct ubifs_pad_node {
  * @padding2: reserved for future, zeroes
  * @time_gran: time granularity in nanoseconds
  * @uuid: UUID generated when the file system image was created
+ * @ro_compat_version: UBIFS R/O compatibility version
  */
 struct ubifs_sb_node {
 	struct ubifs_ch ch;
--=20
2.19.1
