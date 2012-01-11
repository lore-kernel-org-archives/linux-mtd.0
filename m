Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rl2JB-0004Ta-UT
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2012 17:49:58 +0000
Received: by ghrr15 with SMTP id r15so466922ghr.36
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2012 09:49:56 -0800 (PST)
Message-ID: <1326304336.32705.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] cfi: AMD/Fujitsu compatibles: add panic write support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
Date: Wed, 11 Jan 2012 19:52:16 +0200
In-Reply-To: <4F0DC11E.5020308@freebox.fr>
References: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
 <4F0C124F.7040807@freebox.fr> <1326233055.2335.13.camel@koala>
 <4F0CB86C.10006@freebox.fr> <1326234127.2335.19.camel@koala>
 <4F0DC11E.5020308@freebox.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/Bjbo+C0D8dEbICEdJkZ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 "Ira W. Snyder" <iws@ovro.caltech.edu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/Bjbo+C0D8dEbICEdJkZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-01-11 at 18:04 +0100, Florian Fainelli wrote:
>=20
> On 01/10/12 23:22, Artem Bityutskiy wrote:
> > On Tue, 2012-01-10 at 23:15 +0100, Florian Fainelli wrote:
> >>
> >> My concern is about not adding more code which is barely used. I
> >> don't
> >> question the mtdoops driver, it definitively is useful.
> >
> > I'd actually question "substential" - a tiny piece in generic parts
> > and few functions in drivers does not look substantial.
>=20
> Fair enough, though that is exactly how the kernel gets more and more=20
> bloated with features added and no way to get them disabled.

I think it is not that drammatic :-) In this particular case breaking
layering does not seem to overweight code size increase, in my opinion.

--=20
Best Regards,
Artem Bityutskiy

--=-/Bjbo+C0D8dEbICEdJkZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPDcxQAAoJECmIfjd9wqK0h0UQAJHid9XJDDoyRBYGuT/2LHS6
lE34Ca87wOQAAUOH6123b+ibRR4zKdJDM6iA6BdOxvfycziMJcrZXFIVMYuQPRp5
t6BCOLyoED3gSRrEnkdY4XUpVT3MZm6HLHPv00TlD6YnocFwATzypJ1rGE4SfubV
yGHATegdx1LdBeUK3C+6Co4Rv6eysBKA4FopCFG4zuwW7ALXSy4Pq8PZFteHKCO3
hH1lHbKm0sw+CbCqOJ0m614Rkbe0PvndNHAUv9oQ+nibd04F0BZvn2e1uRyVHBk+
mihEsLL901hQGWWq3HWZ634cuV3KQe++6DM+jt71S9FHVI1WumxZMrLjJuLzIj2E
Vmj9KuvOYvY2KW23Qqaar1K8j4oOZlzwko4o9c8+SSQfL1JzI9hqxJLFT+MHK40a
RnHtQ8c43qZl8F9X2Oa7ySSpSbNBdbzmLBb/mvKQ/cLcCZEJsy58EjdEi5lVIKxT
JTN2FqFKEgCY4s4m6lmu+Tez5Ohwnwpb6AcEzzwAm0GcUxug4F4l6YA8p/5eivZ3
FcT3+KlRd1Ypj+MDGDBopUZM/uXt21g6QrvlTTyFgkhdB5X5Ai/G4orxNPGxJoXi
RInwPup8lRLCePZSOo9juAcR2FamS91At1XQbM2KB+GpzaNNSN0sJCOtssGwieZk
Z2IBLlPGw8MXxLzXqKUI
=Jlz2
-----END PGP SIGNATURE-----

--=-/Bjbo+C0D8dEbICEdJkZ--
