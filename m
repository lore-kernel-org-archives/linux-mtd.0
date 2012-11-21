Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbBoP-0001TR-Ei
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 15:02:03 +0000
Message-ID: <1353510137.2701.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd_blkdev: Use a different name for
 block_device_operations variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 21 Nov 2012 17:02:17 +0200
In-Reply-To: <1352475395-11917-1-git-send-email-elezegarcia@gmail.com>
References: <1352475395-11917-1-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bkYF5fBXMznKPCBKxCZ/"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bkYF5fBXMznKPCBKxCZ/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-09 at 12:36 -0300, Ezequiel Garcia wrote:
> struct mtd_blktrans_ops is a type, and mtd_blktrans_ops is a variable.
> To improve code clarity it's better to not use the same names,
> so we just change the latter.
>=20
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-bkYF5fBXMznKPCBKxCZ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrOz5AAoJECmIfjd9wqK0lCcP/1eo59nE5zhZpdqBA0JtILFS
0pFSqF638rxjEtX7RaQERW7vsweRuQlyf4pBd6URvebegr9DnvyN/3HzaofKRD5B
hPHiAog0r4mRIFFZaF+kSy2DmmVV1x8nw0rPTGNy6QpNyVQy70BvD4T46UFLYDb3
JuRQCUDqrjHPlpkuWxQ/ogJ0cN6iy+fFJIk3LgQf6MvVldco8czTnIt8T2007e10
Gl1r68EHQROV9mvjRv8oEl/ec5CTATU/IQA0dp7An7BCkJS8/pDUJTa4vQY6QQgU
NJwc5NXJgoTpNcU1T/OJ9RFuLo8mO5yZ4Xq+E2FPkiCJLuSLGU39ibOpiGCdhkSP
E9XjqKqZrfY9z5mJk0sO52FbFls1KUbj5fc2VQfEmXc/U/4gTiri2KsvOeY3ouL9
9OcSbTp3PtjBu4pD31pUtIiNIVNxn6UFm9Pf+DotPFsPwTuK59cEvBG8hG0A0CS2
XJG05G7cRfuYmwFP0ueNH072+FAvbIpOh0cvpK0GgD7oy4us3MdkksWXi+P61j5C
Bw2IWV175pFTZ4Khfo9Ff43ims0B+fXv43gXjDtp0i/czC55korc2Fz5Y57cpbMx
QRCv8E3i8be205s1Bua4gUXGv+kP44bgIwoG0CaNBLJ23yPKrEtUYUj09P1t6Qgu
lbZe3YdmdeBTf/Rzx8Wq
=bprf
-----END PGP SIGNATURE-----

--=-bkYF5fBXMznKPCBKxCZ/--
