Received: from cpsmtpb-ews04.kpnxchange.com ([213.75.39.7])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTbDk-0000g5-Tu
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2015 19:14:10 +0000
Message-ID: <1425582823.24292.225.camel@x220>
Subject: Re: [PATCH 2/2] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
From: Paul Bolle <pebolle@tiscali.nl>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Date: Thu, 05 Mar 2015 20:13:43 +0100
In-Reply-To: <1425576461-52412-3-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1425576461-52412-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1425576461-52412-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-03-05 at 17:27 +0000, Zubair Lutfullah Kakakhel wrote:
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -0,0 +1,359 @@
> +/*
> + * JZ4780 BCH controller
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex@alex-smith.me.uk>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */

This states the license is GPL v2 or later.

> +MODULE_LICENSE("GPL v2");

So you probably want
    MODULE_LICENSE("GPL");

here.

> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -0,0 +1,373 @@
> +/*
> + * JZ4780 NAND driver
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex@alex-smith.me.uk>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */

This states the license is GPL v2 or later.

> +MODULE_LICENSE("GPL V2");

So, again, you probably want
    MODULE_LICENSE("GPL");

here.

Actually "GPL V2" would taint the kernel on module load.

(This all assumes we're talking about two separate modules here. I don't
speak "Makefile" enough to be sure.)


Paul Bolle
