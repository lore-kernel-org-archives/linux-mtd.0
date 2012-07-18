Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrT3f-0006RT-3L
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 12:09:09 +0000
Received: by lbbgg6 with SMTP id gg6so2104376lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 05:08:23 -0700 (PDT)
Message-ID: <1342612972.7530.19.camel@brekeke>
Subject: Re: [PATCH] mtd: sh_flctl: Switch from tick-based to time-based
 timeout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Date: Wed, 18 Jul 2012 15:02:52 +0300
In-Reply-To: <1341410726-10562-1-git-send-email-hechtb@gmail.com>
References: <1341410726-10562-1-git-send-email-hechtb@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-AgJ6QFlEPV/EGajUF8wP"
Mime-Version: 1.0
Cc: Bastian Hecht <hechtb@gmail.com>, linux-mtd@lists.infradead.org,
 Linux-SH <linux-sh@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-AgJ6QFlEPV/EGajUF8wP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-04 at 16:05 +0200, Bastian Hecht wrote:
> Instead of counting down a compile-time value, we use a value based on
> jiffies.
>=20
> Signed-off-by: Bastian Hecht <hechtb@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-AgJ6QFlEPV/EGajUF8wP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBqXsAAoJECmIfjd9wqK0u94QAMU39xcd1UJTnb8LbX5biFSZ
S4wZT3cQAbonwcB4AZ4t2yljOG6Qln6u4eK2HKyQMLjicc2djINRTpwzmeKFmZrf
+0s47Xxy9a5p3pgL1hfbUi7s7UQEUvHUwrgYDSBJRmxXKhXeI4M8jpkQrnp14KYH
8oZZoknGB9Ljs0hZsZGnnRv01eQjlvy/AqKYVlSVmpkhXruwepSQcfcB5QvS71XW
zED0z4ktEmFbJPBcX8k7qoEFzLl3OGUoKy/Oa7NFTCvW5wBhTyrW0VcCFo1i8VzN
Em3pqW/1gLE4cqkkjpSQLkJegEwq7vkgmH6Cr4PrSGFIWJpBjSuymCg/+9zlBdeZ
+VwMrcta2OSg/wBRVo7R4yJ1DDfNSU2nRzVafWuYUjYLKpi8NUR8zpShxVP25ht7
2gYrZLpjT+2zqzLPH2s4xsiLf13F/hH8Ixt6b3a2+esZDXoctlxa90aPE0H2mDq1
aDyuNqPHr62CGDD+2/gjZ7Mx24E+FoF2ntkz9BASBfTzkxNdJ2qrqF5rCSDreSiD
mnAj/Ts/4L6Kp+naCj0Ns8/n8olqS0Lpvnto5L8CTrW4K6UW/1JEZDTVaxap4fCD
LelcRSLsgEUtYFLWNRsZc+G2fGIDVD5pdMgcs2cbE8iyqKWia7AvUMZqsB4vOIvW
WG0y1sFXb0clvsqemACp
=XToN
-----END PGP SIGNATURE-----

--=-AgJ6QFlEPV/EGajUF8wP--
