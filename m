Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9S1-0005J1-H8
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:02 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 25/42] mkfs.ubifs: Specify padding policy via command line
Date: Thu, 18 Oct 2018 16:37:01 +0200
Message-Id: <20181018143718.26298-26-richard@nod.at>
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

From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 38 ++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 70c306bdf94e..9935fceafb77 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -217,7 +217,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
=20
-static const char *optstring =3D "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:=
j:UQqaK:b:";
+static const char *optstring =3D "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:=
j:UQqaK:b:P:";
=20
 static const struct option longopts[] =3D {
 	{"root",               1, NULL, 'r'},
@@ -245,6 +245,7 @@ static const struct option longopts[] =3D {
 	{"selinux",            1, NULL, 's'},
 	{"key",                1, NULL, 'K'},
 	{"key-descriptor",     1, NULL, 'b'},
+	{"padding",            1, NULL, 'P'},
 	{NULL, 0, NULL, 0}
 };
=20
@@ -291,6 +292,8 @@ static const char *helptext =3D
 "-s, --selinux=3DFILE       Selinux context file\n"
 "-K, --key=3DFILE           load an encryption key from a specified file=
.\n"
 "-b, --key-descriptor=3DHEX specify the key descriptor as a hex string.\=
n"
+"-P, --padding=3DNUM        specify padding policy for encrypting filena=
mes\n"
+"                         (default =3D 4).\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilob=
ytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -713,7 +716,7 @@ static int open_ubi(const char *node)
=20
 static int get_options(int argc, char**argv)
 {
-	int opt, i;
+	int opt, i, fscrypt_flags =3D FS_POLICY_FLAGS_PAD_4;
 	const char *key_file =3D NULL, *key_desc =3D NULL;
 	const char *tbl_file =3D NULL;
 	struct stat st;
@@ -904,6 +907,35 @@ static int get_options(int argc, char**argv)
 			}
 			key_desc =3D optarg;
 			break;
+		case 'P': {
+			int error =3D 0;
+			unsigned long num;
+
+			num =3D simple_strtoul(optarg, &error);
+			if (error)
+				num =3D -1;
+
+			fscrypt_flags &=3D ~FS_POLICY_FLAGS_PAD_MASK;
+
+			switch (num) {
+			case 4:
+				fscrypt_flags |=3D FS_POLICY_FLAGS_PAD_4;
+				break;
+			case 8:
+				fscrypt_flags |=3D FS_POLICY_FLAGS_PAD_8;
+				break;
+			case 16:
+				fscrypt_flags |=3D FS_POLICY_FLAGS_PAD_16;
+				break;
+			case 32:
+				fscrypt_flags |=3D FS_POLICY_FLAGS_PAD_32;
+				break;
+			default:
+				return errmsg("invalid padding policy '%s'",
+						optarg);
+			}
+			break;
+		}
 		}
 	}
=20
@@ -931,7 +963,7 @@ static int get_options(int argc, char**argv)
 		c->double_hash =3D 1;
 		c->encrypted =3D 1;
=20
-		root_fctx =3D init_fscrypt_context(FS_POLICY_FLAGS_PAD_4,
+		root_fctx =3D init_fscrypt_context(fscrypt_flags,
 						key_file, key_desc);
 		if (!root_fctx)
 			return -1;
--=20
2.19.1
