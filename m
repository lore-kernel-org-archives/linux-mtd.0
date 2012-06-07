Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScYg8-0001v3-Al
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 09:06:53 +0000
Message-ID: <1339060240.6875.90.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4] UBIFS: compute KSA size and store in superblock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Thu, 07 Jun 2012 12:10:40 +0300
In-Reply-To: <alpine.DEB.2.00.1206062052140.31834@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205251509220.2989@eristoteles.iwoars.net>
 <1337952271.30969.37.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205301531220.6465@eristoteles.iwoars.net>
 <1338391121.2536.94.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205311211340.15137@eristoteles.iwoars.net>
 <1338459575.2536.120.camel@sauron.fi.intel.com>
 <1338460565.2536.126.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1206061202370.28118@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1206062052140.31834@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HBj7PDUNvFQ440jAsqb8"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-HBj7PDUNvFQ440jAsqb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 20:52 +0200, Joel Reardon wrote:
> This patch makes the super block reserve space for the KSA. It computes t=
he
> number of KSA LEBs and adds the ksa_lebs to on-medium superblock. The val=
ue is
> read off the media. The decision to use a KSA is controlled by use_ubifse=
c
> switch, added as a flag to the superblock, ubifs_info, and is controlled =
as a mount
> option. Validate superblock also checks these values.
>=20
> This is tested by creating a drive and checking the mount debug output. T=
he
> number of LEBS assigned during create_default_filesystem was changed to e=
nsure
> that remounting does infact read the old value. When the use_ubifsec opti=
on
> was not enabled, no LEBs were assigned. Integck was run and the drive was
> filled to capacity. The LEBs in the KSA were not used when filled. Invali=
d
> value for ksa_lebs were used and then rejected by validate superblock.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

Thank Joel, but this patch has several major issues with the KSA size
calculation, I believe. I've pushed it anyway to the 'joel' branch, then
on top of it I've added several clean-ups and little improvements, and
then on top of it I've added a patch which adds several TODO comments
for you. Please, take a look. I've also sent the patches to you
separately.

--=20
Best Regards,
Artem Bityutskiy

--=-HBj7PDUNvFQ440jAsqb8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0HAQAAoJECmIfjd9wqK06MoQAMavzvs6AkPYvyuPk/5zgpAr
KjDBcB1/tsTfqnxmnvDcLm9DIgnWMlvZJLRtQudDM9mH+1KpN6Tgkqs9iVpuHJxA
sGbdTux3pAeTKtLezz+9ybL3s2V3gnydO+NRER7y0fxJdAYi9+y1rKRyMmTO/nJJ
aMb1UMA45wl7YYrkuFujrIqpbYtJVpuTE3XajDDkYbiXQGtq3EOt2J2HXtGGKxYh
UN1bGlUgedRFz0vOotAWfub6cEK4a/eeD1tmKuze+xZcwqYSTOLJFT2vkwXM2x5W
pSuicSZAYxrRFa4HNzgAKWOMT/q147fH2YLgrZJ0G7IddeUApGfEYx4FAOX6Dke1
wTsQ++cBOUb3k4ilhS0fz8ZM5rrBICqK9kYyOVh2VeXYqL4YDYJ7uZGtF7dEN+Ov
dxucOutRdPeOFvfM6toJ4I4roRTD7WhE7VZCPy4WsXTIXlYf5HBqR86UT4yf8KpY
4s5rS297hpFk96dfC71yaEozU5sP4FXpp45hO7Xc7CODMpSOgUP0xp3+XPAaZl9T
ltyw0HaM01Mq6Y369mhtxGyoT5JM++2WBZ4lugYQmC079mE+z1s6EZ9X8KyQeMsi
ITSoP5HS5ZHXnRXdl/ErZhDnPG+8+Vujox0aFU2XU/2EmedRegOoPXgmCEuwQ83r
7wCrc6r4IhzNWGy1fkaH
=iFa0
-----END PGP SIGNATURE-----

--=-HBj7PDUNvFQ440jAsqb8--
