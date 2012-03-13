Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7RgE-00040z-HM
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 13:22:23 +0000
Message-ID: <1331645035.3595.60.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: phram: dot not crash when built-in and passing
 boot param
From: Artem Bityutskiy <dedekind1@gmail.com>
To: h-fache@ti.com
Date: Tue, 13 Mar 2012 15:23:55 +0200
In-Reply-To: <1331632351-32610-1-git-send-email-h-fache@ti.com>
References: <1331632351-32610-1-git-send-email-h-fache@ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-i6eDnkQ1tTEYonGzSRcw"
Mime-Version: 1.0
Cc: joern@lazybastard.org, joern@logfs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-i6eDnkQ1tTEYonGzSRcw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 10:52 +0100, h-fache@ti.com wrote:
> +/* This shall contain the module parameter if any. It is of the form:
> +   * phram=3D<device>,<address>,<size> for module case
> +   * phram.phram=3D<device>,<address>,<size> for built-in case
> +   We leave 64 bytes for the device name, 12 for the address and 12 for =
the
> +   size.
> +   Example: phram.phram=3Drootfs,0xa0000000,512Mi
> +*/

Sorry for this, but please, while you are on it, still, turn all your
comments into the standard Linux-style comments. This is not that
important, but just cleaner.

> +static __initdata char phram_paramline[64+12+12];

Despite that you told that there are not section mismatches, which I
doubted and thus decided to check, I see that this patch _does_ cause a
section mismatch:

+WARNING: modpost: Found 1 section mismatch(es).
+To see full details build your kernel with:

Could you please fix this?

--=20
Best Regards,
Artem Bityutskiy

--=-i6eDnkQ1tTEYonGzSRcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPX0prAAoJECmIfjd9wqK0bJ4P/RoT0JMUbbWmgDKr/2eNSlWA
PyXN6Ll8l/IRuoiIMCfmv2vOvkgxWLybOAKZwdSQIgXHEOk9diKRkGPKb48Cf9ey
Z4z7GuSAD2vdmk9e7EOBmGCFfokdD7gQqRJE/8eRtPd3FvoELaf1wrGaZmCz1NV9
FOq/L+peW9t9Zb8B6fCD+kPAp/kwuv5gWZPtuFJ5CkPpTZw8HlApGimqP8gIdBYj
twFwBeuktPmUzKZlFkgxqOzO9mOtJEgd3yIP5EAaK0QaeDt7aarSK0zjrrVxsu87
bhUGsYTbZRrOhrumbym6ycYulR8DALXUCXpfzpZ/doN08HrQYi85iqsxwKiklbBY
rLDnUF2FXrpfvgYN6roBPBH99T57bw4gwq8RndcGI5OR8T5OjH4K9r2HsAPKMpyd
X72qK23cWP5NLazrJR7C48M+dd73UIBX7wl4T5m1N56dmYULzL+eirjqokB1ayrI
jg76S7ZsKfEu+ssSZJVEj47E15wIJETCUFtsAkGA/Ez+mnQGSAd1HiPm+/ulC+CW
V5E1O9PtRRp1CrXcDk7aCqYN7oygMMV3orlmBQpNeY8/VXvtHEHmH1VD4baAzFVI
e5XIBA/ZaXiPOmg9r+wbpbTxwQqboRYCmupyFM+WLRD26ozitZRsGPrFFhwbuxqg
YDIpVaWP5DhE/6H1zu/e
=Mr3u
-----END PGP SIGNATURE-----

--=-i6eDnkQ1tTEYonGzSRcw--
