Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2H1K-00066R-CR
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 08:03:18 +0000
Message-ID: <1359965101.13791.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: fix random pointer dereference in OF device name
 handling
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Mon, 04 Feb 2013 10:05:01 +0200
In-Reply-To: <1358967548-25491-1-git-send-email-paul.gortmaker@windriver.com>
References: <1358967548-25491-1-git-send-email-paul.gortmaker@windriver.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zLB4sqBWOty5dL5QyLzB"
Mime-Version: 1.0
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zLB4sqBWOty5dL5QyLzB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-23 at 13:59 -0500, Paul Gortmaker wrote:
> Here is the output from an mpc8548 based board.  There are
> three instances of missing device name here:

A similar fix is already in the linux-mtd.git tree.

--=20
Best Regards,
Artem Bityutskiy

--=-zLB4sqBWOty5dL5QyLzB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD2utAAoJECmIfjd9wqK0sIwP/1ro+FypPr8AHbAPiv9pzSln
OCgaUBBAqE6exD5hfjj5GGCzfLtX6IpyAH7zzxLvFttEsEakM5dmzYdgok80Gqg7
NQyBSxphcWKB9VfankM5LRUzN7y/enNXMuTSIZu1rXZ0KBwwNc1QrNIXa4BNlFxx
E1e4CTF8JkQXxBL5o/Vg+u0mZ76Aspfcj3Q82Mtx4nA6l3fPmvU9SbyuJpkFdZ2e
fkRWLxuQknWx6QGO+ViRzHQUvCA2McOkDt8yfIe+GFdA9mn/XgGZ0DulH5XEaKIL
wMebfwRTOOJszEi+KtbxVtJ9BreTCpaMu5fqjzyNCs5Xx/qwC8IFlaE+HzRZXdx2
P5WIT0tva+0TC0EKE6eUARmM8xFrIFq8vWv9QuuDugtnYHsonIscLdZrNa0Gwci9
H47+RUKJPdNQRlvsuLCI7dU81nINvjOSsl4+GArrPqb4YrcpQl9RB2ajyYLPvCbl
QVTeNRKRlFSTiL0B5PLeCEWBv6cYFGpqGoeai+/QvLxnuOFg5+nelpfxxJCIaaX4
phEG0LXtWN3baUP1poXoPdgDuiq/Rc5hhH1Ls6bNntPTl26fitQsTdqTxLIEu+Ts
eVRDbG7c5v+VQGOyfYIQLqn24MUmUjL4JV0BDaJVk2DLrN8Q8ZIFyqx7Zpte6Xug
wgGUVZTQGvgMq1FqG8FF
=k2d+
-----END PGP SIGNATURE-----

--=-zLB4sqBWOty5dL5QyLzB--
