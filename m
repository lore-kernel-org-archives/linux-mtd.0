Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrNoO-0001zf-L4
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 06:32:42 +0000
Received: by lbbgg6 with SMTP id gg6so1732047lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2012 23:32:33 -0700 (PDT)
Message-ID: <1342592816.31927.2.camel@brekeke>
Subject: Re: [PATCH] mtd: physmap_of: Add "map-indirect" DT property
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Wed, 18 Jul 2012 09:26:56 +0300
In-Reply-To: <201207171156.45375.sr@denx.de>
References: <1341303991-6219-1-git-send-email-sr@denx.de>
 <4FF7E253.4080604@gatzka.org>
 <1342471312.25411.30.camel@shinybook.infradead.org>
 <201207171156.45375.sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-XPK39lMTzej+1B4aD1XT"
Mime-Version: 1.0
Cc: stephan@gatzka.org, Albrecht Dress <albrecht.dress@arcor.de>,
 linux-mtd@lists.infradead.org, Anatolij Gustschin <agust@denx.de>,
 David Woodhouse <dwmw2@infradead.org>, Stephan Gatzka <Stephan.Gatzka@hbm.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-XPK39lMTzej+1B4aD1XT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-17 at 11:56 +0200, Stefan Roese wrote:
> How about "no-unaligned-direct-access"? Pretty long though. Any other=20
> suggestions here?

FYI, I am dropping this patch from l2-mtd.git.

--=20
Best Regards,
Artem Bityutskiy

--=-XPK39lMTzej+1B4aD1XT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBlcwAAoJECmIfjd9wqK0O20P/RYhjl91zkrDQDHEWClxhGhn
x2l2S3Z4lVPSYC9DF0QbfW3yJb7GFyj/UegQOC0O5gvCMxfWGFVnsyIDOhAGzDs8
Wfm+8cGmIgwzUfTs/ZtjTRtPJsZ9hobtwkG2TvhpW+2J6HkMqJNuRvv4oDQEZQF2
b+OltfaDS4Um7Z2bzoRXknOfqk4Fmy/oXxsAZjCFHf062px7jZLEw2aUFH5Sv0wo
oqYUdO33DofwYEJzZw56WWiRV8Im7PulndVNrWCSPOEucAmRq8rJc6bUr0ZT9B5W
PT9vKHDniwaGqulwJrucdmIFiK1w/7oKT+98m8LfMzfxMLsuFLPLxaxWrro7aZE8
/nxfoMtPEIUeFxNpSnh4/TIHFKFYmTS06h9+pKdW02N4f1lzgm5SHzHiXHduKUPa
tMlhwIeYoQadNgNHMobwjy6fTGKoj5Zniw7+iTubGKI2kjuPsTVOZxQ1qMU1q1gI
qEkjf29I0f7RhrCCfGgF1j2NOmEWPGVcIA2MOgRS57QOiLPktuyoqgy9+aBthyff
DaCfJ9CsWRWoetYctIybw50rvraLmVDm2wUt7ABVDGVY4aRbf6QAPnwH6jilUSnu
YL1SxKfdhYzgzKYG0UsfASldhykhQgKwhhOTb/bIabkSHLHgiRXkanB01oIaWbBh
1vdxqc588KJmwVv3MlOG
=WgKH
-----END PGP SIGNATURE-----

--=-XPK39lMTzej+1B4aD1XT--
