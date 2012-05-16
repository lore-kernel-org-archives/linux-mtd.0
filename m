Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUagh-0005Uk-OR
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 09:38:32 +0000
Message-ID: <1337161320.24809.39.camel@sauron.fi.intel.com>
Subject: Re: [RFC v4] UBI: Fastmap support (aka checkpointing)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 16 May 2012 12:42:00 +0300
In-Reply-To: <1337161096.24809.36.camel@sauron.fi.intel.com>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337161096.24809.36.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-r6FXQVVBnlQbJbgmVF+3"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-r6FXQVVBnlQbJbgmVF+3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-16 at 12:38 +0300, Artem Bityutskiy wrote:
> O(N) would be: N -> inf, UBI_FM_MAX_BLOCKS -> C, where C is a constant.

O(1) of course, sorry.

--=20
Best Regards,
Artem Bityutskiy

--=-r6FXQVVBnlQbJbgmVF+3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs3ZoAAoJECmIfjd9wqK0e0YQAIF05aS8jKIA3quc4mbYnX+G
bViuhs6QFkjZQCv7uwXozkpwdihwqitZdCfzBVFQBB8O8CiQKbCwPWj7Kjbu47M3
tvC93pmNsN31zptJt32lrac1Qr6bq7H9TPK6QVpvWvY02oG8tjCSTDI2g0cprvqJ
idD2xWK9Aj+qfwY7WjBYd6KhvsoBKB+VyAWZnlvw7x4w5B+QpHczcMpoH0yYxd11
n+zCMnQQsT84rUnpys2Y7SByxzzI7xzE59FxcAVMju8+rb8zwmdiGgLK7OunUV1C
8oS713Hjjhz9kF4hq3GzeClhQNMCoJlZbtYeL0DjUHmoj9NogkYu5ttbrjUCAJHn
8qox4Vk0V7adr7qhShJa7MwKtKgYJIk/teQHL8QYoF5PpSvJqeq9mcvarhvVdzkg
lZEmbmQeOFYNwBCzNyX+V7eu00UzUU9wnsQgWajqVMKTKUx0+wgOGWtwgQKgFsKN
Bq6VtcDkEfJI7p7WfEBNr85/F1YZfqfgxqZA/k1kMoVcV0MMQAdcoaAQkWLryPWD
g24+4LauFH5tVBhaSZIpvC75uR8cVLWBygXxEXnDF46Qo6Jg8jk2/3uBwj9G6d15
aFQVmDgb004usN6lNY06Hu5PV8YdJAuUOGyIclcleIDSii16ZEDH0n6+TVhZK7CG
feqskD64sY7KROdaGrvj
=aLRG
-----END PGP SIGNATURE-----

--=-r6FXQVVBnlQbJbgmVF+3--
