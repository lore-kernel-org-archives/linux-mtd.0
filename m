Received: from mail-bl2on0055.outbound.protection.outlook.com ([65.55.169.55]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRmSN-00030c-1b
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 19:21:59 +0000
Message-ID: <55D384D6.9040303@opensource.altera.com>
Date: Tue, 18 Aug 2015 14:17:42 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: vikas <vikas.manocha@st.com>
CC: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, "Yves
 Vandervennet" <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <1439522892-7524-2-git-send-email-marex@denx.de> <55D299CD.2070809@st.com>
In-Reply-To: <55D299CD.2070809@st.com>
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

On 08/17/2015 09:34 PM, vikas wrote:
 > Hi Marek,
 >

[...]

 >> +
>> +/* Operation timeout value */
>> +#define CQSPI_TIMEOUT_MS                       500
>> +#define CQSPI_READ_TIMEOUT_MS                  10
>
> please add some comment about the timeouts value selection.
>

I wish I could comment, but I don't know the origin of these values. 
The 500 ms value is probably just "a very long time".

[...]

>> +
>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_RD;
>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>
> here interrupt mask is being configured for every read, better would be to move it in init.
>

[...]

>> +
>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_WR;
>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>
> same like read, it should be moved to init.
>

It uses different masks for read and write

[...]

BR,
Graham
