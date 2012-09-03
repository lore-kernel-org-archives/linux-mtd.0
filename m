Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8VBn-0002r7-21
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 11:51:36 +0000
Message-ID: <1346673385.3061.48.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Informations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: simon widmer <simonxwidmer@gmail.com>
Date: Mon, 03 Sep 2012 14:56:25 +0300
In-Reply-To: <503F7685.8030707@gmail.com>
References: <503F7685.8030707@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ws1IYAbFgld+6A0VYqgs"
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


--=-ws1IYAbFgld+6A0VYqgs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-30 at 16:19 +0200, simon widmer wrote:
> Hej,
>=20
> is there any possibility to extract the compile options of a ubinized=20
> UBIFS? My problem is that I have an embedded system where some UBIFS run=
=20
> on, I have an old UBIFS which I can easily put on a volume=20
> (ubiupdatevol) and which runs perfectly. I had to make a new image,=20
> taking the parameters i wrote down and its now working, i end with an err=
or
>      UBIFS error (pid 946): ubifs_read_node: bad node type (255 but=20
> expected 6)
>      UBIFS error (pid 946): ubifs_read_node: bad node at LEB 0:0
> either the node is 255 either 0 instead of 6.

You are the second person complaining about this. What is the kernel
version your image worked fine with?

--=20
Best Regards,
Artem Bityutskiy

--=-ws1IYAbFgld+6A0VYqgs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRJrpAAoJECmIfjd9wqK09OQP+gNS2TpYyGIpfuCuOczaQyal
fJALVm/McQjqJ5EKK1z4VHXuXwEvtOM5HwiWYtFvhcIaLx4EHMAzXfFxrhruSen/
HsMwDMIiJ/SbZ/HN2adzb1KjDKQgzlx40XTSar9Nx19GSfRLakMkJ5qNsAuYhGti
dYdxOK78grqzeXSyjbPeF+l0nDoy01bdrUyNh56Gmwa5utjo+K2SQr/aVcoSZUuk
v6YpfpFK+Aa2VXa9Tl5k9isofPouhlIjX2A7SLp3/xO8y9MCdLX9UyV/d07dfSgJ
jDkbH0VzMbFDfWhYpTcETZJn3nQ4vuc+hOsq9c7Cd/ic18X9qO3/cEWXYQ/RY7nS
DK+ZLdESn94BAGRs2PeolcjkXibV8yY/qwokTxvwrE+4VsAkgAnj9ZVsf+cDUgOr
dVJ0jty5AC9ur6dkDHUNACIEFOfMku6q98UqTKPNEM28My8c7jqB2impM8Wtbj6z
YHPnnjq2YJicIRgMbTJ8AXjWdXmlqTp+FGCzfSGgjcr7eEtwb6H+Hbn0AfU2EEhg
YFd3N2azBKmpgyjTB9uovCv7KtWm6RoxUJdMQ+oskNNNHQdVp+p9Am1Hi3agxmNS
3yG31OOnQEuvFr44hZiUl0WiSeda1xnIo0sNeQG5Eou/XpWHlKROFJYd5+KjCnFR
ys4IhciluwDw/wTQDFZ2
=BCik
-----END PGP SIGNATURE-----

--=-ws1IYAbFgld+6A0VYqgs--
