Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STuAv-0004l6-SE
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 12:14:54 +0000
Message-ID: <1336997899.2528.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] Modify mtd-utils intgck utility to test extended
 attribute set/get for UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Date: Mon, 14 May 2012 15:18:19 +0300
In-Reply-To: <1336691159-31764-1-git-send-email-snijsure@grid-net.com>
References: <1336691159-31764-1-git-send-email-snijsure@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cS9hqJWAlirPlowOw96Z"
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


--=-cS9hqJWAlirPlowOw96Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-10 at 16:05 -0700, Subodh Nijsure wrote:
> + * Verify security.selinux extendend attribute for given path
> + */
> +void xattr_check(char *path, char *xattr_value)
> +{
> +	int ret;
> +	char buf[255];
> +	int attrLen;
> +	/* Check if path actually exists */
> +	if (access(path, F_OK) !=3D 0)
> +		return;
> +	if (xattr_value =3D=3D NULL)
> +		return;
> +	attrLen =3D strlen(xattr_value) + 1;
> +	v("retrieve extended attribute for  %s", path);
> +	getxattr(path, "security.selinux", buf, attrLen);
> +	CHECK(ret =3D=3D 0);
> +	ret =3D strncmp(buf, xattr_value, attrLen);
> +	if (ret !=3D 0) {
> +		printf("ret !=3D 0 PATH %s\n", path);
> +		printf("Expected value %s and retrived val %s\n",
> +			xattr_value, buf);
> +		CHECK(ret =3D=3D 0);
> +	} else {
> +		CHECK(ret =3D=3D 0);
> +	}

If the file-system does not support xattrs and returns ENOTSUPP, you
should not fail. Instead, you should set a "xattrs_supported" variable,
set it to zero, and have "fi (!xattrs_supported) return" check at the
top level of this function. Or something like this which handles the
situation gracefully.

--=20
Best Regards,
Artem Bityutskiy

--=-cS9hqJWAlirPlowOw96Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsPgLAAoJECmIfjd9wqK0aZEP/AtoeYU+2xol8huEsE3HmlXB
rLgWj9yJb+h8eGs+f0h0WVXEbPiuVWomusJs0ghBHLqyErN3e84NvsoYUVWms3zU
4gepdepLPjOoL8Ox+3o6zY/oDai9ekQnkIzQn1bBkmX8sfAzz5t5rhrv9IKGqgqR
24CkL253aYZF/Jr5sS460MF6dKvKPqr0nfV112xUMYqPSb9QhMpJDyTrUEGn/ciH
v9NuiHtAFFvvHRXidyn9o4O2ldMy2/B/Rjd0yXKCNHSn+0+MgPqTlwLEu8zJVYkh
y3vjAXkaG5v14SHZsUWeIhf1kND9kKKuPxNFTj+RQlE/jR3WN6X8/qXkksRieDQm
yK7np0N5oRnBzlE4PYO4QhRp/CFr2YEzIZO9V/QEP9T27opNyZcqVtY7/rudtSEC
tEKoDD/qfJ16Q9lnm7CpZzfJ8n9w6GmpaZoYHa0Yc3y5ZLopy7Y3l0gZGod20Bxi
7T2outk4mj+dVw/V6B+E8Wb/uDjTwAXLYFCBAIwEiDQMdrguOZffLW2VfPpS3zGH
WVnrusowiWQcq20gvmV8w2BKj2ahE5kESA3LMABmj80SaLi0HdIOFtKhyHU6WZho
Gk4DF7iUWuwHlD8fpcQnWR0Fq4mUTgmS73jBia5qx9lEqSK/F9wG8rgnFuPpyILY
Hjo2v+BnAn2/39mCnQEH
=Leoe
-----END PGP SIGNATURE-----

--=-cS9hqJWAlirPlowOw96Z--
