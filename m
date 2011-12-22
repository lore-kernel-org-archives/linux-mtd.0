Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rdl85-0002n8-Mc
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 16:04:30 +0000
Received: by ghrr15 with SMTP id r15so3856351ghr.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2011 08:04:24 -0800 (PST)
Message-ID: <1324569962.1165.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [RFC] ubi: Make vid_hdr non-static
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Date: Thu, 22 Dec 2011 18:06:02 +0200
In-Reply-To: <1324566777-1918-1-git-send-email-rw@linutronix.de>
References: <1324566777-1918-1-git-send-email-rw@linutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-960mFQsGEXaWzZzZl1Fb"
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


--=-960mFQsGEXaWzZzZl1Fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-22 at 16:12 +0100, Richard Weinberger wrote:
> There is no reason to have vid_hdr static.
>=20
> Signed-off-by: Richard Weinberger <rw@linutronix.de>
> ---
>  drivers/mtd/ubi/vtbl.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> index 9ad18da..890754c 100644
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -306,7 +306,7 @@ static int create_vtbl(struct ubi_device *ubi, struct=
 ubi_scan_info *si,
>  		       int copy, void *vtbl)
>  {
>  	int err, tries =3D 0;
> -	static struct ubi_vid_hdr *vid_hdr;
> +	struct ubi_vid_hdr *vid_hdr;
>  	struct ubi_scan_leb *new_seb;

Hmm, this shouldn't be [RFC] - this a bugfix, I'll merge it, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-960mFQsGEXaWzZzZl1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO81VqAAoJECmIfjd9wqK054QQAJobo5sDHvaZOldepI0DOM6v
loXUgTLo6gYKybyA7GUZMc+8gB1ckIRmjpSXkDYM97kRR9OzAkC2IXmurxs+7qth
Zjnngekw/BIWtwOTNdlafzOheLsQ1gswOBB4R5uOozUpd9p6ZiAetJoIdwzPPWO3
2bErHBhN3iXuRlxGT6kXED1jWcJEbvS3z4pmTFHzbImrA4FX2P6vjTUOrjTs26N/
SfOoEPTmL5ggTbytvEhvRmdd8Yraiyw4sMLP7P0stfqUw6bwkfes6urCnmkvLiEo
knTzLEjhKQ9Az5370SbVtm9OrR6ahFQFAFv7+0ATzv78qBwEY/85560rQqUI0fax
9poMDVeInqR6n6J+Mxl6odRPuQoZlWroX7HRLKrWOU9o+Rm+jpHKMnaS73T5LPtK
esves9Z4N3ZE0iMkXMWGdngkJp/dMRYpxmpYmECfLOXOQtXkK0ECKeyt3U5/vyZc
WBqXQ6EuTlxkimIpQrUqu23ohT2wT0OMsKl7QkMwWhu6TZ6Zl+KTxgaWFTsVBvna
JlkS31Dju+N/Xlm1uT9c8w/asAMsqmfkf5FSrXrDhCbujgHRk1Ck47zVSI4JNcOn
1/oSxBnjuboQ90t0D3r/VI2wrSYVbm/W2mSYaizPiSLkML4efEKk7F1/+n0j2/1v
PxQzw3OhQ2x9P/ghQw/0
=/X2Z
-----END PGP SIGNATURE-----

--=-960mFQsGEXaWzZzZl1Fb--
