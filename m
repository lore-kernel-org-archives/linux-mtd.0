Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2wvK-0002EM-Hb
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 11:15:08 +0000
Date: Thu, 20 Sep 2018 13:14:53 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 3/3] spi: spi-mem: Add extra sanity checks on the op param
Message-ID: <20180920131453.66a597fe@bbrezillon>
In-Reply-To: <VI1PR04MB1038A9979C770938CE7C36B999130@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <20180920073112.7897-1-boris.brezillon@bootlin.com>
 <20180920073112.7897-4-boris.brezillon@bootlin.com>
 <VI1PR04MB1038A9979C770938CE7C36B999130@VI1PR04MB1038.eurprd04.prod.outlook.com>
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

Hi Yogesh,

On Thu, 20 Sep 2018 10:31:16 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> > 
> > +static bool spi_mem_buswidth_is_valid(u8 buswidth) {
> > +	if (hweight8(buswidth) > 1 || buswidth > SPI_MEM_MAX_BUSWIDTH)  
> 
> Isn't check for lower limit should be '< 1'?

buswidth == 0 is valid if you have nothing to send...

> 
> --
> Regards
> Yogesh Gaur
> 
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static int spi_mem_check_op(const struct spi_mem_op *op) {
> > +	if (!op->cmd.buswidth)
> > +		return -EINVAL;
> > +
> > +	if ((op->addr.nbytes && !op->addr.buswidth) ||
> > +	    (op->dummy.nbytes && !op->dummy.buswidth) ||
> > +	    (op->data.nbytes && !op->data.buswidth))
> > +		return -EINVAL;

... and I make sure op->data.buswidth != 0 when required here.

Thanks for the review by the way.

Boris
