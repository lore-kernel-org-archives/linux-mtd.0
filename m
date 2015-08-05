Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZN7uU-0006hv-7o
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 23:15:48 +0000
From: Marek Vasut <marex@denx.de>
To: vikasm <vikas.manocha@st.com>
Subject: Re: [PATCH V6 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Thu, 6 Aug 2015 01:15:18 +0200
Cc: Graham Moore <grmoore@opensource.altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alan Tull <atull@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>
References: <1438105083-19738-1-git-send-email-grmoore@opensource.altera.com>
 <1438105083-19738-2-git-send-email-grmoore@opensource.altera.com>
 <55C255F7.80207@st.com>
In-Reply-To: <55C255F7.80207@st.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508060115.18627.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, August 05, 2015 at 08:29:11 PM, vikasm wrote:
> Hi Graham,

Hi vikasm,

> On 07/28/2015 10:38 AM, Graham Moore wrote:
> > Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> > ---
> > V2: use NULL instead of modalias in spi_nor_scan call
> > V3: Use existing property is-decoded-cs instead of creating duplicate.
> > V4: Support Micron quad mode by snooping command stream for EVCR command
> > and subsequently configuring Cadence controller for quad mode.
> > V5: Clean up sparse and smatch complaints.  Remove snooping of Micron
> > quad mode.  Add comment on XIP mode bit and dummy clock cycles.  Set
> > up SRAM partition at 1:1 during init.
> > V6: Remove dts patch that was included by mistake.  Incorporate Vikas's
> > comments regarding fifo width, SRAM partition setting, and trigger
> > address.  Trigger address was added as an unsigned int, as it is not
> > an IO resource per se, and does not need to be mapped. Also add
> > Marek Vasut's workaround for picking up OF properties on subnodes.
> 
> I am still not able to apply this patch to master. It seems to be rebased
> on master for ..spi-nor/Kconfig & spi-nor/makefile.

I'm able to apply this on next/master just fine.

> Also I still see spaces are still not replaced by tabs in this version.

Which exact spots are you talking about ? I don't see that many indent flubs
in this patch to be honest. Sometimes, it is better to indent the last piece
with spaces (mandated by kernel coding style btw) to increase the readability.

This is in particular the case with stuff like this:

pr_err("formating string that is almost 80 chars long %i!\n",
       parameter_that_is_indented_with_7_spaces);

The sole purpose is to align stuff right under the opening parenthesis.

> > ---

btw. would you please learn to use [...] and keep only the part you're 
commenting on with a bit of context in your reply? It is really hard
to locate your comment if it's inbetween 500 lines of nothing.

[...]

> > +static int cqspi_indirect_read_setup(struct spi_nor *nor,
> > +                                    unsigned int from_addr)
> > +{
> > +       unsigned int reg;
> > +       unsigned int dummy_clk = 0;
> > +       struct cqspi_st *cqspi = nor->priv;
> > +       void __iomem *reg_base = cqspi->iobase;
> > +
> > +       writel(cqspi->trigger_address,
> > +              reg_base + CQSPI_REG_INDIRECTTRIGGER);
> 
> move indirect trigger configuration in init, no need to do it for every
> read & write.

Fixed.

> > +       writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
> > +
> > +       reg = nor->read_opcode << CQSPI_REG_RD_INSTR_OPCODE_LSB;
> > +       reg |= cqspi_calc_rdreg(nor, nor->read_opcode);
> > +
> > +       /* Setup dummy clock cycles */
> > +#define CQSPI_SUPPORT_XIP_CHIPS
> > +#ifdef CQSPI_SUPPORT_XIP_CHIPS
> > +       /*
> > +        * Set mode bits high to ensure chip doesn't enter XIP.
> > +        * This results in an extra 8 dummy clocks so
> > +        * we must account for them.
> > +        */
> > +       writel(0xFF, reg_base + CQSPI_REG_MODE_BIT);
> > +       reg |= (1 << CQSPI_REG_RD_INSTR_MODE_EN_LSB);
> > +       if (nor->read_dummy >= 8)
> > +               dummy_clk = nor->read_dummy - 8;
> > +       else
> > +               dummy_clk = 0;
> > +#else
> > +       dummy_clk = nor->read_dummy;
> > +#endif
> > +       reg |= (dummy_clk & CQSPI_REG_RD_INSTR_DUMMY_MASK)
> > +           << CQSPI_REG_RD_INSTR_DUMMY_LSB;
> > +
> > +       writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> > +
> > +       /* Set address width */
> > +       reg = readl(reg_base + CQSPI_REG_SIZE);
> > +       reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
> > +       reg |= (nor->addr_width - 1);
> > +       writel(reg, reg_base + CQSPI_REG_SIZE);
> > +       return 0;
> > +}
> > +
> > +static int cqspi_indirect_read_execute(struct spi_nor *nor,
> > +                                      u8 *rxbuf, unsigned n_rx)
> > +{
> > +       int ret = 0;
> > +       unsigned int reg = 0;
> > +       unsigned int bytes_to_read = 0;
> > +       unsigned int timeout;
> > +       unsigned int watermark;
> > +       struct cqspi_st *cqspi = nor->priv;
> > +       void __iomem *reg_base = cqspi->iobase;
> > +       void __iomem *ahb_base = cqspi->ahb_base;
> > +       int remaining = (int)n_rx;
> > +
> > +       watermark = cqspi->fifo_depth * cqspi->fifo_width / 2;
> > +       writel(watermark, reg_base + CQSPI_REG_INDIRECTRDWATERMARK);
> 
> I think watermark configuration can be moved to init also & there should
> not be any need to configuration it for every read.

Fixed.

> > +       writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
> > +
> > +       /* Clear all interrupts. */
> > +       writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
> > +
> > +       cqspi->irq_mask = CQSPI_IRQ_MASK_RD;
> > +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
> > +
> > +       reinit_completion(&cqspi->transfer_complete);
> > +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
> > +              reg_base + CQSPI_REG_INDIRECTRD);
> > +
> > +       while (remaining > 0) {
> > +               ret =
> > wait_for_completion_timeout(&cqspi->transfer_complete, +                
> >                                 msecs_to_jiffies +                      
> >                           (CQSPI_READ_TIMEOUT_MS)); +
> > +               bytes_to_read = CQSPI_GET_RD_SRAM_LEVEL(reg_base);
> 
> There should not be any need to read SRAM level, we should be able to get
> rid of it like in u-boot.

Can you explain why ?

> > +
> > +               if (!ret && bytes_to_read == 0) {
> > +                       dev_err(nor->dev, "Indirect read timeout, no
> > bytes\n"); +                       ret = -ETIMEDOUT;
> > +                       goto failrd;
> > +               }
> > +
> > +               while (bytes_to_read != 0) {
> > +                       bytes_to_read *= cqspi->fifo_width;
> > +                       bytes_to_read = bytes_to_read > remaining
> > +                           ? remaining : bytes_to_read;
> > +                       cqspi_fifo_read(rxbuf, ahb_base, bytes_to_read);
> > +                       rxbuf += bytes_to_read;
> > +                       remaining -= bytes_to_read;
> > +                       bytes_to_read =
> > CQSPI_GET_RD_SRAM_LEVEL(reg_base); +               }
> > +       }
> > +
> > +       /* Check indirect done status */
> > +       timeout = cqspi_init_timeout(CQSPI_TIMEOUT_MS);
> > +       while (cqspi_check_timeout(timeout)) {
> > +               reg = readl(reg_base + CQSPI_REG_INDIRECTRD);
> > +               if (reg & CQSPI_REG_INDIRECTRD_DONE_MASK)
> > +                       break;
> > +       }
> > +
> > +       if (!(reg & CQSPI_REG_INDIRECTRD_DONE_MASK)) {
> > +               dev_err(nor->dev,
> > +                       "Indirect read completion error 0x%08x\n", reg);
> > +               ret = -ETIMEDOUT;
> > +               goto failrd;
> > +       }
> > +
> > +       /* Disable interrupt */
> > +       writel(0, reg_base + CQSPI_REG_IRQMASK);
> > +
> > +       /* Clear indirect completion status */
> > +       writel(CQSPI_REG_INDIRECTRD_DONE_MASK, reg_base +
> > CQSPI_REG_INDIRECTRD); +
> > +       return 0;
> > +
> > + failrd:
> > +       /* Disable interrupt */
> > +       writel(0, reg_base + CQSPI_REG_IRQMASK);
> > +
> > +       /* Cancel the indirect read */
> > +       writel(CQSPI_REG_INDIRECTWR_CANCEL_MASK,
> > +              reg_base + CQSPI_REG_INDIRECTRD);
> > +       return ret;
> > +}
> > +
> > +static int cqspi_indirect_write_setup(struct spi_nor *nor, unsigned int
> > to_addr) +{
> > +       unsigned int reg;
> > +       struct cqspi_st *cqspi = nor->priv;
> > +       void __iomem *reg_base = cqspi->iobase;
> > +
> > +       /* Set opcode. */
> > +       reg = nor->program_opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
> > +       writel(reg, reg_base + CQSPI_REG_WR_INSTR);
> > +       reg = cqspi_calc_rdreg(nor, nor->program_opcode);
> > +       writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> > +
> > +       writel(cqspi->trigger_address,
> > +              reg_base + CQSPI_REG_INDIRECTTRIGGER);
> > +       writel(to_addr, reg_base + CQSPI_REG_INDIRECTWRSTARTADDR);
> 
> move it to init also.

I assume you mean the trigger address, not the write start address ?

> > +
> > +       reg = readl(reg_base + CQSPI_REG_SIZE);
> > +       reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
> > +       reg |= (nor->addr_width - 1);
> > +       writel(reg, reg_base + CQSPI_REG_SIZE);
> > +       return 0;
> > +}
> > +
> > +static int cqspi_indirect_write_execute(struct spi_nor *nor,
> > +                                       const u8 *txbuf, unsigned n_tx)
> > +{
> > +       int ret;
> > +       unsigned int timeout;
> > +       unsigned int reg = 0;
> > +       struct cqspi_st *cqspi = nor->priv;
> > +       void __iomem *reg_base = cqspi->iobase;
> > +       int remaining = (int)n_tx;
> > +       struct cqspi_flash_pdata *f_pdata;
> > +       unsigned int page_size;
> > +       unsigned int write_bytes;
> > +
> > +       f_pdata = &cqspi->f_pdata[cqspi->current_cs];
> > +       page_size = nor->page_size;
> > +
> > +       writel(CQSPI_REG_SRAM_THRESHOLD_BYTES, reg_base +
> > +              CQSPI_REG_INDIRECTWRWATERMARK);
> 
> should be able to move it to init

OK

[...]
