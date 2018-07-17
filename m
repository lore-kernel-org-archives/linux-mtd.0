Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffOgH-0005R4-8w
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:02:14 +0000
Date: Tue, 17 Jul 2018 14:01:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 2/3] mtd: rawnand: update the controller structure
 initialization function name
Message-ID: <20180717140151.122688a0@xps13>
In-Reply-To: <20180717135106.492dbb3d@bbrezillon>
References: <20180717095454.27935-1-miquel.raynal@bootlin.com>
 <20180717095454.27935-3-miquel.raynal@bootlin.com>
 <20180717135106.492dbb3d@bbrezillon>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 17 Jul 2018
13:51:06 +0200:

> On Tue, 17 Jul 2018 11:54:53 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > After the rename of the structure nand_hw_control -> nand_controller,
> > let's also rename the core function initializing it from
> > nand_hw_control_init() to nand_controller_init().
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> I think this should go with patch 1, no need to split that in 2
> patches IMO.

I wasn't sure of the split. I'll fold them.

>=20
> Other than that, I'm okay with the change, so my ack on the first patch
> stands.

Thanks,
Miqu=C3=A8l
