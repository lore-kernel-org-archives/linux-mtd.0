Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z00NW-00016t-Vo
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 04:34:14 +0000
Received: by qkoo18 with SMTP id o18so113398622qko.1
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jun 2015 21:33:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1432554590-2655-1-git-send-email-haikun.wang@freescale.com>
References: <1432554590-2655-1-git-send-email-haikun.wang@freescale.com>
Date: Tue, 2 Jun 2015 23:33:49 -0500
Message-ID: <CA+EcR21+s-vsS-k4tpqbk=oPe1jNHdLqjq=nB+k1GuJq=jF-zA@mail.gmail.com>
Subject: Re: [PATCH 2/4 v2] mtd: spi-nor: fsl-quadspi: Enable support big
 endian registers
From: Han Xu <xhnjupt@gmail.com>
To: Haikun Wang <haikun.wang@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 25, 2015 at 6:49 AM, Haikun Wang <haikun.wang@freescale.com> wrote:
> Check endianness before accessing register and swap the data if QSPI
> register is big endian.

I don't think all qspi registers need endian swap, just need to swap
when writing to TBDR and reading from RBDR.

>
> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
> ---
>
> Changes in v2:
> - Fix compile issue
>
>  drivers/mtd/spi-nor/fsl-quadspi.c | 139 ++++++++++++++++++++++----------------
>  1 file changed, 81 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 91d6fab..997eb20 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -191,6 +191,8 @@
>  #define SEQID_EN4B             10
>  #define SEQID_BRWR             11
>
> +#define FSL_QSPI_FLAG_REGMAP_BE        (1 << 0)
> +
>  enum fsl_qspi_devtype {
>         FSL_QUADSPI_VYBRID,
>         FSL_QUADSPI_IMX6SX,
> @@ -202,6 +204,7 @@ struct fsl_qspi_devtype_data {
>         int rxfifo;
>         int txfifo;
>         int ahb_buf_size;
> +       u32 flags;
>  };
>
>  static struct fsl_qspi_devtype_data vybrid_data = {
> @@ -222,7 +225,8 @@ static struct fsl_qspi_devtype_data ls1_data = {
>         .devtype = FSL_QUADSPI_LS1,
>         .rxfifo = 128,
>         .txfifo = 64,
> -       .ahb_buf_size = 1024
> +       .ahb_buf_size = 1024,
> +       .flags = FSL_QSPI_FLAG_REGMAP_BE
>  };
>
>  #define FSL_QSPI_MAX_CHIP      4
> @@ -253,6 +257,18 @@ static inline int is_imx6sx_qspi(struct fsl_qspi *q)
>         return q->devtype_data->devtype == FSL_QUADSPI_IMX6SX;
>  }
>
> +static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem *addr)
> +{
> +       q->devtype_data->flags & FSL_QSPI_FLAG_REGMAP_BE ?
> +               writel(cpu_to_be32(val), addr) : writel(val, addr);
> +}
> +
> +static u32 qspi_readl(struct fsl_qspi *q, void __iomem *addr)
> +{
> +       return q->devtype_data->flags & FSL_QSPI_FLAG_REGMAP_BE ?
> +                       cpu_to_be32(readl(addr)) : readl(addr);
> +}
> +
>  /*
>   * An IC bug makes us to re-arrange the 32-bit data.
>   * The following chips, such as IMX6SLX, have fixed this bug.
> @@ -264,14 +280,14 @@ static inline u32 fsl_qspi_endian_xchg(struct fsl_qspi *q, u32 a)
>
>  static inline void fsl_qspi_unlock_lut(struct fsl_qspi *q)
>  {
> -       writel(QUADSPI_LUTKEY_VALUE, q->iobase + QUADSPI_LUTKEY);
> -       writel(QUADSPI_LCKER_UNLOCK, q->iobase + QUADSPI_LCKCR);
> +       qspi_writel(q, QUADSPI_LUTKEY_VALUE, q->iobase + QUADSPI_LUTKEY);
> +       qspi_writel(q, QUADSPI_LCKER_UNLOCK, q->iobase + QUADSPI_LCKCR);
>  }
>
>  static inline void fsl_qspi_lock_lut(struct fsl_qspi *q)
>  {
> -       writel(QUADSPI_LUTKEY_VALUE, q->iobase + QUADSPI_LUTKEY);
> -       writel(QUADSPI_LCKER_LOCK, q->iobase + QUADSPI_LCKCR);
> +       qspi_writel(q, QUADSPI_LUTKEY_VALUE, q->iobase + QUADSPI_LUTKEY);
> +       qspi_writel(q, QUADSPI_LCKER_LOCK, q->iobase + QUADSPI_LCKCR);
>  }
>
>  static irqreturn_t fsl_qspi_irq_handler(int irq, void *dev_id)
> @@ -280,8 +296,8 @@ static irqreturn_t fsl_qspi_irq_handler(int irq, void *dev_id)
>         u32 reg;
>
>         /* clear interrupt */
> -       reg = readl(q->iobase + QUADSPI_FR);
> -       writel(reg, q->iobase + QUADSPI_FR);
> +       reg = qspi_readl(q, q->iobase + QUADSPI_FR);
> +       qspi_writel(q, reg, q->iobase + QUADSPI_FR);
>
>         if (reg & QUADSPI_FR_TFF_MASK)
>                 complete(&q->c);
> @@ -302,7 +318,7 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>
>         /* Clear all the LUT table */
>         for (i = 0; i < QUADSPI_LUT_NUM; i++)
> -               writel(0, base + QUADSPI_LUT_BASE + i * 4);
> +               qspi_writel(q, 0, base + QUADSPI_LUT_BASE + i * 4);
>
>         /* Quad Read */
>         lut_base = SEQID_QUAD_READ * 4;
> @@ -318,14 +334,15 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>                 dummy = 8;
>         }
>
> -       writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
> +       qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
>                         base + QUADSPI_LUT(lut_base));
> -       writel(LUT0(DUMMY, PAD1, dummy) | LUT1(READ, PAD4, rxfifo),
> +       qspi_writel(q, LUT0(DUMMY, PAD1, dummy) | LUT1(READ, PAD4, rxfifo),
>                         base + QUADSPI_LUT(lut_base + 1));
>
>         /* Write enable */
>         lut_base = SEQID_WREN * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_WREN), base + QUADSPI_LUT(lut_base));
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WREN),
> +                   base + QUADSPI_LUT(lut_base));
>
>         /* Page Program */
>         lut_base = SEQID_PP * 4;
> @@ -339,13 +356,13 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>                 addrlen = ADDR32BIT;
>         }
>
> -       writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
> +       qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
>                         base + QUADSPI_LUT(lut_base));
> -       writel(LUT0(WRITE, PAD1, 0), base + QUADSPI_LUT(lut_base + 1));
> +       qspi_writel(q, LUT0(WRITE, PAD1, 0), base + QUADSPI_LUT(lut_base + 1));
>
>         /* Read Status */
>         lut_base = SEQID_RDSR * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_RDSR) | LUT1(READ, PAD1, 0x1),
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDSR) | LUT1(READ, PAD1, 0x1),
>                         base + QUADSPI_LUT(lut_base));
>
>         /* Erase a sector */
> @@ -360,40 +377,43 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>                 addrlen = ADDR32BIT;
>         }
>
> -       writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
> +       qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
>                         base + QUADSPI_LUT(lut_base));
>
>         /* Erase the whole chip */
>         lut_base = SEQID_CHIP_ERASE * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_CHIP_ERASE),
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_CHIP_ERASE),
>                         base + QUADSPI_LUT(lut_base));
>
>         /* READ ID */
>         lut_base = SEQID_RDID * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_RDID) | LUT1(READ, PAD1, 0x8),
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDID) | LUT1(READ, PAD1, 0x8),
>                         base + QUADSPI_LUT(lut_base));
>
>         /* Write Register */
>         lut_base = SEQID_WRSR * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_WRSR) | LUT1(WRITE, PAD1, 0x2),
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRSR) | LUT1(WRITE, PAD1, 0x2),
>                         base + QUADSPI_LUT(lut_base));
>
>         /* Read Configuration Register */
>         lut_base = SEQID_RDCR * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_RDCR) | LUT1(READ, PAD1, 0x1),
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDCR) | LUT1(READ, PAD1, 0x1),
>                         base + QUADSPI_LUT(lut_base));
>
>         /* Write disable */
>         lut_base = SEQID_WRDI * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_WRDI), base + QUADSPI_LUT(lut_base));
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRDI),
> +                   base + QUADSPI_LUT(lut_base));
>
>         /* Enter 4 Byte Mode (Micron) */
>         lut_base = SEQID_EN4B * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_EN4B), base + QUADSPI_LUT(lut_base));
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_EN4B),
> +                   base + QUADSPI_LUT(lut_base));
>
>         /* Enter 4 Byte Mode (Spansion) */
>         lut_base = SEQID_BRWR * 4;
> -       writel(LUT0(CMD, PAD1, SPINOR_OP_BRWR), base + QUADSPI_LUT(lut_base));
> +       qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_BRWR),
> +                   base + QUADSPI_LUT(lut_base));
>
>         fsl_qspi_lock_lut(q);
>  }
> @@ -446,15 +466,16 @@ fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsigned int addr, int len)
>                         q->chip_base_addr, addr, len, cmd);
>
>         /* save the reg */
> -       reg = readl(base + QUADSPI_MCR);
> +       reg = qspi_readl(q, base + QUADSPI_MCR);
>
> -       writel(q->memmap_phy + q->chip_base_addr + addr, base + QUADSPI_SFAR);
> -       writel(QUADSPI_RBCT_WMRK_MASK | QUADSPI_RBCT_RXBRD_USEIPS,
> +       qspi_writel(q, q->memmap_phy + q->chip_base_addr + addr,
> +                   base + QUADSPI_SFAR);
> +       qspi_writel(q, QUADSPI_RBCT_WMRK_MASK | QUADSPI_RBCT_RXBRD_USEIPS,
>                         base + QUADSPI_RBCT);
> -       writel(reg | QUADSPI_MCR_CLR_RXF_MASK, base + QUADSPI_MCR);
> +       qspi_writel(q, reg | QUADSPI_MCR_CLR_RXF_MASK, base + QUADSPI_MCR);
>
>         do {
> -               reg2 = readl(base + QUADSPI_SR);
> +               reg2 = qspi_readl(q, base + QUADSPI_SR);
>                 if (reg2 & (QUADSPI_SR_IP_ACC_MASK | QUADSPI_SR_AHB_ACC_MASK)) {
>                         udelay(1);
>                         dev_dbg(q->dev, "The controller is busy, 0x%x\n", reg2);
> @@ -465,21 +486,22 @@ fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsigned int addr, int len)
>
>         /* trigger the LUT now */
>         seqid = fsl_qspi_get_seqid(q, cmd);
> -       writel((seqid << QUADSPI_IPCR_SEQID_SHIFT) | len, base + QUADSPI_IPCR);
> +       qspi_writel(q, (seqid << QUADSPI_IPCR_SEQID_SHIFT) | len,
> +                   base + QUADSPI_IPCR);
>
>         /* Wait for the interrupt. */
>         if (!wait_for_completion_timeout(&q->c, msecs_to_jiffies(1000))) {
>                 dev_err(q->dev,
>                         "cmd 0x%.2x timeout, addr@%.8x, FR:0x%.8x, SR:0x%.8x\n",
> -                       cmd, addr, readl(base + QUADSPI_FR),
> -                       readl(base + QUADSPI_SR));
> +                       cmd, addr, qspi_readl(q, base + QUADSPI_FR),
> +                       qspi_readl(q, base + QUADSPI_SR));
>                 err = -ETIMEDOUT;
>         } else {
>                 err = 0;
>         }
>
>         /* restore the MCR */
> -       writel(reg, base + QUADSPI_MCR);
> +       qspi_writel(q, reg, base + QUADSPI_MCR);
>
>         return err;
>  }
> @@ -491,7 +513,7 @@ static void fsl_qspi_read_data(struct fsl_qspi *q, int len, u8 *rxbuf)
>         int i = 0;
>
>         while (len > 0) {
> -               tmp = readl(q->iobase + QUADSPI_RBDR + i * 4);
> +               tmp = qspi_readl(q, q->iobase + QUADSPI_RBDR + i * 4);
>                 tmp = fsl_qspi_endian_xchg(q, tmp);
>                 dev_dbg(q->dev, "chip addr:0x%.8x, rcv:0x%.8x\n",
>                                 q->chip_base_addr, tmp);
> @@ -519,9 +541,9 @@ static inline void fsl_qspi_invalid(struct fsl_qspi *q)
>  {
>         u32 reg;
>
> -       reg = readl(q->iobase + QUADSPI_MCR);
> +       reg = qspi_readl(q, q->iobase + QUADSPI_MCR);
>         reg |= QUADSPI_MCR_SWRSTHD_MASK | QUADSPI_MCR_SWRSTSD_MASK;
> -       writel(reg, q->iobase + QUADSPI_MCR);
> +       qspi_writel(q, reg, q->iobase + QUADSPI_MCR);
>
>         /*
>          * The minimum delay : 1 AHB + 2 SFCK clocks.
> @@ -530,7 +552,7 @@ static inline void fsl_qspi_invalid(struct fsl_qspi *q)
>         udelay(1);
>
>         reg &= ~(QUADSPI_MCR_SWRSTHD_MASK | QUADSPI_MCR_SWRSTSD_MASK);
> -       writel(reg, q->iobase + QUADSPI_MCR);
> +       qspi_writel(q, reg, q->iobase + QUADSPI_MCR);
>  }
>
>  static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
> @@ -544,13 +566,13 @@ static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
>                 q->chip_base_addr, to, count);
>
>         /* clear the TX FIFO. */
> -       tmp = readl(q->iobase + QUADSPI_MCR);
> -       writel(tmp | QUADSPI_MCR_CLR_RXF_MASK, q->iobase + QUADSPI_MCR);
> +       tmp = qspi_readl(q, q->iobase + QUADSPI_MCR);
> +       qspi_writel(q, tmp | QUADSPI_MCR_CLR_RXF_MASK, q->iobase + QUADSPI_MCR);
>
>         /* fill the TX data to the FIFO */
>         for (j = 0, i = ((count + 3) / 4); j < i; j++) {
>                 tmp = fsl_qspi_endian_xchg(q, *txbuf);
> -               writel(tmp, q->iobase + QUADSPI_TBDR);
> +               qspi_writel(q, tmp, q->iobase + QUADSPI_TBDR);
>                 txbuf++;
>         }
>
> @@ -568,10 +590,10 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
>         int nor_size = q->nor_size;
>         void __iomem *base = q->iobase;
>
> -       writel(nor_size + q->memmap_phy, base + QUADSPI_SFA1AD);
> -       writel(nor_size * 2 + q->memmap_phy, base + QUADSPI_SFA2AD);
> -       writel(nor_size * 3 + q->memmap_phy, base + QUADSPI_SFB1AD);
> -       writel(nor_size * 4 + q->memmap_phy, base + QUADSPI_SFB2AD);
> +       qspi_writel(q, nor_size + q->memmap_phy, base + QUADSPI_SFA1AD);
> +       qspi_writel(q, nor_size * 2 + q->memmap_phy, base + QUADSPI_SFA2AD);
> +       qspi_writel(q, nor_size * 3 + q->memmap_phy, base + QUADSPI_SFB1AD);
> +       qspi_writel(q, nor_size * 4 + q->memmap_phy, base + QUADSPI_SFB2AD);
>  }
>
>  /*
> @@ -593,24 +615,25 @@ static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
>         int seqid;
>
>         /* AHB configuration for access buffer 0/1/2 .*/
> -       writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF0CR);
> -       writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF1CR);
> -       writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF2CR);
> +       qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF0CR);
> +       qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF1CR);
> +       qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF2CR);
>         /*
>          * Set ADATSZ with the maximum AHB buffer size to improve the
>          * read performance.
>          */
> -       writel(QUADSPI_BUF3CR_ALLMST_MASK | ((q->devtype_data->ahb_buf_size / 8)
> -                       << QUADSPI_BUF3CR_ADATSZ_SHIFT), base + QUADSPI_BUF3CR);
> +       qspi_writel(q, QUADSPI_BUF3CR_ALLMST_MASK |
> +                   ((q->devtype_data->ahb_buf_size / 8)
> +                   << QUADSPI_BUF3CR_ADATSZ_SHIFT), base + QUADSPI_BUF3CR);
>
>         /* We only use the buffer3 */
> -       writel(0, base + QUADSPI_BUF0IND);
> -       writel(0, base + QUADSPI_BUF1IND);
> -       writel(0, base + QUADSPI_BUF2IND);
> +       qspi_writel(q, 0, base + QUADSPI_BUF0IND);
> +       qspi_writel(q, 0, base + QUADSPI_BUF1IND);
> +       qspi_writel(q, 0, base + QUADSPI_BUF2IND);
>
>         /* Set the default lut sequence for AHB Read. */
>         seqid = fsl_qspi_get_seqid(q, q->nor[0].read_opcode);
> -       writel(seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
> +       qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
>                 q->iobase + QUADSPI_BFGENCR);
>  }
>
> @@ -630,21 +653,21 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>         fsl_qspi_init_lut(q);
>
>         /* Disable the module */
> -       writel(QUADSPI_MCR_MDIS_MASK | QUADSPI_MCR_RESERVED_MASK,
> +       qspi_writel(q, QUADSPI_MCR_MDIS_MASK | QUADSPI_MCR_RESERVED_MASK,
>                         base + QUADSPI_MCR);
>
> -       reg = readl(base + QUADSPI_SMPR);
> -       writel(reg & ~(QUADSPI_SMPR_FSDLY_MASK
> +       reg = qspi_readl(q, base + QUADSPI_SMPR);
> +       qspi_writel(q, reg & ~(QUADSPI_SMPR_FSDLY_MASK
>                         | QUADSPI_SMPR_FSPHS_MASK
>                         | QUADSPI_SMPR_HSENA_MASK
>                         | QUADSPI_SMPR_DDRSMP_MASK), base + QUADSPI_SMPR);
>
>         /* Enable the module */
> -       writel(QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_MASK,
> +       qspi_writel(q, QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_MASK,
>                         base + QUADSPI_MCR);
>
>         /* enable the interrupt */
> -       writel(QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
> +       qspi_writel(q, QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
>
>         return 0;
>  }
> @@ -979,8 +1002,8 @@ static int fsl_qspi_remove(struct platform_device *pdev)
>         }
>
>         /* disable the hardware */
> -       writel(QUADSPI_MCR_MDIS_MASK, q->iobase + QUADSPI_MCR);
> -       writel(0x0, q->iobase + QUADSPI_RSER);
> +       qspi_writel(q, QUADSPI_MCR_MDIS_MASK, q->iobase + QUADSPI_MCR);
> +       qspi_writel(q, 0x0, q->iobase + QUADSPI_RSER);
>
>         clk_unprepare(q->clk);
>         clk_unprepare(q->clk_en);
> --
> 2.1.0.27.g96db324
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
