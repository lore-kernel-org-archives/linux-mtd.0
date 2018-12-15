Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY7AX-00089B-Td
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 10:27:39 +0000
Date: Sat, 15 Dec 2018 11:27:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: omap2: Pass the parent of pdev to
 dma_request_chan()
Message-ID: <20181215112725.3bea4f68@xps13>
In-Reply-To: <20181213192227.3815-1-boris.brezillon@bootlin.com>
References: <20181213192227.3815-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 13 Dec 2018
20:22:27 +0100:

> Commit e1e6255c311b ("mtd: rawnand: omap2: convert driver to
> nand_scan()") moved part of the init code in the ->attach_chip hook
> and at the same time changed the struct device object passed to
> dma_request_chan() (&pdev->dev instead of pdev->dev.parent).
>=20
> Fixes: e1e6255c311b ("mtd: rawnand: omap2: convert driver to nand_scan()")
> Reported-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Applied on nand/next,

Thanks,
Miqu=C3=A8l
