Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm7io-0002rS-PX
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 21:02:31 +0000
Received: by mail-pd0-f169.google.com with SMTP id y10so1478899pdj.14
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 13:02:10 -0800 (PST)
Date: Wed, 5 Nov 2014 13:02:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rostislav Lisovy <lisovy@gmail.com>
Subject: Re: [PATCH v4] mtd: nand: omap: Synchronize the access to the ECC
 engine
Message-ID: <20141105210206.GS23619@ld-irv-0074>
References: <1414577459-26135-1-git-send-email-lisovy@merica.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414577459-26135-1-git-send-email-lisovy@merica.cz>
Cc: Rostislav Lisovy <lisovy@merica.cz>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, michal.vokac@comap.cz,
 Roger Quadros <rogerq@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 sojkam1@fel.cvut.cz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 29, 2014 at 11:10:59AM +0100, Rostislav Lisovy wrote:
> The AM335x Technical Reference Manual (spruh73j.pdf) says
> "Because the ECC engine includes only one accumulation context,
> it can be allocated to only one chip-select at a time ... "
> (7.1.3.3.12.3). Since the commit 97a288ba2cfa ("ARM: omap2+:
> gpmc-nand: Use dynamic platform_device_alloc()") gpmc-nand
> driver supports multiple NAND flash devices connected to
> the single controller.
> Use global 'struct nand_hw_control' among multiple NAND
> instances to synchronize the access to the single ECC Engine.
> 
> Tested with custom AM335x board using 2x NAND flash chips.
> 
> Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>
> Acked-by: Roger Quadros <rogerq@ti.com>
> ---
> Changes since v3:
> * Make the omap_gpmc_controller static (Frans Klaver)
> 
> Changes since v2:
> * Do not use custom locks. Use global 'struct nand_hw_control'
>   among multiple NAND instances and it will do the work for us
>   (Roger Quadros)
> 
> Changes since v1:
> * Since not all the read/write operations are performed by the
>   omap_read(write)_page_bch() functions use the locks directly on
>   those places that configure the ECC engine (take the lock) and
>   read the result from the ECC engine (release the lock).
>   This approach should cover read/write operations with all
>   possible ECC modes. (Roger Quadros)

Pushed to l2-mtd.git. Thanks!

Brian
