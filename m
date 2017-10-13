Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e36a6-000277-9F
 for linux-mtd@lists.infradead.org; Fri, 13 Oct 2017 20:29:20 +0000
Subject: Re: [PATCH] [RFC] mtd: atmel-quadspi: fix build issues
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ludovic Barre <ludovic.barre@st.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <20170721222204.3402340-1-arnd@arndb.de>
 <fa857ef2-0ae6-5383-c178-3a86fa557332@wedev4u.fr>
 <CAK8P3a27xzszjbfP4KdAMFOa2iqfH7vvUOBcT39Ychn0kw39KA@mail.gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <63b33705-6e03-08b3-5d1e-6d07e73d32cf@wedev4u.fr>
Date: Fri, 13 Oct 2017 22:28:41 +0200
MIME-Version: 1.0
In-Reply-To: <CAK8P3a27xzszjbfP4KdAMFOa2iqfH7vvUOBcT39Ychn0kw39KA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

+ Nicolas Ferre

Le 01/08/2017 à 22:10, Arnd Bergmann a écrit :
> On Tue, Aug 1, 2017 at 9:41 PM, Cyrille Pitchen
> <cyrille.pitchen@wedev4u.fr> wrote:
>> Le 22/07/2017 à 00:21, Arnd Bergmann a écrit :
> 
>>> --- a/drivers/mtd/spi-nor/atmel-quadspi.c
>>> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
>>> @@ -208,9 +208,9 @@ static int atmel_qspi_run_transfer(struct atmel_qspi *aq,
>>>       if (cmd->enable.bits.address)
>>>               ahb_mem += cmd->address;
>>>       if (cmd->tx_buf)
>>> -             _memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
>>> +             memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
>>>       else
>>> -             _memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);
>>> +             memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);
>>>
>>
>> At least on AT91 platforms and likely on most ARM boards,
>> memcpy_fromio == memcpy_toio == memcpy.
> 
> Just to give more background, it's a bit more complicated than this:
> 
> On big-endian kernels, memcpy_fromio/memcpy_toio are
> always defined as _memcpy_fromio/_memcpy_toio so we
> do byte load/store operations in the correct order, while
> little-endian kernels have the optimized mmiocpy() that redirects
> to memcpy(). This is true for all ARM platforms other than EBSA110
> IIRC.
> 
> Also, mmiocpy is an exported symbol that aliases to the external
> memcpy definition, but we can't call memcpy directly, because gcc
> knows how to inline calls to memcpy() and replace them by direct
> load/store instructions that might be unaligned and trap on uncached
> mmio areas.
> 
>> I got some sama5d2 hardware last week, so I'll try to test your patch
>> within few days because as you said maybe memcpy() was broken when I
>> developed this driver at first but now memcpy() is likely to have been
>> fixed so it might be interesting to get rid of _memcpy_fromio() and
>> _memcpy_toio() because this is not the first time those 2 functions have
>> created issues when building the Atmel Quad SPI driver on other platforms.
>>
>> So thanks for you're patch, I'll give it a try :)
>

Bad news:

I've just tested this patch, applied onto the spi-nor/next branch of
l2-mtd (based on 4.14.0-rc4), with a sama5d2 xplained board + Macronix
MX25L25673G Quad SPI memory but it fails on the very first SPI command,
Read JEDEC ID (9Fh):

atmel_qspi f0020000.spi: unrecognized JEDEC id bytes: c2, 20, 20
atmel_qspi: probe of f0020000.spi failed with error -2

Best regards,

Cyrille

> Ok, thanks.
> 
>        Arnd
> 
