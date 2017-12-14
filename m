Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePPZl-0006Wf-VE
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 09:13:13 +0000
Received: by mail-wm0-x242.google.com with SMTP id 64so9943737wme.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2017 01:12:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171214074906.2147-3-nagasure@xilinx.com>
References: <20171214074906.2147-1-nagasure@xilinx.com>
 <20171214074906.2147-3-nagasure@xilinx.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Thu, 14 Dec 2017 10:12:06 +0100
Message-ID: <CAOFm3uFJ9MPpN=2YOsY=kr0j-s=2PvzkKTC51gqJTeaBrSMrrw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] mtd: nand: Add support for Arasan NAND Flash
 Controller
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 michals@xilinx.com, punnaia@xilinx.com, nagasuresh12@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Naga,

On Thu, Dec 14, 2017 at 8:49 AM, Naga Sureshkumar Relli
<naga.sureshkumar.relli@xilinx.com> wrote:
> Added the basic driver for Arasan NAND Flash Controller used in
> Zynq UltraScale+ MPSoC. It supports only Hw ECC and upto 24bit
> correction.
>
> Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>

<snip>

> --- /dev/null
> +++ b/drivers/mtd/nand/arasan_nand.c
> @@ -0,0 +1,1020 @@
> +/*
> + * Arasan NAND Flash Controller Driver
> + *
> + * Copyright (C) 2014 - 2017 Xilinx, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License version 2 as published by the
> + * Free Software Foundation; either version 2 of the License, or (at your
> + * option) any later version.
> + */

Could you use the new SPDX tags instead of this fine and long
boilerplate? See Thomas doc for details [1]

[1] https://lkml.org/lkml/2017/12/4/934

Thanks!

-- 
Cordially
Philippe Ombredanne
