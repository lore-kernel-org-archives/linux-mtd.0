Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJLt-00043g-4z
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:59:14 +0000
Date: Tue, 4 Sep 2018 23:58:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: Convert to using %pOFn instead of
 device_node.name
Message-ID: <20180904235850.3e1e69df@xps13>
In-Reply-To: <20180828015252.28511-33-robh@kernel.org>
References: <20180828015252.28511-1-robh@kernel.org>
 <20180828015252.28511-33-robh@kernel.org>
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

Hi Rob,

Rob Herring <robh@kernel.org> wrote on Mon, 27 Aug 2018 20:52:34 -0500:

> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
>=20
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Applied to nand/next.

Thanks,
Miqu=C3=A8l
