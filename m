Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2WV5-0008Nv-Hl
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 02:11:52 +0000
Received: by mail-pa0-f48.google.com with SMTP id et14so13515314pad.7
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 19:11:10 -0700 (PDT)
Date: Thu, 3 Jul 2014 10:11:03 +0800
From: Kevin Hao <haokexin@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/2] mtd/ftl: fix the double free of buffers
Message-ID: <20140703021103.GA30893@pek-khao-d1.corp.ad.wrs.com>
References: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
 <20140703003740.GS3599@ld-irv-0074>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20140703003740.GS3599@ld-irv-0074>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2014 at 05:37:40PM -0700, Brian Norris wrote:
> Considering the nature of the panic, this sounds like a -stable fix. Can
> you elaborate on how you confirmed this is the bug? You didn't paste
> sufficient logging/details to show which code paths you are exercising
> in ftl.c. One hand, it sounds like scan_header() might have returned
> non-zero (which skips build_maps()), and on the other hand, you say the
> double-free occurs because both build_maps() and ftl_freepart() are
> freeing the same buffers.

Sorry for the confusion. It is the build_maps() that returns non-zero inste=
ad
of scan_header(). In function build_maps() it will allocate the buffers nee=
ded
by the mtd partition, but if something goes wrong such as kmalloc failure, =
mtd
read error or invalid partition header parameter, it will free all allocated
buffers and then return non-zero. In my case, it seems that partition header
parameter 'NumTransferUnits' is invalid.

And the ftl_freepart() is a function which free all the partition buffers
allocated by build_maps(). Given the build_maps() is a self cleaning functi=
on,
so there is no need to invoke this function even if build_maps() return with
error.

>=20
> I'd just like to fill in my understanding a little better, if I'm going
> to send this as a -stable fix. Plus, we might want to add some details
> to the patch 2 commit message, instead of just in this cover letter.

OK, I will respin the patch 2 to add more detail in the commit log.

Thanks,
Kevin

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTtLu3AAoJEJNY7TDerrFxbuIH/jqVJVzLXt5aueSBdUDn6f/l
ziGb+7RzmYOSm6JsKdw+YCM93D6XksQ+eMZ+WgTqg3A6b2Wyrv2gWTQi8lsKPMFb
ImYmEtY7bz7+CufuXH5kloa6HYXXrzxcnUPYqMVd8xmfJk6iQWd2bA/N1DaDjmik
2Y8CH5QqmVpZn8Z+3C7OB3Kkvrc/H/PxHLqJvfDzyHdqcUehaxvBF3SKGTSQkOUO
R5Gs30ezrgvJx9GpMR5ZR9KRJeuR6A3sGivAzX5wfu8T/3Ogw5K5UwNHJGYGDSEi
/jgT6tCd99GcLE9JKNJgPzTK0gDlzgY6Wu8sgqcKosaWPjLbtmYue9lhBm0aTmE=
=0CiX
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
