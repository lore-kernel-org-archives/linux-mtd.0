Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPaj4-0005gV-9g
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 14:40:18 +0000
Message-ID: <1335969816.10293.65.camel@sauron.fi.intel.com>
Subject: Re: ubiattach fails after mkvol with "vtbl_check: bad CRC..."
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Shawn J. Goff" <shawn7400@gmail.com>
Date: Wed, 02 May 2012 17:43:36 +0300
In-Reply-To: <CAGiDA6KgHTQehUPtN_wT90unaHwZPzre7V5WCOEipaVpzbxJOQ@mail.gmail.com>
References: <CAGiDA6KgHTQehUPtN_wT90unaHwZPzre7V5WCOEipaVpzbxJOQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-VWAUhLlm6neQI6pTwiZC"
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


--=-VWAUhLlm6neQI6pTwiZC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-01 at 10:39 -0400, Shawn J. Goff wrote:
> Sorry if this is a double-post; I haven't seen a bounce-back, but I also
> didn't see it go on the list.
>=20
> I am having trouble attaching an ubi device after creating a volume on
> it. My procedure is as follows (a full console log is at the end of
> this e-mail):

Did you validate your flash using mtdtests:
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

--=20
Best Regards,
Artem Bityutskiy

--=-VWAUhLlm6neQI6pTwiZC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPoUgYAAoJECmIfjd9wqK0M0UQAJG/I92cy6h+4weZkFJn1nSN
x9bxlRQpd27ayTOE7y5+mKXlEXSo9qp7OlByrHiANWJi0mrjVnkbXCCXH+In9K0I
VsLO4r0t7zr66KMVcomyaUFoSaJtF472Il5reMgZs0ekLE20hm6jhcCq23Su9m/Z
nECfPCv7thS/vD+oTtLPCfrQm/OtbVrY0B6ldXfzF/MOzbB6EoNvr4UGU62Ydn5R
/+3vnk2xx6dV0JBy0hVLqEt5PblhabHK/Ylad2VZR2ncC1/9c/jGSsHizAkEOm8H
2t2OZS6SFblR2F3myUZAmYaLsmSItfq6IqqFgGh1dz1ASWDzVgE3Q+zbj2dMyHVb
qeQv7CPf5zzoN+l8wDRmBxCp6MQ3PPUxo/n/nVE9wPiOSMS6rnOKpnHW1/Kjl2Ly
LKeYPISHks5ooWmQLflrqvx158cC9Kdr3AKJVd6Zi0z/5xzvdx3LpkzbsMNbHa6m
bpdudDtJYK1LO00ITXiI39rV7vv/dKTiMJrH4dWLNHSracLZDxzQvJdUxnQ9kxBU
IFhwUuK93S47RN+JAnLfntjsvlPNdcK0Ozx4q4tipPO3w5v8qxpSGGCqTVFJsMCn
aiwKS11lIJv1GsE1T048RBJJ4kLwS3c8NnoxKkVuvgeoE3pOkJROgqNd1+eGcbON
cN4aTtTcUDbv8mxCycg1
=q4SS
-----END PGP SIGNATURE-----

--=-VWAUhLlm6neQI6pTwiZC--
