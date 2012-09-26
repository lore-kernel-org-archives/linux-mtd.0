Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGmDP-0004t6-83
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 07:39:28 +0000
Message-ID: <1348645171.24309.21.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd: prepare place for BCMA NAND flash driver(s)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 26 Sep 2012 10:39:31 +0300
In-Reply-To: <1347481275-995-1-git-send-email-zajec5@gmail.com>
References: <1347481275-995-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IRnCXduuUgGLDRD4ERHM"
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


--=-IRnCXduuUgGLDRD4ERHM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-12 at 22:21 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> +config MTD_NAND_BCM47XXNFLASH
> +	tristate "Support for NAND flash on BCMA bus"
> +	depends on BCMA_NFLASH && BROKEN
> +	help
> +	  BCMA bus can have various flash memories attached, they are
> +	  registered by bcma as platform devices. This enables driver for
> +	  NAND flash memories.

Could we please merge only non-broken stuff upstream. I understand your
intentions to merge something non-working first with a promise to make
it working later, but I do not think this is an acceptable approach.

Why exactly you mark this one as broken? If it is R/O so far, and
reading works, and you tested it (how?), we can merge it I guess, just
make it clear that it is R/O in Kconfig help text.

--=20
Best Regards,
Artem Bityutskiy

--=-IRnCXduuUgGLDRD4ERHM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYrEzAAoJECmIfjd9wqK0ytcP/AyFaxtP/JHa1m5av7nBBXJ7
jGVIMRZFrnUfVIhvuP9ktzRU5ifUhsR/JtNgTIcYLqz5+juS8HzAnBMLwWyRFNbp
JHr74iF1qhAaCtXtJQ9sn4+7aD9JoZfPFXA6/JtOVpsKehppRskhcRAGQEr8PDsQ
fLFFksMj93F/tXFNiRsRSd9bPoZA3GjHHWLtK+t1XArxcalmdX7/3OGAfIsMZVvk
romTgWoDv5Kp/z4p0ccMaE24K+ys3OxilUA/BHytCaHVT64r4AXOrrg31RKdO6k+
pK4xU5gbTYmXmMYcJkSGexJh7OlR6f8j0X25dYPPMC+VZcpMluO4Q4ItuCNSyLiR
hj55071hS7Ka6V6w1oCGhXmNhhJp3UzY5Bxx1vr0dxa5GSZkYVhJu3Lg2ylOZNA3
IDgq7XiaoNSZHluhDl+BaD+mUHzDFlQyC4kKCszsrCBT5lPPgI2PQZOwvQtBrcIS
6jSlNhHWFhIIv/laDS2jkabdV01TUacz2e9nQCG+WJGULZOmEtFVgcquAb2xgjCY
EZpMxh5g+hLd9dy8FDmmTwzJS33iub+KJlHU65z5ufUm0xlZHRu+XOKqSWqTJp9+
4g8MqE/Zyzeu2UepDx+8WGJUJ6ecn8cu8a/enMHAOGxv7xlIiYNYyeikuCXOq3LH
SvJjfOQUNuRlpWhmld5v
=qBK/
-----END PGP SIGNATURE-----

--=-IRnCXduuUgGLDRD4ERHM--
