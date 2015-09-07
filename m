Message-ID: <55EDF31F.6010607@st.com>
Date: Mon, 7 Sep 2015 13:27:11 -0700
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
 <201509061716.27521.marex@denx.de> <55EDDDCC.7060006@st.com>
In-Reply-To: <55EDDDCC.7060006@st.com>
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

On 09/07/2015 11:56 AM, vikas wrote:
> Hi,
> 
> On 09/06/2015 08:16 AM, Marek Vasut wrote:
>> On Saturday, September 05, 2015 at 01:45:01 AM, vikas wrote:
>>> Hi,
>>>
>>> On 08/21/2015 02:20 AM, Marek Vasut wrote:
>>>> From: Graham Moore <grmoore@opensource.altera.com>
>>>>
>>>> Add support for the Cadence QSPI controller. This controller is
>>>> present in the Altera SoCFPGA SoCs and this driver has been tested
>>>> on the Cyclone V SoC.
>>>
>>> can we add info about the modes supported/not supported like direct mode,
>>> indirect etc.
>>
>> It's already part of the documentation.
> 
> To be clear, add info for modes supported in the driver. e.g. Direct mode is not supported in the driver.
> Lets add this info to help users.
> 
>>
>>>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Alan Tull <atull@opensource.altera.com>
>>>> Cc: Brian Norris <computersforpeace@gmail.com>
>>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>>> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
>>>> Cc: Graham Moore <grmoore@opensource.altera.com>
>>>> Cc: Vikas MANOCHA <vikas.manocha@st.com>
>>>> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
>>>> Cc: devicetree@vger.kernel.org
>>>> ---
>>
>> [...]
>>
>>>> +#define CQSPI_REG_CMDADDRESS                   0x94
>>>> +#define CQSPI_REG_CMDREADDATALOWER             0xA0
>>>> +#define CQSPI_REG_CMDREADDATAUPPER             0xA4
>>>> +#define CQSPI_REG_CMDWRITEDATALOWER            0xA8
>>>> +#define CQSPI_REG_CMDWRITEDATAUPPER            0xAC
>>>> +


[...]

>>>> +
>>>> +       /* Clear all interrupts. */
>>>> +       writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
>>>> +
>>>> +       writel(CQSPI_IRQ_MASK_RD, reg_base + CQSPI_REG_IRQMASK);
>>>
>>> I think there is no need for separate masks for read & write. Use one mask
>>> & configure it once in the init rather than configuring each time for
>>> every read/write. Then in the ISR, take action as per the interrupt
>>> source: read/write/error condition etc.
>>
>> Setting up the specific IRQ mask prevents spurious interrupts during the
>> particular IO operation, so this solution looks more precise to me.
> 
> spurious interrupt ? like ?
> 
> Configuring interrupt at one time for read/write (preferably in init) is better software design
> then breaking it in for every read/write.

just to clarify "preferably in init" not always but yes in this case.

Cheers,
Vikas

> 
>>
>>>> +
>>>> +       reinit_completion(&cqspi->transfer_complete);
>>>> +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
>>>> +              reg_base + CQSPI_REG_INDIRECTRD);
>>>> +
>>>> +       while (remaining > 0) {
>>>> +               ret =

[...]
