Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqeyO-0000IN-DZ
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 06:40:14 +0000
Received: by lbbgg6 with SMTP id gg6so7337028lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jul 2012 23:39:45 -0700 (PDT)
Message-ID: <1342420459.3213.3.camel@brekeke>
Subject: Re: [PATCH 0/2] UBI(FS): fixing IS_ENABLED() usage + backport trees
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 16 Jul 2012 09:34:19 +0300
In-Reply-To: <CAN8TOE_zv1n_Ugx9YD2XYH2trnPhHuYdWOzg5g4v2jys5Eg=fw@mail.gmail.com>
References: <1340062283-11421-1-git-send-email-computersforpeace@gmail.com>
 <1340796875.29342.60.camel@sauron.fi.intel.com>
 <CAN8TOE_zv1n_Ugx9YD2XYH2trnPhHuYdWOzg5g4v2jys5Eg=fw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-TOx7Y2234sjkV85mctKO"
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


--=-TOx7Y2234sjkV85mctKO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-02 at 09:13 -0700, Brian Norris wrote:
> On Wed, Jun 27, 2012 at 4:34 AM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
> > On Mon, 2012-06-18 at 16:31 -0700, Brian Norris wrote:
> >>  2) IS_ENABLED() has changed some between v3.3 and when this commit wa=
s
> >>  originally integrated in mainline, so it masks a compile error in the
> >>  mainline version
> >
> > Not sure what you mean. It was introduced in 3.1
> > (2a11c8ea20bf850b3a2c60db8c2e7497d28aba99), so I have to back-port it
> > older ubifs backport trees.
>=20
> I was referring to
> kconfig: fix IS_ENABLED to not require all options to be defined
> 69349c2dc01c489eccaa4c472542c08e370c6d7e
> which was introduced in 3.4. I think this masks some errors in your
> mainline patch, but when you backport between 3.1..3.4-rc2, you get
> compilation errors.

I think I fixed all the backport trees, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-TOx7Y2234sjkV85mctKO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQA7XrAAoJECmIfjd9wqK08NcP/0P3wNW+ibBnLZTHXDRDQxSj
1YFMY6KjbH0aeMzHn06rV0UI3xt8K963hjr8jpDWt3O1WHwcZyefgAnp0De2eHKc
CR5QMPeFuaATslmhvzoHEl3ytWWrp/9EXEBuXwJmNNlcKYqeHF2ERgE+BhNKJa3n
LPm8PX7C165xk53/DXLPIifUl/BOK93nALpiR8XZp0KGirmmfvYKhV6bcB6envyz
My1Rk3bj62/IhfXlmqCmuLoWIMTVHA+IdyAxhcAgvKZdccNGByhyCmsdWbdq5QgL
pYAoFd3I+bhzshvkoDyO4nkN7NQqDKseHTBQcq3N8w4VU4FObltZiEQbyILb5obN
HwSguR+I4ntI1KVwIl9A46814WMccWoZ+NlWAqF1L0isGHu/3RafiSEQiFb448nv
lFMZecgIQfBCE2OruIZVbh6oIDO0C1BB66DnmXaahNi5HZqFAWXBsnrmxnkzNvA4
6tRopqRH+U9KFFdYkgLBEH27UgP/P0rjeKY2wLSeu7ONUmPf1lhe9vrphO1gqRAi
Q3eEm8VQZLBiNj8LS6QfKcrQClplzke1pR/iczXbLJng6Eq6LVFtbU7doIUgzhlR
fjdUopZ/ru5fphnzIqr/SjKGMsnMKrzy3hX4UvJeVirTi/ko31aAQKhnr6paSbsw
9vebCBR/7D0hpc+Q78Vh
=K32q
-----END PGP SIGNATURE-----

--=-TOx7Y2234sjkV85mctKO--
