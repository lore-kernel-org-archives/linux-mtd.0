Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLwkH-0002DK-BI
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 20:54:14 +0000
Date: Sun, 11 Nov 2018 21:54:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christoph Hellwig <hch@lst.de>
Cc: maximlevitsky@gmail.com, boris.brezillon@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: r852: use generic DMA API
Message-ID: <20181111215401.53da9000@xps13>
In-Reply-To: <20181018125935.9028-1-hch@lst.de>
References: <20181018125935.9028-1-hch@lst.de>
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

Hi Christoph,

Christoph Hellwig <hch@lst.de> wrote on Thu, 18 Oct 2018 14:59:35 +0200:

> Use the generic DMA API instead of the legacy PCI DMA API.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
