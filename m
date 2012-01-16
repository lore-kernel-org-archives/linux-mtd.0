Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmlaM-0002m9-1y
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:22:50 +0000
Received: by obcuz6 with SMTP id uz6so1692082obc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 04:22:48 -0800 (PST)
Message-ID: <1326716672.14299.70.camel@sauron.fi.intel.com>
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexandre Gambier <a.gambier@ftemaximal.fr>
Date: Mon, 16 Jan 2012 14:24:32 +0200
In-Reply-To: <4F13E424.7070104@ftemaximal.fr>
References: <4F0C3339.6070909@ftemaximal.fr> <1326230599.2335.4.camel@koala>
 <4F0D4405.2060800@ftemaximal.fr>
 <1326554080.14299.2.camel@sauron.fi.intel.com>
 <4F13E424.7070104@ftemaximal.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-oyrpbiiZAv0ycvfBgBDp"
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


--=-oyrpbiiZAv0ycvfBgBDp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 09:47 +0100, Alexandre Gambier wrote:
> On 01/14/2012 04:14 PM, Artem Bityutskiy wrote:
> > On Wed, 2012-01-11 at 09:10 +0100, Alexandre Gambier wrote:
> >>>> hi everyone,
> >>>>
> >>>> I use UBI volume and UBIFS on top of a NAND device with an embedded
> >>>> video meter.
> >>>> Everything works fine except that when a UBI volume is mounted the
> >>>> following warning is outputted :
> >>>> "UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad =
PEB
> >>>> handling, reserved 0, need 20"
> >>> Looks like the pool of reserved PEBs is fully used. Fo how long have =
you
> >>> been using this flash?
> >> This is a brand new flash...I've been using it for 2 months.
> > OK, in this case this is most probably because you specified too large
> > sizes in your ubinize.cfg. So that your volumes take all eraseblocks.
> > Try to make some volumes smaller.
>=20
> For example, for my 128MiB partition I specified 120MiB which is 7%=20
> smaller than the total size.

You should be able to find the UBI overhead formulas on the MTD web
site. Try to specify less than that and see. You should leave enough
PEBs reserved for bad eraseblocks handling - it is 1% by default.

> What size would you specify for a 128MiB partition ?
> thanks for your help.

I do not have time to calculate and I do not remember. But the easiest
is to use something small enough and put the auto-resize flag - it will
then make it to be the maximum size. E.g., use 100MiB, boot and see to
how much it resized.

--=20
Best Regards,
Artem Bityutskiy

--=-oyrpbiiZAv0ycvfBgBDp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFBcAAAoJECmIfjd9wqK0mkUQALCVbGXblMCEwX7RWcARRBrS
n4EIFV4soVUVd4IQUCrcCZ+VXwIHGfTZzaUW3ZW3j2SDpR+RU3vcIDzijgkB0w00
zcKeYQpjCbPtj4G91TBzydQw3loIsyhuPhki8BULRhmrIHUe266WOh6fYymH7Awg
QVBrpH8VZ3D7D7WosiEPJFwQu7vyW/qQOqsjGLmiuuBtXvKSO6E4Y1FqMx7+htIk
EmhwacBXp8E8i563pJUwOQNIA1PfOb8Pdk7Jjj7TkpphKE/Bf2+hKftRKkX2sxCF
uD7Rb6yc6AHPzQBjkv5clo9L9qdtBN729v6KblFanQqchciPVC2BU62MwfBCxBuA
I5CNV8QHZ9LqNZhMf6JIWwn68wVVMShFLe+ApF8V+dyp88YUG4K1NLCO71wL7qnP
9zUgDodJFcrXg8+q1ODrJ4nFNcscB9TpsnlDJ2JKc5dqy0ZVQb8ZB2uWSmOsMndJ
Mq6W+M7WENV/H5ONHKFEZfUvnQb0PSg3DxBOYf3AGYlhwnd3c8fSOEWkK+lGvySg
HN0Xw5q8yk1ZRb5JyrNFC8ReBW9LU2+NbF7VdJ5kPKz+Aux+QAhFg/IW2J8wSM32
N/EWGYR5HIUfeHpFVT+mOjNQBxanMe9yXXMKTYr4KGS4q5HUxtTyIFGOODQw6cZ8
AlpCgJoauuCSTwfK5BvA
=lrf1
-----END PGP SIGNATURE-----

--=-oyrpbiiZAv0ycvfBgBDp--
