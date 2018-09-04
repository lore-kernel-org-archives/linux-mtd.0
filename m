Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxIOK-0003DC-IL
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 20:57:42 +0000
Date: Tue, 4 Sep 2018 22:57:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Mike Dunn <mikedunn@newsguy.com>, Sergey
 Larin <cerg2010cerg2010@mail.ru>
Subject: Re: [PATCH v2 2/4] ARM: pxa: palmtreo: Drop docg4 specific init
Message-ID: <20180904225726.2593ff10@xps13>
In-Reply-To: <87d0ue9mfd.fsf@belgarion.home>
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
 <20180804205923.25298-2-boris.brezillon@bootlin.com>
 <87d0ue9mfd.fsf@belgarion.home>
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

Hi Robert,

Robert Jarzmik <robert.jarzmik@free.fr> wrote on Sun, 19 Aug 2018
21:38:30 +0200:

> Boris Brezillon <boris.brezillon@bootlin.com> writes:
>=20
> > The docg4 driver has been removed. Remove the code that was registering
> > a docg4 device.
> >
> > Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com> =20
> No answer for several weeks from the maintainers, so let's say they lost
> interest.
>=20
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

I'm about to pick this series including this patch, do you need an
immutable branch?

Thanks,
Miqu=C3=A8l
