Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMWor-0007hV-5E
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2012 03:53:38 +0000
Received: by lagy4 with SMTP id y4so199077lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 20:53:32 -0700 (PDT)
Message-ID: <1335239442.14183.3.camel@brekeke>
Subject: Re: [PATCH] ubi: Do "dump_stack()" in case of the
 ubi_io_read()/ubi_io_write()/do_sync_erase() has an error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark <xiaoming1981.zhang@gmail.com>
Date: Tue, 24 Apr 2012 06:50:42 +0300
In-Reply-To: <4F954BAD.2010606@gmail.com>
References: <CAGKjfA1YN6wrSpV3ZuvYfA=gW_hjBLPKTraudeL_FTUu2dTJ8Q@mail.gmail.com>
 <4F954BAD.2010606@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LQbhtAoDuifk9rhAk3bn"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>, zxm927@163.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LQbhtAoDuifk9rhAk3bn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-23 at 20:31 +0800, Mark wrote:
> ubi: Do "dump_stack()" to always have the dump in case of the
> ubi_io_read()/ubi_io_write()/do_sync_erase() has an error.
>=20
> Signed-off-by: Mark Zhang <mark.zhang@motorola.com>

Mark, sorry, but this patch is not applicable because it is
1) line-wrapped
2) against some old UBI version.

To check what I mean - save it from the mailing list as mbox and try to
apply it using git am to the upstream kernel.

Also, keep in mind that the subject line should be short and only give
idea what the patch does without details. In this case I'd prefer "UBI:
dump the stack in case of I/O errors".

BTW, I suggest you to use newer kernel or pull one of the ubifs
back-port trees which also contains all the UBI back-ports.

Anyway, I'll do this change myself now.

--=20
Best Regards,
Artem Bityutskiy

--=-LQbhtAoDuifk9rhAk3bn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPliMSAAoJECmIfjd9wqK0QmQP/2lQ25DzKunJW4oYptNexQHG
sePg9NhpGWjc2Vr+euKKaXOssX064TkR6qD13sGKhWqVy8/1sSkIvhFllbHcMNFr
K23L5vXoLXw2H1TyXNyV+sYFbrMOfSQziBbn7S8guhlwYFxhyKmTKsES/00wSYcK
EKWgG056zd28OP4S3rSXBdZ+64eRxoBcKubWCLbUNJ5/uqy8Jr+uTHIc6nwgx0AQ
EmvFyh1FW5/wgqtClu2EhycW6b91PWQ/coppcTgzAlJ4nR5pljRQNAIi6uiKsoB5
k80iTpsPbsX033AoVa8gA6ytDMYYG8MveSyOQhyOk74zPSctnY3rruZeeCx4pupY
4HTBvMLz0BncQiT0q/Z4hUHDWerWSXzCFWXKRQShqeHNIgWZVzUXwt145kRobqL2
btyoA1lYJPOcFiYjYO88b6rvDDnOd5jrn6npG+JY9F2sIUR89mCLw26ZSV8fwMh1
StOKjhJGYS3PaLbWLP0SUwbGBZ7ILWVbf+wDPnZ4UWfnX3p8MozEFT49wRlzhV8z
dax8m4YWR7Cxzbutig7/mtJHTH9S/D1zV/T/b/INAxO0o51t+iB7FaO4pJoa3vuX
93ScQkYUaulDIOWgZM8WQpm5ohEOUZXVUMAY/0wBGIp4OSJJF0RrUzdQ6wwLoXEC
ck3E6e8I/fYAbQQzuFXx
=Al6M
-----END PGP SIGNATURE-----

--=-LQbhtAoDuifk9rhAk3bn--
