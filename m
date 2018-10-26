Date: Fri, 26 Oct 2018 08:08:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: <marek.vasut@gmail.com>, <linux-spi@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <ryder.lee@mediatek.com>, <sean.wang@mediatek.com>,
 <xiaolei.li@mediatek.com>, <benliang.zhao@mediatek.com>,
 <bayi.cheng@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <honghui.zhang@mediatek.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] spi: spi-mem: MediaTek: Add SPI NAND Flash
 interface driver for MediaTek MT7622
Message-ID: <20181026080833.2fedbd94@bbrezillon>
In-Reply-To: <1540532796.24602.11.camel@mhfsdcap03>
References: <1536716612-24610-1-git-send-email-xiangsheng.hou@mediatek.com>
 <1536716612-24610-4-git-send-email-xiangsheng.hou@mediatek.com>
 <20181023075247.004982c9@bbrezillon>
 <1540532796.24602.11.camel@mhfsdcap03>
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

On Fri, 26 Oct 2018 13:46:36 +0800
Xiangsheng Hou <xiangsheng.hou@mediatek.com> wrote:

> Hi Boris,
> 
> On Tue, 2018-10-23 at 07:52 +0200, Boris Brezillon wrote:
> > +Mark (the SPI maintainer, please remember to Cc him next time you
> > send a SPI related patch).
> > 
> > Hi Xiangsheng,
> > 
> > On Wed, 12 Sep 2018 09:43:32 +0800
> > Xiangsheng Hou <xiangsheng.hou@mediatek.com> wrote:
> > 
> > Please add a commit message here.
> >   
> > > Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > > ---
> > >  drivers/spi/Kconfig        |   10 +
> > >  drivers/spi/Makefile       |    1 +
> > >  drivers/spi/spi-mtk-snfi.c |  918 ++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 929 insertions(+)
> > >  create mode 100644 drivers/spi/spi-mtk-snfi.c
> > > 
> > > diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> > > index 671d078..9f94921 100644
> > > --- a/drivers/spi/Kconfig
> > > +++ b/drivers/spi/Kconfig
> > > @@ -389,6 +389,16 @@ config SPI_MT65XX
> > >  	  say Y or M here.If you are not sure, say N.
> > >  	  SPI drivers for Mediatek MT65XX and MT81XX series ARM SoCs.
> > >  
> > > +config SPI_MTK_SNFI
> > > +	tristate "MediaTek SPI NAND interface"
> > > +	select MTD_SPI_NAND
> > > +	help
> > > +	  This selects the MediaTek(R) SPI NAND FLASH interface (SNFI)
> > > +	  driver, which could be found on MT7622 Soc, say Y or M here.
> > > +	  If you are not sure, say N. This driver use SPI NAND FLASH
> > > +          on-die ECC.  
> > 
> > Should be aligned on the previous line.
> >   
> > > +	  Note Parallel Nand and SPI NAND is alternative on MediaTek SoCs.  
> > 
> > There's a fundamental issue with this driver: spi-mem was designed to be
> > memory agnostic, and you seem to have a SPI controller that supports
> > only SPI NANDs. Is that correct, or is it just that you developed the
> > driver with SPI NANDs in  mind?
> >   
> Yes, this driver supports only SPI NANDs.
> Actually, Mediatek's controller is designed for NAND specifically, which
> can support SPI NANDs and PARALLEL NANDs,and this driver is just for SPI
> NANDs.

Hm, I'm not so sure about that (I might be wrong though), it seems you
can send any command you want, not only SPI NAND related ones. Maybe the
controller is optimized for SPI NANDs but can do all kind of SPI
transfers.

> 
> > > +
> > >  config SPI_NUC900
> > >  	tristate "Nuvoton NUC900 series SPI"
> > >  	depends on ARCH_W90X900  
> >   
> > > +static int mtk_snfc_read(struct spi_mem *mem,
> > > +			 const struct spi_mem_op *op)
> > > +{
> > > +	struct mtk_snfc *snfc = spi_controller_get_devdata(mem->spi->master);
> > > +	struct spinand_device *spinand = spi_mem_get_drvdata(mem);  
> > 
> > Just one example of things I don't want to see in spi-mem drivers.
> > Clearly you're breaking the layering we're trying to enforce:
> > 
> > 		       MTD
> > 		------------------
> > 		spi-nor | spinand
> > 		------------------
> > 		     spi-mem
> > 		------------------
> > 		       spi
> > 
> > spi-mem should no know nothing about the memory it's manipulating, all
> > it should do is execute SPI memory operations.
> > 
> > Don't know what's possible to do with your controller, and maybe it's
> > not able to execute random SPI memory operations, but in this case we
> > should consider a different solution to support this driver.
> > 
> > Do you have a public datasheet I can look at?
> >   
> We do not have a public datasheet for Mediatek controller currently.

Unfortunately, there's not much I can do without a clear understanding
of how the controller works.
