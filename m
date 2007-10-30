Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Imv6h-000578-BJ
	for linux-mtd@lists.infradead.org; Tue, 30 Oct 2007 13:42:34 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: getdents64 problem in 2.6.23
Date: Tue, 30 Oct 2007 18:42:19 +0100
Message-ID: <001701c81b1c$381df220$5267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1193701294.26497.48.camel@gentoo-jocke.transmode.se>
Cc: 'Jamie Lokier' <jamie@shareable.org>, 'Jörn Engel' <joern@logfs.org>, 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org=20
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=20
> Joakim Tjernlund
> Sent: den 30 oktober 2007 00:42
> To: David Woodhouse
> Cc: 'Linux-MTD Mailing List'; 'J=F6rn Engel'; 'Jamie Lokier'
> Subject: RE: getdents64 problem in 2.6.23
>=20
> On Mon, 2007-10-29 at 18:30 +0100, Joakim Tjernlund wrote:
> > On Mon, 2007-10-29 at 13:58 +0100, Joakim Tjernlund wrote:
> > > On Sun, 2007-10-28 at 20:26 -0400, David Woodhouse wrote:
> > > > On Mon, 2007-10-29 at 00:58 +0100, Joakim Tjernlund wrote:
> > > > > David, before rewriting getdents et. all may I ask=20
> you to apply the
> > > > > patch I sent today? Then we will have something that=20
> works and go
> > > > > from there.
> > > >=20
> > > > I'm not happy about having fd->raw still pointing to=20
> nodes which may no
> > > > longer exist. Can't we set it to NULL (and cope with=20
> potential fallout)?
> > >=20
> > > Thats a diffrent story. Now I fixed the bug so it behaves=20
> like the=20
> > > !mark_node_obsolete case. Walking through all ->raw references is
> > > something I will save for a rainy dag, I need to fix a=20
> few other bugs in
> > > our system ATM.
> >=20
> > ehh, my patch may be somewhat wrong, need to reflect a bit=20
> on that. I
> > might even get to the ->raw =3D NULL thing :)
>=20
> ok, this should do it I hope. I also have ->raw =3D NULL in=20
> progess, but I
> would like to know if this patch is accpetable to solve this problem.
>=20
>  Jocke

David, just sent 2 patches to the list to do your bidding :)
I am done now unless you have something more to add.

   Jocke
