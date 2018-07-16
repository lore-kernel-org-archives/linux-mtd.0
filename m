Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ff0nY-0003Ib-Ha
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 10:32:09 +0000
Date: Mon, 16 Jul 2018 12:31:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: rawnand: marvell: document a bit more the driver
Message-ID: <20180716123147.77e2fe77@xps13>
In-Reply-To: <20180714224648.310bedec@windsurf>
References: <20180714135428.26955-1-miquel.raynal@bootlin.com>
 <20180714224648.310bedec@windsurf>
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

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Sat, 14 Jul
2018 22:46:48 +0200:

> Hello,
>=20
> On Sat, 14 Jul 2018 15:54:27 +0200, Miquel Raynal wrote:
>=20
> > + * The internal ECC operations are depicted in details in Marvell
> > + * AN-379. =20
>=20
> AN-379 is as far as I know not publicly available, so I'm not sure if it
> makes a lot of sense to mention it here.

No it's not, but I think it's not the first time this AN is quoted in
the ML and it might be useful to know about it for people having access
to Marvell specifications. At least in this file all layouts are
explained in details.

Thanks,
Miqu=C3=A8l
