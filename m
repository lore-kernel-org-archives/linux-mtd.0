Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXvtU-0005ss-Pv
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 14:53:33 +0000
Message-ID: <1337957835.30969.45.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd stresstest: Fix random number generation
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 25 May 2012 17:57:15 +0300
In-Reply-To: <1337954309-18178-1-git-send-email-s.hauer@pengutronix.de>
References: <1337954309-18178-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ba8R6ou/QcvwICQK0Pjl"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ba8R6ou/QcvwICQK0Pjl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 15:58 +0200, Sascha Hauer wrote:
> the random number generation in the mtd stresstest was changed from a
> homebrew generator to random32. random32 generates unsigned random
> numbers, but the values are assigned to signed integers. This results
> in negative offsets, eraseblocks and writesized. Fix it by using unsigned
> integers for these variables instead.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-ba8R6ou/QcvwICQK0Pjl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPv53LAAoJECmIfjd9wqK0GnAP/0fo3m4sDtzFn4hUS3p9vg8W
czMXwS4UdrBMfK/SSfMjLfXHnFDFzyFpY5qd/4vbekYKHNChQfKl4QhLt/k7Y54v
QKB5OjmkRw28GTQGK8PmS7n8LD1PiXAR+UGjYd/WnfKfLiJjyBNrsUY/LkAapNmm
AwCT19zLhsOF/2LIW1SAGlV24YTWKNYr6Qlk79/Pvm+W6JgaOX3FAkHc1nAc+aco
4hL4Pq3NQrLJl9N92Xj1YXPrhIs4REfytki1On1x/m/2Hwj0ExbeY0HF/TDlGODr
sdYW7U9YbvIopDfqYqxNhM6UfRTtdUe1Odc01vKePMEmotvalB47378D9JMNYWXQ
UtCWk57N73FWng6Wvkt+jUX4nhp3e0dwYFmSrznyp5Bs7ueejus6dGYyuERJQgyo
BI4GeCOJeZ/O+qgzSnJMt0UkwO75h4BS01n1wmiBbltpltm9ZBVtY6jt7EqySAWk
7UcPVh/eCV0Q4vknud6QrmxEbGLhFo5yMqkkOk7gsgYaZk/C2nwFUkJdYaR2MN4z
9CyA6hM3+CudpZ/BOR1FIU2b3MGzHMXpJE+zb49piC1wDrbv8zqg7p6NxiyqlfuS
dfXrXxhO6AvhBb8zUqG1bVAxYQ4SAhI3+d8bZQyGIuWQBxW9L//whS9FTxk78k4d
Ky8dfAS/K5naHZXEPCFU
=u/fC
-----END PGP SIGNATURE-----

--=-ba8R6ou/QcvwICQK0Pjl--
