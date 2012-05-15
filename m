Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUBeL-0003kN-Ri
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 06:54:26 +0000
Message-ID: <1337065072.2528.118.camel@sauron.fi.intel.com>
Subject: Re: Missing offset increment in scan_read_raw_oob()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Maluka <D.Maluka@adbglobal.com>
Date: Tue, 15 May 2012 09:57:52 +0300
In-Reply-To: <4FAD51B7.6010303@adbglobal.com>
References: <4FAD51B7.6010303@adbglobal.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9NROeQo+Tnr9zLYiTwC/"
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


--=-9NROeQo+Tnr9zLYiTwC/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 20:51 +0300, Dmitry Maluka wrote:
> It seems there is a bug in scan_read_raw_oob() in nand_bbt.c which
> should cause wrong functioning of NAND_BBT_SCANALLPAGES option.
>=20
> Possible fix (relies on offs passed page-aligned):
>=20
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -324,6 +324,7 @@ static int scan_read_raw_oob(struct mtd_info *mtd,
> uint8_t *buf, loff_t offs,
> =20
>                 buf +=3D mtd->oobsize + mtd->writesize;
>                 len -=3D mtd->writesize;
> +               offs +=3D mtd->writesize;
>         }
>         return 0;
>  }

Looks like a correct fix. Did you encounter a real bug and then spot
this issue, or you spot it by reading the code?

--=20
Best Regards,
Artem Bityutskiy

--=-9NROeQo+Tnr9zLYiTwC/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsf5wAAoJECmIfjd9wqK0pJIP/AoIy2yDE2wW3Ps7Eii/NvKb
3Q+sOTjwdOi1sluzoQnHA/VzgJVuzLKNVv94zVRTMbz3uIQciuNc+XHeRLhaCg+D
xGgtbQiFr5/3XWIl4N5qWlUeYCPw7Ayw4F53UVHsyR4gsuFwc3QkgrT/C2QqnXlK
ZBQMfcfrG97KxFsdNtPHWSyhlNqE9os70WLFheaqUXAqvLb5opSWJyBOmWjBx3Va
+1jyKSP3+g6/pvaRIL3eNVAx3tU3f3Q7Rei3GVGjuQp73z8tsx/db4PeiLt+3bC0
+iCdZMOUtLwUd8cPR8VRknD/eGqzdxJ+8+8GAOOE4KZaMtn3B7zfpkwCpjDHQNwa
dAxcAwBJkT9VlfnP2iJqQc2uqZtBWx6nFa3Ibreot1EK5V4FQq+BKWL9+VpFjbnr
leM/4mk4x7myycDIuoA7ABghe6AuSz1aataGC0A3vOwHsWlBdb5MJpS7JwjEQGjS
C2nLeVBA1ulJ1AJ0O3PZ+jfObBdPgMFQah90g7u3sbpT4LChYYlhb2G7VLuq3mCJ
KZZ5hTyB2Piu/q6FPMUUCD7WiF+LAPS8CoxfR2qtQ5irKCYhjylYBywzqUjCCLuX
7u4wy7G0Uvi2EY0iC26v/ZerV6E0mdX8dxUMmqkjKtrL0wCkq01uEHRntqK4LP8z
t1qKsP85MaRqJ007eCHw
=xCVY
-----END PGP SIGNATURE-----

--=-9NROeQo+Tnr9zLYiTwC/--
