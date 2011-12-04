Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXCy6-0003ie-4h
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 14:23:02 +0000
Received: by iaby26 with SMTP id y26so18948iab.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 06:23:01 -0800 (PST)
Subject: Re: [PATCH] mtdoops: skip reading initially bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Date: Sun, 04 Dec 2011 16:24:03 +0200
In-Reply-To: <1322831237-22044-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1322831237-22044-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gKBNVIu3xh4DL8PLVkBQ"
Message-ID: <1323008649.9400.61.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, rpurdie@openedhand.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gKBNVIu3xh4DL8PLVkBQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-12-02 at 15:07 +0200, Roman Tereshonkov wrote:
> Use block_isbad to check and skip the bad blocks reading.
> This will allow to get rid of the read errors if bad blocks
> are present initially.
>=20
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>

Looks like a candidate for the stable tree as it fixes a bad bug. I've
added

Cc: stable@kernel.org

and pushed to l2-mtd-2.6.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-gKBNVIu3xh4DL8PLVkBQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO24KDAAoJECmIfjd9wqK0T+QQAKzhZjRW5UJiJS23ubKsGEat
qZXm+1coYnA8ExMegck/eh6M7EhXrNgpDbVvh2HwRziPRzB5cj2oYaUAUlOK2Sc/
FepnPOZRb4Scnqs8U72y7eTzsfNEDNOcRLesFrlveUGl7gqHOFt3Tp9tV9Jay2Rv
kI50qmkspH5Xqha83MLgWI0sxeQePWztmnAu9ntCVV6A0Lf8lWcluU0w1k/FBrRI
eFq38/MBMauxwcS6F1jTWDnYoNrRbnaafiRDcDqVrQ2Sk+VGJPR9wNAgR7ywzop3
dZ4Sz7nCP6ms6eUk6PLFS3FMiHCt5QtJtNk3vkvI02BSbbyD8abxyArvQIz09eLU
ltDRvCWSTFXt7twe+UTxlRd+v5limc3tF9DbNoqDCFSCULVPnk74ozdFu5kxhv18
HdCBLCbWh5DeDQaQneuFYId4ycUU7sxP0TdOElDISxBlz0HS/XFMqTeGRNFBjrQo
3LNRk5i6xFskB0sLsYeQOfludYiByO5wBJjgbTdq4VZOBRdxCRmoQabdRl/64UEh
VP4Bnn3PCPRTBDQHkcxGy7ZofWlq7iLozsqgJiqkDDJeiWuPN0UwPtOq1HUbn4It
52F+vNmWNDWB/o7BEEXoo/9oSwS8lZtVepF2N+XNqjmjQutiCTn47ufpsbfCPxIt
AWmc5/oblgG9bAd5pHi6
=Gefm
-----END PGP SIGNATURE-----

--=-gKBNVIu3xh4DL8PLVkBQ--
