Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeN3j-0003LF-7s
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 09:39:01 +0000
Message-ID: <1354268388.30168.80.camel@sauron.fi.intel.com>
Subject: Re: [RFC] LFTL: a FTL for large parallel IO flash cards
From: Artem Bityutskiy <dedekind1@gmail.com>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Date: Fri, 30 Nov 2012 11:39:48 +0200
In-Reply-To: <CAMjNe_cJG6wkiPDvVZzqURz4gVTW8Dx4JrM-KPVbVedLwsDfcw@mail.gmail.com>
References: <CAMjNe_cJG6wkiPDvVZzqURz4gVTW8Dx4JrM-KPVbVedLwsDfcw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uY/ZD0xDP1iYdg7ToHRU"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uY/ZD0xDP1iYdg7ToHRU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-11-17 at 01:04 +0530, srimugunthan dhandapani wrote:
> Hi all,
>=20
>  Due to fundamental limits like size-per-chip and interface speed
>  limits all  large capacity Flash  are made of multiple chips or banks.
>  The presence of multiple chips readily offers parallel read or write sup=
port.
>  Unlike an SSD, for a raw flash card , this parallelism is visible to
>  the software layer and there are many opportunities
>  for exploiting this parallelism.
>=20
>  The presented LFTL is meant for flash cards with multiple banks and
>  larger minimum write sizes.
>  LFTL mostly reuses code from mtd_blkdevs.c and mtdblock.c.
>  The LFTL was tested on  a 512GB raw flash card which has no firmware
>  for wearlevelling or garbage collection.
>=20
>  The following are the important points regarding the LFTL:
>=20
>  1. multiqueued/multithreaded design:(Thanks  to Joern engel for a
>  mail-discussion)
>  The mtd_blkdevs.c dequeues block I/O requests from the block layer
>  provided request queue from a single kthread.
>  This design of IO requests dequeued from a single queue by a single
>  thread is a bottleneck for flash cards that supports hundreds of MB/sec.
>  We use a multiqueued and multithreaded design.
>  We bypass the block layer by registering a new make_request and
>  the LFTL maintains several queues of its own and the block IO requests a=
re
>  put in one of these queues. For every queue there is an associated kthre=
ad
>  that processes requests from that queue. The number of "FTL IO kthreads"
>  is #defined as 64 currently.

Hmm, should this be done in MTD layer, not hacked in in LFTL, so that
every MTD user could benefit?

Long time ago Intel guys implemented "striping" in MTD, sent out, but it
did not make it to upstream. This is probably something your need.

With striping support in MTD, you will end up with a 'virtual' MTD
device with larger eraseblock and minimum I/O unit. MTD would split all
the I/O requests and work with all the chips in parallel.

This would be a big work, but everyone would benefit.

--=20
Best Regards,
Artem Bityutskiy

--=-uY/ZD0xDP1iYdg7ToHRU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuH7kAAoJECmIfjd9wqK0DEgP/3rEYFsA99KtVqPPK98aC6c4
wd+b/Jauc/5WJpCC/5dXcFJw0eKmH2gQiAl3VYg/doqxo6nYvU2LYPq5F3pBBKMq
lKBnSEY7LYgtoeC2/tCxjPErt8Ll8/YH/o7zbb2qTZwZfnOY8eYd5r8lu7ijagkz
d7S3w7u7YQMnFfWiIovO7ru5OXiqlfj1O3l0BIsRwd1z3Qe1XN10jIE1kYgWDTMP
nBL7awyLbdu7Rpt8DTCXEk8Y0jJuvbhwOfQVG0Z7TnEvrOocHgl4YNX6M79q68wU
fs1TLzsgoE1N4LfpXqG5mAqZndzqXKpdDmbWD62+9zWMUgLYuvxRAOJQP0vvouYV
rqn/B7cxab6VR7Lqj9bNPTgEC0A83AwAjlps6PlYTgHSQH+sqnrZbOx0K+wglDmx
m+iAHNfBW8FWuP5TwktxuRQT7F/l8Qqf0mOgpbvv0whLlzv5UzxtPNAG7ax0pPdj
pmfBGfecpRixe7lcalfAPO/a44V4OTG3YS02DMNMVA1UNHHuQipsZiljM1Jpgyjx
Xh1Tez/OttI1YNr3TvcYvUXgh0BPL9g0Zcz4WHFHf4fqECM4zk+wlFbNIZxg1Ut0
o3vGsJs9aXoLrkMzQk3hBOdJimzENclHTkHbvNHdGaZn/3/thD05bObRDGq4q31R
sOMV4tpx8TFqK0WWwQVs
=uZj5
-----END PGP SIGNATURE-----

--=-uY/ZD0xDP1iYdg7ToHRU--
