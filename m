Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmkZr-0005Cz-FF
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 11:18:16 +0000
Received: by obcuz6 with SMTP id uz6so1589546obc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 03:18:14 -0800 (PST)
Message-ID: <1326712798.14299.53.camel@sauron.fi.intel.com>
Subject: Re: ubiformat & linux 3.0.14-rt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tim Sander <tim01@iss.tu-darmstadt.de>
Date: Mon, 16 Jan 2012 13:19:58 +0200
In-Reply-To: <201201161143.23934.tim01@iss.tu-darmstadt.de>
References: <201201131006.33998.tim01@iss.tu-darmstadt.de>
 <1326468894.19039.45.camel@sauron.fi.intel.com>
 <201201161143.23934.tim01@iss.tu-darmstadt.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-c3GvooQ5+3QIF3kPGCKr"
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


--=-c3GvooQ5+3QIF3kPGCKr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 11:43 +0100, Tim Sander wrote:
> > http://git.infradead.org/ubifs-2.6.git/commit/1f5d78dc4823a85f112aaa2d0=
f176
> > 24f8c2a6c52
> > http://git.infradead.org/ubifs-2.6.git/commit/d34315da9146253351146140e=
a4b
> > 277193ee5e5f
> Do you think it is worthwhile checking the ubifs 3.0 backport with the ab=
ove=20
> two cherry-picked?

I've pushed them to the ubifs-v3.0 back-port tree as well. But I think
they are useless - sorry, I was confused.

Also, if you say this happens when you run ubiformat - this is something
about your flash driver. Do you use NOR or NAND? Can you detect which
interrupt takes too much time? If the theory is that this is your flash
driver interrupt - can you verify it by injecting some instrumentation
to the interrupt handler?

--=20
Best Regards,
Artem Bityutskiy

--=-c3GvooQ5+3QIF3kPGCKr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFAfeAAoJECmIfjd9wqK0egYQAJUkxpGFx1CoWXcrjgeQewWo
3o0o9EcMR5U6X2K3aAEUgMwKVh4uH07K4mnkNrTBJSU01B1nXXRB4GJPfEJLP1jX
1wJXDQXAOAnm4ZIVQqiIJYZr2267op7zRKjQXXEmypOaIt2JhNTFM0AOZCp2620f
YZ880AKP2q9T2Ucl30Z2cKjYgxw0CU6Fs9VcNcZ6pQehxGaygwTzDTBc00wcy8CD
pr/U9bI+92lW6ZybGufJNefPUhAjGRpFzjTqPUzrPDSvVO66gcfaUNjWDPwDWjNx
xP3u4lxsDNLqTpu7EPMKxUiHHwayFpw39tv/lJrHSpEiPEeplbEsHcVCBkjWS68e
5BWiPkTrM9q2yIaCwEywxQVacvvePfMb+bvyX6oF6SVhNL3B+1iRbcP2Q0eRaQaP
zSjs1FPnARdQdWOOwCcXUzZUUBCXFTB6j4p4q+io6yS5DpxmAzbXm79e9dl6by82
i9awU8PBnHAQ7j2e7zJyPfzpXwT2SkBb5fbINHfvNQ5skJ0VLooNT5NmPdzlBY1h
hRIiXQcg5gxPVarsbyc1TonFwHnSGG6zWOyXItXV82JPHcqjAOVrrVlTUKtTNV3k
6w9xUR0mDvxYHPob7RBL1qD2WYJfvkyBYsJw/3aqQMa5BibO4J5HhdeXg4TXQS3b
N/RiKNh2rr3K4Plic/hH
=UkBJ
-----END PGP SIGNATURE-----

--=-c3GvooQ5+3QIF3kPGCKr--
