Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWyD-0007KL-HT
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 07:25:02 +0000
Received: by mail-pd0-f175.google.com with SMTP id y10so2264821pdj.6
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 23:24:40 -0800 (PST)
Date: Tue, 25 Nov 2014 23:24:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2] mtd: atmel_nand: replace
 memcpy32_toio/memcpy32_fromio with memcpy
Message-ID: <20141126072437.GP3212@norris-Latitude-E6410>
References: <1415345169-9602-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415345169-9602-1-git-send-email-josh.wu@atmel.com>
Cc: vinod.koul@intel.com, nicolas.ferre@atmel.com, herve.codina@celad.com,
 linux-mtd@lists.infradead.org, voice.shen@atmel.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 07, 2014 at 03:26:09PM +0800, Josh Wu wrote:
> There is no need to use memcpy32_toio/memcpy32_fromio to transfer data
> between memory and NFC sram. As the NFC sram is a also a memery space
> not a io space.
> So just use memcpy is enough.
> 
> Also we removed the __iomem prefix for NFC sram to avoid sparse warnings.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> Reviewed-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v1 -> v2:
>   1. fix sparse warnings.
>   2. remove __iomem prefix for sram_bank0.

Applied to l2-mtd.git.

Brian
