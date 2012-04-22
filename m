Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwKe-0007UX-1p
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 12:56:01 +0000
Message-ID: <1335099353.4879.13.camel@golum>
Subject: Re: [PATCH] Modify mtd-utils intgck utility to test extended
 attribute set/get for UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: subodh.nijsure@gmail.com
Date: Sun, 22 Apr 2012 15:55:53 +0300
In-Reply-To: <1334168668-26218-1-git-send-email-snijsure@grid-net.com>
References: <1334168668-26218-1-git-send-email-snijsure@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RwSvr5LKe17b+j9O+IkF"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Subodh Nijsure <snijsure@grid-net.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RwSvr5LKe17b+j9O+IkF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-11 at 11:24 -0700, subodh.nijsure@gmail.com wrote:
> From: Subodh Nijsure <snijsure@grid-net.com>
>=20
> [ Assuming that linux-mtd is right place to send patches for mtd-utils]
>=20
> Need to compile the test target with option UBIFS_XATTR_TEST=3D1
> run make as "UBIFS_XATTR_TEST=3D1 make tests"
>=20
> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
> ---
>  tests/fs-tests/integrity/Makefile  |   11 +++++++++++
>  tests/fs-tests/integrity/integck.c |   31 ++++++++++++++++++++++++++++++=
+
>  tests/ubi-tests/Makefile           |    3 ++-
>  3 files changed, 44 insertions(+), 1 deletions(-)
>=20
> diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity=
/Makefile
> index 4d6fc7d..2b1280f 100644
> --- a/tests/fs-tests/integrity/Makefile
> +++ b/tests/fs-tests/integrity/Makefile
> @@ -3,6 +3,12 @@ ifeq ($(origin CC),default)
>  CC =3D gcc
>  endif
> =20
> +#To compile  integck with XATTR test support
> +#invoke as UBIFS_XATTR_TEST=3D1 make tests from toplevel directory
> +ifeq ($(UBIFS_XATTR_TEST), 1)
> +  CPPFLAGS +=3D -DUBIFS_XATTR_TEST
> +endif

Would you please make this unconditional, i.e., remove the
UBIFS_XATTR_TEST thing completely.

> @@ -38,6 +38,7 @@
>  #include <sys/statvfs.h>
>  #include <linux/fs.h>
> =20
> +
>  #define PROGRAM_VERSION "1.1"

Do not add extra newlines please.

> +/* Assign given path extended attribute security.selinx value
> + * root:object_t:bin_t then read it back and verify it correct
> + */
> +#ifdef UBIFS_XATTR_TEST

Please, kill this ifdef as well.

> +void test_xattr(char *path)
> +{
> +	int ret;
> +	char buf[255];
> +	char value[255];
> +	int attrLen;
> +	strcpy(value,"root:object_r:bin_t");
> +	attrLen =3D strlen(value) + 1;
> +	ret =3D setxattr (path, "security.selinux", value, attrLen, 0x0);
> +	v("assign extended attribute to %s", path);
> +	CHECK(ret =3D=3D 0);
> +	if ( ret =3D=3D 0 ) {

CHECK(ret =3D=3D 0) will kill the test if ret !=3D 0, so the above "if"
statement is redundant - please kill it.
> +		v("retrieve extended attribute for  %s", path);
> +		ret =3D getxattr(path,"security.selinux",buf,attrLen);
> +		CHECK(strncmp(buf,"root:object_r:bin_t", attrLen) =3D=3D 0 );
> +	}
> +}
> +#endif

The patch is OK except of few nitpicks, but it would be much better if
you also remembered the extended addributes you created.

How the integck test works it creates random objects on the FS and
remembers them in internal in-memory data structures. Then it unmounts
the FS, mounts back, and checks that the objects are there. Would be
much better if you remembered and checked xattrs too.

> 	add_dir_entry(parent, 'd', name, NULL);
> @@ -627,6 +653,8 @@ static int dir_remove(struct dir_info *dir)
>  	return 0;
>  }
> =20
> +
> +
>  static int file_new(struct dir_info *parent, const char *name)

Junk extra newlines..

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-RwSvr5LKe17b+j9O+IkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPk//ZAAoJECmIfjd9wqK0hRwQAKQVZ6wHZ7Xx3y4gu2eVarlF
hpzYQLTDXbmVsPxlVatuuQhwV0CqGsITivb8HVIdmXZkUvNwX2OOCofIwqZjLSCd
H4/W51m/BkdZHSVmkmSQmW0oP+UyzzVXtTTQ2/GisIw6u+l23NBh6lntEsJN0cxx
E6eVZXC6MsncIUU5zuIoBj1LqdgvASEQNl6FsDOcGcUImBkwGLVmMCtvHdZkw8Pk
tsqQ+hz3LETu0fmp8cfz0FuJBsMPxtA5pZqd8BHakY99foGCEVw09NJe3Wnr/qMU
6Lacw0CtNtt0nS7QDOu/zBHmzvywQ79jlZtMYS33zECdatgI8kPHElZqkeboW66D
/ToCJuDcwJe1LG0kYiZe7DNTDr4L0+AMK8tN9pSlOykRiSfdnGSojF4zqmXeLSaG
oiSNmlF8taZM8QU0K4eUD5XA1hF0b/nnRF4ZLK4nhjJeSSEbOZPujweXaSTteunO
EvfvhzTy+9MxNy5ZwbQPlHpfpbTMKmA7v78Z2LxyOphxF/ncQj4tRIlTj9iyX73V
td+6B2z87t9MYthDV50aoDKjmVNWwoo0ltOjJCjBGMj9NowteOs1gmqpukZAlxM+
ySpBf0RiPaA8EUafEJ0jsYwCoMkVncoMhnzWbZAFNbP4Oc91PMKmz02JN5yi0EI3
RfXeg4Vy3/7vfk/ycikr
=TPSX
-----END PGP SIGNATURE-----

--=-RwSvr5LKe17b+j9O+IkF--
