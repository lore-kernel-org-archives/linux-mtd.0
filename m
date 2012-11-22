Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbO5z-0002uz-5K
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 04:09:00 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so11047718iej.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2012 20:08:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1353541372.12585.14.camel@laptop>
References: <1353541372.12585.14.camel@laptop>
Date: Wed, 21 Nov 2012 20:08:55 -0800
Message-ID: <CAN8TOE-10VYTOS8EbPWxs0HyhdeZBzxL_8gmJsMmXPO1ti_6bQ@mail.gmail.com>
Subject: Re: [PATCH] mtd cs553x_nand: Initialise ecc.strength before
 nand_scan()
From: Brian Norris <computersforpeace@gmail.com>
To: Nathan Williams <nathan@traverse.com.au>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Dunn <mikedunn@newsguy.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 21, 2012 at 3:42 PM, Nathan Williams <nathan@traverse.com.au> wrote:
> Loading cs553x_nand with Hynix H27U1G8F2BTR NAND flash causes this bug:
>
> kernel BUG at drivers/mtd/nand/nand_base.c:3345!
...
> Initialising ecc.strength before the call to nand_scan() fixes this.

Acked-by: Brian Norris <computersforpeace@gmail.com>

BTW, I made a quick read through of the other NAND drivers to look for
similar errors. I think this is the only one where the only
ecc.strenght initialization occurred after the nand_scan() or
nand_scan_tail() call.

Thanks,
Brian
