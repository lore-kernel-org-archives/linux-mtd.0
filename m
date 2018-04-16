Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f81T5-000888-NV
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2018 10:34:42 +0000
Subject: Re: [PATCH v2 04/10] spi: Extend the core to ease integration of SPI
 memory controllers
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Peter Pan <peterpansjtu@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Sourav Poddar <sourav.poddar@ti.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20180410224439.9260-1-boris.brezillon@bootlin.com>
 <20180410224439.9260-5-boris.brezillon@bootlin.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <31229922-5bc4-99ce-5373-452d27a20ade@exceet.de>
Date: Mon, 16 Apr 2018 12:33:54 +0200
MIME-Version: 1.0
In-Reply-To: <20180410224439.9260-5-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 11.04.2018 00:44, Boris Brezillon wrote:
> Some controllers are exposing high-level interfaces to access various
> kind of SPI memories. Unfortunately they do not fit in the current
> spi_controller model and usually have drivers placed in
> drivers/mtd/spi-nor which are only supporting SPI NORs and not SPI
> memories in general.
> 
> This is an attempt at defining a SPI memory interface which works for
> all kinds of SPI memories (NORs, NANDs, SRAMs).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

[...]

> +
> +/**
> + * spi_mem_supports_op() - Check if a memory device and the controller it is
> + *			   connected to support a specific memory operation
> + * @mem: the SPI memory
> + * @op: the memory operation to check
> + *
> + * Some controllers are only supporting Single or Dual IOs, others might only
> + * support specific opcodes, or it can even be that the controller and device
> + * both support Quad IOs but the hardware prevents you from using it because
> + * only 2 IO lines are connected.
> + *
> + * This function checks whether a specific operation is supported.
> + *
> + * Return: true if @op is supported, false otherwise.
> + */
> +bool spi_mem_supports_op(struct spi_mem *mem, const struct spi_mem_op *op)
> +{
> +	struct spi_controller *ctlr = mem->spi->controller;
> +
> +	if (ctlr->mem_ops->supports_op)

this misses a null check for mem_ops:
	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)

> +		return ctlr->mem_ops->supports_op(mem, op);
> +
> +	return spi_mem_default_supports_op(mem, op);
> +}

[...]

Regards,

Frieder
