Message-ID: <55D39722.8030506@st.com>
Date: Tue, 18 Aug 2015 13:35:46 -0700
From: vikas <vikas.manocha@st.com>
MIME-Version: 1.0
To: Graham Moore <grmoore@opensource.altera.com>
CC: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Yves
 Vandervennet <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <1439522892-7524-2-git-send-email-marex@denx.de> <55D299CD.2070809@st.com>
 <55D384D6.9040303@opensource.altera.com>
In-Reply-To: <55D384D6.9040303@opensource.altera.com>
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


On 08/18/2015 12:17 PM, Graham Moore wrote:
> Hi Vikas,
> 
> On 08/17/2015 09:34 PM, vikas wrote:
>  > Hi Marek,
>  >
> 
> [...]
> 
>  >> +
>>> +/* Operation timeout value */
>>> +#define CQSPI_TIMEOUT_MS                       500
>>> +#define CQSPI_READ_TIMEOUT_MS                  10
>>
>> please add some comment about the timeouts value selection.
>>
> 
> I wish I could comment, but I don't know the origin of these values. 
> The 500 ms value is probably just "a very long time".

In my opinion we should have some logical value based on some worst timing like read/write sector.
I let you decide on this point.

> 
> [...]
> 
>>> +
>>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_RD;
>>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>>
>> here interrupt mask is being configured for every read, better would be to move it in init.
>>
> 
> [...]
> 
>>> +
>>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_WR;
>>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>>
>> same like read, it should be moved to init.
>>
> 
> It uses different masks for read and write

Yeah i saw it but why not to OR these values & configure for once in init. 
After that in ISR, check for the interrupt source & take action accordingly. I think other drivers also use it this way.

Rgds,
Vikas

> 
> [...]
> 
> BR,
> Graham
> 
> .
> 
