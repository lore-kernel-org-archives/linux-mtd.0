From: Vikas MANOCHA <vikas.manocha@st.com>
To: Marek Vasut <marex@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David
 Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Tull
 <atull@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>
Date: Wed, 12 Aug 2015 03:05:48 +0200
Subject: RE: [PATCH V6 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Message-ID: <9026814FBF99304F9FA3AC3FB72F3E2F0491A0BE@SAFEX1MAIL4.st.com>
References: <1438105083-19738-1-git-send-email-grmoore@opensource.altera.com>
 <1438105083-19738-2-git-send-email-grmoore@opensource.altera.com>
 <55C255F7.80207@st.com> <201508060115.18627.marex@denx.de>
In-Reply-To: <201508060115.18627.marex@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

> -----Original Message-----
> From: Marek Vasut [mailto:marex@denx.de]
> Sent: Wednesday, August 05, 2015 4:15 PM
> To: Vikas MANOCHA
> Cc: Graham Moore; linux-mtd@lists.infradead.org; David Woodhouse; Brian
> Norris; linux-kernel@vger.kernel.org; Alan Tull; Dinh Nguyen; Yves
> Vandervennet
> Subject: Re: [PATCH V6 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
> Flash Controller.
>=20
> On Wednesday, August 05, 2015 at 08:29:11 PM, vikasm wrote:
> > Hi Graham,
>=20
> Hi vikasm,
>=20
> > On 07/28/2015 10:38 AM, Graham Moore wrote:
> > > Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> > > ---
> > > V2: use NULL instead of modalias in spi_nor_scan call
> > > V3: Use existing property is-decoded-cs instead of creating duplicate=
.
> > > V4: Support Micron quad mode by snooping command stream for EVCR
> > > command and subsequently configuring Cadence controller for quad
> mode.
> > > V5: Clean up sparse and smatch complaints.  Remove snooping of
> > > Micron quad mode.  Add comment on XIP mode bit and dummy clock
> > > cycles.  Set up SRAM partition at 1:1 during init.
> > > V6: Remove dts patch that was included by mistake.  Incorporate
> > > Vikas's comments regarding fifo width, SRAM partition setting, and
> > > trigger address.  Trigger address was added as an unsigned int, as
> > > it is not an IO resource per se, and does not need to be mapped.
> > > Also add Marek Vasut's workaround for picking up OF properties on
> subnodes.
> >
> > I am still not able to apply this patch to master. It seems to be
> > rebased on master for ..spi-nor/Kconfig & spi-nor/makefile.
>=20
> I'm able to apply this on next/master just fine.

I think my thunderbird client is messing up with the patch, I am trying to =
fix it.

>=20
> > Also I still see spaces are still not replaced by tabs in this version.
>=20
> Which exact spots are you talking about ? I don't see that many indent fl=
ubs
> in this patch to be honest. Sometimes, it is better to indent the last pi=
ece
> with spaces (mandated by kernel coding style btw) to increase the
> readability.
>=20
> This is in particular the case with stuff like this:
>=20
> pr_err("formating string that is almost 80 chars long %i!\n",
>        parameter_that_is_indented_with_7_spaces);
>=20
> The sole purpose is to align stuff right under the opening parenthesis.
>=20
> > > ---
>=20
> btw. would you please learn to use [...] and keep only the part you're
> commenting on with a bit of context in your reply? It is really hard to l=
ocate
> your comment if it's inbetween 500 lines of nothing.
>=20
> [...]

Thanks Marek, I am not sure how to use it.  I would appreciate any help.

>=20
> > > +static int cqspi_indirect_read_setup(struct spi_nor *nor,
> > > +                                    unsigned int from_addr) {
> > > +       unsigned int reg;
> > > +       unsigned int dummy_clk =3D 0;
> > > +       struct cqspi_st *cqspi =3D nor->priv;
> > > +       void __iomem *reg_base =3D cqspi->iobase;
> > > +
> > > +       writel(cqspi->trigger_address,
> > > +              reg_base + CQSPI_REG_INDIRECTTRIGGER);
> >
> > move indirect trigger configuration in init, no need to do it for
> > every read & write.
>=20
> Fixed.
>=20
> > > +       writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
> > > +
> > > +       reg =3D nor->read_opcode << CQSPI_REG_RD_INSTR_OPCODE_LSB;
> > > +       reg |=3D cqspi_calc_rdreg(nor, nor->read_opcode);
> > > +
> > > +       /* Setup dummy clock cycles */ #define
> > > +CQSPI_SUPPORT_XIP_CHIPS #ifdef CQSPI_SUPPORT_XIP_CHIPS
> > > +       /*
> > > +        * Set mode bits high to ensure chip doesn't enter XIP.
> > > +        * This results in an extra 8 dummy clocks so
> > > +        * we must account for them.
> > > +        */
> > > +       writel(0xFF, reg_base + CQSPI_REG_MODE_BIT);
> > > +       reg |=3D (1 << CQSPI_REG_RD_INSTR_MODE_EN_LSB);
> > > +       if (nor->read_dummy >=3D 8)
> > > +               dummy_clk =3D nor->read_dummy - 8;
> > > +       else
> > > +               dummy_clk =3D 0;
> > > +#else
> > > +       dummy_clk =3D nor->read_dummy; #endif
> > > +       reg |=3D (dummy_clk & CQSPI_REG_RD_INSTR_DUMMY_MASK)
> > > +           << CQSPI_REG_RD_INSTR_DUMMY_LSB;
> > > +
> > > +       writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> > > +
> > > +       /* Set address width */
> > > +       reg =3D readl(reg_base + CQSPI_REG_SIZE);
> > > +       reg &=3D ~CQSPI_REG_SIZE_ADDRESS_MASK;
> > > +       reg |=3D (nor->addr_width - 1);
> > > +       writel(reg, reg_base + CQSPI_REG_SIZE);
> > > +       return 0;
> > > +}
> > > +
> > > +static int cqspi_indirect_read_execute(struct spi_nor *nor,
> > > +                                      u8 *rxbuf, unsigned n_rx) {
> > > +       int ret =3D 0;
> > > +       unsigned int reg =3D 0;
> > > +       unsigned int bytes_to_read =3D 0;
> > > +       unsigned int timeout;
> > > +       unsigned int watermark;
> > > +       struct cqspi_st *cqspi =3D nor->priv;
> > > +       void __iomem *reg_base =3D cqspi->iobase;
> > > +       void __iomem *ahb_base =3D cqspi->ahb_base;
> > > +       int remaining =3D (int)n_rx;
> > > +
> > > +       watermark =3D cqspi->fifo_depth * cqspi->fifo_width / 2;
> > > +       writel(watermark, reg_base +
> CQSPI_REG_INDIRECTRDWATERMARK);
> >
> > I think watermark configuration can be moved to init also & there
> > should not be any need to configuration it for every read.
>=20
> Fixed.
>=20
> > > +       writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
> > > +
> > > +       /* Clear all interrupts. */
> > > +       writel(CQSPI_IRQ_STATUS_MASK, reg_base +
> > > + CQSPI_REG_IRQSTATUS);
> > > +
> > > +       cqspi->irq_mask =3D CQSPI_IRQ_MASK_RD;
> > > +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
> > > +
> > > +       reinit_completion(&cqspi->transfer_complete);
> > > +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
> > > +              reg_base + CQSPI_REG_INDIRECTRD);
> > > +
> > > +       while (remaining > 0) {
> > > +               ret =3D
> > > wait_for_completion_timeout(&cqspi->transfer_complete, +
> > >                                 msecs_to_jiffies +
> > >                           (CQSPI_READ_TIMEOUT_MS)); +
> > > +               bytes_to_read =3D CQSPI_GET_RD_SRAM_LEVEL(reg_base);
> >
> > There should not be any need to read SRAM level, we should be able to
> > get rid of it like in u-boot.
>=20
> Can you explain why ?

There is no need to check for sram fill level. If sram is empty, cpu will g=
o in the wait state till the time data is available from flash.

Also Relying on SRAM fill level only for deciding when the data should befe=
tched from the local SRAM is not most efficient approach, particularly
if we are working on high data rates.
   =20
After one SRAM word is collected, the information is forwarded into system =
domain and then synchronized into register domain (apb).
If we are using slow APB and AHB clks, SRAM fill level might not be up-to-d=
ated because of latency cycles needed for synchronization.
For example in case we are getting SRAM fill level equal to 10 locations bu=
t in reality there were 2 another words completed and
actual level is 12 but information may not be synchronized yet because of t=
he synchronization latency on APB domain.

>=20
> > > +
> > > +               if (!ret && bytes_to_read =3D=3D 0) {
> > > +                       dev_err(nor->dev, "Indirect read timeout, no
> > > bytes\n"); +                       ret =3D -ETIMEDOUT;
> > > +                       goto failrd;
> > > +               }
> > > +
> > > +               while (bytes_to_read !=3D 0) {
> > > +                       bytes_to_read *=3D cqspi->fifo_width;
> > > +                       bytes_to_read =3D bytes_to_read > remaining
> > > +                           ? remaining : bytes_to_read;
> > > +                       cqspi_fifo_read(rxbuf, ahb_base, bytes_to_rea=
d);
> > > +                       rxbuf +=3D bytes_to_read;
> > > +                       remaining -=3D bytes_to_read;
> > > +                       bytes_to_read =3D
> > > CQSPI_GET_RD_SRAM_LEVEL(reg_base); +               }
> > > +       }
> > > +
> > > +       /* Check indirect done status */
> > > +       timeout =3D cqspi_init_timeout(CQSPI_TIMEOUT_MS);
> > > +       while (cqspi_check_timeout(timeout)) {
> > > +               reg =3D readl(reg_base + CQSPI_REG_INDIRECTRD);
> > > +               if (reg & CQSPI_REG_INDIRECTRD_DONE_MASK)
> > > +                       break;
> > > +       }
> > > +
> > > +       if (!(reg & CQSPI_REG_INDIRECTRD_DONE_MASK)) {
> > > +               dev_err(nor->dev,
> > > +                       "Indirect read completion error 0x%08x\n", re=
g);
> > > +               ret =3D -ETIMEDOUT;
> > > +               goto failrd;
> > > +       }
> > > +
> > > +       /* Disable interrupt */
> > > +       writel(0, reg_base + CQSPI_REG_IRQMASK);
> > > +
> > > +       /* Clear indirect completion status */
> > > +       writel(CQSPI_REG_INDIRECTRD_DONE_MASK, reg_base +
> > > CQSPI_REG_INDIRECTRD); +
> > > +       return 0;
> > > +
> > > + failrd:
> > > +       /* Disable interrupt */
> > > +       writel(0, reg_base + CQSPI_REG_IRQMASK);
> > > +
> > > +       /* Cancel the indirect read */
> > > +       writel(CQSPI_REG_INDIRECTWR_CANCEL_MASK,
> > > +              reg_base + CQSPI_REG_INDIRECTRD);
> > > +       return ret;
> > > +}
> > > +
> > > +static int cqspi_indirect_write_setup(struct spi_nor *nor, unsigned
> > > +int
> > > to_addr) +{
> > > +       unsigned int reg;
> > > +       struct cqspi_st *cqspi =3D nor->priv;
> > > +       void __iomem *reg_base =3D cqspi->iobase;
> > > +
> > > +       /* Set opcode. */
> > > +       reg =3D nor->program_opcode <<
> CQSPI_REG_WR_INSTR_OPCODE_LSB;
> > > +       writel(reg, reg_base + CQSPI_REG_WR_INSTR);
> > > +       reg =3D cqspi_calc_rdreg(nor, nor->program_opcode);
> > > +       writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> > > +
> > > +       writel(cqspi->trigger_address,
> > > +              reg_base + CQSPI_REG_INDIRECTTRIGGER);
> > > +       writel(to_addr, reg_base + CQSPI_REG_INDIRECTWRSTARTADDR);
> >
> > move it to init also.
>=20
> I assume you mean the trigger address, not the write start address ?

Yes, you are right.

Rgds,
Vikas

>=20
> > > +
> > > +       reg =3D readl(reg_base + CQSPI_REG_SIZE);
> > > +       reg &=3D ~CQSPI_REG_SIZE_ADDRESS_MASK;
> > > +       reg |=3D (nor->addr_width - 1);
> > > +       writel(reg, reg_base + CQSPI_REG_SIZE);
> > > +       return 0;
> > > +}
> > > +
> > > +static int cqspi_indirect_write_execute(struct spi_nor *nor,
> > > +                                       const u8 *txbuf, unsigned
> > > +n_tx) {
> > > +       int ret;
> > > +       unsigned int timeout;
> > > +       unsigned int reg =3D 0;
> > > +       struct cqspi_st *cqspi =3D nor->priv;
> > > +       void __iomem *reg_base =3D cqspi->iobase;
> > > +       int remaining =3D (int)n_tx;
> > > +       struct cqspi_flash_pdata *f_pdata;
> > > +       unsigned int page_size;
> > > +       unsigned int write_bytes;
> > > +
> > > +       f_pdata =3D &cqspi->f_pdata[cqspi->current_cs];
> > > +       page_size =3D nor->page_size;
> > > +
> > > +       writel(CQSPI_REG_SRAM_THRESHOLD_BYTES, reg_base +
> > > +              CQSPI_REG_INDIRECTWRWATERMARK);
> >
> > should be able to move it to init
>=20
> OK
>=20
> [...]
