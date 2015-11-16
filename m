Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyOqS-0006Xq-Fj
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 18:49:41 +0000
Received: by padhx2 with SMTP id hx2so183212954pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 10:49:19 -0800 (PST)
Date: Mon, 16 Nov 2015 10:49:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
Subject: Re: [PATCH] mtd: jz4740_nand: fix build on jz4740 after removing
 gpio.h
Message-ID: <20151116184917.GM8456@google.com>
References: <1447284976-96693-1-git-send-email-computersforpeace@gmail.com>
 <20151116132328.GB9425@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151116132328.GB9425@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 02:23:28PM +0100, Ralf Baechle wrote:
> On Wed, Nov 11, 2015 at 03:36:16PM -0800, Brian Norris wrote:
> 
> > Fallout from commit 832f5dacfa0b ("MIPS: Remove all the uses of custom gpio.h")
> > 
> > We see errors like this:
> > 
> > drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_detect_bank':
> > drivers/mtd/nand/jz4740_nand.c:340:9: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)
> > drivers/mtd/nand/jz4740_nand.c:340:9: note: each undeclared identifier is reported only once for each function it appears in
> > drivers/mtd/nand/jz4740_nand.c:359:2: error: implicit declaration of function 'jz_gpio_set_function' [-Werror=implicit-function-declaration]
> > drivers/mtd/nand/jz4740_nand.c:359:29: error: 'JZ_GPIO_FUNC_MEM_CS0' undeclared (first use in this function)
> > drivers/mtd/nand/jz4740_nand.c:399:29: error: 'JZ_GPIO_FUNC_NONE' undeclared (first use in this function)
> > drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_probe':
> > drivers/mtd/nand/jz4740_nand.c:528:13: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)
> > drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_remove':
> > drivers/mtd/nand/jz4740_nand.c:555:14: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)
> > 
> > Patched similarly to:
> > 
> > https://patchwork.linux-mips.org/patch/11089/
> > 
> > Fixes: 832f5dacfa0b ("MIPS: Remove all the uses of custom gpio.h")
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Looks, good, shall I funnel this upstream?

Actually, if you don't mind, I'll take it through MTD. I think I'll have
a few things to push upstream this week anyway, and I'd like to get some
of my MIPS-based build test configs working again in my development
trees.

So...pushed to linux-mtd.git

Regards,
Brian
