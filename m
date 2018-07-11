Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdG4q-000893-CK
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 14:26:46 +0000
Received: by mail-lj1-x243.google.com with SMTP id y17-v6so14753893ljy.8
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2018 07:26:34 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20180711150449.4152333c@bbrezillon>
References: <20180711122709.358159-1-arnd@arndb.de>
 <20180711150449.4152333c@bbrezillon>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 11 Jul 2018 16:26:31 +0200
Message-ID: <CAK8P3a1M4v1hMduAX3y39DEjBiT=70xm-+qJ8CPLZHQwKOzJ1g@mail.gmail.com>
Subject: Re: [PATCH] nand: ranw: qcom_nand: stop using phys_to_dma()
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Abhishek Sahu <absahu@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 11, 2018 at 3:04 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Wed, 11 Jul 2018 14:26:58 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
>
>> Compile-testing this driver on x86 caused a link error:
>>
>> ERROR: "__phys_to_dma" [drivers/mtd/nand/raw/qcom_nandc.ko] undefined!
>>
>> The problem here is that the driver attempts to convert the physical
>> address into the DMA controller as a dma_addr_t and calls phys_to_dma()
>> to do the conversion.
>>
>> However, there is no generic way to convert a phys_addr_t into a dma_addr_t
>> for anything other than RAM (which should use the dma-mapping API instead).
>> The only correct use of phys_to_dma() instead is inside of the dma-mapping
>> implementation.
>
> Should we use dma_map_resource() to do the phys_addr_t to dma_addr_t
> conversion?

I had not seen that interface before, but yes, that does seem like the best
way to do it here.

       Arnd
