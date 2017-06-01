Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGLcS-00072d-7J
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 08:38:13 +0000
Date: Thu, 1 Jun 2017 10:37:49 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lee Jones <lee.jones@linaro.org>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/9] mtd: nand: tmio_nand.c: take in account partition
 parser types
Message-ID: <20170601083749.GC1477@katana>
References: <1496270458-6479-1-git-send-email-andrea.adami@gmail.com>
 <1496270458-6479-6-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline
In-Reply-To: <1496270458-6479-6-git-send-email-andrea.adami@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -	retval = mtd_device_parse_register(mtd, NULL, NULL,
> +	retval = mtd_device_parse_register(mtd,
> +					   data->types ? data->types : NULL,

This is superfluous. You want to check against 'data' instead as it is
done below. Otherwis you might get a NULL pointer dereference.

> +					   NULL,
>  					   data ? data->partition : NULL,
>  					   data ? data->num_partitions : 0);


--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlkv0l0ACgkQFA3kzBSg
KbZ3jQ//SMLSH7KRaP3ZgQfmpnqLUv6/xstDhcO1qz1+8ReMP+YL6fuTfyLQYjEJ
FLt0l1t5xFfZ0l/nn9T6vAkGW3VA6aqqftTs81PufJRuoqwALU2NBfqrM+Kd8BH/
YZOUilmBHK2jD+dHjQ1++bjFvri0ZLWShtZ50kh0WihlhhvOgndnDPSWt6QD1ZVL
0fsq2o1ygYz+TQgdflGuzUGhzUcaqAQmF3IQGTaswk+W1sGUls+elSWaau+R40uY
zHasxq3mEIef68HPf2mvzEkY7Y2z3Fjnp1cg+WpuUtJxxi+B3nvjjZxJIw94rx72
39uilSglZrpJH1WwVcr5Hm1MnvdkX8/3a7JLQh9PfVKp4e1Qd4A9VpUVqtpWPqy5
mzfd8RVjyLh5+Q67dzuqUHxQJ0VzsVbrwFFaPhPgMC8Xmb/drHKtsTXgCjhq3yz7
cCwu9pT4vhYJ2OC3l1DXedj0aTsORDvvyRTunp4F6ORXjHMIP9PAiXieY6WfOGGb
BN27KNxeTTO3y9Y1xnWRI0gf7/WWfKGsJ3kjl58HYe2VEw5kpEm9jha62UxWF7Xv
4ldwB9q2pPbSmvAtnTNeEJjtx9h82EVq74KNTKROqAoo0GIwTqyuB/9qQYyV1D1O
Z/oTut4Q7EoQNVqkoiRCJRiR3oJeTnA2xydXdFKnop/Afm3vo0I=
=KqAq
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
