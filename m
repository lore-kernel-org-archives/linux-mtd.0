Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRyp-000571-EY
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 16:54:25 +0000
Date: Tue, 15 Jan 2019 17:54:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Xiaolei
 Li <xiaolei.li@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [RFC PATCH 0/5] mtd: rawnand: Simplify the locking
Message-ID: <20190115175402.6b4d990c@xps13>
In-Reply-To: <20181120105720.23081-1-boris.brezillon@bootlin.com>
References: <20181120105720.23081-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 20 Nov 2018
11:57:15 +0100:

> Hello,
>=20
> The nand_get_device()/nand_release_device() logic looks complex for no
> obvious reasons. I might be wrong, but I think the spinlock+waitqueue
> approach can be replaced by regular mutexes: one to serialize accesses
> to the NAND chip (and protect the suspended field), another one to
> serialize accesses to the controller.
>=20
> We also get rid of the ->state field which was not really useful except
> for detecting when the NAND chip is suspended (some drivers were using
> it to determine the timeout value, but always taking the max timeout
> sounds like a good solution too, since it's a timeout, not a delay).
> This ->state field is replaced by a ->suspended field which is
> protected by the chip lock. So no state machine anymore, just 3 states:
>=20
> 1/ NAND is idle
> 2/ NAND is being accessed (we don't care about the access type)
> 3/ NAND is suspended
>=20
> Patches 1 to 4 are preparing things for the chip->state, controller->wq
> and controller->lock removal by patching all drivers that were
> accessing those fields directly.
>=20
> Patch 5 is doing the actual locking changes.
>=20
> Note that even if we don't rework the locking, I think patches 1 to 4
> are worth applying.
>=20
> Regards,
>=20
> Boris

Looks good to me, applied on nand/next.


Thanks,
Miqu=C3=A8l
