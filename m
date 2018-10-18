Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9S6-0002Qr-II
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:39:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 26/42] mkfs.ubifs: Initial support for encryption command lines
Date: Thu, 18 Oct 2018 16:37:02 +0200
Message-Id: <20181018143718.26298-27-richard@nod.at>
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
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 39 +++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs=
/mkfs.ubifs.c
index 9935fceafb77..707758a42f4f 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -186,6 +186,7 @@ int yes;
 static char *root;
 static int root_len;
 static struct fscrypt_context *root_fctx;
+static struct cipher *fscrypt_cipher;
 static struct stat root_st;
 static char *output;
 static int out_fd;
@@ -217,7 +218,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
=20
-static const char *optstring =3D "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:=
j:UQqaK:b:P:";
+static const char *optstring =3D "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:=
j:UQqaK:b:P:C:";
=20
 static const struct option longopts[] =3D {
 	{"root",               1, NULL, 'r'},
@@ -246,6 +247,7 @@ static const struct option longopts[] =3D {
 	{"key",                1, NULL, 'K'},
 	{"key-descriptor",     1, NULL, 'b'},
 	{"padding",            1, NULL, 'P'},
+	{"cipher",             1, NULL, 'C'},
 	{NULL, 0, NULL, 0}
 };
=20
@@ -294,6 +296,8 @@ static const char *helptext =3D
 "-b, --key-descriptor=3DHEX specify the key descriptor as a hex string.\=
n"
 "-P, --padding=3DNUM        specify padding policy for encrypting filena=
mes\n"
 "                         (default =3D 4).\n"
+"-C, --cipher=3DNAME        Specify cipher to use for file level encrypt=
ion\n"
+"                         (default is \"AES-128-CBC\").\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilob=
ytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -718,7 +722,7 @@ static int get_options(int argc, char**argv)
 {
 	int opt, i, fscrypt_flags =3D FS_POLICY_FLAGS_PAD_4;
 	const char *key_file =3D NULL, *key_desc =3D NULL;
-	const char *tbl_file =3D NULL;
+	const char *tbl_file =3D NULL, *cipher_name =3D "AES-128-CBC";
 	struct stat st;
 	char *endp;
=20
@@ -797,6 +801,8 @@ static int get_options(int argc, char**argv)
 			exit(EXIT_SUCCESS);
 		case '?':
 			printf("%s", helptext);
+			printf("\n\nSupported ciphers:\n");
+			list_ciphers(stdout);
 			exit(-1);
 		case 'v':
 			verbose =3D 1;
@@ -936,6 +942,9 @@ static int get_options(int argc, char**argv)
 			}
 			break;
 		}
+		case 'C':
+			cipher_name =3D optarg;
+			break;
 		}
 	}
=20
@@ -967,6 +976,15 @@ static int get_options(int argc, char**argv)
 						key_file, key_desc);
 		if (!root_fctx)
 			return -1;
+
+		fscrypt_cipher =3D get_cipher(cipher_name);
+		if (!fscrypt_cipher) {
+			fprintf(stderr, "Cannot find cipher '%s'\n"
+				"Try `%s --help' for more information\n",
+				cipher_name, PROGRAM_NAME);
+			return -1;
+		}
+
 		print_fscrypt_master_key_descriptor(root_fctx);
 	}
=20
@@ -1604,6 +1622,7 @@ static int encrypt_path(void **outbuf, void *data, =
unsigned int data_len,
 	void *inbuf, *crypt_key;
 	unsigned int padding =3D 4 << (fctx->flags & FS_POLICY_FLAGS_PAD_MASK);
 	unsigned int cryptlen;
+	int ret;
=20
 	cryptlen =3D max_t(unsigned int, data_len, FS_CRYPTO_BLOCK_SIZE);
 	cryptlen =3D round_up(cryptlen, padding);
@@ -1619,7 +1638,10 @@ static int encrypt_path(void **outbuf, void *data,=
 unsigned int data_len,
 	crypt_key =3D calc_fscrypt_subkey(fctx);
 	if (!crypt_key)
 		return err_msg("could not compute subkey");
-	if (encrypt_aes128_cbc_cts(inbuf, cryptlen, crypt_key, *outbuf) < 0)
+
+	ret =3D fscrypt_cipher->encrypt_fname(inbuf, cryptlen,
+					    crypt_key, *outbuf);
+	if (ret < 0)
 		return err_msg("could not encrypt filename");
=20
 	free(crypt_key);
@@ -2003,10 +2025,13 @@ static int add_file(const char *path_name, struct=
 stat *st, ino_t inum,
 			if (!crypt_key)
 				return err_msg("could not compute subkey");
=20
-			ret =3D encrypt_block_aes128_cbc(inbuf, pad_len, crypt_key, block_no,
-						       outbuf);
-			if (ret !=3D pad_len)
-				return err_msg("encrypt_block_aes128_cbc returned %zi instead of %zi=
", ret, pad_len);
+			ret =3D fscrypt_cipher->encrypt_block(inbuf, pad_len,
+							    crypt_key, block_no,
+							    outbuf);
+			if (ret !=3D pad_len) {
+				return err_msg("encrypt_block returned %zi "
+						"instead of %zi", ret, pad_len);
+			}
=20
 			memcpy(&dn->data, outbuf, pad_len);
=20
--=20
2.19.1
