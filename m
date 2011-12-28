Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rfrgz-0002hO-LI
 for linux-mtd@lists.infradead.org; Wed, 28 Dec 2011 11:29:10 +0000
Received: by iadk27 with SMTP id k27so24260799iad.36
 for <linux-mtd@lists.infradead.org>; Wed, 28 Dec 2011 03:29:06 -0800 (PST)
Message-ID: <1325071857.1165.111.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpio-nand: fix build breakage for !CONFIG_OF
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Date: Wed, 28 Dec 2011 13:30:57 +0200
In-Reply-To: <1325071137-4063-1-git-send-email-jamie@jamieiles.com>
References: <1325071137-4063-1-git-send-email-jamie@jamieiles.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-U6G99BFFx4MrQXHuNLg5"
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


--=-U6G99BFFx4MrQXHuNLg5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-12-28 at 11:18 +0000, Jamie Iles wrote:
> Whilst adding support for device tree probing I dropped a semicolon
> resulting in:
>=20
> drivers/mtd/nand/gpio.c: In function 'gpio_nand_get_io_sync_of':
> drivers/mtd/nand/gpio.c:237:1: error: expected ';' before '}' token
>=20
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

I've rolled this into your device tree support patch, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-U6G99BFFx4MrQXHuNLg5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO+v3xAAoJECmIfjd9wqK0X1UP/2ldRt72gZMJ/Cqfw7mNvpv+
HMIYav8/EX5kTNy3MNwmsBUXBlfEb/IAjjqRxUFHU/W47AAIP9h2EdBXNBcZzvcL
dthXwfbOIJNLOQGSVv0Jrrk5z6omLKVtPWdFnBEDFrq61RRmGUZ2SnBJeYf2njij
n6vNDrewrNHw56iV05ST56T7u9I6lZh4wZtw205ppycu9XWcRegaO5+2CQnUq3Jq
yA5DWXBFIj2avmei/flxvmMHVOFzasbfcMZiXksYLA+ihwS/eU58PBXjMaKtD9AZ
6/AHg5tMT1oj110KDXCmP6lQh5/ZglOXSL+rviWqqLnbi0Ll7X89VzZD6VDwOzSV
nOzAQSsKtVRrPIq40/JhRo61kxUU1Hudr6PVHEmfcJwfMOngGHt2HkBhG4EVCsCz
Jfkn/b4KYO1Qrph15HpkljsnYl6sJQbra4CnyYkiiFjyzMy99R56+qRRw61LS+qT
ywKGZSbhj7EA9Y6IyO6Bt0+Onu0Jq3eta6IN0sK9aUJrRAkAGW1cTVHutcoz6Q5c
6Lt7DtWc3k1ShZU05l2w34Ic1dyt9Hdii0v9PiCSnZrQKaOUxepbn3w33+Gr7UXK
UrcD8zkgOjbM6vq3/f4as7ullpjLsfRRhpqC0PUw2orJeJr3QCRa7Dh8JmeirQvZ
xGEa5V+R2gfEVNghtd7e
=VLXz
-----END PGP SIGNATURE-----

--=-U6G99BFFx4MrQXHuNLg5--
