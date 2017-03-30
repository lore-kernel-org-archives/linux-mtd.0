Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctX8x-0007XU-3L
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 10:17:28 +0000
Received: by mail-wr0-x243.google.com with SMTP id w43so10677221wrb.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 03:17:06 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: spi-nor: add driver for STM32 quad spi flash
 controller
To: Ludovic BARRE <ludovic.barre@st.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
 <1490619296-8168-3-git-send-email-ludovic.Barre@st.com>
 <1be39452-83b0-5c32-39fe-d6dd5134d1ef@gmail.com>
 <2c364b99-512c-8eb6-7044-7989ba21d53b@st.com>
 <28454969-0f56-7752-b087-5e02a1a20c23@gmail.com>
 <2410fcde-1d1d-57b5-01ee-bd6bc3bc863b@st.com>
 <0e7da44f-c41b-de15-62c3-7509e556f623@gmail.com>
 <d785a279-362c-3693-d318-08ef43af7ad4@st.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring
 <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <14d69f70-ffa1-c65c-f8e4-c120a827e102@gmail.com>
Date: Thu, 30 Mar 2017 12:17:03 +0200
MIME-Version: 1.0
In-Reply-To: <d785a279-362c-3693-d318-08ef43af7ad4@st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/29/2017 06:38 PM, Ludovic BARRE wrote:
> 
> 
> On 03/29/2017 03:57 PM, Marek Vasut wrote:
>> On 03/29/2017 03:35 PM, Ludovic BARRE wrote:
>>
>> [...]
>>
>>>>>>> +    writel_relaxed(CR_PRESC(presc) | CR_FTHRES(3) | CR_TCEN |
>>>>>>> CR_SSHIFT
>>>>>>> +               | CR_EN, qspi->io_base + QUADSPI_CR);
>>>>>>> +
>>>>>>> +    /* a minimum fsize must be set to sent the command id */
>>>>>>> +    flash->fsize = 25;
>>>>>> I don't understand why this is needed and the comment doesn't make
>>>>>> sense. Please fix.
>>>>> fsize field defines the size of external memory.
>>>> What external memory ? Unclear
>>> oops, fsize field defined the size of "flash memory" in stm32 qspi
>>> controller.
>> Errr, now I am totally lost :) Is that some internal SPI NOR ? Shouldn't
>> the size be coming from DT or something ?
>>
>>> Number of bytes in Flash memory = 2 ^[FSIZE+1].
>>> To sent a nor cmd this field must be set (hardware issue),
>>> but before "spi_nor_scan" the size of flash nor is not know.
>>> So I set a temporary value (workaround).
>> Is it needed before the scan ?
> yes it's needed before scan (fix a "stm32 qspi controller" issue)
> 
> sorry, I try to reformulate:
> 
> The nor flash (external component like micron n25q128a13
> or spansion s25fl512s ...) is connected to stm32 by classic
> spi-nor interface cs, clock and 1/2/4 IO lines.
> 
> the stm32 microprocessor has a dedicated controller to
> manage spi-nor interface, it's stm32 qspi.
> 
> In stm32 qspi controller there is a register with fsize field
> which define the size of nor flash (n25q128a13 or s25fl512s...).
> 
> fsize can't be null, else the stm32 qspi controller doesn't send
> spi-nor command. it's "stm32 qspi controller" issue.
> 
> Before the "spi_nor_scan" the size of nor flash (n25q128a13
> or s25fl512s...) is not know. So we set a temporary value just
> to discover the nor flash with "spi_nor_scan". After we can
> set the right value (mtd->size) in fsize.

I see, now it makes sense. Such a beefy comment would be nice :)

-- 
Best regards,
Marek Vasut
