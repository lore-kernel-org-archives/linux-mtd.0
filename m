Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1giy5m-0007r4-Ex
 for linux-mtd@lists.infradead.org; Mon, 14 Jan 2019 08:59:35 +0000
Date: Mon, 14 Jan 2019 09:59:18 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, Vignesh R <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Piotr Bugalski <bugalski.piotr@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 5/7] mtd: devices: m25p80: Use the spi-mem dirmap API
Message-ID: <20190114095910.7280c8bb@bbrezillon>
In-Reply-To: <VI1PR04MB5726AF470280F23B40BC704199800@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <20181106160536.13415-1-boris.brezillon@bootlin.com>
 <20181106160536.13415-6-boris.brezillon@bootlin.com>
 <VI1PR04MB5726AF470280F23B40BC704199800@VI1PR04MB5726.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 Jan 2019 08:49:35 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Hi Boris,
> 
> I have tested this patch on NXP FlexSPI controller having SPI-NOR flash MT35x.
> Added tested-by tag.

Would be easier for me if you had added it in a formal way so that
patchwork can collect it:

Tested-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
