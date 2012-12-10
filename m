Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti1HZ-0002ne-Pj
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 11:12:22 +0000
Message-ID: <1355138000.25188.131.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: Advice request on how to reduce orph_buf size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Mon, 10 Dec 2012 13:13:20 +0200
In-Reply-To: <CALF0-+V2eZcEj-t2P-58XS7uStX_Uj4Gbf=ScpuMRBkxf4bnuw@mail.gmail.com>
References: <CAJA4uhcD+bGAdKMb6Nv-Kvs+o229PaLQL-9Dok-ddCUS5rbGpg@mail.gmail.com>
 <1354267874.30168.73.camel@sauron.fi.intel.com>
 <CALF0-+V2eZcEj-t2P-58XS7uStX_Uj4Gbf=ScpuMRBkxf4bnuw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-H4SGsdneNV8XdEO7jDnM"
Mime-Version: 1.0
Cc: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Wolfram Sang <w.sang@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-H4SGsdneNV8XdEO7jDnM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-30 at 15:46 -0300, Ezequiel Garcia wrote:
> Artem: is there any other place in the kernel you can point me at
> that implement something similar to this SC list?

Linus W. mentioned it in this discussion:

http://www.spinics.net/lists/arm-kernel/msg200950.html

--=20
Best Regards,
Artem Bityutskiy

--=-H4SGsdneNV8XdEO7jDnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxcPQAAoJECmIfjd9wqK0sicQANJSdzhaTGP3BtHJzrFPkyuO
Qpf17WkWYEkaV0WP08LFoNnHgnyLIaaAPbKt73NhP+I9sUSzZd2hdNXbTWR29gZl
dl4Z27s6A+lEPmJXL4hvnpLJvYYmopeUnjGL2Zt+j1cuthC5TJ77Ig2lnuiQDBcU
aMDbK/lBbU3cRXbBScohc6L51QGZkdQiHHhkeJwaRuYHMl0PuyzEWmjxmmexmMMt
IqaTyMtwPeeU8MRaPO2cGTazDUuT/6HsAAYs3ID9xp9VWKmT3OzPpy0SyE4rsR3l
7inPZoI/3b+/Jr4Rblo9jtnxk2ZaAT8k8Ync7cB8R50gS5qvlcNsE9P0hIzwmYh1
Q98Bjo/XlfzV7Lt/u4WluBuv88thSZF77PmA0Fw7atQVPHyTm2zsL0ZajFl/jCBP
C9IYLA1QqDcIYtyOs3wfq1BiWOg8yfT6RYfrOvz42esSL81AYePF/PRial5/JfVP
CbHBXPGjN6Dcv7l0FjzqHL3I/rAvwp+2gejPQv32dzGG+ZEnRrFfJdeTANXngPB4
qMhVpWw9qQt+wWlisal/GL7/NDxoWKnjyDgVkzDg2ZlqvnXhMkwCK5SYTZZ88rN5
LPqh0T3gk09RpvlHwHtGoyyRl8NOB3r5A8/3rrnA8svkosmdfo12b5E9aIRPtPhC
5TYKzKRFToO3esWZ5uxq
=32y3
-----END PGP SIGNATURE-----

--=-H4SGsdneNV8XdEO7jDnM--
