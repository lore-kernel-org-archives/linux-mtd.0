Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6yLh-0003Ly-BB
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 06:35:29 +0000
Message-ID: <1346308825.2848.530.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V5] mtd: bcm47part driver for BCM47XX chipsets
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 30 Aug 2012 09:40:25 +0300
In-Reply-To: <1346305276-28208-1-git-send-email-zajec5@gmail.com>
References: <1346305276-28208-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QlpKI/lhAdb1/9YT7jOe"
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


--=-QlpKI/lhAdb1/9YT7jOe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-30 at 07:41 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> This driver provides parser detecting partitions on BCM47XX flash
> memories. It has many differences in comparison to BCM63XX, like:
> 1) Different CFE with no more trivial MAGICs
> 2) More partitions types (board_data, ML, POT)
> 3) Supporting more than 1 flash on a device
> which resulted in decision of writing new parser.
>=20
> It uses generic mtd interface and was successfully tested with Netgear
> WNDR4500 router which has 2 flash memories: serial one and NAND one.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-QlpKI/lhAdb1/9YT7jOe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPwraAAoJECmIfjd9wqK0WQgP/ixRGHmKjVv+wudjARo6QqBU
tupPjW9sMly0eHScHKxuibnJFxQpVHU6GlSloqA2IsgEpzznzORl/lHSrkl0r4vc
dKqZY0f9veBp1q2Zh9mr5o/O6uCqVNJdlD8AggzZeweUMXXOd4S6U4MzWXMg2DJA
+iKaCEJEDGlBaFZQXC6Nxs40StRIqvoaC/i4oVXlL60BZeH3kigvmeyxIGMbmubS
eoq9VM942BmZNNSrkb+7frraHQJWU7zYx2U3Uw3+o+xJEcRuSZouuty2r1GaCP6j
FjhRq0O/QZhpOGDQNOMlkM1dvhZnMpgPVkhlkvzRgx0R6B7Rx6CZSyIIQrwLmlXx
T+5v+2Rx2MgxoKeNhHMqk6Bhit/qPogTZjDgZjrEjKK5P9N5nVg8gyC7A33c6XLr
3HwUAayp0UN9ClNlYOhZR5D4hXiUKp0cUSNTa4DS6hQkMFd1CbaX2TopBQShRKp1
M0TmTzzOb7WfYP27RqG+JPZSD1ZLTcmwPx77KSuG18sZ4KMjf3in9usSuBmYwn+s
a1/EJBHVwyRGsZBuWxFf6kNWg4+thHTyPO53ZBVHvUPbleBU1vVYgr9l8uEjRVAr
k6K+427TGTyxDQeu+ko4Js+usHpZ9FIwuVpUDAz949LA2JwZ134Rd1hw1O7kVR+j
i25smsqT2a/LtW3rei/u
=R43Z
-----END PGP SIGNATURE-----

--=-QlpKI/lhAdb1/9YT7jOe--
