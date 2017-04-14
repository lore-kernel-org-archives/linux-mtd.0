Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz1NZ-000623-Sk
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 13:35:15 +0000
Subject: Re: [PATCH v5 1/6] nand: spi: add basic blocks for infrastructure
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com, arnaud.mouiche@gmail.com,
 thomas.petazzoni@free-electrons.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
 <1491810713-27795-2-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Marek Vasut <marex@denx.de>
Message-ID: <8017e0c6-9adb-21be-0807-4cf31469070d@denx.de>
Date: Fri, 14 Apr 2017 15:18:35 +0200
MIME-Version: 1.0
In-Reply-To: <1491810713-27795-2-git-send-email-peterpandong@micron.com>
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

On 04/10/2017 09:51 AM, Peter Pan wrote:
> This is the first commit for spi nand framkework.
> This commit is to add add basic building blocks
> for the SPI NAND infrastructure.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>

[...]

> +/* SPI NAND supported OP mode */
> +#define SPINAND_RD_X1		0x00000001

You might want to use BIT() here too.

btw SPI NOR seems to have something similar coming up, see
[PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories

> +#define SPINAND_RD_X2		0x00000002
> +#define SPINAND_RD_X4		0x00000004
> +#define SPINAND_RD_DUAL		0x00000008
> +#define SPINAND_RD_QUAD		0x00000010
> +#define SPINAND_WR_X1		0x00000020
> +#define SPINAND_WR_X2		0x00000040
> +#define SPINAND_WR_X4		0x00000080
> +#define SPINAND_WR_DUAL		0x00000100
> +#define SPINAND_WR_QUAD		0x00000200
> +
> +#define SPINAND_RD_COMMON	(SPINAND_RD_X1 | SPINAND_RD_X2 | \
> +				 SPINAND_RD_X4 | SPINAND_RD_DUAL | \
> +				 SPINAND_RD_QUAD)
> +#define SPINAND_WR_COMMON	(SPINAND_WR_X1 | SPINAND_WR_X4)
> +#define SPINAND_OP_COMMON	(SPINAND_RD_COMMON | SPINAND_WR_COMMON)
> +
> +struct spinand_device *spinand_alloc(struct device *dev);
> +void spinand_free(struct spinand_device *chip);
> +int spinand_register(struct spinand_device *chip);
> +int spinand_unregister(struct spinand_device *chip);
> +#endif /* __LINUX_MTD_SPINAND_H */
> 


-- 
Best regards,
Marek Vasut
