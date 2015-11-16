Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyJlH-0008QW-Gl
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 13:24:30 +0000
Received: from localhost.localdomain ([127.0.0.1]:54770 "EHLO linux-mips.org"
 rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
 id S27012320AbbKPNXfEuVTh (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 16 Nov 2015 14:23:35 +0100
Date: Mon, 16 Nov 2015 14:23:28 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
Subject: Re: [PATCH] mtd: jz4740_nand: fix build on jz4740 after removing
 gpio.h
Message-ID: <20151116132328.GB9425@linux-mips.org>
References: <1447284976-96693-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447284976-96693-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 11, 2015 at 03:36:16PM -0800, Brian Norris wrote:

> Fallout from commit 832f5dacfa0b ("MIPS: Remove all the uses of custom gpio.h")
> 
> We see errors like this:
> 
> drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_detect_bank':
> drivers/mtd/nand/jz4740_nand.c:340:9: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)
> drivers/mtd/nand/jz4740_nand.c:340:9: note: each undeclared identifier is reported only once for each function it appears in
> drivers/mtd/nand/jz4740_nand.c:359:2: error: implicit declaration of function 'jz_gpio_set_function' [-Werror=implicit-function-declaration]
> drivers/mtd/nand/jz4740_nand.c:359:29: error: 'JZ_GPIO_FUNC_MEM_CS0' undeclared (first use in this function)
> drivers/mtd/nand/jz4740_nand.c:399:29: error: 'JZ_GPIO_FUNC_NONE' undeclared (first use in this function)
> drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_probe':
> drivers/mtd/nand/jz4740_nand.c:528:13: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)
> drivers/mtd/nand/jz4740_nand.c: In function 'jz_nand_remove':
> drivers/mtd/nand/jz4740_nand.c:555:14: error: 'JZ_GPIO_MEM_CS0' undeclared (first use in this function)
> 
> Patched similarly to:
> 
> https://patchwork.linux-mips.org/patch/11089/
> 
> Fixes: 832f5dacfa0b ("MIPS: Remove all the uses of custom gpio.h")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Looks, good, shall I funnel this upstream?

  Ralf
