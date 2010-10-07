Received: from www.tglx.de ([62.245.132.106])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3wL7-00027X-Kc
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 19:41:20 +0000
Message-ID: <4CAE2256.6000700@linutronix.de>
Date: Thu, 07 Oct 2010 21:41:10 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd/nand.h: little more cleanup
References: <20101005104101.GA18714@www.tglx.de>	
	<20101005182656.GA21067@pengutronix.de>
	<1286304506.1797.2.camel@brekeke>	
	<20101006210614.GA18551@www.tglx.de>
	<1286479829.1797.12.camel@brekeke>
In-Reply-To: <1286479829.1797.12.camel@brekeke>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> drivers/mtd/nand/nand_base.c: In function ‘nand_command’:
> drivers/mtd/nand/nand_base.c:589: error: ‘struct nand_chip’ has no member named ‘chipsize’
> drivers/mtd/nand/nand_base.c: In function ‘nand_command_lp’:
> drivers/mtd/nand/nand_base.c:680: error: ‘struct nand_chip’ has no member named ‘chipsize’
> drivers/mtd/nand/nand_base.c: In function ‘nand_flash_detect_onfi’:
> drivers/mtd/nand/nand_base.c:2890: error: ‘struct nand_chip’ has no member named ‘chipsize’
> drivers/mtd/nand/nand_base.c: In function ‘nand_get_flash_type’:
> drivers/mtd/nand/nand_base.c:2977: error: ‘struct nand_chip’ has no member named ‘chipsize’
> drivers/mtd/nand/nand_base.c:3099: error: ‘struct nand_chip’ has no member named ‘chipsize’
> drivers/mtd/nand/nand_base.c:3103: error: ‘struct nand_chip’ has no member named ‘chipsize’
> drivers/mtd/nand/nand_base.c:3104: error: ‘struct nand_chip’ has no member named ‘chipsize’
> drivers/mtd/nand/nand_base.c:3106: error: ‘struct nand_chip’ has no member named ‘chipsize’
> drivers/mtd/nand/nand_base.c: In function ‘nand_scan_ident’:
> drivers/mtd/nand/nand_base.c:3216: error: ‘struct nand_chip’ has no member named ‘chipsize’

I'm very sorry for that. I fix is coming in a jiffy or two.

Sebastian
