Message-ID: <1345703718.2848.200.camel@sauron.fi.intel.com>
Subject: Re: JFFS2 issue with v3.5.x and later on Atmel chips at least (was:
 Kernel oops since v3.5.x on Atmel chips)
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "ludovic.desroches" <ludovic.desroches@atmel.com>
Date: Thu, 23 Aug 2012 09:35:18 +0300
In-Reply-To: <5034F3F8.9080802@atmel.com>
References: <5034B45A.5060107@atmel.com> <5034F3F8.9080802@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6F49xiX55AXqI+kSBikD"
Mime-Version: 1.0
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-mtd@lists.infradead.org,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@atmel.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6F49xiX55AXqI+kSBikD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 17:00 +0200, ludovic.desroches wrote:
> After bisection the commit causing this issue is:
>=20
> commit 8bdc81c5069e43755d6e59e5e990e21ca200e8e2
> Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date:   Mon May 7 19:56:53 2012 +0300
>=20
>      jffs2: get rid of jffs2_sync_super

Thanks Ludovic for bisecting the issue, I'll take a look at this.

--=20
Best Regards,
Artem Bityutskiy

--=-6F49xiX55AXqI+kSBikD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNc8nAAoJECmIfjd9wqK01M0P/jLom6PjOvuHsOnObNXXIaS0
xNJn4O+AiIiy3VtoS1nN5WPrzTFI7Wqssf7G3JbukgpapcFn8GXfzUilTCxY6oY0
2lfi5vrL7vuxG0vqZXOlbG18G1jHGkA7KJlrzeffF9Mz+fvY0tTB9ifwdEQSeIqM
uS+e2KMFz4EkJmO+eNXgbAw3oaHlj60EtfFy5ID/z1kPZlBkxwz/9CgQDVbWJHnG
aOVHq7JK5aDeqBmD0d6u1mSYxMfo980hA+6SvTwtF97r0yItWA9tnwLLIrYnnaLX
CiVbcJ1L34xD9oXY5lQ0EMZKOS8nmf31rmxtjZfAI0ZY4lBmrsY1LddHi7K54siZ
6TWNXLfuvV/PPZUzP1STY4wylkdPXkPP0ONlcdw5b8RtmjfKqt7Zx6PsFCws6C4y
Xs7/A61KsHWRvmF5aIiFVtseVCVHbT74y38JhHiShT5MnZA2yOYPpb/eWIu3xcE1
/ZwWlTe1rqYRMqJnHE+p7DesTqIBqESgVaTEgOBFz0zisTYSq3N+7Npz6QiM5xxr
ujqmpY/xg+SB2vOjorQY+7ISwPaMG4rGqKCVR2txTYTQwB0uMqMmYV0BBKCeFaj4
qKlcFDbmtPXO6+mBWdKPerM7gxP9yAOJjsRCdQuqJKbrBjHg0WlTCM4B5u3heQnw
0z0h/RRTcwWrabNKfsRA
=UG4E
-----END PGP SIGNATURE-----

--=-6F49xiX55AXqI+kSBikD--
