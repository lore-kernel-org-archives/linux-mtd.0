Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWAxT-0006QZ-6z
 for linux-mtd@lists.infradead.org; Sun, 20 May 2012 18:34:23 +0000
Received: by laap9 with SMTP id p9so3847332laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 20 May 2012 11:34:21 -0700 (PDT)
Message-ID: <1337538856.1745.10.camel@koala>
Subject: Re: [patch] UBIFS: improved comment for data node's format history
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Sun, 20 May 2012 21:34:16 +0300
In-Reply-To: <alpine.DEB.2.00.1205201334080.26953@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205151101100.17750@eristoteles.iwoars.net>
 <1337087022.2528.204.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205161451250.27131@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1205191027340.18672@eristoteles.iwoars.net>
 <1337427288.2041.24.camel@koala>
 <alpine.DEB.2.00.1205201334080.26953@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Mmh7S1UaRasXYBzR611V"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Mmh7S1UaRasXYBzR611V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-20 at 13:35 +0200, Joel Reardon wrote:
> A few more lines of comment on ksa_pos field in struct ubifs_data_node.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

Pushed to the "joel" branch, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Mmh7S1UaRasXYBzR611V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPuTkoAAoJECmIfjd9wqK06BcQAKVh5E5LQojwCBEz73YBQNIR
H2+ShP2utHVPz1LXlEwiGpnDCP437H0B6S7FWfc3O1Bo9z9twOc8/vEkkPmUmZx2
iJUaVCchMHgf39+LpzfhpvoAnAonoMV77/VK3Ukug5xSeX2fC9Z8P//of4nrw6N7
L/Y1ekAzGpfLSs+a0UeLZfxqIqGnU2OBKymTok51vVLDmLskHQoslc4QDVPcxH8a
Y1LFVAhlBWtleWGhdYIY8hPr7A6Ss5tm5zyYaakC/fpGyI+524wv0ZtAg1ZrIw9v
usRA3of8NWpoMLKFE0tTCH/eIBkknnCTf8ksd/Q6BcbsH0XLV8Z7GIFU0xkXZaqE
iGE1kj4d2SdO2liYvXaCflB9agvp/ekNZhNcozUHCDcxgTSzGDHJeMv7kBWuHeUq
Bjy/BZYTZFNApuz2RCveePdDi34myiE2VFmLiTzU0FC0Vl2S1WGEqGTrUEy3Ywwl
kH2z1m6mlhcbPRYT3Dj2o+Wr7uAeSJDt0fu8fKPyc3SeRQlPrZbaA/aXwJVydjYN
ocpRT4LO28JI3cEsDS/47YlxSQkVvqiv848gyl1xx4Ccog6efrmztUjO6NrxHx2S
TuDZru/nhUL8oUf2U61WXMHYsYW2iwJKFJAMzvwQuuLj2Jk05m6FNAtR4EmWYjAZ
1iqmZAcdQ0ZEfL8/dv9V
=7Gys
-----END PGP SIGNATURE-----

--=-Mmh7S1UaRasXYBzR611V--
