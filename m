Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRuja-0002qZ-2t
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 07:58:12 +0000
Date: Wed, 28 Nov 2018 08:57:45 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <Cyrille.Pitchen@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: parse SFDP 4-byte Address Instruction Table
Message-ID: <20181128085745.1ef607b3@bbrezillon>
In-Reply-To: <20181120115512.15958-1-tudor.ambarus@microchip.com>
References: <20181120115512.15958-1-tudor.ambarus@microchip.com>
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

On Tue, 20 Nov 2018 11:55:21 +0000
<Tudor.Ambarus@microchip.com> wrote:

> +
> +	/*
> +	 * We set nor->addr_width here to skip spi_nor_set_4byte_opcodes()
> +	 * later because this latest function implements a legacy quirk for
> +	 * the erase size of Spansion memory. However this quirk is no longer
> +	 * needed with new SFDP compliant memories.
> +	 */
> +	nor->addr_width = 4;
> +	nor->flags |= SPI_NOR_4B_OPCODES;

You mean SNOR_F_4B_OPCODES (the one introduced here [1]), because
SPI_NOR_4B_OPCODES should only be used for flash_info->flags and might
soon conflict with another SNOR_F_ flag?

[1]http://patchwork.ozlabs.org/patch/991476/
