Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aShDN-0007ME-PK
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2016 08:30:34 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Dinh Nguyen <dinguyen@altera.com>,
 devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>,
 linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] mtd: denali: fix property name for Denali DT binding
Date: Mon, 08 Feb 2016 09:29:49 +0100
Message-ID: <5298318.0qJ9fLYbSx@wuerfel>
In-Reply-To: <1454916702-20982-1-git-send-email-yamada.masahiro@socionext.com>
References: <1454916702-20982-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 08 February 2016 16:31:42 Masahiro Yamada wrote:
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index b04d03a..785b825 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -5,7 +5,7 @@ Required properties:
>    - reg : should contain registers location and length for data and reg.
>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>    - interrupts : The interrupt number.
> -  - dm-mask : DMA bit mask
> +  - dma-mask : DMA bit mask
>  
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
> 

It looks like this binding is wrong in multiple ways, and it doesn't seem to
be used in any .dts files. Is this actually being shipped anywhere or
could we try to fix the binding properly?

	Arnd
