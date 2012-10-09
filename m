Received: from mail-la0-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLdZ2-0001kz-MI
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 17:25:55 +0000
Received: by mail-la0-f49.google.com with SMTP id z14so3111155lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2012 10:25:50 -0700 (PDT)
Message-ID: <1349803535.1827.0.camel@kyv>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Tue, 09 Oct 2012 20:25:35 +0300
In-Reply-To: <CAP+RiCBCe-KUu+dd5NTizMoJU4gd+r5o=VmBa4CauP704uSmbQ@mail.gmail.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
 <1346413469.9709.44.camel@sauron.fi.intel.com>
 <CAP+RiCBRopbShAGf_fWCvK2R=uPPR1j4Pz12JfJxdEMUjwofNw@mail.gmail.com>
 <CAP+RiCAzOKvV00F8zppPxrL1CHKqR6eU2g08F+s_wm2R6jJ7Cg@mail.gmail.com>
 <CAP+RiCDHZYMZPFYmE6YfkLoA1gH=z8cTSRZ+9iQqQ=ei1xXFYg@mail.gmail.com>
 <1349789437.1992.116.camel@sauron.fi.intel.com>
 <CAP+RiCBCe-KUu+dd5NTizMoJU4gd+r5o=VmBa4CauP704uSmbQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-fQTNSA46ynnJD4iMaYTR"
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


--=-fQTNSA46ynnJD4iMaYTR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-09 at 12:11 -0500, Brent Taylor wrote:
> Artem,
>    Thanks so much for your time to track down this bug.  I've tested
> your patch and it does mount the filesystem that it would fail on
> before.  I'm glad I could help.  I want to thank you for all your work
> in the UBI and UBIFS subsystems and all your contributions to the
> Linux kernel.

Thanks!

I will send a better version of the patch later, and give it some more
test. I will keep you in CC.

--=20
Best Regards,
Artem Bityutskiy

--=-fQTNSA46ynnJD4iMaYTR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdF4PAAoJECmIfjd9wqK0+PIP/3/7ImRx3MAe/9h3zWBHkiJH
r3Lgw7n2/xhqvn0KI+HxHiiubJmFgCbHVQvTB1uQiQugrc/ggBZkjO2OFQp3JyNj
3PEE8Bm3AkTVPhpGKQ+5KyGsuR6Yf2muGKFM8I8zeLplMojgDDL/u400W20RR5J7
XTvY+2L1n4r/2go7ovfOCc+zM1wnnaAQI7Vg9tfUo8p3BfB5r3GLbImWsrS7Z9OT
vxyjBO6pKFmmoBgcs+5N+hlvPPSorPwOk3zR5OaG3Ct0nYRLGIZYelk6DgHYcDT6
WGNHS7Z78SYbmtrDqDRI8bjpRvB9grMQ5q/jPVX1UY936ATVUyFczAWd3qSiJmnS
qr3GYFI1n+9T/zRgjXdtkh9Tsi4aXwkJZ1jpW6wckE32Xtoj4Vdz/H/su44jqDeH
nDJVycGv6efHwuJesEn+XxwLysTiSqXNWfFleKKIwHN5xwq4D7f2iJTLEP0hOX2v
m4jtSkUHaW3j6HCBNQFelD3TtkFVBL3+72et5NVMPigpIL3WQCbvNF5of/vQwzNX
BIisemGSnnguFAZEECvKinlF3sRg9a55akrnzofOgvyCunpYW6P0FcBa6wy6jwrw
AzqiKSV5RFhMZduFxUyg5mzHPqV28+3RgVfh0Qe45o8xawI7HmOCOY0D+ssRB47r
uFHtjv7iki0+o5SEbqkT
=f1xo
-----END PGP SIGNATURE-----

--=-fQTNSA46ynnJD4iMaYTR--
