Received: from mail-yw0-f196.google.com ([209.85.161.196])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCTjZ-00020G-5U
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 15:57:18 +0000
Received: by mail-yw0-f196.google.com with SMTP id a10so18956114ywa.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 07:56:56 -0800 (PST)
Date: Thu, 1 Dec 2016 09:56:53 -0600
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 22/39] mtd: nand: denali_dt: remove dma-mask DT property
Message-ID: <20161201155653.l3iu2c7fqcekyyt7@rob-hp-laptop>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-23-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480183585-592-23-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 27, 2016 at 03:06:08AM +0900, Masahiro Yamada wrote:
> The driver sets appropriate DMA mask.  Delete the "dma-mask" DT
> property.  Refer to the Link tag for negative opinions for this
> binding.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Link: https://lkml.org/lkml/2016/2/8/57
> ---
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 --
>  drivers/mtd/nand/denali_dt.c                          | 9 ---------
>  2 files changed, 11 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
