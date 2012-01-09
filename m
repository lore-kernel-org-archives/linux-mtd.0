Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkGrY-0007Av-GH
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 15:10:20 +0000
Received: by obcwn1 with SMTP id wn1so5598375obc.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 07:10:15 -0800 (PST)
Message-ID: <1326121948.6755.102.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [RFC] ubi: Make vid_hdr non-static
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Date: Mon, 09 Jan 2012 17:12:28 +0200
In-Reply-To: <1324569962.1165.6.camel@sauron.fi.intel.com>
References: <1324566777-1918-1-git-send-email-rw@linutronix.de>
 <1324569962.1165.6.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-o4AqsCzDwAfBaLZWIMw8"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
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


--=-o4AqsCzDwAfBaLZWIMw8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-22 at 18:06 +0200, Artem Bityutskiy wrote:
> On Thu, 2011-12-22 at 16:12 +0100, Richard Weinberger wrote:
> > There is no reason to have vid_hdr static.
> >=20
> > Signed-off-by: Richard Weinberger <rw@linutronix.de>
> > ---
> >  drivers/mtd/ubi/vtbl.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> > index 9ad18da..890754c 100644
> > --- a/drivers/mtd/ubi/vtbl.c
> > +++ b/drivers/mtd/ubi/vtbl.c
> > @@ -306,7 +306,7 @@ static int create_vtbl(struct ubi_device *ubi, stru=
ct ubi_scan_info *si,
> >  		       int copy, void *vtbl)
> >  {
> >  	int err, tries =3D 0;
> > -	static struct ubi_vid_hdr *vid_hdr;
> > +	struct ubi_vid_hdr *vid_hdr;
> >  	struct ubi_scan_leb *new_seb;
>=20
> Hmm, this shouldn't be [RFC] - this a bugfix, I'll merge it, thanks!

Pushed to ubifs-2.6 git tree with "Cc: stable@kernel.org", thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-o4AqsCzDwAfBaLZWIMw8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPCwPcAAoJECmIfjd9wqK0L1YP/jTE0HUA62ZMe8T/+N04X3Wu
VfkYj3wZ+lUpx2P4KvWKWxwIID4UH4PrSnoElc1V2pSEJ2rhOA/7xuUDOELmbvnP
pnjLHX0mucMoD6dmKOgqWBRfJIv/oVPIjH3X92pS4Xvi+eXL8qPFXb87Ol64N7zv
CdN/pHlOz/QVK7oa0IqGxNg8Op0D0K6/lTSv5JQbAqJfFLaUsWSGR59c8bC1IvkU
Mcjgzb7j34hgSgkndB0c4elxVj0XcXTxNZ+dRCUzAd76VlzwdzMnzt9z0PfcxYpR
gKA+PZcIFB7/H6sF3+ByWv+KHC1stfjvd1Hy0V9zyn+j2B/3TqJNKl1ESvhmSSFc
TRx90LPi+sGb47HoNWnCqsxwY36zs2qKqUPlY9HsSfa1t5vSsONweBe6ikQf3i3o
0dSpz+ukhWSbQXKE5HShHXn3o7kLe9vZuRBywbD3NsmZujl5y8evCJeVBKegj4qV
Xq8UX5ZFVhNmNwQq7k8n4lJJXJIHb64mBgVhujc/TbbRdmO4L0kIOz2ZzzBu1svT
lKfEutX8RqWMIWs3oxTctJw6XQMMxVqMLH/ajS0MkicjpsO1invXZ9focGLyGyvP
saNeUHmDzO6/A8SH2QZKyTJ2BBqMQ6RdNjGIF1OJUxgE1O4g/05fo3WoH01vXsDp
6hiLZru7z87TJdDkzBiT
=m435
-----END PGP SIGNATURE-----

--=-o4AqsCzDwAfBaLZWIMw8--
