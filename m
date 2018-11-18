Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOKQP-0007W3-M3
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2018 10:35:34 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Olof Johansson <olof@lixom.net>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: mtd: rawnand: qcom: Namespace prefix some commands
Date: Sun, 18 Nov 2018 11:35:19 +0100
Message-Id: <20181118103519.25189-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181117034327.72638-1-olof@lixom.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2018-11-17 at 03:43:27 UTC, Olof Johansson wrote:
> PAGE_READ is used by RISC-V arch code included through mm headers,
> and it makes sense to bring in a prefix on these in the driver.
> 
> drivers/mtd/nand/raw/qcom_nandc.c:153: warning: "PAGE_READ" redefined
>  #define PAGE_READ   0x2
> In file included from include/linux/memremap.h:7,
>                  from include/linux/mm.h:27,
>                  from include/linux/scatterlist.h:8,
>                  from include/linux/dma-mapping.h:11,
>                  from drivers/mtd/nand/raw/qcom_nandc.c:17:
> arch/riscv/include/asm/pgtable.h:48: note: this is the location of the previous definition
> 
> Caught by riscv allmodconfig.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git master, thanks.

Boris
