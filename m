Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbTpF-0003mU-4g
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2012 09:43:49 +0000
Message-ID: <1338803249.2507.8.camel@sauron.fi.intel.com>
Subject: Re: Resizing of an existing UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Mon, 04 Jun 2012 12:47:29 +0300
In-Reply-To: <Pine.LNX.4.64.1206041134440.24047@lnxricardw.se.axis.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
 <4FBF2DF7.8030809@intel.com> <4FBF396D.4070000@bury.com>
 <Pine.LNX.4.64.1205250958290.4247@lnxricardw.se.axis.com>
 <4FC340D4.9020905@intel.com>
 <Pine.LNX.4.64.1206011133500.4247@lnxricardw.se.axis.com>
 <4FC8AC00.7020309@intel.com>
 <Pine.LNX.4.64.1206012135000.20240@lnxricardw.se.axis.com>
 <4FCC6A9D.4010208@intel.com>
 <Pine.LNX.4.64.1206041134440.24047@lnxricardw.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-slikxS34dL2/0cAVn0Fo"
Mime-Version: 1.0
Cc: Ricard =?ISO-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Robert Homann <homann@bury.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-slikxS34dL2/0cAVn0Fo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-04 at 11:35 +0200, Ricard Wanderlof wrote:
> I suppose it would be possible to add some sysfs-parameter or similar to=
=20
> add this functionality?

I do not think we would want to have it. If we add one parameter today,
there will be much more tomorrow. The autoformat feature was only meant
for developers' convenience. If you can set the flag in user-space, you
can as well run mkfs.ubifs with all the parameters you want.

--=20
Best Regards,
Artem Bityutskiy

--=-slikxS34dL2/0cAVn0Fo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzIQxAAoJECmIfjd9wqK0m5EP/2om/Rxl1I3lTZqU5qTV4U4D
akhkKFTN94jL9EHeNLcjO7c0pxJX5ev98ATrny9xtUhvbuXtII/y1fWPq+ObBRr1
rj5+B3DWuOWbg2Kn6lMt9zKkRrVSa/y/dkLaglv3JpSN20BllN5FX6ToQyQ9XZ1k
gPhZ2IgzEP+zdDqzhY1uXmaNwZCOH6KM5CglOcHZccP1hhNUpFJsefQ+kWtUU6bO
QW1K6VOaXOKRHUA4NL+98V7yNxcFiXsdwg72r7znxEKQzmaMGJKN0zzPurcHe7i7
ZsvG8D0dkbbmGwtqXSwe3Ptt53HSQiPz/odsfg4Y8L9ERcihWohjoyKdYI3Ad3fG
aGiGb+hqGL/q4irYPpVw+eJWZKw7HK2mPX+GriL92RZOjkTAwxSpNCPBADiP6khf
I+qpNQItCJzXiRoL663LhWTAFHB9MtSMFiK1/jV6fzLDFLKy48A1Qjp+MFH6x/Bs
a8p//v340T64Fc0XJZA6slRqQr6wqNiADqbKmc5EbDFHw1iCRUGgb6nhMQL7VrW3
QA74chOxLNCx8OuaoBODTXCjswBlnK6hB7fq5/w6fWHprRVTXNSKloFmJUhrCIyn
iEGn0/kX3DcSdEACx7U1PrwdRUbaCw8diAobh/8CIEykUPnj6uMMQg5DEYyKq+wi
5/fRIxqUM3HBBvpYQRoJ
=QRBO
-----END PGP SIGNATURE-----

--=-slikxS34dL2/0cAVn0Fo--
