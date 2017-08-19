Date: Sat, 19 Aug 2017 09:26:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrea Adami <andrea.adami@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Dmitry
 Eremin-Solenikov <dbaryshkov@gmail.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Russell
 King <linux@armlinux.org.uk>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/9] mfd: tmio: Add partition parsers platform data
Message-ID: <20170819092603.1c919b4b@bbrezillon>
In-Reply-To: <20170815065835.jcuweb377lqioddc@dell>
References: <1502743720-28672-1-git-send-email-andrea.adami@gmail.com>
 <1502743720-28672-4-git-send-email-andrea.adami@gmail.com>
 <20170815065835.jcuweb377lqioddc@dell>
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

Hi Lee,

Le Tue, 15 Aug 2017 07:58:35 +0100,
Lee Jones <lee.jones@linaro.org> a =C3=A9crit :

> On Mon, 14 Aug 2017, Andrea Adami wrote:
>=20
> > With the introduction of sharpslpart partition parser we can now read t=
he
> > offsets from NAND: we specify the list of the parsers as platform data,=
 with
> > cmdlinepart and ofpart parsers first allowing to override the part. tab=
le
> > written in NAND. This is done in the board files using this driver.
> >=20
> > Thus, we need to extend tmio_nand_data to consider the partition parser=
s.
> >=20
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  include/linux/mfd/tmio.h | 1 +
> >  1 file changed, 1 insertion(+) =20
>=20
> Acked-by: Lee Jones <lee.jones@linaro.org>
>=20

I'm about to apply patches 1 to 5 of this series to the nand/next
branch. Do you want me to create an immutable branch with this patch?

Regards,

Boris
