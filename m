Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STdNQ-0002UP-QM
 for linux-mtd@lists.infradead.org; Sun, 13 May 2012 18:18:41 +0000
Received: by laap9 with SMTP id p9so3606152laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 13 May 2012 11:18:38 -0700 (PDT)
Message-ID: <1336933106.1643.0.camel@koala>
Subject: Re: MTD: Add fixup for S29NS512P NOR flash.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Javier Martin <javier.martin@vista-silicon.com>
Date: Sun, 13 May 2012 21:18:26 +0300
In-Reply-To: <1336731341-615-1-git-send-email-javier.martin@vista-silicon.com>
References: <1336731341-615-1-git-send-email-javier.martin@vista-silicon.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-O7rENPfn1gB66h9A4Y7a"
Mime-Version: 1.0
Cc: Gernot.Hoyler@spansion.com, Artem.Bityutskiy@nokia.com,
 joakim.tjernlund@transmode.se, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, tabe@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-O7rENPfn1gB66h9A4Y7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 12:15 +0200, Javier Martin wrote:
> +	/*
> +	 *  S29NS512P flash uses more than 8bits to report number of sectors,
> +	 * which is not permitted by CFI.
> +	 */
> +	cfi->cfiq->EraseRegionInfo[0] =3D 0x020001ff;
> +	pr_warning("%s: Bad S29NS512P CFI data, adjust to 512 sectors\n", mtd->=
name);

I've removed the warning and pushed to l2-mtd.git, thanks! If you
disagree - please complain.

--=20
Best Regards,
Artem Bityutskiy

--=-O7rENPfn1gB66h9A4Y7a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPr/ryAAoJECmIfjd9wqK0yN8P/A6OXcBMlIFNgYUwKBXt975d
3T4ZB3QvhlROobOBBgF9MPCm0152FI3wRkboBv90Ma7Sf8/5ziXDP1KH/WCqyQSq
uDuEfT0c9hhMHqE6EcXvz34K/J6Jd3EG6N54TYXybCEH/zGkfef/3lM3/pi7AIFf
fVpc1SiQlwyFi5Q/hMhOSG27B4dGfHk9sBgD0nblJq36gbS3vp/TqFmNV0PPGWzE
gTlocxUF9AHy0q7FE1d1qVp7QyKY5WMUSuXMCzfnwkcZjO1tBHFAfxT5YWEBxctQ
ITe+8A0JN9gLHnC2QKhJgsEBg6Dscihn7jYGKVrzuI2HOopBNUqKuFWDz42ac1XE
QNvRtYeOUnplA32l8JQnJ8wQhh33MrLbX0eV4yCew3jVHJXud5YN0KBPhA+RXEMr
BG2fu1jwyHdgOmJdDkps1L12zFAUfzhi9aUCuY3eQ6UiLAv72uO0Wf79jAl4G6cV
h4F8ox32/0AcA74dtA9oM2X9R5zCBu3dyvciuvKdZcyFhpj2LaCby68Vx12dbvd4
dwrH6xPSnx5guAbV7g6P1kzRI5EYbAcZYGG8lhzywd2AI8sMh/vzn9NScpSRzM0C
DXNMRONb9AUjGN7sUkcoaA6dY00peESA/Rihb405z6LoOj8+BhWEDyDA49GmQlDQ
JEfcmTlyV6lDHz0OzRdh
=RLPL
-----END PGP SIGNATURE-----

--=-O7rENPfn1gB66h9A4Y7a--
