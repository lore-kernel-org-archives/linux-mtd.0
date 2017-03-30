Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctUZ2-0005EE-Jj
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 07:32:14 +0000
Subject: Re: [PATCH 0/2] mtd: spi-nor: add stm32 qspi driver
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
 <5224f3cd-a128-9e72-c0c8-62a137ceeb79@wedev4u.fr>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, <devicetree@vger.kernel.org>, Richard Weinberger
 <richard@nod.at>, <linux-kernel@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <d1c2f0a9-302d-ea7c-5d1b-ad32b9950ed4@st.com>
Date: Thu, 30 Mar 2017 09:31:15 +0200
MIME-Version: 1.0
In-Reply-To: <5224f3cd-a128-9e72-c0c8-62a137ceeb79@wedev4u.fr>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Cyrille

I see your patch series

[PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories

No problem, I rebase my V2 onto your patch


BR
Ludo

On 03/29/2017 06:51 PM, Cyrille Pitchen wrote:
> Hi Ludovic,
>
> Le 27/03/2017 à 14:54, Ludovic Barre a écrit :
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> This patch set adds a SPI-NOR driver for stm32 QSPI controller.
>> It is a specialized SPI interface for serial Flash devices.
>> It supports 1 or 2 Flash device with single, dual and quad SPI Flash memories.
>>
>> It can operate in any of the following modes:
>> -indirect mode: all the operations are performed using the quadspi
>>   registers
>> -read memory-mapped mode: the external Flash memory is mapped to the
>>   microcontroller address space and is seen by the system as if it was
>>   an internal memory
>>
>> Ludovic Barre (2):
>>    dt-bindings: Document the STM32 QSPI bindings
>>    mtd: spi-nor: add driver for STM32 quad spi flash controller
>>
>>   .../devicetree/bindings/mtd/stm32-quadspi.txt      |  45 ++
>>   drivers/mtd/spi-nor/Kconfig                        |   7 +
>>   drivers/mtd/spi-nor/Makefile                       |   1 +
>>   drivers/mtd/spi-nor/stm32-quadspi.c                | 679 +++++++++++++++++++++
>>   4 files changed, 732 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>   create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
>>
> Just a small word to warn you that I'm likely to ask you to rebase this
> series onto the patch "mtd: spi-nor: introduce more SPI protocols and
> the Dual Transfer Mode". Indeed, I need to synchronize with Marek first
> but I plan to merge this patch within few days.
>
>
> Best regards,
>
> Cyrille
