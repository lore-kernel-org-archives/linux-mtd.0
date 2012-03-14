Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7lqS-0000Eh-T3
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 10:54:17 +0000
Message-ID: <1331722608.2140.15.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/4] MTD: Change meaning of -EUCLEAN return code on reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 14 Mar 2012 12:56:48 +0200
In-Reply-To: <4F5F87E6.7010301@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331640228.3595.19.camel@sauron.fi.intel.com>
 <4F5F87E6.7010301@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-83Cu0FYKzh/TOYx99u2G"
Mime-Version: 1.0
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-83Cu0FYKzh/TOYx99u2G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

      * On Tue, 2012-03-13 at 10:46 -0700, Mike Dunn wrote:
> Do you think bitflip_threshold and/or ecc_strength should be accessible t=
hrough
> mtdchar ioctls as well?

If there is a need - probably, but I feel that sysfs should be enough
for most cases.

--=20
Best Regards,
Artem Bityutskiy

--=-83Cu0FYKzh/TOYx99u2G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYHlwAAoJECmIfjd9wqK0pdUP/RBXPnToZUVTNIeVCwkMm3N+
4vq7ag44hfQ4YiMg28o/Szeb3wrDfejNkUuXtHXzjrvE2e07Jy4rAkb/8MGM/IQs
m+/rpmpOQNxvoehMtrBr1x6jfD6+xfh4cJe/wdpbQPY29H3z839/HnBh9I6TAzPT
UPrfUMqew7/1Qj/Vfa93QewvPjon3oLPHd7mLcpXJGkBfwh0NB1OubzlODV+hTnv
BCpdfspRgeVZ7h83DIhZBtHvoncBPqbYugXXfoDbCiBsJQiUi2huJz6wwYGkAxU7
ePlIAapMJdGEEhF+fRR3hOdO09GCHkrZnxddx91lYjOfg4QRELs1CxxBEkmxoNX8
0uMtGtISt87QjIn05Lu1wNG1squ36uTR0zm/Wpa2NWuFa8PmLoOiRaKmNgZG1HjZ
+cOQ5e8aRsVm4Rg+QXEDt5/fRjKck4ljxR2koiLYh4CqLYddu7MqAFKoIDHMrH1F
r6QecW65nQddGo76zCsbdf1SfG9deAqDasdXnEovXjzHxjaM0DKddp+4ph+FQ/PC
h/fHec3J6D47Z0CfsNggLPwP2yV+ovJ/rEIe+3iDa184zNnz8/g21//C2pqqOzKa
lX+hw6TEQiX1EMx0/tzyl9EKLt3x4h8/D92SMzdmFOw+JB5AUq1esBkIrbBtNH+Z
GmpyLmMEpoIWhkMbRwXA
=5XMa
-----END PGP SIGNATURE-----

--=-83Cu0FYKzh/TOYx99u2G--
