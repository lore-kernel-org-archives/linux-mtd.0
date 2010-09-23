Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oyjoz-0002TW-KB
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 11:18:38 +0000
Received: by bwz19 with SMTP id 19so1539497bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 04:18:36 -0700 (PDT)
Subject: Re: [PATCH] mtd: mxc_nand: do not depend on disabling the irq in
	the interrupt handler
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <1285054802-21388-2-git-send-email-s.hauer@pengutronix.de>
References: <1285054802-21388-1-git-send-email-s.hauer@pengutronix.de>
	<1285054802-21388-2-git-send-email-s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 14:16:52 +0300
Message-ID: <1285240612.29268.76.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-21 at 09:40 +0200, Sascha Hauer wrote:
> This patch reverts the driver to enabling/disabling the NFC interrupt
> mask rather than enabling/disabling the system interrupt. This cleans
> up the driver so that it doesn't rely on interrupts being disabled
> within the interrupt handler.
> For i.MX21 we keep the current behaviour, that is calling
> enable_irq/disable_irq_nosync to enable/disable interrupts.
> This patch is based on earlier work by John Ogness.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Acked-by: John Ogness <john.ogness@linutronix.de>
> Tested-by: John Ogness <john.ogness@linutronix.de>

I've created l2-mtd-2.6.git/for-2.6.36 branch, pushed your patch there,
pinged dwmw2 for you. I do not give you any guarantees this will reach
2.6.36, you have to ping dwmw2.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
