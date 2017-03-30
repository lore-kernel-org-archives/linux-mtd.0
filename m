Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctZYN-0005o9-Cz
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 12:51:53 +0000
Date: Thu, 30 Mar 2017 14:51:29 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, richard@nod.at,
 computersforpeace@gmail.com, thomas.petazzoni@free-electrons.com,
 marex@denx.de, cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 peterpansjtu@gmail.com, linshunquan1@hisilicon.com
Subject: Re: [PATCH v4 4/9] nand: spi: add basic blocks for infrastructure
Message-ID: <20170330145129.7b17a808@bbrezillon>
In-Reply-To: <30ff4192-26d8-0046-0fa7-ab04d662c52a@gmail.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-5-git-send-email-peterpandong@micron.com>
 <30ff4192-26d8-0046-0fa7-ab04d662c52a@gmail.com>
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

On Thu, 30 Mar 2017 14:38:00 +0200
Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:

> On 23/03/2017 10:43, Peter Pan wrote:
> > This is the first commit for spi nand framkework.
> > This commit is to add add basic building blocks
> > for the SPI NAND infrastructure.
> >
> > Signed-off-by: Peter Pan <peterpandong@micron.com>
> > ---
> >   drivers/mtd/nand/Kconfig            |   1 +
> >   drivers/mtd/nand/Makefile           |   1 +
> >   drivers/mtd/nand/spi/Kconfig        |   5 +
> >   drivers/mtd/nand/spi/Makefile       |   2 +
> >   drivers/mtd/nand/spi/core.c         | 464 ++++++++++++++++++++++++++++++++++++
> >   drivers/mtd/nand/spi/manufactures.c |  24 ++
> >   include/linux/mtd/spinand.h         | 270 +++++++++++++++++++++
> >   7 files changed, 767 insertions(+)
> >   create mode 100644 drivers/mtd/nand/spi/Kconfig
> >   create mode 100644 drivers/mtd/nand/spi/Makefile
> >   create mode 100644 drivers/mtd/nand/spi/core.c
> >   create mode 100644 drivers/mtd/nand/spi/manufactures.c
> >   create mode 100644 include/linux/mtd/spinand.h  
> [...]
> > diff --git a/drivers/mtd/nand/spi/manufactures.c b/drivers/mtd/nand/spi/manufactures.c
> > new file mode 100644
> > index 0000000..7e0b42d
> > --- /dev/null
> > +++ b/drivers/mtd/nand/spi/manufactures.c
> > @@ -0,0 +1,24 @@
> > +/**
> > + *
> > + * Copyright (c) 2009-2017 Micron Technology, Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/mtd/spinand.h>
> > +
> > +struct spinand_manufacturer spinand_manufacturer_end = {0x0, "Unknown", NULL};
> > +
> > +struct spinand_manufacturer *spinand_manufacturers[] = {
> > +	&spinand_manufacturer_end,
> > +};  
> 
> *const* struct spinand_manufacturer *spinand_manufacturers[]  ?
> 
> > +EXPORT_SYMBOL(spinand_manufacturers);
> > diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> > new file mode 100644
> > index 0000000..44748b4
> > --- /dev/null
> > +++ b/include/linux/mtd/spinand.h
> > @@ -0,0 +1,270 @@
> > +/**
> > + *
> > + * Copyright (c) 2009-2017 Micron Technology, Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +#ifndef __LINUX_MTD_SPINAND_H
> > +#define __LINUX_MTD_SPINAND_H
> > +
> > +#include <linux/mutex.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/mtd/nand.h>
> > +  
> 
> [...]
> 
> > +
> > +enum spinand_ecc_mode {
> > +	SPINAND_ECC_ONDIE,
> > +	SPINAND_ECC_HW,
> > +};
> > +
> > +struct spinand_ecc_engine {
> > +	enum spinand_ecc_mode mode;
> > +	u32 strength;
> > +	u32 steps;
> > +	struct spinand_ecc_engine_ops *ops;  
> 
> const struct spinand_ecc_engine_ops ?
> 

Yep.
