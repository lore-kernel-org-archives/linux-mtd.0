Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOoaX-0008Ql-GC
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 16:38:57 +0000
Received: by mail-wm0-x242.google.com with SMTP id m203so92297402wma.3
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2017 08:38:37 -0800 (PST)
Subject: Re: [PATCH v4 10/15] mtd: nand: move Micron specific init logic in
 nand_micron.c
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-11-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Icenowy Zheng
 <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <51f2f7a3-56a7-1117-ab15-dd8eb59a4373@gmail.com>
Date: Wed, 4 Jan 2017 16:15:46 +0100
MIME-Version: 1.0
In-Reply-To: <1483448495-31607-11-git-send-email-boris.brezillon@free-electrons.com>
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

On 01/03/2017 02:01 PM, Boris Brezillon wrote:
> Move Micron specific initialization logic into nand_micron.c. This is
> part of the "separate vendor specific code from core" cleanup process.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

[...]

> diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
> new file mode 100644
> index 000000000000..ddb9adf12c21
> --- /dev/null
> +++ b/drivers/mtd/nand/nand_micron.c
> @@ -0,0 +1,83 @@
> +/*
> + * Copyright (C) 2013 Boris Brezillon <boris.brezillon@free-electrons.com>

2013-2017 ?

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/mtd/nand.h>
> +
> +struct nand_onfi_vendor_micron {
> +	u8 two_plane_read;
> +	u8 read_cache;
> +	u8 read_unique_id;
> +	u8 dq_imped;
> +	u8 dq_imped_num_settings;
> +	u8 dq_imped_feat_addr;
> +	u8 rb_pulldown_strength;
> +	u8 rb_pulldown_strength_feat_addr;
> +	u8 rb_pulldown_strength_num_settings;
> +	u8 otp_mode;
> +	u8 otp_page_start;
> +	u8 otp_data_prot_addr;
> +	u8 otp_num_pages;
> +	u8 otp_feat_addr;
> +	u8 read_retry_options;
> +	u8 reserved[72];
> +	u8 param_revision;
> +} __packed;

Is this __packed really needed?

-- 
Best regards,
Marek Vasut
