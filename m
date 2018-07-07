Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbqpS-0001ab-El
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 17:17:03 +0000
Received: by mail-oi0-x241.google.com with SMTP id q11-v6so3435637oic.12
 for <linux-mtd@lists.infradead.org>; Sat, 07 Jul 2018 10:16:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180707190059.4f9837b0@xps13>
References: <1530898103-27125-1-git-send-email-festevam@gmail.com>
 <20180707190059.4f9837b0@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 7 Jul 2018 14:16:48 -0300
Message-ID: <CAOMZO5CU7EkPOsaneMm5cBsUvHD8diW8MLb+aD-Jaw-_G9AbYA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Switch to SPDX identifier
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: boris.brezillon@bootlin.com, Fabio Estevam <fabio.estevam@nxp.com>,
 Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On Sat, Jul 7, 2018 at 2:00 PM, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

>> +// SPDX-License-Identifier: GPL-2.0+
>> +//
>> +// Freescale GPMI NAND Flash Driver
>> +//
>> +// Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
>> +// Copyright (C) 2008 Embedded Alley Solutions, Inc.
>
> Maybe I'm not aware of something recent but I thought only the SPDX
> license tag was supposed to use '//' comments while the other lines
> should be still using '/* */' like any other comments in the code?

There are some subsystem maintainers (and also Linus) that prefer
putting everything in // style:
https://lkml.org/lkml/2017/11/25/133

> I think the rest of this subsystem uses:
>
> // SPDX tag
> /*
>  *
> [...]
>  */
>
> Would you mind changing this?

Sure, I can send a v2.
