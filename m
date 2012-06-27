Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjmV2-0006zs-PT
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 07:17:17 +0000
Message-ID: <4FEAB36E.4030008@nod.at>
Date: Wed, 27 Jun 2012 09:17:02 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
Subject: Re: UBI fastmap updates
References: <1340456602-46050-1-git-send-email-richard@nod.at>
 <CAKYAXd-3ArdssdotKHjvUU0f+yqcFC6y2rHF-mqnJnUcP=+eOg@mail.gmail.com>
 <201206271048.31524@zigzag.lvk.cs.msu.su>
In-Reply-To: <201206271048.31524@zigzag.lvk.cs.msu.su>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig1B9E50BF9585E8C6DD8E6FC5"
Cc: Namjae Jeon <linkinjeon@gmail.com>, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1B9E50BF9585E8C6DD8E6FC5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 27.06.2012 08:48, schrieb Nikita V. Youshchenko:
>> Would you infom me how much UBI attach time is improved with fastmap ?=

>=20
> I'm not Richard but still.
>=20
> On board I'm currently working on, ubi attach time for 1G chip without =

> fastmap is more than 5 seconds. With fastmap, it is less than 250=20
> milliseconds.

I can confirm these numbers.
On all of my boards the attach time dropped from a few seconds to
less than 500 milliseconds.
(The worst case I've seen was ~800 milliseconds)

Thanks,
//richard


--------------enig1B9E50BF9585E8C6DD8E6FC5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP6rNyAAoJEN9758yqZn9eU08IAIVjRIoJHpUZZaexWkZ0gRGE
U5n6/xMf8dQb9CzCdBcZYoy0/ATv2s8nNIfZ8bLSPdn/sqJ3nmxsdxm4tPbA2JQD
KTryL0pCK2OSM7RGU0R3m2x5A4T82GBnGzFdvW6JK6+EOtLC9Nmc72Y1ReE69Di9
fxdA2VN1+9qawC7lMQxUmk8Ag9cntcBFMrBz/XFVGNo0KbCk256D9jaCCgptDTkP
ku+FCiFAFvRrTkLpcxVrcN33p1CYmCYcOpNIvPrHQnH/4EiYWUyYoTwZRjsR2hzn
NhMiULHCz28Wpr5srMNlNonYHedU2UwzBHysG8y10+qh86KPiBsGuPHKLSBzfec=
=Pagm
-----END PGP SIGNATURE-----

--------------enig1B9E50BF9585E8C6DD8E6FC5--
