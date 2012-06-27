Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjobO-0004D0-IU
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 09:31:59 +0000
Message-ID: <1340789755.29342.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 00/10] Prepare for GPMC driver conversion (w.r.t MTD)
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Afzal Mohammed <afzal@ti.com>
Date: Wed, 27 Jun 2012 12:35:55 +0300
In-Reply-To: <cover.1339586624.git.afzal@ti.com>
References: <cover.1339586624.git.afzal@ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4GCDzgQ5odpj22MrXHe+"
Mime-Version: 1.0
Cc: tony@atomide.com, ivan.djelic@parrot.com, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4GCDzgQ5odpj22MrXHe+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-13 at 17:02 +0530, Afzal Mohammed wrote:
> Hi,
>=20
> This series cleans up gpmc mtd interactions so that GPMC driver
> conversion which is going to happen shortly would happen smoothly
> by not creating much disturbance outside of arch/arm/*omap*/

Dunno if Tony picked this, but the MTD changes look good an the quick
glance. Feel free to add

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-4GCDzgQ5odpj22MrXHe+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6tP7AAoJECmIfjd9wqK0K3AQAKLLPvG+9gUxV6S1lJBFulDK
Zxivn4Y2M8+g36ecsZ/a/MqxZXcKefAMwY+ItxBYwJnuDgAsmZUResqLzzA0Uf3y
whAqnZ7pBy2aPy3nrQT9M0fqx346W4DzRejaSP8QD2KkAxmCWBTgYYbPYb5ndoNm
mwZYfhH6TkeRvszGbE7ZkFZbveo2GPj8qbcqLeA8UJisH/elTxmJW+SLA4GA3YlM
acWoxFMzkvyQ44jE3VUvAo4XW6ICtHvGRIM/hpNgqnbPlPxTYOyIhnxR6CHO4ECo
szx/S1qUj0Ai2tl3BRW5kml48K1mrT+lotr5xFrbgtEO2vp/afLdhvgwxbAqk7+1
lLnxbKZOx1a/Gk1rdMU1zliqi6zOnCgWxXaLhs/3mybgn8fFJ0GTo5DsyfNMKb/W
RVme+9pUZNIV1muY+L88B+YQybSqY3nexQ59SDv0aqbICZt20rb9dxDPEHBIqOUG
KEx2W/56kt805gK/1lERa1RpTp8m6Ap3p743oSyvEkStbDIbUW0pRTHtw03OERci
G7yQRYbSmYdTdgT8r2mNz0rpeFMHUpZ9asDjm+YfpY31o3UgIxP8PKzbTIvmUSZu
fEf7jr8qqaLru1e6u62kNxTTsGSdAHXn36EKKtx45vYg5Vmwj5X2oR/1Xwwzzppx
htGFiOvOO91RkzV44tnv
=KSDh
-----END PGP SIGNATURE-----

--=-4GCDzgQ5odpj22MrXHe+--
