Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQw1f-0002fr-0I
 for linux-mtd@lists.infradead.org; Sun, 06 May 2012 07:37:04 +0000
Received: by lbbgg6 with SMTP id gg6so3593003lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 06 May 2012 00:37:01 -0700 (PDT)
Message-ID: <1336289819.1996.5.camel@koala>
Subject: Re: [PATCH 2/2] MIPS: bcm63xx: kbuild: remove -Werror
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Date: Sun, 06 May 2012 10:36:59 +0300
In-Reply-To: <alpine.LFD.2.00.1205060804400.19691@eddie.linux-mips.org>
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
 <1335534510-12573-2-git-send-email-dedekind1@gmail.com>
 <alpine.LFD.2.00.1205060804400.19691@eddie.linux-mips.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-yeAv7sbnRzUmnPVNgf5D"
Mime-Version: 1.0
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yeAv7sbnRzUmnPVNgf5D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-06 at 08:06 +0100, Maciej W. Rozycki wrote:
> On Fri, 27 Apr 2012, Artem Bityutskiy wrote:
>=20
> > From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> >=20
> > I cannot build bcm963xx with the standard Kbuild W=3D1 switch:
> >=20
> > arch/mips/bcm63xx/boards/board_bcm963xx.c: At top level:
> > arch/mips/bcm63xx/boards/board_bcm963xx.c:647:5: error: no previous pro=
totype for 'bcm63xx_get_fallback_sprom' [-Werror=3Dmissing-prototypes]
> > cc1: all warnings being treated as errors
> >=20
> > This patch removes the gcc switch to make W=3D1 work. Mips is the only
> > architecture I know which does not build with W=3D1 and this upsets my =
aiaiai
> > scripts. And in general, you never know which warnings newer versions o=
f gcc
> > will start emiting so having -Werror by default is not the best idea.
>=20
>  If the function has no prototype, then it cannot be reasonably used from=
=20
> outside -- perhaps you meant to mark it static instead?

No, I meant what I meant - MIPS does not build with W=3D1.

--=20
Best Regards,
Artem Bityutskiy

--=-yeAv7sbnRzUmnPVNgf5D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPpiobAAoJECmIfjd9wqK0CWgP/09IEFhQNvpYLax535k9UJp8
l7BHh7CoIUy8UOqwz/ofe/oG7mdUgap+Lf6SV97jfGGm5wEhrqrgwFPSo1G/wv0K
MYOPcoRVizR+0WsHoksonhQ/34DlVUV7hIiOQPWv4aYeZD+npv9c49icW6z37tny
DcYuSASQs0X6MEa1Y724LD7xYqvwTB+hcnnO/C6CsPT5VKf/Ul0NeFM0eojUsuWz
lEVOps/GetRSqXLl7ft3M0kpIIk2CDJZir3QWeJyMKDGMC+r0rSaeS/bTiZDNcU7
CPx3puJKdBk2qyAz7kSG7PZSnRWLgWCdZ/n9+pa/R0YxVF+gTl1Uo2vGDGbnWJ9B
V+8cG8kFJr4bH/ZLCG/n78252tTkow555eSH1WnGJJ4DGkP2w7LlcoY13Wse+2vQ
x/2nGnFq0WPasxsv/I8iQ0JHC3jqG2bkTDqfbYbswzgAAhDsRU41OooUCIFGSSdq
mrqQoJTIYPwWiSBIJQUSJLA6UQkNT5vbSeJ4Ia4xtBCDJOa2SKiQXv48+XSos3GC
kxa9oa34EpsPiSIOb0T7gMS+f/sm3GycU7w3Dnme7WxfQT/MGmV8OB2dVhG0TmEb
Z9MYry6Lj5GhsFoiI46MLFfnUI/eQT9kOuJLnvv+x4dC5BFAGWW15Ha4Ub0ayfls
hkwaAo78S4DMR941lWpY
=sbZ9
-----END PGP SIGNATURE-----

--=-yeAv7sbnRzUmnPVNgf5D--
