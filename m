Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emy0o-0007ti-3Q
 for linux-mtd@lists.infradead.org; Sat, 17 Feb 2018 08:38:28 +0000
Date: Sat, 17 Feb 2018 09:38:12 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Jonas Gorski
 <jonas.gorski@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V5 0/2] mtd: simplify mtd_device_parse_register() code
Message-ID: <20180217093812.0814fe2b@bbrezillon>
In-Reply-To: <20180116154542.9767-1-zajec5@gmail.com>
References: <20180115224547.9265-1-zajec5@gmail.com>
 <20180116154542.9767-1-zajec5@gmail.com>
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

On Tue, 16 Jan 2018 16:45:40 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Even though I have some experience with MTD subsystem every time I was
> starting working on it I had to do some quick research on the code flow.
> I think there is some place for cleanup and optimization that would
> simplify overall code and allow new developers to start working on it
> more easily.
>=20
> In these patches I meant to slightly simplify mtd_device_parse_register
> function. I think we could reduce amount of add/register/del functions
> and this is the first step for that.
>=20
> Ideally I think mtdcore.c shouldn't handle parsing but just use a single
> function from mtdpart.c.
>=20
> Patch 1/2 modifies code to make sure parsing code is not mixed with MTD
> master code. This should allow moving parsing parts to the mtdpart.c in
> the future.
>=20
> Patch 2/2 simplifies code and makes sure parsing is handled at 1 place
> only.
>=20
> Even though this cleanup isn't complete I think it already has some
> value and could be accepted (if there won't be objections) on its own.
> It's also quite small which should allow reviewing it easily.
>=20
> Rafa=C5=82 Mi=C5=82ecki (2):
>   mtd: move code adding master MTD out of mtd_add_device_partitions()
>   mtd: get rid of the mtd_add_device_partitions()

Applied (even if I keep thinking those 2 commits should have been
merged in a single one :P)

Thanks,

Boris

>=20
>  drivers/mtd/mtdcore.c | 58 ++++++++++++++++++---------------------------=
------
>  1 file changed, 20 insertions(+), 38 deletions(-)
>=20



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
