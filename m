Message-ID: <1350307104.4115.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Mon, 15 Oct 2012 16:18:24 +0300
In-Reply-To: <507794B6.2000107@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
 <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
 <507794B6.2000107@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uNlVli5IntlffuGo0VG5"
Mime-Version: 1.0
Cc: Vinod Koul <vinod.koul@intel.com>, viresh kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 spear-devel <spear-devel@list.st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uNlVli5IntlffuGo0VG5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-10-12 at 09:25 +0530, Vipin Kumar wrote:
> The buffers provided to the driver are actually user buffers. The reason=
=20
> I say that is because the generic nand test modules eg=20
> drivers/mtd/nand/mtd_stresstest.c calls mtd->_read with a user buffer as=
=20
> an argument

I am not sure what does "user" buffers mean, but they are vmalloced()
buffer, not kmalloc()'ed, so they are not physically contiguous.

> This same buffer directly trickles down to the driver
>=20
> Artem, should we clearly cast this buffer as a user pointer instead of=
=20
> just a 'uint8_t *'.

They are not "_user", they are really kernel buffers. Or what do you
mean, which exactly type do you suggest?

This stuff is something many people are bringing up for many years
already. Drivers that do DMA do not cope with vmalloc()ed memory well,
and we grew a number of hacks in several drives. I mean, hacks like the
one you are introducing to your driver.

I'd solve the problem by changing the in-kernel mtd users to use
physically-contiguous memory instead. The following are the users I can
think of:

UBI, UBIFS, JFFS2, mtdtests and probably mtdswap.

They use vmalloc() when they need to read/write entire eraseblock, which
is usually 128KiB or 256KiB, and kmalloc() that much may fail if the
memory is fragmented.=20

In many cases, it is easy to read/write in smaller chunk, but several
times. E.g., mtdtests could be changed.

In some cases, it is not easy, though.

First thing which comes to mind is that in modern kernels memory
fragmentation is not that big issue as it used to be. So may be
kmalloc() the memory is not that bad nowadays? We have page migration,
memory compaction, etc?

I'd really prefer to just switch to kmalloc() everywhere instead of
adding hacks like this to the drivers. Then if this is a problem for
someone, he can fix it by either switching to smaller buffers (possible
in many places), or by improving memory fragmentation issues on his
system, or by just using CMA.

We can even have an mtd-wide funcion which will try kmalloc(), and if
that fails, fall-back to CMA.


Then we can add a guard check to all mtd function which accept a buffer
and WARN() if it not physically contiguous.

--=20
Best Regards,
Artem Bityutskiy

--=-uNlVli5IntlffuGo0VG5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfA0gAAoJECmIfjd9wqK0fSUQAK3eannIelphawp+Xne13lLr
Dl1ENUPjOHiiQC3/LcD9NA+LUiQTarfhIJIdqiYSJ2VVV5zJCrnsi2HGl/qTVRmY
ZQ/OkiN1kRTu0DIkvGzXa6Kg0luvWu+6wpjNdhfHX2wIHZ8ewZ1OMtBJAkFAGxAS
GZJvuSICliR0ufMsK8it1J/a/Av++wAa2t/s7mQG8JfWpt6GTYBfIPpdQ6ASBAh+
RenybHkBmM2TVQas6lacuCy9rb4w2+Z+QjeMpl0ogffC64YmU9xf1KWkr4CJVXon
F7xlieHFDcOBSg8ZBXxRpZxo05qJO9WA782CQESScuj+NjhnvBfIckO3GAD99Cy0
LWSURqQnZI3zz3/5hkWej2v1Ul946lpXkyip6ZqII/vWYW8aLDjqgUM6s5zN7GUK
cc/PIUJTWlmfiJaFj7HdT0GayymV7z3dm6q1PFT2FhjKf787CF+8yrab4U2U+cZz
LBsUp+ePNdTKweUXj8ol+G+TkYwf57iKAqKwTks23GTIKeR03y3EF/wxo7FdcW1p
1iGYl4KMufXghzivd6rk1KLgaU/IWDdpTvn/IZ0MDRC8Iba31gJMATAFLhXmJAYC
fxcOJJX1ZQqt6uqkK2GfH2OdWmS1rCq8aF9mEfunmO27/JYKnhGvyJVHROiZxHtS
abPjhgsjhLminCXjq7Ih
=2dRX
-----END PGP SIGNATURE-----

--=-uNlVli5IntlffuGo0VG5--
