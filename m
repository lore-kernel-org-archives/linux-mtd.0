Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUGim-0000Bx-FS
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 12:19:21 +0000
Message-ID: <1337084568.2528.194.camel@sauron.fi.intel.com>
Subject: Re: determining if a block erasure failed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Tue, 15 May 2012 15:22:48 +0300
In-Reply-To: <alpine.DEB.2.00.1205151349580.18866@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205150944550.17750@eristoteles.iwoars.net>
 <1337082053.2528.182.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205151349580.18866@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-O8mTrPFGE77gIpHIDcQg"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-O8mTrPFGE77gIpHIDcQg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-15 at 13:56 +0200, Joel Reardon wrote:
> Ah yes, if wl_wrk is freed in schedule_erase, theres no way to pass it
> back that way.
>=20
> The reason is that, if erasing a block of keys fails, then those keys may
> remain on the flash device for eternity. While a rare occurance, it may b=
e
> nice to have ubifs perform GC on all main LEBs storing the data nodes tha=
t
> can no longer be deleted through key erasure / reencrypt the valid data
> nodes.

Erasure is asynchronous and I do not see an good way to implement your
idea. Do you have a good plan?

--=20
Best Regards,
Artem Bityutskiy

--=-O8mTrPFGE77gIpHIDcQg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPskqYAAoJECmIfjd9wqK0hK4QAIlHuTQKVnK7m5I+QYqbq8oz
RNvookf93HBHeQBPkQM4rEcdRs/0ev9eFARW5U0AJNjETHB5yitDtQlmIwhBoyZC
RjhNJudL7jXV9RIZGdZrlVe7AjKejJ0rQO1OWG2kYy0Tc5yZC2aGLDjkWK8J6Kbj
sQQB3xO0fTtQPu6WLdAqGi9xqi21nJ087EoQKoELRgOLxuCkQmNytidOgPSdnIUt
33rVl2bhGj3y0tLQJ7azOaQPtOmpbrEvUnCJVlW4bB2qPhWfLmTzaRyhT3sfpTfj
DshX42wC029WOYTAbkZyglLSLJrtDzv3Ph5GCGlEha3ush5DCFRuJhJAqzUTnvwI
N5PaMawY2qxeKFAVtR7KwuSI/VhbsRyw5KmwVBZuCTcC0FJrMVBsk0ch7z0puz/w
0xVeAcelYZt/xIGnNGyX8bsY3UQC29IflysdxdmT/lqh9wjuLnNpxoSDHl2fiTMu
p31mDqCQkx747j0oA70u8pwd4YvurCjorlZmeWxWFhnTiGVk5t3eXlRAKQYZHH8i
1e7HeZTyWuMEZ45db3uBHZdngQ4flO4zs1QfHnmJglqNIxRO2Xot36W+3z72c/IK
+9pCi8ueKa98mUOwkiVNE/BzRDlpz0FwSLfXhZat7qw+SCM2xP6fNgmSIzxdrF/l
HlQXSM5RFtpKzWHttsbP
=+F5v
-----END PGP SIGNATURE-----

--=-O8mTrPFGE77gIpHIDcQg--
