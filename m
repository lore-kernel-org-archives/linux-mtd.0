Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMGo2-0002kP-QX
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 11:19:59 +0000
Message-ID: <1349954405.12014.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [MTD] MTD driver for LPDDR2-NVM PCM memories
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Date: Thu, 11 Oct 2012 14:20:05 +0300
In-Reply-To: <1349385434-3073-1-git-send-email-valibert@micron.com>
References: <1349385434-3073-1-git-send-email-valibert@micron.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gTSxOkeZBbAWEsiVisx/"
Mime-Version: 1.0
Cc: arnd@arndb.de, lporzio@micron.com, linux-mtd@lists.infradead.org,
 valibert@micron.com, svenkatr@ti.com, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gTSxOkeZBbAWEsiVisx/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-10-04 at 23:17 +0200, Vincenzo Aliberti wrote:
> +menu "LPDDR2_NVM memory drivers"
> +	depends on MTD!=3Dn

Just 'depends on MTD'

> +# linux/drivers/mtd/lpddr2_nvm/Makefile

Why did you decide to create a separate directory for this one?
I think you should just put it to 'drivers/mtd/lpddr' instead.

--=20
Best Regards,
Artem Bityutskiy

--=-gTSxOkeZBbAWEsiVisx/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdqtlAAoJECmIfjd9wqK0sYkP+gNPs108PCilDyDjT66v+Cr+
kA/nyRh7PLJE3TWIo6cqwKuAgzU0f2LPXA/r81CmNF48iHBreE1BC+9UM593zzTp
6aTx7Y76PXS1NwrcjuMVDqFaxWVQW8NBStiim3nX0V1oOL19yhITCVkrQW87tlK8
nWpqBPPfHfhWdJlLVcDIc54Rz7+0EMC1CjPEu5h/4PH3dQ39TeFr2YigmyEO1Eek
sduMGIDjrvZ6VQWUFRfTVINippEFpexB64lZLelswrHbc+m/wJME9RI+g4aUp7N4
qhSjtfPnR9r1pA8uUhqYJkxByEfjRtdLGgBiGUBbHY7PVxHBl+WW7Z1yobbNIsmC
AQT4fC9NOKMO1TYicTF5UZiSfxECs11TqJLsy2SDtLrts8RB/fgw9wj7gBC/0mP8
MbSkUE8BvF4oyt1EY5biDLCWCmxsoeZ4+PA2wQyzEx+yVGAG2C/Lbz0k7WNVBHyA
D6ej6svEyn3JA6EytepXJzecDa2Xfg4UYdyXOiXrBfocP+XMs2hLgmjvf8ERXXgu
RAlAG7mpqVuSROm6WqclvjqwloHT3nXdyoJt7VUqGzmw/xlNveovzMgSOEXDNvKu
AZozcfDlE1T4B9QMGamN6qhQBrKiztFfx0bwNOPgS2/N7kMb2yUoKM7p2IcOFeRo
HWSb3gznj6u5miWE2M4X
=whJC
-----END PGP SIGNATURE-----

--=-gTSxOkeZBbAWEsiVisx/--
