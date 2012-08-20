Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3Rac-0007Xy-TP
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 13:00:19 +0000
Message-ID: <1345467898.2848.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 3/7] UBI: accept empty string for vid_hdr_offs parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 20 Aug 2012 16:04:58 +0300
In-Reply-To: <20120820155210.64d64803@pixies.home.jungo.com>
References: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
 <1345464561-24464-4-git-send-email-richard.genoud@gmail.com>
 <20120820155210.64d64803@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MnP0GOm186m7l1yFUe5b"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MnP0GOm186m7l1yFUe5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 15:52 +0300, Shmulik Ladkani wrote:
> Hi Richard,
>=20
> On Mon, 20 Aug 2012 14:09:17 +0200 Richard Genoud <richard.genoud@gmail.c=
om> wrote:
> > @@ -1292,7 +1292,11 @@ static int __init bytes_str_to_int(const char *s=
tr)
> >  	unsigned long result;
> > =20
> >  	result =3D simple_strtoul(str, &endp, 0);
> > -	if (str =3D=3D endp || result >=3D INT_MAX) {
> > +	if (str =3D=3D endp)
> > +		/* empty string, assume it's 0 */
> > +		return 0;

Please, let's not over-engineer this, do not bother with ",,", use ",0,"
instead. Just do amend the documentation properly.

--=20
Best Regards,
Artem Bityutskiy

--=-MnP0GOm186m7l1yFUe5b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMjX6AAoJECmIfjd9wqK0XSAP/RzFNyFnaiXlc5moKUOCL3zf
kPziEAfp3aadgGRGMzzZ3PYfwnBQpX+YIbCeJ/LJBkDEJ2jY6FZV9jA70+qObW6l
3BiznqydNcek+/TN6Z1UWOa7ut7cyGF+IAT5hPo5hm9diWZ4Rq0hSp3gcMTy/acR
+24tXwP2WX9RrnEscELSyRa5jUzzztqSBy58VxZE2v3j8wg4XCl/IU3lDoHKhc3V
P5TVdx9VvEo0ApKB1XU8kc2//oUBdu+sbvKTqjsYtkUcR3Ib7USu1EC9zVWOxDTh
xyU5oRI/NbkG76+ge6yDqP6khk0JD4fSmUGKEOvMEGgg3rDSQ/P0UNhkVzHGo/KU
wgunX3fMD4AoD5TBuRb80q6gH1/9d6wYaCo5WerGywPoJcwzEKq8h/U7X6mGUkF0
Qc5tLyb15lQTLFxvO2y9WtghE1amuTTDZ/CkSeNeKnS90FDaPRugFAY5kYf34bpn
c75VkfHC8pFcDsIXicK14KakMfLSZcgmjvtSADJ47Tr+vekEyYxdjWqEzqaKzoee
l1kanXCiQlS3vYu1ihL6VI08+1wC3OykwKhGdCqYX36/CLy5Ma6lPNxj2nUsxBjV
96RixO3+y2wW/bMOoL3YnZGemE+OWJFf/QD+5H+xV2lXzBS8eeWgDfZ/SKoQrwmD
/d9h12AauGimUhjRhEQq
=y+QB
-----END PGP SIGNATURE-----

--=-MnP0GOm186m7l1yFUe5b--
