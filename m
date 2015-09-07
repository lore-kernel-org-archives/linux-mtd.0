Message-ID: <55EDDDCC.7060006@st.com>
Date: Mon, 7 Sep 2015 11:56:12 -0700
From: vikas <vikas.manocha@st.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Graham
 Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
References: <1440148851-14621-1-git-send-email-marex@denx.de>
 <1440148851-14621-2-git-send-email-marex@denx.de> <55EA2CFD.6060300@st.com>
 <201509061716.27521.marex@denx.de>
In-Reply-To: <201509061716.27521.marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 09/06/2015 08:16 AM, Marek Vasut wrote:
> On Saturday, September 05, 2015 at 01:45:01 AM, vikas wrote:
>> Hi,
>>
>> On 08/21/2015 02:20 AM, Marek Vasut wrote:
>>> From: Graham Moore <grmoore@opensource.altera.com>
>>>
>>> Add support for the Cadence QSPI controller. This controller is
>>> present in the Altera SoCFPGA SoCs and this driver has been tested
>>> on the Cyclone V SoC.
>>
>> can we add info about the modes supported/not supported like direct mode,
>> indirect etc.
> 
> It's already part of the documentation.

To be clear, add info for modes supported in the driver. e.g. Direct mode is not supported in the driver.
Lets add this info to help users.

> 
>>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Alan Tull <atull@opensource.altera.com>
>>> Cc: Brian Norris <computersforpeace@gmail.com>
>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
>>> Cc: Graham Moore <grmoore@opensource.altera.com>
>>> Cc: Vikas MANOCHA <vikas.manocha@st.com>
>>> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
>>> Cc: devicetree@vger.kernel.org
>>> ---
> 
> [...]
> 
>>> +#define CQSPI_REG_CMDADDRESS                   0x94
>>> +#define CQSPI_REG_CMDREADDATALOWER             0xA0
>>> +#define CQSPI_REG_CMDREADDATAUPPER             0xA4
>>> +#define CQSPI_REG_CMDWRITEDATALOWER            0xA8
>>> +#define CQSPI_REG_CMDWRITEDATAUPPER            0xAC
>>> +
>>> +/* Interrupt status bits */
>>> +#define CQSPI_REG_IRQ_MODE_ERR                 BIT(0)
>>> +#define CQSPI_REG_IRQ_UNDERFLOW                        BIT(1)
>>> +#define CQSPI_REG_IRQ_IND_COMP                 BIT(2)
>>> +#define CQSPI_REG_IRQ_IND_RD_REJECT            BIT(3)
>>> +#define CQSPI_REG_IRQ_WR_PROTECTED_ERR         BIT(4)
>>> +#define CQSPI_REG_IRQ_ILLEGAL_AHB_ERR          BIT(5)
>>
>> remove unused MACROs.
> 
> You mean you prefer to have incomplete definition of bits in the register
> instead of a complete one ? I cannot agree to this, sorry.
> 
>>> +#define CQSPI_REG_IRQ_WATERMARK                        BIT(6)
>>> +#define CQSPI_REG_IRQ_IND_RD_OVERFLOW          BIT(12)
>>
>> Correct this bit name to ..IND_RD_SRAM_FULL.
> 
> Good catch.
> 
> [...]
> 
>>> +static int cqspi_wait_idle(struct cqspi_st *cqspi)
>>> +{
>>> +       const unsigned int poll_idle_retry = 3;
>>> +       unsigned int count = 0;
>>> +       unsigned long timeout;
>>> +
>>> +       timeout = jiffies + msecs_to_jiffies(CQSPI_TIMEOUT_MS);
>>> +       while (1) {
>>> +               /*
>>> +                * Read few times in succession to ensure the controller
>>> +                * is indeed idle, that is, the bit does not transition
>>> +                * low again.
>>> +                */
>>> +               if (cqspi_is_idle(cqspi))
>>> +                       count++;
>>> +               else
>>> +                       count = 0;
>>> +
>>> +               if (count >= poll_idle_retry)
>>> +                       return 0;
>>
>> why do we need to check it 3 times ?
> 
> Please see the comment above.

don't use the comments to explain what code is doing. Add info why it is being done & how this solution fixes it.
The point is if is some soc bug, it should be handled differently.

> 
>>> +
>>> +               if (time_after(jiffies, timeout)) {
>>> +                       /* Timeout, in busy mode. */
>>> +                       dev_err(&cqspi->pdev->dev,
>>> +                               "QSPI is still busy after %dms
>>> timeout.\n", +                               CQSPI_TIMEOUT_MS);
>>> +                       return -ETIMEDOUT;
>>> +               }
>>> +
>>> +               cpu_relax();
>>> +       }
>>> +}
>>> +
>>
>> [...]
>>
>>> +
>>> +static int cqspi_indirect_read_execute(struct spi_nor *nor,
>>> +                                      u8 *rxbuf, const unsigned n_rx)
>>> +{
>>> +       struct cqspi_flash_pdata *f_pdata = nor->priv;
>>> +       struct cqspi_st *cqspi = f_pdata->cqspi;
>>> +       void __iomem *reg_base = cqspi->iobase;
>>> +       void __iomem *ahb_base = cqspi->ahb_base;
>>> +       unsigned int remaining = n_rx;
>>> +       unsigned int bytes_to_read = 0;
>>> +       int ret = 0;
>>> +
>>> +       writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
>>> +
>>> +       /* Clear all interrupts. */
>>> +       writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
>>> +
>>> +       writel(CQSPI_IRQ_MASK_RD, reg_base + CQSPI_REG_IRQMASK);
>>
>> I think there is no need for separate masks for read & write. Use one mask
>> & configure it once in the init rather than configuring each time for
>> every read/write. Then in the ISR, take action as per the interrupt
>> source: read/write/error condition etc.
> 
> Setting up the specific IRQ mask prevents spurious interrupts during the
> particular IO operation, so this solution looks more precise to me.

spurious interrupt ? like ?

Configuring interrupt at one time for read/write (preferably in init) is better software design
then breaking it in for every read/write.

> 
>>> +
>>> +       reinit_completion(&cqspi->transfer_complete);
>>> +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
>>> +              reg_base + CQSPI_REG_INDIRECTRD);
>>> +
>>> +       while (remaining > 0) {
>>> +               ret =
>>> wait_for_completion_timeout(&cqspi->transfer_complete, +                
>>>                                 msecs_to_jiffies +                      
>>>                           (CQSPI_READ_TIMEOUT_MS)); +
>>> +               bytes_to_read = cqspi_get_rd_sram_level(cqspi);
>>> +
>>> +               if (!ret && bytes_to_read == 0) {
>>> +                       dev_err(nor->dev, "Indirect read timeout, no
>>> bytes\n"); +                       ret = -ETIMEDOUT;
>>> +                       goto failrd;
>>> +               }
>>> +
>>> +               while (bytes_to_read != 0) {
>>> +                       bytes_to_read *= cqspi->fifo_width;
>>> +                       bytes_to_read = bytes_to_read > remaining ?
>>> +                                       remaining : bytes_to_read;
>>> +                       readsl(ahb_base, rxbuf,
>>> DIV_ROUND_UP(bytes_to_read, 4)); +                       rxbuf +=
>>> bytes_to_read;
>>> +                       remaining -= bytes_to_read;
>>> +                       bytes_to_read = cqspi_get_rd_sram_level(cqspi);
>>> +               }
>>> +       }
>>> +
>>> +       /* Check indirect done status */
>>> +       ret = cqspi_wait_for_bit(reg_base + CQSPI_REG_INDIRECTRD,
>>> +                                CQSPI_REG_INDIRECTRD_DONE_MASK, 0);
>>> +       if (ret) {
>>> +               dev_err(nor->dev,
>>> +                       "Indirect read completion error (%i)\n", ret);
>>> +               goto failrd;
>>> +       }
>>> +
>>> +       /* Disable interrupt */
>>> +       writel(0, reg_base + CQSPI_REG_IRQMASK);
>>> +
>>> +       /* Clear indirect completion status */
>>> +       writel(CQSPI_REG_INDIRECTRD_DONE_MASK, reg_base +
>>> CQSPI_REG_INDIRECTRD); +
>>> +       return 0;
>>> +
>>> +failrd:
>>> +       /* Disable interrupt */
>>> +       writel(0, reg_base + CQSPI_REG_IRQMASK);
>>> +
>>> +       /* Cancel the indirect read */
>>> +       writel(CQSPI_REG_INDIRECTWR_CANCEL_MASK,
>>> +              reg_base + CQSPI_REG_INDIRECTRD);
>>> +       return ret;
>>> +}
> 
> [...]
> 
>>> +static void cqspi_controller_enable(struct cqspi_st *cqspi)
>>> +{
>>> +       void __iomem *reg_base = cqspi->iobase;
>>> +       unsigned int reg;
>>> +
>>> +       reg = readl(reg_base + CQSPI_REG_CONFIG);
>>> +       reg |= CQSPI_REG_CONFIG_ENABLE_MASK;
>>> +       writel(reg, reg_base + CQSPI_REG_CONFIG);
>>> +}
>>> +
>>> +static void cqspi_controller_disable(struct cqspi_st *cqspi)
>>> +{
>>> +       void __iomem *reg_base = cqspi->iobase;
>>> +       unsigned int reg;
>>> +
>>> +       reg = readl(reg_base + CQSPI_REG_CONFIG);
>>> +       reg &= ~CQSPI_REG_CONFIG_ENABLE_MASK;
>>> +       writel(reg, reg_base + CQSPI_REG_CONFIG);
>>> +}
>>
>> two above function are almost same, we can have one function by adding
>> one bool arg.
> 
> It makes the code less readable, but whatever.

simple code is good but not simpler :-)

> 
> [...]
> 
>>> +static void cqspi_controller_init(struct cqspi_st *cqspi)
>>> +{
>>> +       cqspi_controller_disable(cqspi);
>>> +
>>> +       /* Configure the remap address register, no remap */
>>> +       writel(0, cqspi->iobase + CQSPI_REG_REMAP);
>>> +
>>> +       /* Disable all interrupts. */
>>> +       writel(0, cqspi->iobase + CQSPI_REG_IRQMASK);
>>> +
>>> +       /* Configure the SRAM split to 1:1 . */
>>
>> The comment is rightly using "SRAM" but the variable name "fifo_depth" is
>> misleading, change it to sram_depth.
> 
> Quote from the datasheet:
> 
> Defines the size of the indirect read partition in the
> SRAM, in units of SRAM locations. By default, half of
> the SRAM is reserved for indirect read operations and
> half for indirect write operations.

good, that explains it is sram depth not fifo depth.

> 
> 
>>> +       writel(cqspi->fifo_depth / 2, cqspi->iobase +
>>> CQSPI_REG_SRAMPARTITION); +
>>> +       /* Load indirect trigger address. */
>>
>> remove this comment & review other comments of this function. I would
>> remove at least first two comments also of the routine.
> 
> I already answered this in the previous iteration.

I don't agree on this commentary of code, loading a value in register & then adding "loading value in register".
I stop here for this point, not worth more discussion.

Cheers,
Vikas

> 
>>> +       writel(cqspi->trigger_address,
>>> +              cqspi->iobase + CQSPI_REG_INDIRECTTRIGGER);
>>> +
>>> +       /* Program read watermark -- 1/2 of the FIFO. */
>>> +       writel(cqspi->fifo_depth * cqspi->fifo_width / 2,
>>> +              cqspi->iobase + CQSPI_REG_INDIRECTRDWATERMARK);
>>> +       /* Program write watermark -- 1/8 of the FIFO. */
>>> +       writel(cqspi->fifo_depth * cqspi->fifo_width / 8,
>>> +              cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);
>>> +
>>> +       cqspi_controller_enable(cqspi);
>>> +}
> 
> [...]
> .
> 
