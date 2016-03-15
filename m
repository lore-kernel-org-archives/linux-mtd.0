Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afoa1-00015G-Rb
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2016 13:00:12 +0000
Date: Tue, 15 Mar 2016 13:59:36 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
Message-ID: <20160315135936.1c924789@bbrezillon>
In-Reply-To: <56E7FFF5.4000803@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon> <56E7FFF5.4000803@linaro.org>
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

On Tue, 15 Mar 2016 08:28:37 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> On 03/08/2016 11:24 AM, Boris Brezillon wrote:
> >> +static int mtk_nfc_write_page(struct mtd_info *mtd,
> >> > +			struct nand_chip *chip, const uint8_t *buf,
> >> > +			int oob_on, int page, int raw)
> >> > +{
> >> > +
> >> > +	struct mtk_nfc_host *host = nand_get_controller_data(chip);
> >> > +	struct completion *nfi = &host->nfi.complete;
> >> > +	struct device *dev = host->dev;
> >> > +	const bool use_ecc = !raw;
> >> > +	void *q = (void *) buf;
> >> > +	dma_addr_t dma_addr;
> >> > +	size_t dmasize;
> >> > +	u32 reg;
> >> > +	int ret;
> >> > +
> >> > +	dmasize = mtd->writesize + (raw ? mtd->oobsize : 0);
> >> > +
> >> > +	dma_addr = dma_map_single(dev, q, dmasize, DMA_TO_DEVICE);
> > buf is not guaranteed to be physically contiguous, so you can't just
> > use it with DMA without doing a few more verifications.
> >
> > In case you're interested in using a generic approach to do this
> > verification, you can have a look at this series [2].
> >
> 
> unfortunately the internal dma controller does not support scatter gather
> operations (we need to DMA in/out of memory in a single shot)
> If we enable NAND_USE_BOUNCE_BUFFER, I think this guarantees that the buffer
> will be contiguous (since they are allocated with kmalloc)
> ...although maybe I should have the bounce buffers in the driver and allocate
> them with devm_get_free_pages instead
> 
> would either of this would be acceptable?

Or you could test if the buffer is contiguous, and fallback to using
a bounce buffer (either an internal one or the generic one) if that's
not the case. Note that the proposed API can be improved to reject
non-contiguous buffers...
I'd really like to avoid adding more custom DMA mapping code and that
starts by creating an API that is generic enough to handle all NAND
controller driver cases.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
