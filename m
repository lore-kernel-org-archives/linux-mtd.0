Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YrRcc-0008Al-1b
 for linux-mtd@lists.infradead.org; Sun, 10 May 2015 13:50:24 +0000
Date: Sun, 10 May 2015 15:49:51 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/4] mtd: sh_flctl: drop unused variable
Message-ID: <20150510134951.GA14077@opentech.at>
References: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
 <20150504051723.GW3521@localhost> <20150504060346.GB26350@opentech.at>
 <3139913.OhcnyJWC3N@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3139913.OhcnyJWC3N@avalon>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Wolfram Sang <wsa@the-dreams.de>, Vinod Koul <vinod.koul@intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 04 May 2015, Laurent Pinchart wrote:

> Hi Nicholas,
> 
> On Monday 04 May 2015 08:03:46 Nicholas Mc Guire wrote:
> > On Mon, 04 May 2015, Vinod Koul wrote:
> > > On Sun, May 03, 2015 at 10:33:43PM +0300, Laurent Pinchart wrote:
> > > > On Saturday 02 May 2015 09:57:08 Nicholas Mc Guire wrote:
> > > > > shdma_tx_submit() called via dmaengine_submit() returns the assigned
> > > > > cookie but this is not used here so the variable and assignment can
> > > > > be dropped.
> > > > > 
> > > > > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > > > 
> > > > I would rephrase the commit message to avoid mentioning
> > > > shdma_tx_submit() as that's not relevant. Something like
> > > > "dmaengine_submit() returns the assigned cookie but this is not used
> > > > here so the variable and assignment can be dropped."
> > > 
> > > And I am bit surrised about taht. Ideally the driver should use the cookie
> > > to check the status later on...
> > 
> > looking at other drivers it seems like the drivers should call
> > dma_submit_error(cookie); on the received cookie - which does:
> >   return cookie < 0 ? cookie : 0;
> > but doing that after dmaengine_submit() which actually already queued the
> > this request in shdma_base.cc:shdma_tx_submit()
> 
> Don't take shdma into account. There's no guarantee that the DMA engine will 
> be an SH DMAC on all platforms where the flctl driver will be used. 
> Furthermore, the shdma implementation might change in the future. You should 
> consider the DMA engine API only and comply with its requirements.
>
ok - trying to find out what the requirements regarding checking actually are
- looking through Documentation/dmaengine/client.txt

   Interface:
        dma_cookie_t dmaengine_submit(struct dma_async_tx_descriptor *desc)     

   This returns a cookie can be used to check the progress of DMA engine
   activity via other DMA engine calls not covered in this document.

the client.txt later points to include/linux/dmaengine.h - so there it seems
that it should be calling dma_submit_error(cookei) in any case and return
error if < 0. basically (as a few other drivers do)

        ret = dma_submit_error(cookie);                                         
        if (ret) {
                dev_err(&flctl->pdev->dev, "dma_submit_error\n");
                return ret;
        }

e.g. like in drivers/crypto/qce/dma.c:qce_dma_prep_sg() - most simply do
        cookie = dmaengine_submit(desc);                                        
        dma_async_issue_pending(channel);
or
        dmaengine_submit(desc);                                        
        dma_async_issue_pending(channel);

so all of these cases would need to be cleaned up ?
provided this is the correct interpretation of the dmaengine interfacer 
requirements this probably is best done with a spatch.

The spatch scanner (which might not yet be exhaustive/correct) used here is:

<snip check_dmaengine_submit_return.cocci>
virtual context
virtual patch
virtual org
virtual report

@has_cookie@
identifier f;
typedef dma_cookie_t;
idexpression dma_cookie_t cookie;
position p;
@@

f(...){
<+...
  cookie = dmaengine_submit@p(...);
  ... when != dma_submit_error(cookie)
  dma_async_issue_pending(...);
...+>
}

@script:python@
p << has_cookie.p;
fn << has_cookie.f;
@@

print "%s:%s:%s WARNING unchecked dmaengine_submit" % (p[0].file,fn,p[0].line)

@no_cookie@
identifier f;
position p,p1;
@@

f@p(...){
<+...
  dmaengine_submit@p1(...);
  ... when != dma_submit_error(...)
  dma_async_issue_pending(...);
...+>
}

@script:python@
p << no_cookie.p;
fn << no_cookie.f;
@@

print "%s:%s:%s WARNING unchecked dmaengine_submit" % (p[0].file,fn,p[0].line)
<snip>

run: make coccicheck COCCI=check_dmaengine_submit_return.cocci MODE=report

The list of cases found is currently 54 cases:

./sound/soc/sh/siu_pcm.c:siu_pcm_rd_set:192 WARNING unchecked dmaengine_submit
./sound/soc/sh/siu_pcm.c:siu_pcm_wr_set:142 WARNING unchecked dmaengine_submit
./drivers/soc/tegra/fuse/fuse-tegra20.c:tegra20_fuse_readl:57 WARNING unchecked dmaengine_submit
./drivers/crypto/omap-aes.c:omap_aes_crypt_dma:416 WARNING unchecked dmaengine_submit
./drivers/crypto/atmel-tdes.c:atmel_tdes_crypt_dma:433 WARNING unchecked dmaengine_submit
./drivers/crypto/ux500/cryp/cryp_core.c:cryp_set_dma_transfer:596 WARNING unchecked dmaengine_submit
./drivers/crypto/ux500/hash/hash_core.c:hash_set_dma_transfer:194 WARNING unchecked dmaengine_submit
./drivers/crypto/omap-sham.c:omap_sham_xmit_dma:552 WARNING unchecked dmaengine_submit
./drivers/crypto/img-hash.c:img_hash_xmit_dma:221 WARNING unchecked dmaengine_submit
./drivers/crypto/atmel-sha.c:atmel_sha_xmit_dma:425 WARNING unchecked dmaengine_submit
./drivers/crypto/atmel-aes.c:atmel_aes_crypt_dma:310 WARNING unchecked dmaengine_submit
./drivers/crypto/omap-des.c:omap_des_crypt_dma:400 WARNING unchecked dmaengine_submit
./drivers/mtd/nand/gpmi-nand/gpmi-nand.c:start_dma_without_bch_irq:445 WARNING unchecked dmaengine_submit
./drivers/mtd/nand/omap2.c:omap_nand_dma_transfer:458 WARNING unchecked dmaengine_submit
./drivers/mtd/nand/lpc32xx_mlc.c:lpc32xx_xmit_dma:389 WARNING unchecked dmaengine_submit
./drivers/mtd/nand/sh_flctl.c:flctl_dma_fifo0_transfer:380 WARNING unchecked dmaengine_submit
./drivers/mtd/nand/lpc32xx_slc.c:lpc32xx_xmit_dma:425 WARNING unchecked dmaengine_submit
./drivers/mmc/host/s3cmci.c:s3cmci_prepare_dma:1086 WARNING unchecked dmaengine_submit
./drivers/mmc/host/mmci.c:mmci_dma_start_data:648 WARNING unchecked dmaengine_submit
./drivers/mmc/host/jz4740_mmc.c:jz4740_mmc_start_dma_transfer:270 WARNING unchecked dmaengine_submit
./drivers/mmc/host/sh_mmcif.c:sh_mmcif_start_dma_rx:311 WARNING unchecked dmaengine_submit
./drivers/mmc/host/sh_mmcif.c:sh_mmcif_start_dma_tx:360 WARNING unchecked dmaengine_submit
./drivers/mmc/host/atmel-mci.c:atmci_submit_data_dma:1088 WARNING unchecked dmaengine_submit
./drivers/mmc/host/moxart-mmc.c:moxart_transfer_dma:257 WARNING unchecked dmaengine_submit
./drivers/mmc/host/mxs-mmc.c:mxs_mmc_ac:293 WARNING unchecked dmaengine_submit
./drivers/mmc/host/mxs-mmc.c:mxs_mmc_adtc:351 WARNING unchecked dmaengine_submit
./drivers/mmc/host/mxs-mmc.c:mxs_mmc_bc:259 WARNING unchecked dmaengine_submit
./drivers/mmc/host/mxcmmc.c:mxcmci_setup_data:301 WARNING unchecked dmaengine_submit
./drivers/mmc/host/davinci_mmc.c:mmc_davinci_send_dma_request:418 WARNING unchecked dmaengine_submit
./drivers/i2c/busses/i2c-mxs.c:mxs_i2c_dma_setup_xfer:177 WARNING unchecked dmaengine_submit
./drivers/i2c/busses/i2c-at91.c:at91_twi_read_data_dma:315 WARNING unchecked dmaengine_submit
./drivers/i2c/busses/i2c-at91.c:at91_twi_write_data_dma:221 WARNING unchecked dmaengine_submit
./drivers/spi/spi-sirf.c:spi_sirfsoc_dma_transfer:337 WARNING unchecked dmaengine_submit
./drivers/spi/spi-imx.c:spi_imx_dma_transfer:893 WARNING unchecked dmaengine_submit
./drivers/spi/spi-img-spfi.c:img_spfi_start_dma:309 WARNING unchecked dmaengine_submit
./drivers/spi/spi-pl022.c:configure_dma:933 WARNING unchecked dmaengine_submit
./drivers/spi/spi-s3c64xx.c:prepare_dma:276 WARNING unchecked dmaengine_submit
./drivers/spi/spi-tegra114.c:tegra_spi_start_rx_dma:454 WARNING unchecked dmaengine_submit
./drivers/spi/spi-tegra114.c:tegra_spi_start_tx_dma:435 WARNING unchecked dmaengine_submit
./drivers/spi/spi-tegra20-slink.c:tegra_slink_start_rx_dma:463 WARNING unchecked dmaengine_submit
./drivers/spi/spi-tegra20-slink.c:tegra_slink_start_tx_dma:444 WARNING unchecked dmaengine_submit
./drivers/spi/spi-dw-mid.c:mid_spi_dma_transfer:248 WARNING unchecked dmaengine_submit
./drivers/spi/spi-mxs.c:mxs_spi_txrx_dma:172 WARNING unchecked dmaengine_submit
./drivers/spi/spi-davinci.c:davinci_spi_bufs:584 WARNING unchecked dmaengine_submit
./drivers/spi/spi-ep93xx.c:ep93xx_spi_dma_transfer:555 WARNING unchecked dmaengine_submit
./drivers/spi/spi-rockchip.c:rockchip_spi_prepare_dma:436 WARNING unchecked dmaengine_submit
./drivers/spi/spi-omap2-mcspi.c:omap2_mcspi_rx_dma:428 WARNING unchecked dmaengine_submit
./drivers/spi/spi-omap2-mcspi.c:omap2_mcspi_tx_dma:390 WARNING unchecked dmaengine_submit
./drivers/ata/sata_dwc_460ex.c:sata_dwc_bmdma_start_by_tag:965 WARNING unchecked dmaengine_submit
./drivers/tty/serial/imx.c:imx_dma_tx:514 WARNING unchecked dmaengine_submit
./drivers/tty/serial/imx.c:start_rx_dma:938 WARNING unchecked dmaengine_submit
./drivers/tty/serial/sirfsoc_uart.c:sirfsoc_uart_tx_with_dma:199 WARNING unchecked dmaengine_submit
./drivers/tty/serial/mxs-auart.c:mxs_auart_dma_prep_rx:551 WARNING unchecked dmaengine_submit
./drivers/tty/serial/mxs-auart.c:mxs_auart_dma_tx:224 WARNING unchecked dmaengine_submit


Pleas let me know if the prposed addition of dma_submit_error(cookie) is 
correct then I'll give it a shot at a clean semantic patch to clean it all up 
at once. 

thx!
hofrat
