Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aKaez-0004gQ-I2
 for linux-mtd@lists.infradead.org; Sat, 16 Jan 2016 23:53:34 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Michael Wang <Michael.Wang@alliedtelesis.co.nz>
Cc: "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel\@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "ezequiel\@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
 "computersforpeace\@gmail.com" <computersforpeace@gmail.com>
Subject: Re: mtd: pxa3xx_nand: issue with command time out
References: <5695CEF0.1080100@alliedtelesis.co.nz>
 <87a8o9ex9r.fsf@belgarion.home> <569827BC.10601@alliedtelesis.co.nz>
Date: Sun, 17 Jan 2016 00:53:06 +0100
In-Reply-To: <569827BC.10601@alliedtelesis.co.nz> (Michael Wang's message of
 "Thu, 14 Jan 2016 22:57:00 +0000")
Message-ID: <874meddqu5.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michael Wang <Michael.Wang@alliedtelesis.co.nz> writes:

> The complete output of debug traces and boot log from your debug patch
> is in the attachment.

Okay, thanks, that's great.
Might a ask another capture, but with :
 1) the timestamps this time
    (ie. CONFIG_PRINTK_TIME=y) ? This will give me the timing of your failure,
    in the dmesg you will provide me.
 2) on the first line of drain_fifo(), add a single :
    nand_readl(info, NDSR)

This will enable me to see how your board behaves on the temporal aspect, as
today I only have this, which looks correct AFAICT:

pxa3xx-nand f10d0000.nand: pxa3xx_nand_start():445 nand_writel(0x1, NDECCCTRL)
pxa3xx-nand f10d0000.nand: pxa3xx_nand_start():465 nand_writel(0xfff, NDSR)
pxa3xx-nand f10d0000.nand: pxa3xx_nand_start():466 nand_writel(0x0, NDCR)
pxa3xx-nand f10d0000.nand: pxa3xx_nand_start():467 nand_writel(0xd104b000, NDCR)

pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():656 nand_readl(NDSR): 0x1
pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():706 nand_writel(0x1, NDSR)
pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():720 nand_writel(0x100d3000, NDCB0)
pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():721 nand_writel(0x4ff0000, NDCB0)
pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():722 nand_writel(0x2, NDCB0)
pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():726 nand_writel(0x820, NDCB0)
  => RJK: here the read command is submitted

pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():656 nand_readl(NDSR): 0x1800
pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():706 nand_writel(0x1800, NDSR)
  => RJK: here the read command is completed

pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():656 nand_readl(NDSR): 0x2
pxa3xx-nand f10d0000.nand: Wait time out!!!
  => RJK: here data is available in NAND controller, and yet it's too late

pxa3xx-nand f10d0000.nand: pxa3xx_nand_stop():476 nand_readl(0x0000): 0xd104b000
pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq_thread():636 nand_writel(0x6, 0x0014)
  => RJK: here we finish the read data transfer operation, too late

Cheers.

--
Robert
