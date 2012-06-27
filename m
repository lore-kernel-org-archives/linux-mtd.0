Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjprG-0000o7-Ea
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 10:52:26 +0000
Message-ID: <1340794586.29342.52.camel@sauron.fi.intel.com>
Subject: Re: ubi_update_fastmap: could not find an early PEB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
Date: Wed, 27 Jun 2012 13:56:26 +0300
In-Reply-To: <201206222126.12515@blacky.localdomain>
References: <201206222005.02308@blacky.localdomain>
 <4FE49E19.4070005@nod.at> <201206222126.12515@blacky.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-eB4V2KH7Tk9sWBp+0+ty"
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, Rob Taylor <rtaylor@mvista.com>,
 Alexander Kaliadin <akaliadin@mvista.com>, linux-mtd@lists.infradead.org,
 Pavan Jadhav <pjadhav@mvista.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-eB4V2KH7Tk9sWBp+0+ty
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-22 at 21:26 +0400, Nikita V. Youshchenko wrote:
> > > How to overcome this?
> >
> > Can you please try the attached patch?
> > This patch allows the WL-worker to produce free anchor PEBS.
>=20
> This patch does not apply against 'fastmap' branch of=20
> git://git.infradead.org/linux-ubi.git
>=20
> And incompatibility is big enough to be not obviously resolvable.

I've just pushed out the latest work of Richard to the "fastmap" branch,
should be up-to-date now. Thanks for feed-back, testing is very
appreciated and certainly should help merging this faster.

--=20
Best Regards,
Artem Bityutskiy

--=-eB4V2KH7Tk9sWBp+0+ty
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6ubaAAoJECmIfjd9wqK09/YP/01HYpzdfb2C3eCcoDXubidW
j8IuvP8XnQjjrFd5rzVULxMIF3OgfTRREoy2yes2+VMwcjtoQv5l3Jw/OCW3CxTL
TKbSXbhAxJHPZgcXZBhhrYoBJG1+76M0EEa9swzjLXN6Sbiz15NTUZN+5dYfRvpV
wWA1TrjUQ9vkHSWUvdQ4rxPGOSwKf/cpGdLYOWLKMGNfNwLO6hH03S0/ypWt34a8
iz2CKcNFJBbz/ddwVuwLJ1zuWsmeV3z3RtJKOMnzYQvCqRQQ5ReKX6KdlTzP6m5h
DXDdeUt/q/ABpoxANLD5TIOiG6CCVcvHEQHHNJeZRpTBuNZYqE7rFrqdWlWMCPQy
icD8EMIXaFEuxYvdc0has/1tda8dzxArT45ty+tlnjRSymXeWM/6IUWZitmRzsnr
5XBhMez0Y490Xf1E0yQb4+DR4v77bBCiQaV3q90CHvT0SpBv8FybV0ytACE+n0i+
4d3rKdWi9GmQPz81FxAsL7hwCZacKynoiPviezyik8Brk//c9+5Z5P+VXdx9tLeY
qFdyv6Plutc3Ct2w8Hx1nptnYD+JMm+5uayne61Nqi8YrLpYdUE0mOLBcEBKy2Yi
2Y+GN1i77DdLfozFv00aMgZora2gkBI9WJWBayoNF9whuoUejwFCUNXMhukTMdO3
cglHhYpGjNiM4fShafCP
=4wRI
-----END PGP SIGNATURE-----

--=-eB4V2KH7Tk9sWBp+0+ty--
