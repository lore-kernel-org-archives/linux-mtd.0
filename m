Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN3ky-0006Uv-L2
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 15:03:49 +0000
Received: by lboj14 with SMTP id j14so189933lbo.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 08:03:45 -0700 (PDT)
Subject: Re: UBIFS recovery fail after power-cut
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b w <wdjjwb@gmail.com>
Date: Wed, 25 Apr 2012 18:03:40 +0300
In-Reply-To: <CAHvCehW+wXWC6MmPsjsZ6mr3i9CPR48anjSr-5rq8T7A8HEVhA@mail.gmail.com>
References: <CAHvCehVNgTgL+vY8SV1APN_xokogCM=Q+c7U1X9-_H1jn47Dpg@mail.gmail.com>
 <1334336350.13160.16.camel@sauron.fi.intel.com>
 <CAHvCehW+wXWC6MmPsjsZ6mr3i9CPR48anjSr-5rq8T7A8HEVhA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-A9CQGDip8SKq/4hbpS8T"
Message-ID: <1335366224.6356.7.camel@koala>
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


--=-A9CQGDip8SKq/4hbpS8T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-17 at 21:03 +0800, b w wrote:
> Thank you very much. I do not apply this patch: "UBIFS: use
> max_write_size during recovery". So the code is "skip =3D ALIGN(offs +
> UBIFS_CH_SZ, c->min_io_size) - offs;" the c->min_io_size is 8. When i
> modify MTD/UBI/UBIFS and apply that patch,use  c->max_write_size
> instead,this problem is solved.I think that patch not just an optimize
> but fix this problem. Should we use "fix" in the title of that patch?
> By the way, in my machine UBIFS_CH_SZ is 24 not 64.

Good to know that the issue is solved. WRT to re-naming the patch title
- may be you are right, but it is too late now.

--=20
Best Regards,
Artem Bityutskiy

--=-A9CQGDip8SKq/4hbpS8T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmBJNAAoJEJtuLFy+q7fey8gH/3X9PXjgG97ybHle588+ZDDb
ZJD7CnPkjH83clxmCG8LnR84et5e4XWcjshYnyw4g/hkPoLMC6hvmYu5DRrGIFNO
EFb7fQ8v2SP5qE/8FTopJD2bpDmFqoCcdCGUn0sxxzaMX/eC+QrKxYhHqPaeu0mB
2Mpk5D9PQJa8Z6akBtWZkcr+7Z24cANQyGFx4owkLCsSq3FDcqQ8+vOUGNi9/XdX
OfYnHCEvEdrvlAAANMd0Rq9zTT2Cnmex3ww7m7S0AtLNCWrvKfOyWvO/SEkVIhbg
wsbi22aieAEAQYfgvQ0xW4p1TfJcMe4OlLTg/SQNQEGlqdz+7SYRqnFxvhUXr60=
=VTrs
-----END PGP SIGNATURE-----

--=-A9CQGDip8SKq/4hbpS8T--
