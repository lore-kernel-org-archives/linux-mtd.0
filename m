Date: Tue, 16 Oct 2018 14:04:11 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>, "cyrille.pitchen@microchip.com"
 <cyrille.pitchen@microchip.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Cristian.Birsan@microchip.com"
 <Cristian.Birsan@microchip.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP
 SPI NOR flash memories
Message-ID: <20181016140411.3f06e449@bbrezillon>
In-Reply-To: <VI1PR04MB103888BC18F3C5AD0C02DEF699FE0@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <20180911154007.17195-1-tudor.ambarus@microchip.com>
 <20180911154007.17195-2-tudor.ambarus@microchip.com>
 <VI1PR04MB103888BC18F3C5AD0C02DEF699FE0@VI1PR04MB1038.eurprd04.prod.outlook.com>
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

On Tue, 16 Oct 2018 09:51:47 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Hi Tudor,
> 
> This patch is breaking the 1-4-4 Read protocol for the spansion flash "s25fl512s".
> 
> Without this patch read request command for Quad mode, 4-byte enable, is coming as 0xEC i.e. SPINOR_OP_READ_1_4_4_4B.
> But after applying this patch, read request command for Quad mode is coming as 0x6C i.e. SPINOR_OP_READ_1_1_4_4B.
> 
> This flash also supports non-uniform erase.
> Can you please check and provide some suggestion?

Are you sure the regression comes from this patch? I suspect your bug
comes from 41fe242979e4 ("mtd: spi-nor: fsl-quadspi: fix read error for
flash size larger than 16MB").
