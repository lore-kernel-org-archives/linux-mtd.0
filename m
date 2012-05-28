Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SYwaS-0006gI-JN
 for linux-mtd@lists.infradead.org; Mon, 28 May 2012 09:50:05 +0000
Message-ID: <4FC34A40.8030000@nod.at>
Date: Mon, 28 May 2012 11:49:52 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC v7] UBI: Fastmap support (aka checkpointing)
References: <1337771191-95358-1-git-send-email-richard@nod.at>
 <1338036094.2525.7.camel@koala>
 <20120528093625.050badc6@pixies.home.jungo.com>
 <1338187619.2480.9.camel@sauron.fi.intel.com>
In-Reply-To: <1338187619.2480.9.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigC2070EFF36E3EBABF25BD24E"
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC2070EFF36E3EBABF25BD24E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 28.05.2012 08:46, schrieb Artem Bityutskiy:
> We should have an ubiattach option instead (and add this feature to the=

> attach ioctl - thankfully we have unused bytes there).

Okay, I put that on my list.
I'll add an option to ubiattach and a kernel command line parameter.

Thanks,
//richard



--------------enigC2070EFF36E3EBABF25BD24E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPw0pEAAoJEN9758yqZn9eEiAH+wY1xNv25XGCNO9XO+calym/
wxxEd2RglS+/rmXOY9FvN0pamI2aHdiiG5vzkXU26V0PbOibSCoW35E0zNr1bXxJ
11fMFiaZoF0sXsTup1qpQFB6SIAmHkd6fFXjBEatinnnxZ0aRwO9cvHyZE4gTA27
yDqUtX2ROSemOfrkAbvxBXeGorn18Wdp0w55yLnSzBZwUzpZ7uVH8y5x1hQApH5r
ItzCaIHz42qNO95nwi5qkAs1PZ1ngkUQzhA+85ZucOEAAjN2DOH0Y/0NUy5kVtly
VjTr0kR+69uPoZYj2PUHZezzqWK2baXk1SZs+C7Fo3ceAhuBBqxLoByb3Q9o/1s=
=jWti
-----END PGP SIGNATURE-----

--------------enigC2070EFF36E3EBABF25BD24E--
