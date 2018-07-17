Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffWB4-00063I-8k
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 20:02:34 +0000
Date: Tue, 17 Jul 2018 22:01:36 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Abhishek Sahu <absahu@codeaurora.org>, Archit Taneja
 <architt@codeaurora.org>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] nand: ranw: qcom_nand: stop using phys_to_dma()
Message-ID: <20180717220136.2782fc5d@bbrezillon>
In-Reply-To: <CAK8P3a1M4v1hMduAX3y39DEjBiT=70xm-+qJ8CPLZHQwKOzJ1g@mail.gmail.com>
References: <20180711122709.358159-1-arnd@arndb.de>
 <20180711150449.4152333c@bbrezillon>
 <CAK8P3a1M4v1hMduAX3y39DEjBiT=70xm-+qJ8CPLZHQwKOzJ1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

On Wed, 11 Jul 2018 16:26:31 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Wed, Jul 11, 2018 at 3:04 PM, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> > On Wed, 11 Jul 2018 14:26:58 +0200
> > Arnd Bergmann <arnd@arndb.de> wrote:
> >  
> >> Compile-testing this driver on x86 caused a link error:
> >>
> >> ERROR: "__phys_to_dma" [drivers/mtd/nand/raw/qcom_nandc.ko] undefined!
> >>
> >> The problem here is that the driver attempts to convert the physical
> >> address into the DMA controller as a dma_addr_t and calls phys_to_dma()
> >> to do the conversion.
> >>
> >> However, there is no generic way to convert a phys_addr_t into a dma_addr_t
> >> for anything other than RAM (which should use the dma-mapping API instead).
> >> The only correct use of phys_to_dma() instead is inside of the dma-mapping
> >> implementation.  
> >
> > Should we use dma_map_resource() to do the phys_addr_t to dma_addr_t
> > conversion?  
> 
> I had not seen that interface before, but yes, that does seem like the best
> way to do it here.

Do you plan to send a new version using dma_map_resource()? BTW,
there's typo in the subject prefix (s/ranw/rawnand/).

Regards,

Boris
