Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtBjP-0005WI-Ov
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 05:30:44 +0000
Received: by iafj26 with SMTP id j26so5086365iaf.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 21:30:41 -0800 (PST)
Message-ID: <1328247161.6750.23.camel@sauron.fi.intel.com>
Subject: RE: [PATCH] mtd: atmel_nand: fix access to 16 bit NAND devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Date: Fri, 03 Feb 2012 07:32:41 +0200
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6DD0B99114@BGMAIL02.nvidia.com>
References: <201201251217.q0PCHmRe027024@gatekeeper.vosshq.de>
 <1327670996.26648.43.camel@sauron.fi.intel.com>
 <EF2E73589CA71846A15D0B2CDF79505D08AD3E5453@wm021.weinmann.com>
 <4F265B7E.6060806@atmel.com>
 <1328184370.28171.175.camel@sauron.fi.intel.com>
 <D958900912E20642BCBC71664EFECE3E6DD0B99114@BGMAIL02.nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hE1uPOobOVBt3mczAn/w"
Mime-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>, "Voss,
 Nikolaus" <N.Voss@weinmann.de>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hE1uPOobOVBt3mczAn/w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-02-03 at 09:05 +0530, Venu Byravarasu wrote:
> I see a problem with atmel_read_buf16 & atmel_write_buf16 functions.
> As they are calling __raw_readsw & __raw_writesw respectively, which=20
> would cause panic in cases of 16 bit unaligned buffers.
> However, the buf passed to these functions is of type u8* from=20
> atmel_read_buf & atmel_write_buf functions.

I think this is a valid concern. In theory, the NAND infrustructure must
guarantee that the buffer is always of even length, and most probably it
does, but we could add a WARN_ON(len & 1) statements in
'atmel_read_buf()' and 'atmel_write_buf()'.

And probably the type could indeed be changed.

But these concerns should be addressed separately.

--=20
Best Regards,
Artem Bityutskiy

--=-hE1uPOobOVBt3mczAn/w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK3F5AAoJECmIfjd9wqK0ZvsQAMaE5Nox20plvaL571Th0Drt
b61exxhhcpbVZLImV9bh4Amc4N6nChjkdMFt2+iQe6h2g8LCOlB2/XDJecDbe4Dp
CiJw/qU0TljNPnU2GiqHtdzXLT2IFbxA3cBRl7zSwg0fSMGXN4Xz73SKmnHSo3EB
ihbIztjjyrcYOvf8V8UuDSrHLKunR/N9zIVbJK9QVHPnvSnzkOEq6Pir1y6NdGFF
QNixCf43LdsXLf0cdC/P1JS/C26VgbbpkGnsBVufUCHIm1LXfLOiFD9fP/5byFyZ
sYa1BHsZB5ApCWYC9Du569JSaVngZfTa+XVHd0arTBEGrSFKZ6ax0yf1y3bynxqT
5nxWuXpuS4fX2XKsUKxY0xD/RHKs5Fbj8qExjfcXHnpVjicf0bBk4m05oAetH+WV
/Q6lKhf/4EGxp+EiCmVYsgmsFDXBErQPE2fbqBAG0A33WfSblrwSRqqoMRLFQNLC
nzJf+3BgdQFMPgU963JlTY/Wg1+4KmjQGcuKEhFI9XwAtWb65+VAlJzz6tZp0mzZ
sqClobSTC4tIYD/pqjRNJJiI7OsTcVpHszqqMi1VhujjXJmMoiGbX3luOpDo9RaG
TQ0z9tWhKZiiAozEo6tOSxVji8C67uyTcH/CO9mCdMU+5QfzYF4zQ49n1k2pxwx5
5TF2Ggw9vSaXOtVGf5uR
=Jq1H
-----END PGP SIGNATURE-----

--=-hE1uPOobOVBt3mczAn/w--
