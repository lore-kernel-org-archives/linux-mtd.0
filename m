Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T33Pj-0007d0-00
 for linux-mtd@lists.infradead.org; Sun, 19 Aug 2012 11:11:27 +0000
Received: by bkcji2 with SMTP id ji2so1928176bkc.36
 for <linux-mtd@lists.infradead.org>; Sun, 19 Aug 2012 04:11:23 -0700 (PDT)
Message-ID: <1345374680.1832.5.camel@kyv>
Subject: Re: [PATCH 6/6] mtd: s3c2410: Fix line over 80 characters warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Sun, 19 Aug 2012 14:11:20 +0300
In-Reply-To: <1342434747-27622-6-git-send-email-sachin.kamat@linaro.org>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
 <1342434747-27622-6-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-OQexK4VN7O7Gi4aw1TwV"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, ben-linux@fluff.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-OQexK4VN7O7Gi4aw1TwV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-16 at 16:02 +0530, Sachin Kamat wrote:
> @@ -540,7 +540,8 @@ static void s3c2412_nand_enable_hwecc(struct mtd_info=
 *mtd, int mode)
>  	unsigned long ctrl;
> =20
>  	ctrl =3D readl(info->regs + S3C2440_NFCONT);
> -	writel(ctrl | S3C2412_NFCONT_INIT_MAIN_ECC, info->regs + S3C2440_NFCONT=
);
> +	writel(ctrl | S3C2412_NFCONT_INIT_MAIN_ECC,
> +					info->regs + S3C2440_NFCONT);

This patch makes the code look uglier and less readable. Please, align
the part which you move to thenext line with the opening bracket ("(").
The current code uses this style as well.

I did not take this patch.

--=20
Best Regards,
Artem Bityutskiy

--=-OQexK4VN7O7Gi4aw1TwV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMMnYAAoJECmIfjd9wqK05Z8QAJbyaC2FE7PiEmhIjJgh57aP
tv5GJI6FI6pa1w+ROveJkOcIBWBgcxEfJ2XATUiN/5d1Pu+DA3w5t49kFUC5lYeK
78+O/SIfr6e+IrQGIeJUt4h7cwLiQuIaRhs6P5ygIPxoHlkTnYOBJIa9tKObQdiA
rKwbu/ts/WBzgE1UOwKvet0OL+1bdYTUTS69hmHQZD9wvbyyszoAj+ybPzTiMPjz
DTtRVhtjHjKQLUHOGixXo19zErHhplIZWsg91au4Hxmb82878+3uwbMFK74N6EPZ
dbm5hoVfN2gr5WupyTe00axAOvcjKVLc9i3fB+U61V/UvUytLqKFz5hcsWaw1DUl
poze8H6oyOXl/bO96x9DNY/m3CniLwVteOzbRd3OIkbhG+JYbz+NGkrJbGpxDDIP
I/RFr2AdMhjYz3GodXFiLLRgIS+w+Cf/33SM88fB76++/DJuLzWgMnotHWHZ4Lkb
vv11umPC8769s9LtfkVjxd0goglRG8eWzqCuWQFNDV7cnfNpYyzWp7bjWqa2JTtk
3C8Q6J/rT4tVSsCBwcmU0nkXsoe9pG/hUu+WKrZiKsvxD8yJ7MbPGtpGFUiIfs5S
RGYgPPXCWMFFzhjoLz0qUPQOgsmSTcK0dG5mCUXo7x/9ppmi9wCNR/ya+6AEL5Lu
WR8C9WWVaQPmDsfv47pV
=ZYji
-----END PGP SIGNATURE-----

--=-OQexK4VN7O7Gi4aw1TwV--
