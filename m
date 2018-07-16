Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffAmo-0003ib-AX
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 21:12:03 +0000
Date: Mon, 16 Jul 2018 23:11:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC API ONLY] mtd: get parsers from lookup table
Message-ID: <20180716231149.0704591f@bbrezillon>
In-Reply-To: <1b51d369d433ae0093ba4dac1062c9e0@milecki.pl>
References: <20180716111712.7636-1-zajec5@gmail.com>
 <20180716182312.74fc55a9@bbrezillon>
 <1b51d369d433ae0093ba4dac1062c9e0@milecki.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 16 Jul 2018 22:58:19 +0200
Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> wrote:

> On 2018-07-16 18:23, Boris Brezillon wrote:
> > Hi Rafal,
> >=20
> > On Mon, 16 Jul 2018 13:17:12 +0200
> > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> >  =20
> >> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>=20
> >> Existing implementation of specifying flash device parsers became a=20
> >> bit
> >> hacky and needs a cleanup. Currently it requires:
> >> 1) Passing parsers in a custom platform data by arch code
> >> or
> >> 2) Hardcoding parsers table in a flash driver
> >>=20
> >> The purpose of the new implementation is to:
> >> 1) Clean up flash drivers
> >> 2) Have a generic solution
> >> 3) Avoid code duplication
> >>=20
> >> That new implementation assigns table of parsers to a MTD's parent
> >> device. That way flash driver doesn't have to take care of passing
> >> parsers. It's inspired by GPIO lookup table.
> >>=20
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >> ---
> >> It's obviously a RFC patch only. It doesn't really implement anything.
> >> It DOESN'T COMPILE.
> >>=20
> >> I'd like to know if you like this idea and if it's worth for me to
> >> actually spend time implementing it. =20
> >=20
> > I love the idea. Actually, I'd like to extend that to fixed partition
> > definitions (those passed to mtd_device_register()) so that they can be
> > parsed by the fixed-partition parser (the one already taking care of
> > compatible =3D "fixed-partitions"). =20
>=20
> That was something I planned to handle next, so it's great to hear we
> share the ideas for further improvements! That will extremely simplify
> mtd_device_register().

Cool!

>=20
> In 99% cases there is only one place in the code registering a given
> platform device. As there is only one place registering "sharpsl-nand"
> device, we can assume the resulting name will be "sharpsl-nand.0".
>=20
> If there was another code doing the same, you couldn't know if you
> should expect "sharpsl-nand.0" or "sharpsl-nand.1".

It's only true if you use platform_device->id =3D PLATFORM_DEVID_AUTO,
and I think we can assume linking a lookup table to a device with ->id
=3D PLATFORM_DEVID_AUTO is broken. In other cases, the id defined at
platform_device definition time (either PLATFORM_DEVID_NONE or a
statically assigned id).

>=20
> I believe we should be fine guessing in these 99% cases and only depend
> on order (semi-risking a race) in that 1% (or less).
