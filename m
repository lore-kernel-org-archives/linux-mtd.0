Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2M9u-0006X2-Mq
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 13:00:15 +0000
Message-ID: <1345208698.27859.77.camel@sauron.fi.intel.com>
Subject: Re: NAND Flash Programming for Production
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Futterman <joel.futterman@iphotonix.com>
Date: Fri, 17 Aug 2012 16:04:58 +0300
In-Reply-To: <076270803FD11A42A33057E83F7C81390220DFC08FA5@AUSP01VMBX07.collaborationhost.net>
References: <076270803FD11A42A33057E83F7C81390220DFC08FA5@AUSP01VMBX07.collaborationhost.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uAH/ZyLHKVKdZBkkIKdU"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uAH/ZyLHKVKdZBkkIKdU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-18 at 16:54 -0500, Joel Futterman wrote:
> We have implemented a UBIFS in our embedded MIPS system. We need to deliv=
er our code to a vendor that performs the gang programming prior to product=
ion. They use a BP Microsystems model 2800 Flash programmer. What format ar=
e the files that we deliver in order for the programmer to create the UBI l=
ayer. They are unable to produce a part with our UBI system properly in pla=
ce. Is there a function within the BP Microsystems programmer that they are=
 missing?

Here is some information on how UBI flasher should work:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

If you do not have a possibility to implement a smart flasher, you can
use a dumb flasher as well, just set the 'fixup' UBIFS flag, see here:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_free_space_fixup

--=20
Best Regards,
Artem Bityutskiy

--=-uAH/ZyLHKVKdZBkkIKdU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLkF7AAoJECmIfjd9wqK0gPAQANCmQLGhS5Sp/Ak3xWhYw+4h
5Y/f064jqgoQkMyPTh3s2vRsA2Jx994gZ0yCaDai+svMrkk5mKtbVyH8FECFQrIN
BZzn3Musiy2liWd4IPI26StgeGuiW8Glzc+AcB/S/YwAd2hhvgZ4w9QWxySPXq3M
odHh8jLbZsJHcwW/dJZcT+M/y8wbOJzHl54WA8mmp175KBpkT8QfE1/Lhcoy7OSf
yRrq7fVLFeB8ufy4fK3YDTFmGEuCmCpEN3vj8079S6Ao6iyualXUw57eT848YsaR
dlxdpQTSUwaNKJAyxjSeepjg6e1VfQSj1QjZuqREikMixW0JRLiZyOLOjcK58ut9
ak5tzsgKONBVuWX2+A8Pq4JHDkphbMKq39TA4poXQ2z5jAkN0G1qZXYeluAMMDC6
zYXY0i3z4pFIMRKezEmlj2JCGn2TFigCl8N6C2oFLEujaRAzRayp+keZ/UIyFoai
40uJ/1GFnT5kYmJZHdWD3APF3r0jv9fsveaFnymVFW3y5ULagOJUiDheJf2jtZ17
gOtMaGG4AfTuaC6HCd7xMMhaRpkRo363B+3dCr1ZeHVELPgJi46UDiZBc22mwXoP
dSQ4ep5e1tVp/se2D16hVidFOaVWFOELerexZPe2FqIiH+rqowlksZjdTWp6MLwk
Bs3+WDf1Ai/50qmuSI0q
=og0e
-----END PGP SIGNATURE-----

--=-uAH/ZyLHKVKdZBkkIKdU--
