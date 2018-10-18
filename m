Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-000450-Ry
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:49 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 06/42] mkfs.ubifs: Add fscrypto defines
Date: Thu, 18 Oct 2018 16:36:42 +0200
Message-Id: <20181018143718.26298-7-richard@nod.at>
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

most of them should be UAPI, therefore check using #ifndef

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index e7acf17f6c96..2649c34cdd68 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -109,6 +109,56 @@ struct inum_mapping {
 	struct stat st;
 };
=20
+#ifndef FS_KEY_DESCRIPTOR_SIZE
+#define FS_KEY_DESCRIPTOR_SIZE  8
+#endif
+#define FS_ENCRYPTION_CONTEXT_FORMAT_V1 1
+#define FS_KEY_DERIVATION_NONCE_SIZE	16
+
+#ifndef FS_ENCRYPTION_MODE_AES_128_CBC
+#define FS_ENCRYPTION_MODE_AES_128_CBC 5
+#endif
+
+#ifndef FS_ENCRYPTION_MODE_AES_128_CTS
+#define FS_ENCRYPTION_MODE_AES_128_CTS 6
+#endif
+
+#ifndef FS_POLICY_FLAGS_VALID
+#define FS_POLICY_FLAGS_PAD_4		0x00
+#define FS_POLICY_FLAGS_PAD_8		0x01
+#define FS_POLICY_FLAGS_PAD_16		0x02
+#define FS_POLICY_FLAGS_PAD_32		0x03
+#define FS_POLICY_FLAGS_PAD_MASK	0x03
+#define FS_POLICY_FLAGS_VALID		0x03
+#endif
+
+#define FS_CRYPTO_BLOCK_SIZE	16
+
+/**
+ * Encryption context for inode
+ *
+ * Protector format:
+ *  1 byte: Protector format (1 =3D this version)
+ *  1 byte: File contents encryption mode
+ *  1 byte: File names encryption mode
+ *  1 byte: Flags
+ *  8 bytes: Master Key descriptor
+ *  16 bytes: Encryption Key derivation nonce
+ */
+struct fscrypt_context {
+	__u8 format;
+	__u8 contents_encryption_mode;
+	__u8 filenames_encryption_mode;
+	__u8 flags;
+	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
+} __attribute__((packed));
+
+#ifndef FS_MAX_KEY_SIZE
+#define FS_MAX_KEY_SIZE	64
+#endif
+static __u8 fscrypt_masterkey[FS_MAX_KEY_SIZE];
+
 /*
  * Because we copy functions from the kernel, we use a subset of the UBI=
FS
  * file-system description object struct ubifs_info.
--=20
2.19.1
