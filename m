Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faehU-0003AD-7T
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 10:07:56 +0000
Date: Wed, 4 Jul 2018 12:07:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH v3 01/11] mtd: rawnand: docg4: fix the probe function
 error path
Message-ID: <20180704120739.52fc75a1@xps13>
In-Reply-To: <20180421180043.18366-2-miquel.raynal@bootlin.com>
References: <20180421180043.18366-1-miquel.raynal@bootlin.com>
 <20180421180043.18366-2-miquel.raynal@bootlin.com>
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

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Sat, 21 Apr 2018
20:00:33 +0200:

> nand_release() should not be called on an MTD device that has not been
> registered. While it should work thanks to the checks done in
> mtd_device_unregister() it's a bad practice to cleanup/release
> something that has not previously been initialized/allocated.
>=20
> Rework the error path to follow this rule.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

This patch is marked applied in patchwork while it is not present
anywhere in the official trees and has probably been forgotten. Applied
on nand/next.

Regards,
Miqu=C3=A8l
