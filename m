Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8r9m-0001N4-UT
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 07:33:13 +0000
Subject: Re: [PATCH] mtd: Nand Atmel: add On Flash BBT support
From: Artem Bityutskiy <dedekind@infradead.org>
To: simon polette <spolette@gmail.com>
In-Reply-To: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
References: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 May 2009 10:32:22 +0300
Message-Id: <1243323142.21646.129.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk, spolette@adetelgroup.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-25 at 17:44 +0200, simon polette wrote:
> +config	MTD_NAND_ATMEL_FLASH_BBT
> +	bool "Use On-Flash Bad Block Table"
> +	depends on MTD_NAND_ATMEL
> +	help
> +	  This enables the On-Flash BBT, which mean that the bad blocks
> +	  will be scanned one time then the BBT will be stored
> +	  in flash, so scanning Nand flash for bad blocks will be no more
> +	  necessary for the next boots.
> +

I do not think you need a config option for this. It should be
a module parameter instead.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
