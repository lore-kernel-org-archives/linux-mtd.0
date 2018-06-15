Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTpCt-0003HV-SY
 for linux-mtd@lists.infradead.org; Fri, 15 Jun 2018 13:56:05 +0000
Date: Fri, 15 Jun 2018 15:55:41 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Fabio Estevam
 <fabio.estevam@nxp.com>, David Wolfe <david.wolfe@nxp.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Cc: "richard@nod.at" <richard@nod.at>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>, Han Xu <han.xu@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Subject: Re: [PATCH 03/11] spi: Add a driver for the Freescale/NXP QuadSPI
 controller
Message-ID: <20180615155541.4f43e9bb@bbrezillon>
In-Reply-To: <DB6PR0402MB28382767652782E0CC6C14A0997C0@DB6PR0402MB2838.eurprd04.prod.outlook.com>
References: <1527686082-15142-1-git-send-email-frieder.schrempf@exceet.de>
 <1527686082-15142-4-git-send-email-frieder.schrempf@exceet.de>
 <DB6PR0402MB283845A1A98672FE63C89550997B0@DB6PR0402MB2838.eurprd04.prod.outlook.com>
 <20180608145130.09f979f9@bbrezillon>
 <DB6PR0402MB2838D514CF38AC5E6C004E8499780@DB6PR0402MB2838.eurprd04.prod.outlook.com>
 <20180611094616.5c8f82cf@bbrezillon>
 <DB6PR0402MB283825171DF93AD3C8590DD799780@DB6PR0402MB2838.eurprd04.prod.outlook.com>
 <20180611121618.40f4b609@bbrezillon>
 <DB6PR0402MB28388D9DEB86629BB58DD5E499780@DB6PR0402MB2838.eurprd04.prod.outlook.com>
 <DB6PR0402MB2838563F1BA71A9A21ABBE01997F0@DB6PR0402MB2838.eurprd04.prod.outlook.com>
 <20180612091328.67734adb@bbrezillon>
 <DB6PR0402MB28387FE79F2742C9BEBD4037997F0@DB6PR0402MB2838.eurprd04.prod.outlook.com>
 <20180615145019.734f23a9@bbrezillon>
 <DB6PR0402MB28382767652782E0CC6C14A0997C0@DB6PR0402MB2838.eurprd04.prod.outlook.com>
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

On Fri, 15 Jun 2018 13:42:12 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Hi Boris,
> 
> I am still debugging the issue.
> With some analysis, able to check that proper values are not being written for QUADSPI_SFA2AD/ QUADSPI_SFB1AD/ QUADSPI_SFB2AD register.
> 
> In current code, value of map_addr are being assigned to these register.
>              map_addr = q->memmap_phy +
>                         2 * q->devtype_data->ahb_buf_size;
> 
>      qspi_writel(q, map_addr, q->iobase + QUADSPI_SFA1AD + (i * 4));
> 
> But instead of "q->devtype_data->ahb_buf_size" it should be flash size.

No, because we're only using 2 * ->ahb_buf_size in the direct mapping
for each device, and we're modifying the mapping dynamically based on
the selected device. Maybe we got the logic wrong though.

> For my case flash size is 0x4000000 and with this hard coded value I am able to perform Write and Erase operation.
> One more change, I have to do is adding the flash_size when writing the base_address in SFAR register for case when "mem->spi->chip_select == 1"
> 	qspi_writel(q, q->memmap_phy + 0x4000000, base + QUADSPI_SFAR);

I don't want to expose the full device in the direct mapping yet
(that's part of the direct-mapping API I posted here [1]). What this
version of the driver does is, map only 2 time the ahb_size so that we
can bypass the internal cache of the QSPI engine.

> 
> Thus, there should be mechanism or the entry in structure where we can have the information of the size of the connected slave device.

Because that's exactly the kind of thing I'd like to avoid. What if the
device is bigger than the reserved memory region? What if the sum of
all devices does not fit in there? Here I tried to support all cases by
just mapping the portion of memory we need.
