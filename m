Received: from mail-by2on0077.outbound.protection.outlook.com ([207.46.100.77]
 helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJmRU-0002Nc-1Y
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 17:44:01 +0000
Message-ID: <55B66CEF.7030100@opensource.altera.com>
Date: Mon, 27 Jul 2015 12:39:59 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: vikasm <vikas.manocha@st.com>
CC: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Alan Tull <atull@opensource.altera.com>, Dinh
 Nguyen <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>
Subject: Re: [PATCH V5 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
References: <1437758259-28299-1-git-send-email-grmoore@opensource.altera.com>
 <1437758259-28299-2-git-send-email-grmoore@opensource.altera.com>
 <55B2D1F9.9040709@st.com>
In-Reply-To: <55B2D1F9.9040709@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vikas,

On 07/24/2015 07:02 PM, vikasm wrote:
> Hi Graham,
>
> On 07/24/2015 10:17 AM, Graham Moore wrote:
>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>> ---
>> V2: use NULL instead of modalias in spi_nor_scan call
>> V3: Use existing property is-decoded-cs instead of creating duplicate.
>> V4: Support Micron quad mode by snooping command stream for EVCR command
>> and subsequently configuring Cadence controller for quad mode.
>> V5: Clean up sparse and smatch complaints.  Remove snooping of Micron
>> quad mode.  Add comment on XIP mode bit and dummy clock cycles.  Set
>> up SRAM partition at 1:1 during init.
>> ---
>>   arch/arm/boot/dts/socfpga.dtsi               |    1 +
>>   arch/arm/boot/dts/socfpga_cyclone5_socdk.dts |    1 -
>>   drivers/mtd/spi-nor/Kconfig                  |    6 +
>>   drivers/mtd/spi-nor/Makefile                 |    1 +
>>   drivers/mtd/spi-nor/cadence-quadspi.c        | 1261 ++++++++++++++++++++++++++
>>   5 files changed, 1269 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c
>>
>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>> index c71a705..e9ecdce 100644
>> --- a/arch/arm/boot/dts/socfpga.dtsi
>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>> @@ -695,6 +695,7 @@
>>                          is-decoded-cs = <1>;
>>                          fifo-depth = <128>;
>>                          status = "disabled";
>> +                       m25p,fast-read;
>
> This patch is not applicable to l2-mtd master or linus master repo, might need to rebase it.
>

Argh, my mistake, these dts files are not supposed to be in the patch.

...

>> +#include <linux/timer.h>
>> +
>> +#define CQSPI_NAME                     "cadence-qspi"
>
> replace space with tabs.
>

They *are* tabs in my original patch.  Not sure how they got changed to 
spaces...

...
>> +
>> +#define CQSPI_FIFO_WIDTH                       4
>
> FIFO width could be 4 or 8 etc depending on the SOC, it would be better to get it from device.
> You can refer to u-boot code for the same.
>

OK
...
>> +
>> +#define CQSPI_INDIRECTTRIGGER_ADDR_MASK                0xFFFFF
>
> Mask value of 0xFFFFF is specific to socfpga platform.
> Please refer to u-boot patchset for same discussion.
>

OK
...
>> +static void cqspi_fifo_read(void *dest, const void __iomem *src_ahb_addr,
>> +                           unsigned int bytes)
>> +{
>> +       unsigned int temp;
>> +       int remaining = bytes;
>> +       unsigned int *dest_ptr = (unsigned int *)dest;
>> +
>> +       while (remaining >= CQSPI_FIFO_WIDTH) {
>> +               *dest_ptr = readl(src_ahb_addr);
>> +               dest_ptr++;
>> +               remaining -= CQSPI_FIFO_WIDTH;
>
> this logic only works when fifo width is 4 with "unsigned int" data of 4 bytes.
> It has been corrected in mainline u-boot or in the u-boot patches.
>

OK
...
>> +static int cqspi_indirect_read_setup(struct spi_nor *nor,
>> +                                    unsigned int from_addr)
>> +{
>> +       unsigned int reg;
>> +       unsigned int dummy_clk = 0;
>> +       struct cqspi_st *cqspi = nor->priv;
>> +       void __iomem *reg_base = cqspi->iobase;
>> +       unsigned int ahb_phy_addr = cqspi->ahb_phy_addr;
>> +
>> +       writel((ahb_phy_addr & CQSPI_INDIRECTTRIGGER_ADDR_MASK),
>> +              reg_base + CQSPI_REG_INDIRECTTRIGGER);
>> +       writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
>
> Base trigger register address (0x1c register) corresponds to the address which
> should be put on AHB bus to handle indirect transfer triggered before.
>
> To handle indirect transfer we need to issue addresses from (value of 0x1c) to
> (value of 0x1c) + 15*4 ("4" corresponds to size of SRAM location).
> There are no obstacles in issuing const address just equal to 0x1c. Important
> thing to note is that indirect trigger address has nothing in common with your
> physical or mapped NOR Flash address.
>
> Transfer read/write start addresses should be programmed with the absolute flash address
> to be read/written.
>

OK, I'll add the trigger address to the device tree, etc.  You seem to 
be concerned about the fact that on Altera SoC, the trigger address and 
the ahb address are different.  I'm not seeing any problem with that. 
The CPU reads/writes the FIFO using an address, but that is not the same 
address that goes on the bus way down in the interconnect.  What's wrong 
with that?  It's the way our SoC works.  If we use the trigger address 
for the trigger address register, and the ahb address for 
reading/writing the FIFO, then it works fine.

...

>> +       watermark = cqspi->fifo_depth * CQSPI_FIFO_WIDTH / 2;
>> +       writel(watermark, reg_base + CQSPI_REG_INDIRECTRDWATERMARK);
>> +       writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
>> +       writel(cqspi->fifo_depth - CQSPI_REG_SRAM_RESV_WORDS,
>> +              reg_base + CQSPI_REG_SRAMPARTITION);
>
> sram partioning is not needed to be changed at every read/write, it should be ok to configure it
> in the init like divide half for read & half for write.
>

OK
...
>
> Rgds,
> Vikas
>

Best regards,
Graham
