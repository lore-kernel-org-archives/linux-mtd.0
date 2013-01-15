Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv7xJ-0002uc-QF
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 14:57:38 +0000
Message-ID: <1358261813.2731.149.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] davinci_nand: fix compilation with CONFIG_OF=y
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Date: Tue, 15 Jan 2013 16:56:53 +0200
In-Reply-To: <201301022322.27541.sshtylyov@ru.mvista.com>
References: <201301022322.27541.sshtylyov@ru.mvista.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UzWP7rdkLnHO321S1Btk"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org,
 davinci-linux-open-source@linux.davincidsp.com, hs@denx.de,
 dwmw2@infradead.org, nsekhar@ti.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UzWP7rdkLnHO321S1Btk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-02 at 23:22 +0300, Sergei Shtylyov wrote:
> Commit cdeadd712f52b16a9285386d61ee26fd14eb4085 (mtd: nand: davinci: add =
OF
> support for davinci nand controller) obviously has never been really buil=
d
> tested with CONFIG_OF=3Dy.  Now it prevents DaVinci family kernels from b=
uilding:
> all due to stupidly missing semicolon after a structure initializer...
>=20
> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> Cc: stable@vger.kernel.org # 3.7

This patch is currently sitting in the mtd tree, and I believe will be
merged to 3.8.

--=20
Best Regards,
Artem Bityutskiy

--=-UzWP7rdkLnHO321S1Btk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9W41AAoJECmIfjd9wqK0MJEQAKeYHXGOuYHGB9oOv25C1kJE
MlYaCvJ+PyDdc3TmxCXAVkyHz0m9f1Ts6dAxsfn1PhTa+BYCB+faEagdaMp3g7NC
3ssSWM3Gk336O4we4LDv2nqnEsHNUPVYg9ijdtv6Vo871AuE6w2v8QwkV2HxEhIy
iO80pXI/j1TQPW4ixpfxWZBi8QVvaaznR3WxYFgUxCpUbd9swdhVyFk3HIoAWTuS
eMGETJy3/jxs2ihvYYSw54flMuK3plWA7V22NIXwtufsybSXfPH+8WDfuOE/3Ja2
VdNDgufOKE502yxSgmdyheJOcx5+m272g1PvpM9onQLdMCn8DwJ6D87Miceop7C1
A5mgTf98dvRzrB0Z1jEjseA+UaG6wTGAbvRs1AbrK+1g0Zlw6VA+h3IH9Ijr+ZB4
4EpoHHFkLZTrJbqBIq/Ntj9O1fkDTffecX2SP0sLHaamgHMALDicYrG3QtthNOJb
ed6kNFyW1Da1sOTzsYH7MbPKTq/VH2e2heZ5ZvYxada5jwuBTqKN7SOM7y+Yvz9U
08R90mIWd7w6Vr8sc8rt+LBsfjzkwZI52xml4AwcjHwg3jZH0P/2H/gu5liVkfr+
0pbTlvdF4F1my8ahq16kJ8UwJ9tuR5JnBNoQjBIC7TDZVGbFn7edvW4HfrAvQ/YA
iIZuI3jKtPzzzvs9WMom
=bZX3
-----END PGP SIGNATURE-----

--=-UzWP7rdkLnHO321S1Btk--
