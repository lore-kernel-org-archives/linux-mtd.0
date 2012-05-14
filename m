Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STucM-0001M5-9o
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 12:43:16 +0000
Message-ID: <1336999601.2528.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] Modify mtd-utils intgck utility to test extended
 attribute set/get for UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Date: Mon, 14 May 2012 15:46:41 +0300
In-Reply-To: <1336691159-31764-1-git-send-email-snijsure@grid-net.com>
References: <1336691159-31764-1-git-send-email-snijsure@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-PtSjGniwR8l6YXA8AeA+"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PtSjGniwR8l6YXA8AeA+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 2012-05-10 at 16:05 -0700, Subodh Nijsure wrote:
> Changes since v1:
>         Randomize value of extended attribute.
>         Update dir_entry structure to keep track of extended attribute an=
d
>         check it during verification phase, as suggested during v1 review=
.
> 	Now compiling and running integck requires libattr.
>=20
> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>

Please, fix these compiler warnings:

gcc  -Wall -g -O2 -I../../../include -I../../../ubi-utils//include -c ../..=
/../ubi-utils//libubi.c -o libubi.o
ar cr libubi.a libubi.o
gcc  -Wall -g -O2 -I../../../include -I../../../ubi-utils//include    integ=
ck.c libubi.a   -o integck
integck.c: In function =E2=80=98xattr_check=E2=80=99:
integck.c:379:2: warning: implicit declaration of function =E2=80=98getxatt=
r=E2=80=99 [-Wimplicit-function-declaration]
integck.c: In function =E2=80=98assign_xattr=E2=80=99:
integck.c:410:2: warning: implicit declaration of function =E2=80=98setxatt=
r=E2=80=99 [-Wimplicit-function-declaration]
integck.c: In function =E2=80=98xattr_check=E2=80=99:
integck.c:380:2: warning: =E2=80=98ret=E2=80=99 may be used uninitialized i=
n this function [-Wuninitialized]

Below are some comments - some of them apply to more places, so do not
forget to check other places in your patch for the same things.

> diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity=
/Makefile
> index 4d6fc7d..b814f77 100644
> --- a/tests/fs-tests/integrity/Makefile
> +++ b/tests/fs-tests/integrity/Makefile
> @@ -25,7 +25,7 @@ $(TARGETS): libubi.a
>  # Disable optimizations to make it possible to use gdb comfortably
>  # Use -rdynamic to have stack backtraces
>  debug: libubi.a
> -	gcc $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o inte=
gck
> +	gcc $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o inte=
gck -lattr
> =20
>  clean:
>  	rm -f *.o $(TARGETS) libubi.a
> diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrit=
y/integck.c
> index 30322cd..7bd73bf 100644
> --- a/tests/fs-tests/integrity/integck.c
> +++ b/tests/fs-tests/integrity/integck.c
> @@ -91,6 +91,7 @@
>  		normsg(fmt " (line %d)", ##__VA_ARGS__, __LINE__);           \
>  } while(0)
> =20
> +static int xattr_count;
>  /* The variables below are set by command line arguments */
>  static struct {
>  	long repeat_cnt;
> @@ -198,6 +199,7 @@ struct dir_entry_info /* Each entry in a directory ha=
s one of these */
>  	struct dir_entry_info *next_link; /* List of hard links for same file *=
/
>  	struct dir_entry_info *prev_link; /* List of hard links for same file *=
/
>  	char *name;
> +	char *xattr_value; /* Extended attribute on this directory */
>  	struct dir_info *parent; /* Parent directory */
>  	union {
>  		struct file_info *file;
> @@ -360,6 +362,60 @@ static char *cat_paths(const char *a, const char *b)
>  }
> =20
>  /*
> + * Verify security.selinux extendend attribute for given path
> + */
> +void xattr_check(char *path, char *xattr_value)
> +{
> +	int ret;
> +	char buf[255];

Introduce a macro for max xattr length instead of a magic number.

> +	int attrLen;
> +	/* Check if path actually exists */
> +	if (access(path, F_OK) !=3D 0)
> +		return;
> +	if (xattr_value =3D=3D NULL)
> +		return;

It is faster to first check xattr_value, then make the "access" syscall.

Also, please the style this file uses - "if (!xattr)".

> +	attrLen =3D strlen(xattr_value) + 1;
> +	v("retrieve extended attribute for  %s", path);
> +	getxattr(path, "security.selinux", buf, attrLen);
> +	CHECK(ret =3D=3D 0);
> +	ret =3D strncmp(buf, xattr_value, attrLen);
> +	if (ret !=3D 0) {
> +		printf("ret !=3D 0 PATH %s\n", path);
> +		printf("Expected value %s and retrived val %s\n",
> +			xattr_value, buf);

Use errmsg().

> +		CHECK(ret =3D=3D 0);
> +	} else {
> +		CHECK(ret =3D=3D 0);
> +	}
> +}
> +
> +/*
> + * Assign security.selinux extendend attribute for this path
> + */
> +char *assign_xattr(const char *path)
> +{
> +	int ret;
> +	char value[255], *xattr_value;
> +	int attrLen;
> +
> +	sprintf(value, "root:object_r:bin_t%d", xattr_count);
> +	xattr_count++;
> +	xattr_value =3D (char *)malloc(strlen(value)+1);

sizefo(value) instead of strlen.
Remove the cast after malloc.

> +	if (xattr_value =3D=3D NULL)
> +		return NULL;
> +	strcpy(xattr_value, value);
> +	attrLen =3D strlen(xattr_value) + 1;
> +	v("assign extended attribute to %s", path);
> +	/* printf("%s assigned %s\n", path, xattr_value); */
Kill this comment.

> +	ret =3D setxattr(path, "security.selinux", xattr_value, attrLen, 0x0);
> +	if (ret =3D=3D 0)
> +		return xattr_value;
> +	else {
> +		free(xattr_value);
> +		return NULL;
> +	}
> +}

Please, do not assign an xattr to all files and directories - better a
give it a 20% chance or something like this. This is better for test
coverage I thing. Add something like:

if (random_no(5) !=3D 0)
	return

at the beginning of this function.


> diff --git a/tests/ubi-tests/Makefile b/tests/ubi-tests/Makefile
> index 2c47a9f..ba8e7e0 100644
> --- a/tests/ubi-tests/Makefile
> +++ b/tests/ubi-tests/Makefile
> @@ -8,7 +8,8 @@ LIBS =3D libubi
>  TARGETS=3Dio_update volrefcnt integ io_paral io_read io_basic \
>            mkvol_basic mkvol_bad mkvol_paral rsvol
> =20
> -CFLAGS +=3D -I$(LIBUBI_HEADER_PATH) -I $(KERNELHDR) -lpthread
> +CFLAGS +=3D -I$(LIBUBI_HEADER_PATH) -I$(KERNELHDR) -lpthread
> +LDFLAGS +=3D -lpthread

This change seems to have nothing to do with integck - please, kill this
chunk.

--=20
Best Regards,
Artem Bityutskiy

--=-PtSjGniwR8l6YXA8AeA+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsP6xAAoJECmIfjd9wqK02jAQAJsdEiv8NNSG8ki2t/H9YUau
Hox+q8EDcFEHmUQCUjGkYgJBTbOmwqdrSSjbeRpXTF/ofjpI2nM7okKECzHg1M6U
EGIaMg+fw4bssa93LrcchBcFieZ9cI+Oz76KUCnH/iLsQ/zuj2ctN6sKuHqZInt2
UyHeiB2kQDfULwQJbI9VmWJSOm9yp0uY3o9VNBr6KMVCiEjVE1ST34hzR8vfRYrm
PtagUYWd0ZtAx9471+NRJ4yrZLeZYoNQeNP1Vqkl8B3KF6KIiW3unwTdXdZlG/I7
x2gy6lY6jC0nIxfyWnLl9aZA/da3F7r54RaBa89NGNui1kfq/w/RfdHb1ROfVeRW
y7cVZYFhL/0sFyIPlgIaJO7nKOmWWRjBy92EOoqx6GBZiY5gOkFvIhKALTc0fl5P
c6D/4QPzrqDokdyGk3L/dlpRGScOZvJjhfwzbuNdTUkVoRekDAltWSQWeETqO+5d
sJUAOxbWA85HYVqyuIF8KRayJB+YIgB7NoTgIxVm/wO0t3e9SCQVJnU/DsHml+uT
eg4GJKwUn5qmKbTqCfnQIMgmLuQ1sKxkZMBCXVR+ZubsIRMTFhF2sa0cXt2Lv4Tf
eMe+yAvMa5yMJiNxi8+Dv2Isf5f8elORyCBt8LlPuf4guxQrm+j0+DdKqKvjHnCi
roICqnlJFcPFef7TZKm9
=9RYE
-----END PGP SIGNATURE-----

--=-PtSjGniwR8l6YXA8AeA+--
