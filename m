Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T49mk-0005We-Mh
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 12:11:47 +0000
Message-ID: <1345637715.2848.167.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 22 Aug 2012 15:15:15 +0300
In-Reply-To: <20120822144751.5aa7f932@pixies.home.jungo.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
 <1345635197.2848.152.camel@sauron.fi.intel.com>
 <20120822144751.5aa7f932@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-c/ajpqFieUDaWpHxrcgN"
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


--=-c/ajpqFieUDaWpHxrcgN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 14:47 +0300, Shmulik Ladkani wrote:
> But the ioctl might return -EINVAL due to any of the *other*
> ubi_attach_req fields being invalid.
> So you can't really determine whether max_beb_per1024 is supported.

We call the attach ioctl 2 times.

1. Call it with bogus max_beb_per1024.
   a) Success - print the warning and exit
   b) Failure with non-EINVAL - overall failure.
   c) Failure with -EINVAL, go to step 2.


2. Call with user-supplied max_beb_per1024.
   a) Success - everything is fine, max_beb_per1024 is supported,
      the first failure was because we passed max_beb_per1024=3D-1
   b) Failure with non-EINVAL - overall failure.
   b) Failure with -EINVAL, return error, the whole operation failed,
      one of the parameters was incorrect.

Where is the flaw?

--=20
Best Regards,
Artem Bityutskiy

--=-c/ajpqFieUDaWpHxrcgN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNM1TAAoJECmIfjd9wqK0aT4QAMO7kJWJOBF14ObMEbTQqOWe
dBPkLcJzqs1yISn9HzXhQK3XA1HtKcGBwZFNkmCE+riq1YJzD8UGM1N6qBhTpRIv
t9NFJALNav/rQ86xNF7lI8DbckFAyY1cGnUl6ik0XqHhramaTaRs3yhy3E42qRYy
OYgxrQvpP6x/+E7+vQRmHwrv8WoHpamOUs2N/9vxV/3jlQvopwP37YsluFFGhImw
JXOzxfbTyShMGn1ps6EVE4JVkRbBqOJZEVTAbIgAe3q6jF1wVqT776ymTBm+a63W
ZEPQI/Pn7CLvWm/fwmbL5vCD8ezR71vNQr2g3JCLowx11+tFUjD2wmH8Hmsqpa1G
+QJimr7y6+nA7Yp2/Z65gZQk6/fZYvRPweBF0cMAhDZia4IbQlB/34MkQePEyc9W
I0+t2xal1Pb/NRKV57yRpA2HNLsmdYooeYP23fQE3gO8OJD8HZHoqDXarkJ8Od49
lnAmpZ72XbiGvlu2OiWM4useH5EtWZ2Noev5s6ALPlOVWWFkG0sHRM85iqfBjIT2
/fd4jCIQUt4yGaiD7Yu64mZmUxcPJ433JscJa1tvnPLD3y/fr+Tep2k16sbvG/fR
VU/24ivTzxXR6mptYPm6PbbzKPIhUvh3svb6xPRsFnjhHjIdaWYfKWsw4e7fgb1V
mXV/t2Hjs6LJy9sFMEA0
=BJlf
-----END PGP SIGNATURE-----

--=-c/ajpqFieUDaWpHxrcgN--
