Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SC6Xs-0005bb-ML
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2012 09:49:01 +0000
Message-ID: <1332755518.22278.7.camel@sauron.fi.intel.com>
Subject: Re: Fix docg3 read align bug
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 26 Mar 2012 12:51:58 +0300
In-Reply-To: <87haxcs68e.fsf@free.fr>
References: <87haxcs68e.fsf@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UxYEm+QL1BY1KaeHV2wq"
Mime-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UxYEm+QL1BY1KaeHV2wq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-03-25 at 23:47 +0200, Robert Jarzmik wrote:
> Hi Artem,
>=20
> I sent not long ago a patch for unaligned reads. And ... I made an error.=
 I have
> a patch to patch my previous submission. I wonder if this can be squashed=
 in, or
> requires an incremental commit. Tell me what you want to do, the patch is=
 at the
> end of the mail.
>=20
> I hope I have not overseen another corner case, I'll recheck tomorrow eve=
ning
> (GMT+1).

Shoved in, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-UxYEm+QL1BY1KaeHV2wq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPcDw+AAoJECmIfjd9wqK0GxQQAM/NI+pcwokEasskROj8S5oY
Z46UkknHK12A+6oJCU/7WiJQGSGREq7TsBRsgTe3/m1ZVqN1T9+Fi7zCY9st71BI
BXzoxFmZLnQ0AzYsHG1y+LnXekybQGW5C+TOwy+V0j6nyLi6pvgjgqQGyicJ0Gej
9dvj/DZCVgAm71EPrSMIbKtgOboke/RHi8IkvtNP9aY4jfeK8f7mX6+eS2OvHrrB
6fFW30WzqfPKSstrCJkRiWdQ2jTiVknIDJgyh3Z7eRym9vNi0HYS4vSosX/uqtzE
JyPBbiZ4WKS5kHQ/XmufV72YcBbKYvNNbgMO7vR+e0zj6z9tzr9jpoDOObLh6RNC
8menikoHwELnSai2r0Yohwf60hi7/KRgow5YvbI+q/nR6TDjQsI5ClZuSp9+OJc5
72YTurLDUQqyMpoCiDst4E6grtb55cvPIIXoE4tsUN6peyvK8EDKaYHSYaDCOt82
ItBMFfVCKwGkQM74OV0mdGHgzrw6yDGm3BIBbjTeKmV6rpQ0D0TmPlJKtmHKxaQh
WD7TPAXaj7sbv5PUkG2xA6hRDiTYV97yDZqvhbc4ov/L9ABQP6GsKfYJ7Vtezdk6
IGObruKg982reZprJToQk8Wak7mELt792bbk3xK1EU8Mztnx71FY2z/JT0IFFs5l
aIt7nQO8AH5qmelILlwn
=qCrs
-----END PGP SIGNATURE-----

--=-UxYEm+QL1BY1KaeHV2wq--
