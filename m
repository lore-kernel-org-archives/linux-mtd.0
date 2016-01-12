Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIr3t-0007my-Kn
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 05:00:06 +0000
Subject: Re: [2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
To: Marek Vasut <marex@denx.de>, Graham Moore <grmoore@opensource.altera.com>
References: <1440148851-14621-2-git-send-email-marex@denx.de>
 <56932C19.6000509@ti.com> <201601110550.25422.marex@denx.de>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>, Alan Tull
 <atull@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, Dinh Nguyen
 <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <5694881F.10707@ti.com>
Date: Tue, 12 Jan 2016 10:29:11 +0530
MIME-Version: 1.0
In-Reply-To: <201601110550.25422.marex@denx.de>
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

On 01/11/2016 10:20 AM, Marek Vasut wrote:
> On Monday, January 11, 2016 at 05:14:17 AM, R, Vignesh wrote:
>> Hi Marek,
> 
> Hi!
> 
>> On 08/21/2015 02:50 PM, Marek Vasut wrote:
>>> From: Graham Moore <grmoore@opensource.altera.com>
>>>
>>> Add support for the Cadence QSPI controller. This controller is
>>> present in the Altera SoCFPGA SoCs and this driver has been tested
>>> on the Cyclone V SoC.
>>
>> Thanks for the patch.
>> I have a TI EVM with Cadence QSPI controller connected to Spansion
>> flash(s25fl512s), and I gave this series a try. It worked with couple of
>> changes, please see comments inline.
> 
> I just posted the latest greatest version I have in tree, could you give it
> a spin please ?
> 

Thanks, I will test it soon.

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
> 
> [...]
> 
>>> +static irqreturn_t cqspi_irq_handler(int this_irq, void *dev)
>>> +{
>>> +	struct cqspi_st *cqspi = dev;
>>> +	unsigned int irq_status;
>>> +
>>> +	/* Read interrupt status */
>>> +	irq_status = readl(cqspi->iobase + CQSPI_REG_IRQSTATUS);
>>> +
>>> +	/* Clear interrupt */
>>> +	writel(irq_status, cqspi->iobase + CQSPI_REG_IRQSTATUS);
>>> +
>>> +	irq_status &= CQSPI_IRQ_MASK_RD | CQSPI_IRQ_MASK_WR;
>>> +
>>> +	if (irq_status)
>>> +		complete(&cqspi->transfer_complete);
>>> +
>>
>> You seem to signal completion even if the interrupt is
>> CQSPI_REG_IRQ_IND_(WR|RD)_OVERFLOW. Doesn't this lead to data loss on
>> overflow?
> 
> That's a good question. The write routine, cqspi_indirect_write_execute(),
> always writes a page and then waits for completion, so the overflow should
> never happen.
> 
> What would you suggest to do about write overflow interrupt anyway ? :(
> 

My concern was signalling completion on CQSPI_REG_IRQ_IND_WR_OVERFLOW
interrupt which meant data loss.
But, I see you have disabled CQSPI_REG_IRQ_IND_WR_OVERFLOW in v10. This
addresses my concern.


>>> +	return IRQ_HANDLED;
>>> +}
> 
> [...]
> 
>>> +static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>>> +{
>>> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
>>> +	struct cqspi_st *cqspi = f_pdata->cqspi;
>>> +	const unsigned int sclk = f_pdata->clk_rate;
>>> +
>>> +	/* Switch chip select. */
>>> +	if (cqspi->current_cs != f_pdata->cs) {
>>> +		cqspi->current_cs = f_pdata->cs;
>>> +		cqspi_switch_cs(nor);
>>> +	}
>>> +
>>> +	/* Setup baudrate divisor and delays */
>>> +	if (cqspi->sclk != sclk) {
>>> +		cqspi->sclk = sclk;
>>> +		cqspi_controller_disable(cqspi);
>>> +		cqspi_config_baudrate_div(cqspi, sclk);
>>> +		cqspi_delay(nor, sclk);
>>> +		cqspi_readdata_capture(cqspi, 1, f_pdata->read_delay);
>>
>> I see bypass field value is being hard coded to 1. Atleast on TI SoC,
>> bypass=0 when SPI bus frequency is  >= 50MHz. Therefore, is it possible
>> to provide a way to configure bypass bit from DT?
>> Or if bypass=0 for >=50MHz on your SoC too then, its better to configure
>> bypass bit based on SPI bus frequency.
> 
> You can have multiple SPI peripherals attached to the QSPI block, each running 
> at different bus speed, so I think the bypass should be configured based on the 
> frequency of the active peripheral, not from OF.

I agree, if the dependency is uniform across SoCs, then bypass should be
configured based on the frequency of the active peripheral.

> 
> I don't know exactly what impact configuring this bit has, the socfpga datasheet 
> is not very clear about the meaning of this bit, so it'd be better if someone 
> from Altera answered this question.
> 

Have you tested the driver at SPI bus frequency >50MHz?

>>> +		cqspi_controller_enable(cqspi);
>>> +	}
>>> +	return 0;
>>> +}
> 
> [...]
> 
[...]
>>> +	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
>>> +			       pdev->name, cqspi);
>>> +	if (ret) {
>>> +		dev_err(dev, "Cannot request IRQ.\n");
>>> +		return ret;
>>> +	}
>>> +
>>
>> pm_runtime_enable(), pm_runtime_get_sync() might be needed here as QSPI
>> clocks may not be enabled by default on all platforms.
> 
> Can you whip up a bit of code and test it on your platform ? I dont think
> socfpga has runtime PM yet. I'd like to add it into the driver or you can
> send a small patch later, whichever way you prefer.
> 

Ok, I can send a patch once the driver is accepted.

>>> +	cqspi_wait_idle(cqspi);
>>> +	cqspi_controller_init(cqspi);
>>> +	cqspi->current_cs = -1;
>>> +	cqspi->sclk = 0;
>>> +
>>> +	ret = cqspi_setup_flash(cqspi, np);
>>> +	if (ret) {
>>> +		dev_err(dev, "Cadence QSPI NOR probe failed %d\n", ret);
>>> +		cqspi_controller_disable(cqspi);
>>> +	}
>>> +
>>> +	return ret;
>>> +}
> 
> Thanks!
> 

-- 
Regards
Vignesh
