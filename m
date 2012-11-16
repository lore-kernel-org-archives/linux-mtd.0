Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZHaK-0002pw-MO
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 08:47:37 +0000
Message-ID: <1353055692.20111.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: s3c2410: Change return type of
 s3c2410_nand_add_partition function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Fri, 16 Nov 2012 10:48:12 +0200
In-Reply-To: <1352369324-25771-1-git-send-email-sachin.kamat@linaro.org>
References: <1352369324-25771-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hGWcEwc3lgi3p38davBr"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hGWcEwc3lgi3p38davBr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-08 at 15:38 +0530, Sachin Kamat wrote:
> The return value of s3c2410_nand_add_partition() is not checked for error
> or success in the calling function. Hence change the return type to void.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

This means you should fix the calling function instead hiding errors.

--=20
Best Regards,
Artem Bityutskiy

--=-hGWcEwc3lgi3p38davBr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpf3MAAoJECmIfjd9wqK0ksMP+wRhPnZvmKMk58txBp9OXCwW
RmmqNd05rRi9a+IWZMJDwggVRI0QrHek+N46nC2hRAaZYh+A19tNjQa/+ZDEKQIO
MXmgN34QhydT45M4CrCi3i0TPCfx8enQI67+cLo60Swv/jehpjhVWOaOewrE+/O0
regxxA4RCEp13umuriey/VLMQViFI4UE8AXC/SmHJZZ2BeyMx9UEfwrBKSDJ/fbn
Kavpf9P7dSz858E/mYa26vULISZVzFzE/Im/dWcbqNrlsq0jPn+nKo9wAbZ/NdUE
7tlisO4h129vO8ll/bllX4kIvvXxNCKum/IuK46GLMVAXUEsdcJSnThSj5Ptrd55
Cg/lKR5AqiPk+FCVZD70gigtnWqfF6obgxqPn8v4KzXjiifGoMCMy8K04h6aVIWD
WmpCKphsbYGZ7C/MTWwfR1ZjvOnUCXAT+CmdsLoUa3pU3g28uBv0V24I3SvTpxQL
PQ5jIC1Tk89nNQPLHfX+sekI0BhIQrRL4OIi8chFeRvB8Gcyn8SnEcg4qjLiUKEs
9a2zObAtopW8PE4umtqWqiYy3YnT6OKfJDwXFHTHthEdT1+gH2AIQ8S3iIybgd6e
uiJl+l843hWyIufU7aJK4Pj+tKG5XEQWuPIVV+0RAFM2eEHCWbaSJcRmAt2qFn4S
ZhLN1bfG9w65uIapfYDZ
=pSuY
-----END PGP SIGNATURE-----

--=-hGWcEwc3lgi3p38davBr--
