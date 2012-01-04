Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiTTQ-0001P9-Ax
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 16:13:56 +0000
Received: by iadk27 with SMTP id k27so36339596iad.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2012 08:13:55 -0800 (PST)
Message-ID: <1325693760.8917.87.camel@sauron.fi.intel.com>
Subject: Re: ubifs panic with 2.6.39 stable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brad Parker <brad@heeltoe.com>
Date: Wed, 04 Jan 2012 18:16:00 +0200
In-Reply-To: <20120102131455.9a4f1a4b2a45238f732670fb1ee2460e.0d3c9ab8df.wbe@email16.secureserver.net>
References: <20120102131455.9a4f1a4b2a45238f732670fb1ee2460e.0d3c9ab8df.wbe@email16.secureserver.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-oxCpNRS+8hwudoYTsHQk"
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


--=-oxCpNRS+8hwudoYTsHQk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-02 at 13:14 -0700, Brad Parker wrote:
> Running and older 2.6.31 kernel with UBIFS I saw a panic which appears
> to be during recovery
> of a bad block. The root fs (which is UBIFS) won't mount and the kernel
> panics.
>=20
> I upgraded the kernel 2.6.39-stable, hoping that would fix the problem,
> as I noticed a lot of
> recovery fixes had gone in.  It still panics; it appears the recovery
> fails.
>=20
> The board is essentially an Olimex SAM9-L9260, with Samsung NAND.
>=20
> Below are the interesting parts of the log (and the panic).  I'm curious
> if this looks familiar
> and if there might be fixes post 2.5.39...  thanks for any insight.

You have a corrupted node on the media. In general, UBIFS cleans-up the
file-system automatically if the corruption is caused by a power-cut.
But when it is caused by something else, it refuses to mount.

In your case UBIFS thinks it is not a power cut. What you need to do is
to figure out why this happened. One of the possible reasons is unstable
bits - this problem is not resolved in UBIFS and no one is working on
this AFAIK. But this depends on your NAND. E.g., in older NANDs we did
not notice this. Also, modern SLCs have some properties of MLCs, which
may cause issues.

Basically, here you can find a list of things which may cause this:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_ubifs_mlc
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

> VFP support v0.3: not present
> UBIFS: recovery needed
> UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes
> from PEB 2970:4096, read 126976 bytes
> UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0xf510fb95,
> read 0x4f0a3196

When UBIFS debugging is enabled, it prints much more information. But it
uses KERN_DEBUG level, so you do not see it. I think I have to change it
to KERN_ERR, because so many people are confused. I wrote about this
many times, documented in the web site (may be in not the most readable
form, though), but people keep sending partial logs - just what they get
in their serial console. Not, I do not blame you, just thinking
aloud :-)

Anyway, try to type dmesg or boot with ignore_loglevel to make sure
_all_ kernel messages go to your serial console. If you dig the MTD
web-site, you'll find more info, e.g., by starting here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

Please, send the full log - may be I'll spot something useful.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-oxCpNRS+8hwudoYTsHQk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPBHtAAAoJECmIfjd9wqK0ZgcP/iPRW0ItZdU4g7tzZqrKGLsk
nMFmN7ygbKEq6VfHZD9gh/kqTORIesc1aihqu0jQ11VGAXCIa/FMcKckztVXSLs7
LmlzGcB4q0hHPn0ZPCT3Nr29eocPE5Quz8DZbIJ80pLmVoAfNgtbebB/X/HYI++c
nTDcE43nY5Ri2LTQum+eTUtrLRJlbl6w+oDbP+zZTICsRI5TMs4AUYq44l3Ij7DJ
AkTXr0sHWzAjn78WKGieQ88CIGB+XVlVEZch03pQKSb4VDfofD1qwQKgroSseTHc
szG7Y9UjqiZ+Miemm62LQfwq91rLZ3x1ojCgAJbwfZQgMtjVxnUUJokTo5J4hD12
ed50EptwQeBj/VOEdwLQkBY7PE7fG5qnPECl4VEYylWeFTTt4mbJM0IjUzXKZaik
FkLgS/fYkuZLIiR1+VGwWF24ugl6tGOaBzQ6uupfSVi7IcfV/Ys4xZ8CK6CgiTW/
0zknEQM2m89+cMAhv5tx+n3QYbntqxshkjh9L91H7ytemOp+jLe5X0emRu8/pCck
BgbfhcCCM4zRpplXVvTmlXW7xPVsPPUTWFLxmt48dOuldU9X5hUqiBFVEonk1m4b
MFr53HCh49HRm5/cwKvQk9VOPwJOJeEah/W23o8KZrdtSFHylVA+QT7YTyNCEMr/
YLo79uMZkBS4i9yDFUPy
=tfaX
-----END PGP SIGNATURE-----

--=-oxCpNRS+8hwudoYTsHQk--
