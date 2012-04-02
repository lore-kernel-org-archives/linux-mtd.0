Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SEhml-00067U-NL
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 13:59:08 +0000
Message-ID: <1333375338.22146.6.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBIFS: Add a encryption key parameter to the compress /
 decompress function.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Mon, 02 Apr 2012 17:02:18 +0300
In-Reply-To: <alpine.DEB.2.00.1203291606450.912@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
 <1332511796.18717.72.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
 <1332521515.22278.2.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203252302310.5527@eristoteles.iwoars.net>
 <1332836863.31549.9.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203291606450.912@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GuAY6Oye8GgZrNz57ORi"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-GuAY6Oye8GgZrNz57ORi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-29 at 16:11 +0200, Joel Reardon wrote:
> Added a crypto_key parameter to ubifs compress and decompress. Will be us=
ed
> later if non-NULL to encrypt / decrypt data nodes.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

Hi,

thanks, pushed with the following amendments:

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index c91974a..b796b8d 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -82,8 +82,8 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TY=
PES_CNT];
  * @out_len: output buffer length is returned here
  * @compr_type: type of compression to use on enter, actually used compres=
sion
  *              type on exit
- * @crypto_key: a pointer to bytes to use as the encryption key,
- *              if NULL then no encryption is performed.
+ * @crypto_key: a pointer to bytes to use as the encryption key, if NULL t=
hen
+ *              no encryption is performed
  *
  * This function compresses input buffer @in_buf of length @in_len and sto=
res
  * the result in the output buffer @out_buf and the resulting length in
@@ -142,8 +142,8 @@ no_compr:
  * @out_buf: output buffer where decompressed data should
  * @out_len: output length is returned here
  * @compr_type: type of compression
- * @crypto_key: a pointer to bytes to use as the decryption key,
- *             if NULL then no decryption is performed.
+ * @crypto_key: a pointer to bytes to use as the decryption key, if NULL t=
hen
+ *              no decryption is performed.
  *
  * This function decompresses data from buffer @in_buf into buffer @out_bu=
f.
  * The length of the uncompressed data is returned in @out_len. This funct=
ions
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 9ece275..57c4d2f 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1113,8 +1113,7 @@ static int recomp_data_node(struct ubifs_data_node *d=
n, int *new_len)
=20
        len =3D le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
        compr_type =3D le16_to_cpu(dn->compr_type);
-       err =3D ubifs_decompress(
-               &dn->data, len, buf, &out_len, compr_type, NULL);
+       err =3D ubifs_decompress(&dn->data, len, buf, &out_len, compr_type,=
 NULL);
        if (err)
                goto out;

--=20
Best Regards,
Artem Bityutskiy

--=-GuAY6Oye8GgZrNz57ORi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPebFqAAoJECmIfjd9wqK0qPMQAJar+Nk0465TDo5O5hSdlEwv
E+ZuJ/XvQAYcHrCi7oQhd9a8v3lhTNTuvZNCpN6Hj5mTQIqQ/T98s0jGiwXI9+I9
HQgdMeF/HLrbj0gNHg66dqKX+BA0fS/FrXosNIzkFjvj+ybXjzmBeZiXOKSnWHAd
SgVA/71aXVlY77n0PGvo4qhJ4eFSE6bcV4zExSuCYGj1wQ26wX9NLknoqUHnq66W
NPxJH5ipD0iO2LO9d2OZaUJtPp5HE4lQS4chEzVYk22isAfOieuR7agJgTozL65G
NsGx9wHDsNd3/mjhSW8ve7Fd6dCXaO+ng/+U08aor0NEW8sQO6qmCNNCNYaPg+8d
ytqPKJTnutDfttgomqhXd6HJv/JRFrohrinPipC1DssrI6rJpD9OEhbux91jdN/4
oj8DefY3mem3cBQsLve2tYJdOekoBpMehzuCJsyu97w+IYhsxnAaX3eI3SS8QOR7
ZgWB+b+Pp47towo1KPSD4y9jOet6fZVJRpeVeVVt6mXZwaMIPCOdMIHLudwUw8nI
9VxIh3YGrn6JYibAi45zXMf+YAQd5y+dARSU25JvAXvj1fQ+lAP2IyaYfcnd+UHc
PY5PEFZi6XakfvpFc7b0yVe1LucCM8uTLXZLJNuXaaTP14ag0R24C6TVLdKVmKBD
8Y4lmwrAX2WrN9dIVXOU
=qe7E
-----END PGP SIGNATURE-----

--=-GuAY6Oye8GgZrNz57ORi--
