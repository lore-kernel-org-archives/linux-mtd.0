Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffuX5-0002a3-CV
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 22:02:52 +0000
Date: Thu, 19 Jul 2018 00:02:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: better name for the controller
 structure
Message-ID: <20180719000228.65e3c477@xps13>
In-Reply-To: <20180718235845.4131d653@bbrezillon>
References: <20180718215056.1242-1-miquel.raynal@bootlin.com>
 <20180718215056.1242-2-miquel.raynal@bootlin.com>
 <20180718235845.4131d653@bbrezillon>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 18 Jul 2018
23:58:45 +0200:

> On Wed, 18 Jul 2018 23:50:55 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > =20
> >  /**
> > - * struct nand_hw_control - Control structure for hardware controller =
(e.g ECC generator) shared among independent devices
> > + * struct nand_controller - Control structure for hardware controller =
=20
>=20
> Hm, the description is weird. How about "NAND controller object" or
> "Structure used to describe a NAND controller"
>=20
> Other than this detail, it looks all good to me.

That's right I don't like it neither. I just removed the "e.g ECC
generator" which was wrong but it deserves a better definition. I'll
stick to "Structure used to describe a NAND controller" which is clear
enough for me.

I'll fix when applying.

Thanks,
Miqu=C3=A8l
