Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPBzs-00051l-57
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 12:16:00 +0000
Received: by lbbgg6 with SMTP id gg6so1234563lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 05:15:57 -0700 (PDT)
Message-ID: <1335874554.2095.7.camel@koala>
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive
 number in case of unrecoverable error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Tue, 01 May 2012 15:15:54 +0300
In-Reply-To: <4F9EFBF5.6080908@tribudubois.net>
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
 <1335100568.28267.12.camel@brekeke> <4F944165.4010400@tribudubois.net>
 <1335362381.5114.17.camel@koala> <4F99B9A0.10605@tribudubois.net>
 <1335714286.1942.14.camel@koala> <4F9EFBF5.6080908@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7U4cwbDhzK9RkGeERj9J"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7U4cwbDhzK9RkGeERj9J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-30 at 22:54 +0200, Jean-Christophe DUBOIS wrote:
> On 29/04/2012 17:44, Artem Bityutskiy wrote:
> > On Thu, 2012-04-26 at 23:09 +0200, Jean-Christophe DUBOIS wrote:
> >> Is this convincing enough?
> > Sure, thanks.
> >
> >> You might think that the attibute corruption I am showing here is very
> >> artificial but I can assure you that it does happen in the wild when y=
ou
> >> get a power cut on your equipment while the GC was moving an attribute
> >> node for example.
> > This issue is for sure worth fixing.
> So, will you accept this patch?

No, I meant that I agree that there is an issue, but I think that it
should be solved for all node types the same way. So I suggest to look
at what happens when data nodes are corrupted, how JFFS2 picks the older
node (if it does) and do it similarly for xattrs.

--=20
Best Regards,
Artem Bityutskiy

--=-7U4cwbDhzK9RkGeERj9J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPn9P6AAoJECmIfjd9wqK0vLsP/0nFtEbgYqkUwRCvvmU6Lpzl
we1pEQifs9s+e8PcsutHhAJ9Z2l/W2FMi7YMgIdMGBI08W6k/vcsG2+hGGP1q5Oy
x60EEVHi7+jLtbga5z62P+kYemdN/i4ffzYoGbOkTsC4cCuKNAEN0WB4D5gIr+r4
tLzotMsqmJdeoW3lSNKNmAM49MEdp2fmmC7OSEIsjscQx79+uSjOLRIz3bhCLwT0
1yK79XqeRPoRJodZNfAEUdk+IRSFDaApDqbCLsfB2nOX20R8NkaEIusHnsBTn9/p
eHl21+zkYwY+AtUkEuNnd0v7Nx+Yte2L4gMNqZ8zIP4z2xH+OaWaBpilb3q4TOBG
dCje1EnFFgTKeSneIm/1HtoZTbvY25fvVUqqZk9iBTN/hr3qre8IxxX1t/QbRGaH
6UqlNpZKSd4GUAOZCwngKgOYjaA24OtfKPX64et2DGadowiDv2B8zhABKuwKii3f
fRuEPma6MXO8T4JG76P2Jsf6lTTs30yKOyg/Fk6U5OH74MYZXPnCEPZ0+R+c9bJT
aFg5xU67AamrJTYAhWmFlO8djpBb/GyZ/enCVXDHmZ0fDa7Tw3V0yyI3f41XGmk9
HWhlx5/K5CJZcyC/Wz9kdep4OMsCA0vH0ZKuaaMb8gf0chvlujBzNkeHc5TUMQoc
3jU5Xj1S+RNDIhXbpU54
=yx0d
-----END PGP SIGNATURE-----

--=-7U4cwbDhzK9RkGeERj9J--
