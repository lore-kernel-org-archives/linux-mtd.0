From: Marek Vasut <marek.vasut@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Date: Mon, 30 Jan 2012 15:33:28 +0100
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <201201301430.44374.marek.vasut@gmail.com>
 <20120130134130.GG15596@pengutronix.de>
In-Reply-To: <20120130134130.GG15596@pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201301533.28882.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Hehe, just torturing you guys a bit :)
> 
> And the gain of that is? The only outcome I currently see is that I feel
> less motivated to put you on CC next time.
> 
> > > > > Did it always do that? Or is a newer version needed?
> > > > 
> > > > I can't comment on this one, I never used it. I rather got NAND
> > > > working properly.
> > > 
> > > Me neither. But if so, we have another regression candidate.
> > 
> > What regression candidate ? The version of NAND driver in u-boot should
> > be close to what's in mainline Linux kernel.
> 
> I am not talking about U-Boot here. I was wondering if somebody who uses
> the FSL deployment method would need to update kobs-ng, so a proper BBT
> gets written.

... if someone actually still uses kobs-ng.

> If so, people missing the need to update would see a
> regression. Which is another reason to not make BBT usage default. But I
> maybe wrong here. Huang will tell.

Yes, either him or Fabio. This is a good point actually.
