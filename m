Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv2WA-0008Th-Bc
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 09:09:15 +0000
Message-ID: <1358241038.2731.118.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Tue, 15 Jan 2013 11:10:38 +0200
In-Reply-To: <1355387350-14002-1-git-send-email-sr@denx.de>
References: <1355387350-14002-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mNi0DHFcf4pY/Tv7Aw2a"
Mime-Version: 1.0
Cc: devicetree-discuss@ozlabs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mNi0DHFcf4pY/Tv7Aw2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-12-13 at 09:29 +0100, Stefan Roese wrote:
> Currently cfi_cmdset_0002.c does not support PPB locking of sectors. This
> patch adds support for this locking/unlocking mechanism. It is needed on
> some platforms, since newer U-Boot versions do support this PPB locking
> and protect for example their environment sector(s) this way.

Some "#ifdef CONFIG_OF"s are missing:

drivers/mtd/chips/cfi_cmdset_0002.c: In function =E2=80=98cfi_cmdset_0002=
=E2=80=99:
drivers/mtd/chips/cfi_cmdset_0002.c:579:4: error: implicit declaration of f=
unction =E2=80=98of_property_read_bool=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
drivers/mtd/chips/cfi_cmdset_0002.c: In function =E2=80=98do_read_secsi_one=
chip=E2=80=99:
drivers/mtd/chips/cfi_cmdset_0002.c:1146:16: warning: variable =E2=80=98tim=
eo=E2=80=99 set but not used [-Wunused-but-set-variable]
cc1: some warnings being treated as errors
make[4]: *** [drivers/mtd/chips/cfi_cmdset_0002.o] Error 1

Please, check allso the timeo warning.

--=20
Best Regards,
Artem Bityutskiy

--=-mNi0DHFcf4pY/Tv7Aw2a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9R0OAAoJECmIfjd9wqK0jKMP/jFRakePV9j5HnusY5dwMtb0
vQYBCADepDypi5M8zBA+mJdtGDfYSqicbdSUHYeUkyuXGSNCC+A4JnA7HObRLssq
/ZFcCZ3/8GI+gCuCH4NTEvXSo5GEFQExjH+hm8yq9ipkX1R4fLe5gxyOUSpCtSFA
bL8N4cV7BvsRff08CQWILQs/qEvq+nGmvXeAFZL0vda4hxy1wBAia9yXEwnj81tv
DtrQEpgtEGdFb2WXZBUgbdK/H8zWR2nmimhxDbd5qDw5GBXdYIKg+rXqmqEHZD19
UXrwgOSGGF3s1wXskfxe+/MUrf9/GZZxrbTnYfoCidu9ymKRNg0IsY8QmS/tdiqx
qLreI7u0OM9Z/NKqowym9Y+axmRXj7J0gbZ3AgqG3lQU7H4UD6CQCiuw4d8Qrsuf
8RM1stFGRXVXkOvton/w2g+9qmnPzHsLihqHW1GYOXEYu14U/YESpIaDiGu5GgBe
HtYLK1oHdkal8KbbEwvL6SHVEheRTsXOXLZeU+O7XDi2lUwFYMJTZYH5vOk3VyVw
UwjgQTBT36n1+83FKa+LklXT6EaGYsE0jp2cnR3YM2mnXgQWaBWtWsDm2kp0jS6M
mitUswduGNXdhn9Z5QcimSeiCxqkQ6Qiy+CUpSweOj5QFqOpnxvGptxOzgQXBedM
bIgT01M0uLuNCTTH3WMl
=8Jhc
-----END PGP SIGNATURE-----

--=-mNi0DHFcf4pY/Tv7Aw2a--
