Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1crSig-0001tC-EI
 for linux-mtd@lists.infradead.org; Fri, 24 Mar 2017 17:09:48 +0000
Subject: Re: [RESEND PATCH v2 52/53] mtd: nand: denali: use non-managed
 kmalloc() for DMA buffer
To: yamada.masahiro@socionext.com, linux-mtd@lists.infradead.org
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-26-git-send-email-yamada.masahiro@socionext.com>
 <8fa877a7-c43a-76e7-2252-3463c8c3afcd@arm.com>
 <98e3485292cf45bf8c63547c3c1790c2@SOC-EX02V.e01.socionext.com>
Cc: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, computersforpeace@gmail.com,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 dinguyen@kernel.org, artem.bityutskiy@linux.intel.com,
 grmoore@opensource.altera.com, ejo@pengutronix.de, chuanxiao.dong@intel.com,
 mhiramat@kernel.org, jaswinder.singh@linaro.org, robh@kernel.org,
 rmk+kernel@armlinux.org.uk, lars@metafoo.de
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <eb091d81-b60e-0a5a-aa34-2e4d09ad238d@arm.com>
Date: Fri, 24 Mar 2017 17:09:20 +0000
MIME-Version: 1.0
In-Reply-To: <98e3485292cf45bf8c63547c3c1790c2@SOC-EX02V.e01.socionext.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24/03/17 01:41, yamada.masahiro@socionext.com wrote:
> Hi Robin,
> 
>> I still think the way the driver actually uses this buffer looks very
>> suspect - keeping it permanently mapped for bidirectional (AKA "I don't
>> know") streaming DMA across multiple operations doesn't add up. If the
>> device might access it at any time (or the driver simply doesn't want to
>> have to care) it should be a coherent allocation. Otherwise, it should
>> just be mapped/unmapped with the appropriate direction around each
>> operation.
> 
> This buffer is not permanently mapped for bidirectional any more.
> 
> I fixed it in 51/53:
> http://patchwork.ozlabs.org/patch/742411/
> 
> When possible, the read/write callbacks
> directly calls dma_map_single() for the buffer
> passed from the core framework.
> (either DMA_TO_DEVICE or DMA_FROM_DEVICE)
> 
> This will bypass the memcpy() to/from the internal buffer.
> 
> 
> 
> This driver internal buffer is still needed for raw read/write.
> The Denali IP uses syndrome page layout.
> So, the raw accessors must arrange the payload/ECC data layout.
> 
> This problem is addressed by 48/53:
> http://patchwork.ozlabs.org/patch/742416/
> 
> 
> I also examined the possibility for coherent allocation.
> Even if I use dma_alloc_coherent, I need another bounce buffer anyway
> for the syndrome page shuffling.  So, this way seems less efficient.

Ah, so it's only a visibility issue at my end, then. Great stuff!

(on balance, I'm fine with not being sent the other 52 patches just for
the sake of this one!)

Thanks,
Robin.

> 
> 
> Masahiro
> 
