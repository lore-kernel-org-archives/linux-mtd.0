Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmjiG-0006CQ-RJ
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 10:22:54 +0000
Received: by iakl21 with SMTP id l21so10146322iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 02:22:51 -0800 (PST)
Message-ID: <1326709475.14299.34.camel@sauron.fi.intel.com>
Subject: Re: Corrupted UBIFS, bad CRC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <arm9263@yahoo.com>
Date: Mon, 16 Jan 2012 12:24:35 +0200
In-Reply-To: <1326701907.78896.YahooMailNeo@web121503.mail.ne1.yahoo.com>
References: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
 <1326630286.2201.3.camel@koala>
 <1326701907.78896.YahooMailNeo@web121503.mail.ne1.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nRhOnJRyiUpJBFoUbaEr"
Mime-Version: 1.0
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nRhOnJRyiUpJBFoUbaEr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 00:18 -0800, Karsten Jeppesen wrote:
> Hi Artem,
>=20
> Of course I can. Anything I can do to help.
>=20
> I put it on one of my outside servers and I put as well the /dev/mtd4 as =
the ubi0_0 you asked for:
>=20
> <http://download.gnist.skov.com/corrupt_mtd4_20120116.img>
> and
> <http://download.gnist.skov.com/ubi0_0_20120116.img>

Thanks.

I've taken a look by using mtdram. You have a strange corruption: 144
bytes of 0xFFs, then 32 bytes of zeroes, and then all 0xFFs. This looks
like some oddity of your NOR flash.

My theory is that your flash has write buffer and its size is 256 or
larger.

Anyway, first of all - start with pulling the latest ubifs-v2.6.32 tree
- I've added few changes there very recently which fix UBI/UBIFS
debugging messages.

Also, please, enable UIBFS debugging compilation option.

=46rom now on I assume you have done this. Also I assume that you are
aware that you need to look at dmesg to see all the UBIFS messages.
There is some test in the MTD web site which explains this.


Next: if I hack UBIFS like this:

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6c3fb5a..58a49e7 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -691,6 +691,8 @@ static int io_init(struct ubi_device *ubi)
        ubi_assert(ubi->min_io_size % ubi->hdrs_min_io_size =3D=3D 0);
=20
        ubi->max_write_size =3D ubi->mtd->writebufsize;
+       ubi->max_write_size =3D 256;
+
        /*
         * Maximum write size has to be greater or equivalent to min. I/O
         * size, and be multiple of min. I/O size.

Then I can mount your image successfully.

What is 'mtd->writebufsize' in your setup? You need to find out the
right size and teach your driver to report it correctly.

UBI reports max_write_size when you attach the MTD device. E.g., with
mtdram I have the following:

[493058.328443] UBI DBG (pid 18798): io_init: min_io_size      1
[493058.328444] UBI DBG (pid 18798): io_init: max_write_size   64

With my hack it is 256, of course. The mtdram module which I use
hard-codes it to 64.

--=20
Best Regards,
Artem Bityutskiy

--=-nRhOnJRyiUpJBFoUbaEr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPE/rjAAoJECmIfjd9wqK0y1MP/jg9BFdJqV1IGEBOnOkvi7sI
BLr7bY4e5vLaGAn7IcKSfSdhYhoTFDSkwCp4uL70eXbqsrkDhYKJXfTxm2sQQsGm
v2TmgoKZUB9Uh2relgFlBbCLMRgmK1+iU/0LNLcINbcef7q/vYe8ST4ynOxMyXID
eIyvfbfpLTmlbGX/or8GNnvS85Lv9/DCrAWqwivxcTgQrvMGb1A51jzfw/AD/MFp
Eo6nTG3jaKs1g5A68c+5eGGaQI13cHl6FHSj6EXV6FMDe2xg3CqI0g4Kt5Vv9cKt
MqT90YzpqdYMVGTklhnCBb3V+YrnYZttbWcvPzgGFGq+G3Y8GGyrpy8XSeBCLIgS
s5PKDf/j9WgxQFSWM+pNt1StWHBD+hncIAcg7H2fqivWTuu+/JmtCO9wYqaAk42z
kiJAET/qp3qPg/LQQZddWphUiznIK51EDJ127FWSgMca2tU5K5rwVqNB2ZsF6Nj5
SedW87WiQvwB7X2NFBDVvp926N0h4h7c61vk6gdc/kFWKPsyQ7rlXRF0SAFXVnyN
apz8SXwo7uS/cGXD+XKUhzU1390r3piZtura9NZWT/i7AXi5Wm6RkuBPEBfZstBr
PVm79ngKnJOfYzZWiI/XaxZOk9UcV2jiORSacoSJaCC5Xp3IXtBYsTLLLkdZvUwQ
lLu82+01FmHixUi43t3U
=kxoR
-----END PGP SIGNATURE-----

--=-nRhOnJRyiUpJBFoUbaEr--
