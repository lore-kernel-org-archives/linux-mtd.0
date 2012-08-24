Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4otq-0002Tx-3G
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 08:05:50 +0000
Message-ID: <1345795830.2848.266.camel@sauron.fi.intel.com>
Subject: Re: jffs2 unmount with delayed work queued
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Fri, 24 Aug 2012 11:10:30 +0300
In-Reply-To: <5019DC14.2030209@freescale.com>
References: <5019DC14.2030209@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1jFZJPPb80A/Fch+SiJm"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1jFZJPPb80A/Fch+SiJm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-01 at 20:47 -0500, Scott Wood wrote:
> With slub debugging on, I was seeing a crash in timer code after
> unmounting a jffs2 filesystem, with a reference to poisoned memory.  I
> traced this back to jffs2_kill_sb() freeing the superblock with
> c->wbuf_dwork.timer still active, and c->wbuf_queued =3D 1.  I've seen
> this in Linus's current tree as well as 3.5.
>=20
> I would have just sent a patch, but I wasn't sure exactly how to
> gracefully shut things down -- cancel or flush, and at what point?
> Don't want to do it too late for the work to happen safely, but don't
> want to do it too early so that it could get queued again.

Hi Scott,

sorry for slow reply. I have a fix in the l2-mtd tree for this, I think
dwmw2 will merge it upstream at some point:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/28b65f8a2eece=
7e14bd4b9359509c667a5cb07d1

--=20
Best Regards,
Artem Bityutskiy

--=-1jFZJPPb80A/Fch+SiJm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNzb2AAoJECmIfjd9wqK0aBgP/iFy98ORZ7oqF+GvuJMK7RZH
ZxkPQSvn6oe+yZefdQlLGBTYDY04RTZ3TnHRKUD2/lLYataWHl7msCNQHRgeXAeD
hUEnSjN5dm3PTFzokIaz6zD3RZc6/THOJdDGctT7iA0XVxAfGXwM6kzstFRi3w1G
17UHKbyEBoHN/0s3Bi1Z5fGjDzC5Pac+W2PSGste1qRaIAhviFla1ENAlUZpTPtS
kVPG3VCjH7Ph42t1W+0H0IdVRZlgryZwrl92L5sBtkBYAsW0TS7WfDWClbD2t+YI
xh1iyoH6rVNcYyUl1D5hikYKWV0IGIKjavQXJtLOuKCu1HReWPR3uTdPrNmr2fMm
PytoE0iMKUTKrQJzuSca+LLAXFyz2FfGNHfgd+X9rfvTXFg/+TCfkjFa0JmfHbaK
0NmEgtGAzJzu+kQBkXzA2rPxfbbgoh3ZcP4zlWMHWz76bZnwBNFlwOybLYs+dWu6
wdC4OsnwZFVAQS5Didd6N5ifLoKPIB1jl8XW50GrVJMS9f0A56GP41tJywsfG4Qj
HC57QP7UtzIOyt/MdNEqRdxrfzsN2wzV7Hl9ZzKXW1zgzvLvtcFvpsHgGT2iYJCt
w2r9NH4iwtJ2I9gpB81OzS3nfgHY+lteiZkXOoyf6ursWnULgATwFVVaVluKqVbD
rv8I6q6ZqcPq3Z1b6V+R
=r9P7
-----END PGP SIGNATURE-----

--=-1jFZJPPb80A/Fch+SiJm--
