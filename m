From: Marek Vasut <marek.vasut@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Date: Mon, 30 Jan 2012 14:30:44 +0100
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <201201301327.41298.marek.vasut@gmail.com>
 <20120130131205.GD15596@pengutronix.de>
In-Reply-To: <20120130131205.GD15596@pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201301430.44374.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > U-Boot has NAND support in mainline, for barebox it is
> > > work-in-progress.
> > 
> > Why don't you rather start hacking on u-boot instead of chasing behind it
> > all the time ;-)
> 
> "chasing all the time behind it" is plain wrong, you should know that. I
> also fed back the DMA fix I found. Besides, this is off-topic.

Hehe, just torturing you guys a bit :)
> 
> > > Did it always do that? Or is a newer version needed?
> > 
> > I can't comment on this one, I never used it. I rather got NAND working
> > properly.
> 
> Me neither. But if so, we have another regression candidate.

What regression candidate ? The version of NAND driver in u-boot should be close 
to what's in mainline Linux kernel.
