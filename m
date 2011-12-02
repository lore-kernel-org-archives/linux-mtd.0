Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RWOQ6-0002HY-FB
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2011 08:24:35 +0000
Received: by ghrr19 with SMTP id r19so3109841ghr.36
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2011 00:24:32 -0800 (PST)
Subject: Re: [PATCH 1/2] MTD: NAND: ndfc: fix compilation error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Fri, 02 Dec 2011 10:24:59 +0200
In-Reply-To: <1322783661.3729.39.camel@pasglop>
References: <1321942850-20012-1-git-send-email-tinamdar@apm.com>
 <1321998220.2222.22.camel@koala> <1322783661.3729.39.camel@pasglop>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ehafntal64DZ/ixkQCBi"
Message-ID: <1322814336.9400.18.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Tanmay Inamdar <tinamdar@apm.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ehafntal64DZ/ixkQCBi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-12-02 at 10:54 +1100, Benjamin Herrenschmidt wrote:
> On Tue, 2011-11-22 at 23:43 +0200, Artem Bityutskiy wrote:
> > On Tue, 2011-11-22 at 11:50 +0530, Tanmay Inamdar wrote:
> > > This patch fixes compilation error in ndfc flash driver
> > > ---
> > >  drivers/mtd/nand/ndfc.c |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > Tony Breeds <tony@bakeyournoodle.com> sent a fix for this a bit earlier=
.
>=20
> Any reason this isn't in Linus tree yet ?

Dunno, I've just re-pinged dwmw2.

--=20
Best Regards,
Artem Bityutskiy

--=-ehafntal64DZ/ixkQCBi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO2ItbAAoJECmIfjd9wqK07SAP/R1fteseq3AJp1nH1xNyfcgn
qhEWvsQuCeC2NIXIKBcMjBKQOI+uPkqizqaBmJcfZZLe5T7KRbB8HjUWd855Thys
reRSJjsLF+DK4gvlxIulc6msyil05eMAW/AUWiv42zY1mHEa95UMD0DzepJ7WCSi
NfEiLGMcjw6wigQMYo60LKKcdDiow/mOKbfFjgHqQjA61AKKKGmWVe3MrspjILI/
mqTHVV7mP5ARDEWn0nz3lzXskhe/xkY7y0j4s+ZhSyANbhLVsPHLjyUrJluegBwg
0EJI52Muz/rnLN0agLVPkImDsSupILNhQDw3jc/+MK2sx6wUZeNNDKG34Fkz1Qmk
rZMjhK3g11lRC8yzYaXg1h7rqtOLcZy0QQmOwngnyrGIPPPSBDNV5y5eSPrdS7mH
EEVzCN0wVh85URFM9s/bW/i06mOYihUBFbwLLz41iH3Gg+74KeRFvVnMfx0njo6j
zVoYDkJ7TeGHMH/4d4GAdoU5JfypYmwbHM/9Cq//wAsBj7wXZZFD794Vc6ai+XdL
nGmQqEvEZznTH7s4Fhr0BdI4GXUyeh24qdY4dPNyPFOQYZmNaXq/fIeB+E4TPXqi
2shfGnoeDqHAtVVI2ArPi5+23DWpws2Ar/yfB1zn5ec76IpSxU+XeaU6rKuCzHQL
ve1pUQAIniN/D6Dl6M7d
=ojc6
-----END PGP SIGNATURE-----

--=-ehafntal64DZ/ixkQCBi--
