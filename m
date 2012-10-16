Message-ID: <1350371685.5769.45.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Oct 2012 10:14:45 +0300
In-Reply-To: <CACRpkdao_9TkH7=ia7kXB-KsQhNZQ7EfSS5B1X0wFPgg5OsuHA@mail.gmail.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
 <CACRpkdb6ArMUQ6MAsue+Gh15UfOUrWNAc9wrxd6awc0BTwOGiw@mail.gmail.com>
 <CAOh2x=ksMr7VRCnpF-rK+Mesg1p4Td++SQ-t=ShrguRRVWSSSQ@mail.gmail.com>
 <CACRpkdYjA8QUh4HqvE1rsnXcGA4WafTkMq_wLNJ__gXEnEYrow@mail.gmail.com>
 <507794B6.2000107@st.com> <1350307104.4115.23.camel@sauron.fi.intel.com>
 <CAN8TOE-7d=YUSYsHFw9X5vnz8cpSJYv5uZfvBpDyhg+-F_LDiQ@mail.gmail.com>
 <CACRpkdao_9TkH7=ia7kXB-KsQhNZQ7EfSS5B1X0wFPgg5OsuHA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Q6Iok8/c5O5GbyXY9trf"
Mime-Version: 1.0
Cc: Vinod Koul <vinod.koul@intel.com>, viresh kumar <viresh.kumar@linaro.org>,
 spear-devel <spear-devel@list.st.com>, Vipin Kumar <vipin.kumar@st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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


--=-Q6Iok8/c5O5GbyXY9trf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-15 at 21:51 +0200, Linus Walleij wrote:
> On Mon, Oct 15, 2012 at 6:27 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>=20
> > I would prefer not building a solution that hopes kmalloc() can get a
> > large contiguous buffer (remember, eraseblock sizes come as large as
> > 2MB these days). A real solution like CMA or scatter-gather seems like
> > a better idea.
>=20
> +1 on that, and as I think I illustrated the MMC subsystem is using
> the block layer helpers to form scatter-gather lists for it's requests.
> I don't see why the MTD subsystem need to be very different?

This is good idea, the problem is that it is a bit more work than
hacking the driver, so most people prefer the latter. By removing all
kmalloc()'s I basically wish to force people to go this way.

What are the SC functions names you refer?

--=20
Best Regards,
Artem Bityutskiy

--=-Q6Iok8/c5O5GbyXY9trf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfQllAAoJECmIfjd9wqK0EewQAKdjB4EL09U9u5mMU+ZqoOtV
Ysvo6cpUYYxG+1oaXqpF5MVSwZmfBRMU5LQO7KVPEnHIF+9m31nYQxTG721plLD1
z9jKALmxc2VF819OMqiqfp39rQS6GQSFKfn3u3eHVN/qjdpD4haxKJMVJ88IECiT
gvp7PJ6IDP0nHLarLLToQ60wRgNDeIDD8oTbjWd1pO+YCZ44A8vNEo8o+kfwLsKo
2hLmPbwFQQhz2Uqsqjmh2JPxdHDw63HSMKPddqyz7F0cej7tFmq39ZBn18bMwHNb
39vhW76i7lOMIewar+XoYaBlMiTVThX7pb92DMVWoYoZfqQ4yKKWmzIDiXn/Ac3d
J1NjMZ1vpG2X1UXRse4n3dul1bpd8H5qeq1N1hrCrk5voKAgGCetQ81JC8oL+BcE
8GqhTFC6gvQ9jdpd3nGngWVx30m5szK0fcIpPL7Z3AdPwPRybX3GAMoYaIV/PEqK
EFR0MdcuTPwAc5611lswG3uzKfF23rPPh9jV5/r25IJY6+tDRvnsKPhPfHzQnudv
/LmLw1WHgOjjWi3cz/2NwwDHN0WE1MIz2JoEDHeotN+KWZ3wNu+C0Ir/mCAJR66R
4nUJ6LuYKxB8uAEdW534r7ZwefJnw9fBtM7DnTUMPqxD7Bu08EZinALijtzj9dRg
jKPyDQrkH92kMYJ0aNyX
=eu3a
-----END PGP SIGNATURE-----

--=-Q6Iok8/c5O5GbyXY9trf--
