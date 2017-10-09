Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1YRt-0004Lm-LP
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 13:50:32 +0000
Subject: Re: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <20170626111947.17092-1-richard@nod.at>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <e3239508-fe96-0d42-af70-d735eec78f2d@pengutronix.de>
Date: Mon, 9 Oct 2017 15:49:56 +0200
MIME-Version: 1.0
In-Reply-To: <20170626111947.17092-1-richard@nod.at>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="oEqo76cFbREhTvFulK5RHwlwM7eS2hr8h"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oEqo76cFbREhTvFulK5RHwlwM7eS2hr8h
Content-Type: multipart/mixed; boundary="kFrQV5HPoF0V2HRn001v7m8N9cCui6XFT";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Message-ID: <e3239508-fe96-0d42-af70-d735eec78f2d@pengutronix.de>
Subject: Re: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
References: <20170626111947.17092-1-richard@nod.at>
In-Reply-To: <20170626111947.17092-1-richard@nod.at>

--kFrQV5HPoF0V2HRn001v7m8N9cCui6XFT
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 06/26/2017 01:19 PM, Richard Weinberger wrote:
> Creating an xattr is an independent journal transaction and the xattr
> code assumes that there is always a valid host inode present when a new=

> xattr is created. This assumption is not correct for LSM and now
> fscrypt, for these users UBIFS creates the xattr before the host inode
> is created and visible to the user. Since these are two journal
> transactions it can happen that due to a power-cut only the xattr is
> present but not the host inode nor the directory entry for it. As resul=
t
> of this UBIFS will lose free space and can run out of space at some
> time.
> It is also not possible to create the xattr after the host inode becaus=
e
> this would violate LSM and fscrypt model. After a power-cut we could en=
d
> up with a inode without security context.
>=20
> This is an intermediate fix that can go into -stable, as long term
> solution we have to make sure that creating the xattr and the host inod=
e
> is a single journal transaction. But to achieve this the journal code
> need some rework first.
>=20
> Cc: Subodh Nijsure <snijsure@grid-net.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Ben Shelton <ben.shelton@ni.com>
> Cc: Brad Mouring <brad.mouring@ni.com>
> Cc: Terry Wilcox <terry.wilcox@ni.com>
> Cc: Gratian Crisan <gratian.crisan@ni.com>
> Cc: stable@vger.kernel.org
> Fixes: d7f0b70d30ff ("UBIFS: Add security.* XATTR support for the UBIFS=
")
> Signed-off-by: Richard Weinberger <richard@nod.at>

What happended to this patch? It's not on mainline (and thus not on the
stable branches). Was there a better fix?

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--kFrQV5HPoF0V2HRn001v7m8N9cCui6XFT--

--oEqo76cFbREhTvFulK5RHwlwM7eS2hr8h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE4bay/IylYqM/npjQHv7KIOw4HPYFAlnbfoQACgkQHv7KIOw4
HPZVWQgAxVUP5/zgag2s3r0CyW1QKH46AH1bQLbC4yPZN2+L7QUNweOK0am5Zh/a
sZXDLhYGHwCyo9FHsAAspgQwfODcRjP1YQVZlWSSXGrLr1Vg0/hthPH8cGQkAFcM
sllmf5euLvRaJY7lzflFEGOULjdtl/874d2pQ6anVN0cC0PdSVHWEAv3DLfh5GIL
nRpxK2kjrtHH4Yp7e6to6TGM8v14WQKihvYjCDLM3n0g0nNn0vgkTi3ClXLpX+we
8DwDmxj/P6FPD5BY0m3X9+LbyrSLrsRdQ3+hT8kTgWcDvNgLpmIzBubjrl2bTZKU
h2L/ieg1PXVaSJy4KZH0nkzNMWu5Zg==
=RnYO
-----END PGP SIGNATURE-----

--oEqo76cFbREhTvFulK5RHwlwM7eS2hr8h--
