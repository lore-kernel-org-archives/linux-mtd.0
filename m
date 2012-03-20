Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9xPj-0000gQ-IO
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2012 11:39:43 +0000
Message-ID: <1332243749.11468.21.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] drivers/mtd: docg3 add protection against concurrency
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 20 Mar 2012 13:42:29 +0200
In-Reply-To: <1332196342-21545-5-git-send-email-robert.jarzmik@free.fr>
References: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
 <1332196342-21545-5-git-send-email-robert.jarzmik@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-XNnaVmLsd2Ffhwl1DYyl"
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


--=-XNnaVmLsd2Ffhwl1DYyl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-19 at 23:32 +0100, Robert Jarzmik wrote:
> +static void cascade_lock(struct docg3 *docg3)
> +{
> +	mutex_lock(&docg3->cascade->lock);
> +}
> +
> +static void cascade_unlock(struct docg3 *docg3)
> +{
> +	mutex_unlock(&docg3->cascade->lock);
> +}

Please, do not introduce that trivial wrappers - they are useless and
only hurt readability. Open-coded mutex_lock()/mutex_unlock() is more
readable.

--=20
Best Regards,
Artem Bityutskiy

--=-XNnaVmLsd2Ffhwl1DYyl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPaG0mAAoJECmIfjd9wqK0+08P/AlWfqdH26OB0Qr1EFvunDKJ
MPxRysT4Ba5lxGOBLpKjmJsmhNVYUvKErn9sVN1APuZcMCd2qBmakGha6VHZEic7
C50zucTwGoO+dLbXkQ0mK+WniJ/d8zhymuDJL0+I3oH39IB5KHX493IaQDDezn2r
HfN4ImZmgd6/JHBr9shyot+Y8uxlJ43z+2z+n96o3NFLLZw3OoYkDTcSoyk6IqrO
cZ72tfwpXhEpkjyoqJPUy4w4sixwa2rCrnG/pE10rTQmjLmxI72INe+kaoEEk2g/
XWAcaB+/QW+Hb9VCoqW31prBilJV+V41aqXhTcFex0Z77gDYx5tb9sKpsCOIg7Cu
Dn7Z+ZiSMhmxaidthKdGsxcOCU0EjORgYEB0y1c2ZBUw0Iq650k2hzesx6PpMOK4
MeAgOhQcplsr65KNxxtViv+A9m5P0Nz6tPPQSQgYBJrIlZXDYEGI4M0HwKHKQ8jE
hYUJBuIqHdOhE4s48s+J4BEY2LU6nEzOcRCshd78B/PcZb/HYsda5m3ndv/yHA1s
irRlXwf5rl/48kLJz2Z4T9jUkxqs0r5MGzqngrhmcd7sSKCNd/QtLojYB5Ewmt7v
jwr7eKNra/oTLXuOyudSwD+3liDbl64MLxPV4j93weUwM7NuIeXvWnL3zySS/BuE
PH4uzFOCeyzD27h8UxEs
=Igt3
-----END PGP SIGNATURE-----

--=-XNnaVmLsd2Ffhwl1DYyl--
