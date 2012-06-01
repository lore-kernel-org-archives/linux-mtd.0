Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaMqZ-0005Y8-9X
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 08:04:35 +0000
Message-ID: <1338538096.2536.145.camel@sauron.fi.intel.com>
Subject: Re: UBIFS master node corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Date: Fri, 01 Jun 2012 11:08:16 +0300
In-Reply-To: <4FC87383.2020303@intel.com>
References: <jq7t2r$md2$1@dough.gmane.org> <4FC87383.2020303@intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-D6R2B3BfzYnXnGXIBr0k"
Mime-Version: 1.0
Cc: Romain Izard <romain.izard.pro@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-D6R2B3BfzYnXnGXIBr0k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-01 at 10:47 +0300, Adrian Hunter wrote:
> You need to make sure you have this patch from the=20
> linux-2.6.32.y branch of linux-stable:

Thanks Adrian. Probably even better - pull the backport tree:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

--=20
Best Regards,
Artem Bityutskiy

--=-D6R2B3BfzYnXnGXIBr0k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPyHhwAAoJECmIfjd9wqK0rVIP/A/sCHzM5WRb3infwisdp5OI
BOc/FNvuM9yV/iIT/hFQsQtbr6WIQ/E+d1YVVq0uQp14RPfYTlqHp5vMixgRKh2e
bs4umKsuK48BDrMn1mBItWPBZJX9CarebJQURmD3V7gPSbHiWyJVCwP8cU49UUL2
f52IQU/fwpTILzjl8SQhJebpCtbnr+1+TgwBRhs9/te2OhtpMRjWYqxkr01GanVV
rP33VhOfCX8h89wZDSigIg+cykJt5dxQDMfUc7OVhZV4JB7X0WzkZ8PVMqVeBSNH
vWJNlwXy0t6WOTTqtCLA6IfMK3/GrH+wNIh5M3afQ0QZnnuxVKqX9txwcTwjhq97
MaoeFuFKkP0GUh64oHBp3jRhQftwFcZAGTzIG1+1ZeECHI2CVgjVmTFE4V3/B5Dw
pqHzKXd8PP06Q2kaH7jXVd7IUgOXasNNvOhNAawQ0z1/0Uzgj/IJxueZkTueuIN5
evvnpX7pLRCywTRZfGP5PKK68bD4jMXgcO1FAMI3cHk3Eznc9wuIVvSj6Ewsasiz
OV/44oCVnTzegGu6nH+Xq+9T21ZD7bWnj9krUXQImnpgxvh05nwuYrUOzIKt3ZtX
NrB2bDUUlJFQLkRpVSF1ZplgZtCPaus0YdTHZVxfpCaNFxhJHa2xqmWU2XS6h765
ePvy43npVdQpiTXRxQig
=SfVn
-----END PGP SIGNATURE-----

--=-D6R2B3BfzYnXnGXIBr0k--
