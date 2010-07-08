Received: from mailhost.informatik.uni-hamburg.de ([134.100.9.70])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWr1m-00030X-Oe
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 13:20:39 +0000
Message-ID: <4C35D084.7050605@metafoo.de>
Date: Thu, 08 Jul 2010 15:20:04 +0200
From: Lars-Peter Clausen <lars@metafoo.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2 17/26] MTD: Nand: Add JZ4740 NAND driver
References: <1276924111-11158-1-git-send-email-lars@metafoo.de>
	<1276924111-11158-18-git-send-email-lars@metafoo.de>
	<1278569214.12733.38.camel@localhost>
In-Reply-To: <1278569214.12733.38.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Sat, 2010-06-19 at 07:08 +0200, Lars-Peter Clausen wrote:
>> diff --git a/include/linux/mtd/jz4740_nand.h b/include/linux/mtd/jz4740_nand.h
>> new file mode 100644
>> index 0000000..379f9b6
>> --- /dev/null
>> +++ b/include/linux/mtd/jz4740_nand.h
>> @@ -0,0 +1,34 @@
>> +/*
>> + *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
>> + *  JZ4740 SoC NAND controller driver
>> + *
>> + *  This program is free software; you can redistribute	 it and/or modify it
>> + *  under  the terms of	 the GNU General  Public License as published by the
>> + *  Free Software Foundation;  either version 2 of the	License, or (at your
>> + *  option) any later version.
>> + *
>> + *  You should have received a copy of the  GNU General Public License along
>> + *  with this program; if not, write  to the Free Software Foundation, Inc.,
>> + *  675 Mass Ave, Cambridge, MA 02139, USA.
>> + *
>> + */
>> +
>> +#ifndef __JZ_NAND_H__
>> +#define __JZ_NAND_H__
>> +
>> +#include <linux/mtd/nand.h>
>> +#include <linux/mtd/partitions.h>
>> +
>> +struct jz_nand_platform_data {
>> +	int			num_partitions;
>> +	struct mtd_partition	*partitions;
>> +
>> +	struct nand_ecclayout	*ecc_layout;
>> +
>> +	unsigned int busy_gpio;
>> +
>> +	void (*ident_callback)(struct platform_device *, struct nand_chip *,
>> +				struct mtd_partition **, int *num_partitions);
>> +};
>> +
>> +#endif
> 
> Do you really have to add your platform data strucutre to
> "inlculde/mtd" ? That is quite global namespace, and ideally only things
> like user-space interface and "public" interface of the MTD subsystem
> should live there.
> 
> Can you keep this somewhere in mips architecture directory?

Hi

Hm, ok, I see. I'll move it to arch/mips/include/asm/mach-jz4740/ then.
But I guess I should move the headers for all the other jz4740 driver to the same
directory as well.

On the other hand I'm wondering where on would put headers for non platform specific
drivers?

- Lars
