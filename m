Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tj6vk-0000NV-Mb
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2012 11:26:21 +0000
Message-ID: <1355398036.3400.45.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Date: Thu, 13 Dec 2012 13:27:16 +0200
In-Reply-To: <50C5FD4A.6090405@itwatchdogs.com>
References: <50BD01F8.3040003@itwatchdogs.com>
 <1355147097.2657.33.camel@sauron.fi.intel.com>
 <50C5FD4A.6090405@itwatchdogs.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Wd+bkW/LItUIkKEkkWqu"
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


--=-Wd+bkW/LItUIkKEkkWqu
Content-Type: multipart/mixed; boundary="=-rKzvESVxwoLeYfSYvKr8"


--=-rKzvESVxwoLeYfSYvKr8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-10 at 09:18 -0600, Zach Sadecki wrote:
> Always report corrected and failed ECC stats back up to the MTD layer.  A=
lso
> return max_bitflips from read_page() as is expected from NAND drivers now=
.
>=20
> Signed-off-by: Zach Sadecki <zsadecki@itwatchdogs.com>
> Acked-by: Huang Shijie <b32955 at freescale.com>
> ---

Dunno, may be your patch is corrupted or something. Try to save it and
apply. This is what I get:

$ git apply --check ~/tmp/zach.mbox
error: patch failed: drivers/mtd/nand/gpmi-nand/gpmi-nand.c:921
error: drivers/mtd/nand/gpmi-nand/gpmi-nand.c: patch does not apply

$ git log -1 --oneline
70df8b3 mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND startup prob=
lems

I've attached the zach.mbox file for you.

--=20
Best Regards,
Artem Bityutskiy

--=-rKzvESVxwoLeYfSYvKr8
Content-Type: application/x-gzip; name="zach.mbox.gz"
Content-Disposition: attachment; filename="zach.mbox.gz"
Content-Transfer-Encoding: base64

H4sICIi6yVAAA3phY2gubWJveAC1V/9v4rgS/5n8FaNKT4JCTAKEEFiqcoXertRuq8I+nd69FQqO
A76GOGs7bdnb97+/cQKl9Muqd9KhFoI99sx85jMfm3Mp1vBdhRGjt/yU6/tQ01UklopQnLgUKYwZ
BdcBx++7vX7bh5bjtqwxS/gdkyyyZ6IPEYvYLU8j93S5Dnlillo3jDI0ifqw2OB60moFBJfivw/3
XK9gejm7Bh5BvHA9qrJOyw+Cb3QxME4bxqNxXDjb+7adnuNA9Xo6q71w4DnEDTzitr3D/Tnz17Lb
6wRtx+dLSnrGxHO9lu92g04wsF443PnrPvOnc5na16Fe9eHDW5CdPIkrNtgWgGSUkbyEtPpsgMDv
3YB0MPhukcDXGuZjwfqBLIVYJqxYVCQ0MRlNTUrhN1/xluv4jhO0OaXE6xhsW8T8OcTxidsj7a4F
VayR4iIdzi6md25zOr24awPl2YrJ4dXs4+Sm9hLut7Ivs7Kn1+d9yEKloLoPECkgMK8URPwmmSyk
ieLLNNRMwUHKECrImFxzrVkEiqURkzWgCWeptnk2PDAeWKNcr3CG01BjavYNU3miVf8QsgGoLB7+
JE7rbdb/pTgtUGudEVPV4ZupXzKlwiWzP42ROp5z5p2POyPSdQKn43gvKTRG3/1XChMUhelgYbqO
Y51Lk9B/QopcL/3+jJZfFJP2aInAmZ2/8yQJmx7B8v7mugO44Gn+AA+97rzbGYC867s+cWrwK+4l
mubZgtkqNwkvuIzKkctPlxP73yXB+uDiiNGCD6+IwYl1doYziXFir3V0mnClFeFpLDHcMCJCLk+s
ab74g1EM7/fr0ezs41dAyz4sszXvwyi5DzcKJMuE1DA5OwOlQ60gTCMcNI2JjfYwX3AdJzxTSNcY
1SmlTBWA/zJ23HNsCYTbcdovwanAh0IUOr4T+KTV9XzSbhMarllyqsJcipTEHOPVbJvPJ8O7LNkU
8vcX154JfEZmzzYZVlmzB93MEiTlAOgqlIrp4dGX2bndOxpALOQ61MM4EfcsOlSgN7n2m30l+ZIj
f3m6tD9dI55dn/hGfT3S7X5Fg8mdSPKieaYilxSjcNsdv+V1kY+kFSDjW9vQ98HKMFWIqT1JqYhw
5z70EG3LOqwMFVJiDbE9TGVirD8+7su1COkt5BloAdjDcDkbQxJumCSAFVbCeqWUpYpKZMk8wxaq
1kwXcgXsISsdFfOfR5/HEElzJilIxT2xrCn2MOqViGN7sXl/n4zoLa4yKz7mYbqE6Yr/wRl8WLRb
gYcSoNEhY4qGpaKcWLZtW7Dz3UTONlPMvWl4ax8+EQo/AKDlQ337sl++cC8XYsTNsCFdsqgBPeAp
dq8pmKrWaygKAWpUwsoBu2ZZEY9jsO0l1xA23xnK4p2GFvYyewCPRm7HjQlxvba3iDxUJqfb6Zj0
3+3TwpTf7/f0FOyg5TZ6UDcfPuCAoRGniIcuhGHOKJ3vuaG0zKk2ujFHbRFwjE8N2I6aXed0xTM4
Nu8NBLoSrcN5GEVyrrEuEOYPPOGh3Myz1UYNjEGeqoJGhUfgh2OmXeHYhJSjtf3MuCT/y/HHFhlY
9WdTB7wfglO4K2YeX9ghZtRMZHIesUW+rB6Z5CHN1wsmTWv04V/Rf9OjBpjx2qAEstNt4M2oHnS8
Rsv7B6CsVLJwkwhcf8elNr7LbwbKWplIDFUMvwZ/FvYYPpOyejSRUmDYqZEJexEqFhXd/piEWWJQ
rCwFygZ74HqextSAV9nKxRaTyv+2wDSPAVsnwhYyIrNIBIrOOpS3oO7DLEPtguOmsStm5mZmvpup
6hVX++DLVPa8MN9rg72bCyEyEEhmKFmAVze8NeAKSvN1nhQS/Ch/eN8zju1KyYxKpaiwXXkkxG6g
NDbzh56hDpj5fMmEfbKfKa3nqHPK4FDfLoe/tbrMDI8dqPKCgYBiuV9nOELxHnA7pyJPNc7W641t
cvX6rrKm0NXjXRhDmM5Gsy/T+a9XV+Ma/PgBr8xNbkbTybhWK5lE8dDBuwLbxVPs+HLRl89nVzc3
k7PZ6JeLiXGOJNmCW68XBKkga8uoi/OH7Cdf+KkgfezKvhhQHz7tbZzE9+YxvsExXEuBXYK3tCfF
3R1q4j41VTdnm0iTDdzjZXV3EgpZrt970XyN18yUhRJNkfd0hV/xUC423pqhzOPOkqmVSCJS7GBo
ZEDZ7oug7rc8GUL1oGLYtSxd4i8IG9zaFqdXgTECg2nvleu52QE6B0L2U8tHHI3docaZr7r6VAYb
BzLY2C2uHbS4yV2IBQrWt5zjz1CTVSFzQbc4L3oefvwTImf0wT451IfDMSN4W+PHKuzmFP/O3qOW
9k7m+liEpypXRwhfuSQZbLbQvJbxveSa/Z2U8Wy3XOKTgHiWZf0f6d5fESwQAAA=


--=-rKzvESVxwoLeYfSYvKr8--

--=-Wd+bkW/LItUIkKEkkWqu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQybuUAAoJECmIfjd9wqK0y6EQAL5XEfT3x5Ugdhi5reRwsiB0
3QrLmO6fLC4MeeqiNXKlvi6rL08VkN4Uly/hGaKsDQZVqDwaJ8m5IdBUc9VztSjU
gdqi1m1bYFWAwfPsVg/MYEzZv/V2XgmsUSmNVcskL1MyUlCO3wiWOPXc9L71Zrk4
IR5To/I14+rms/W+YdZRqQcqTqLxP7vguHG+m/xpHQ252ORTrCEbrCKugXxGpjtd
Xwkc2nMScUW3MYJSg5uWMjnB9menQcF4syfnXc5v+YYehUCVuEmdtF2nKfzHYD6u
DtLyRo/j4Yz1fKUukNA0XRQOt634wAK6KKiA6G6Su38tcDk86yOF8zdZ6wfON1Sr
2jd2D3xgyg6xx8OKJuNiSFpuPJEGGfrDJjdizg/KD5hi7GoSsmbtLOOwbGVJVCT5
4qG+y85Q/Y884O+oxSxd96EGEn68x4jPnl3qpm0jzqdUYy4xaX4bCfnuJmZeFlMy
cJ8b+33MIrt0nxV2IR8KIqUqOTFTVoqkg3/rNaLglBkACEwtXl6jKY+KSvdyVtvN
MSDidyd+aPGUny+U/gUg8qHK8+P3Re+O4qgOtLzGKfksE69IyezWuG0FViiXbiXH
a7BT3XrCOw3+r9haxaVbuj0VCVb3CRb4MyUM5U+lS+zG6fJASXFaKHvq+We/YfeE
b0jMiVX3a0xfw7mOkc1o
=4kQ3
-----END PGP SIGNATURE-----

--=-Wd+bkW/LItUIkKEkkWqu--
