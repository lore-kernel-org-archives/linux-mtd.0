Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWtiG-000840-VD
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 18:21:42 +0000
Received: by lbbgg6 with SMTP id gg6so5691567lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2012 11:21:38 -0700 (PDT)
Message-ID: <1337710886.1977.6.camel@koala>
Subject: Re: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Tue, 22 May 2012 21:21:26 +0300
In-Reply-To: <20120522171023.GA2372@parrot.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
 <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
 <1337673190.2483.115.camel@sauron.fi.intel.com>
 <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
 <20120522171023.GA2372@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-BwS+Zh7PdflTr2SW6h2a"
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jesper Nilsson <jespern@axis.com>,
 Johan Gunnarsson <johan.gunnarsson@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-BwS+Zh7PdflTr2SW6h2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 19:10 +0200, Ivan Djelic wrote:
> Current NAND devices require approximately 1-3 ms per block erase, and 10=
0-200 us per page program operation.
> But I think this timeout is only useful to detect and recover from broken=
 hardware: IMHO there is no point in
> trying to "optimize" the timeout delay to 20ms or 400ms depending on whic=
h operation is being done (program or erase).
>=20
> Why not simplify and just use a single 1s (1000ms) timeout ?


I have many things on my plate now so my answers are are sloppy - I
spent 1 minute or less looking at the code. But I thought that this
timeout is important for the the case when 'chip->device_ready' is NULL.
This is why I wanted to get rid of that case, and then the timeout would
only become about detecting the forever loops. And this is exactly what
I meant by saying that I have further idea on improving that without
hrtimer - just have one single 1 second timeout. We indeed do not have
to be precise for the errors detection.

Oops, SIGBABY.

--=20
Best Regards,
Artem Bityutskiy

--=-BwS+Zh7PdflTr2SW6h2a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu9kmAAoJECmIfjd9wqK0okUQAIePx3h72R42piZ4Qh4Vv6Tn
UBKyh8/jy3hkddn1E27WB9Y+K/D+hM4uhygF+L4Y5aDAhY9/3gQIM6Vlo6wMGess
QZgb0ExDxjArve0HX2mWAcDqZV6LslpixMMcqF8hMkZy/NgiTjwThXDGwqJpXHzG
BntGHufsPEpPNzh7vHS1eieoP3+ezrqauf0RfiInShYGkKJ7WlPOh5MAbttot9D/
XAL8bIuEQfShoxydJg2AZTZ2ZT6pYef5rYMzz/g/68xK/o8L+Nnsr37flBIX4Dyv
Z2b4Xrxa5wWelRjroOUNvQPPRjCYt9KQWY7/pkaqZWpzw4Lsc1MG6rcB5Dx6madH
XBzAJMjt/0Nxqg7gWglE/wrxEmj4iyUJQzErZSgf98H+4Kd/LjFNmEub/7ZP89Br
SBb+0gZuTEdSAev62vci5iquqHLl519JEf1g2/bslHQV1C8mKTOEVHweqQNBQ01k
dGV48s8Da8soIFhAlragRm8JCmEF+BpSzfB5lJ9xruH5HP9H/tdYSXmCgoayWHK0
aPkphu6UL9vSmc/tWecFgHsoMyPgPa/LncHm4wWyEfpLRkrIebMVngGktCOrwxpV
tuQQukvMbsR8LMbJj7rzoiABvQ3dxpi739tX95H4yPDTx5moSQbHyAFIkMaVfb9J
vNLk5Os1+HMrs7K/Jd76
=GzF3
-----END PGP SIGNATURE-----

--=-BwS+Zh7PdflTr2SW6h2a--
