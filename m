Received: from mx51.mymxserver.com ([85.199.173.110])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LzUA3-0008Td-Sc
	for linux-mtd@lists.infradead.org; Thu, 30 Apr 2009 11:10:42 +0000
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: Vladimir Barinov <vbarinov@embeddedalley.com>
Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v3)
Date: Thu, 30 Apr 2009 13:09:54 +0200
References: <1238709260-17439-1-git-send-email-vbarinov@embeddedalley.com>
	<200904291252.15650.h.schurig@mn-solutions.de>
	<49F97D72.8030109@embeddedalley.com>
In-Reply-To: <49F97D72.8030109@embeddedalley.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904301309.54859.hs4233@mail.mn-solutions.de>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	dwmw2@infradead.org, linux-arm-kernel@lists.arm.linux.org.uk,
	Lothar Wassmann <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hello Holger,
>
> Could you explain how this message is related to this thread?
> This patch as well as linux-mtd mail list doesn't care about
> platform specific code that you can do in your custom mx21
> based board.

The thread is about a NAND flash driver for Linux MTD. And this 
driver will work with i.MX27 and i.MX21 SoCs. However, the 
i.MX21 has a specific error in it's silicon, where the hardware 
ECC cannot one-bit-errors IF they are in two consecutive NAND 
blocks.

If the NAND driver, that is supposed to be used for i.MX21, 
cannot handle this (e.g. using software ECC), then the NAND 
driver is buggy.


This has nothing to do with board-specific things, my question 
was just if the board setup code can keep ".ecc = 0". Or if that 
won't work, we have to fix the MXC NAND driver with some 
cpu_is_mx21() code paths.
