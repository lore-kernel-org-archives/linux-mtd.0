Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMguY-0001i5-T8
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:16:59 +0000
From: Marek Vasut <marex@denx.de>
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Thu, 19 Sep 2013 18:16:33 +0200
References: <522062B4.4080709@digi.com> <201309191807.21140.marex@denx.de>
 <523B22D6.8050303@digi.com>
In-Reply-To: <523B22D6.8050303@digi.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201309191816.33680.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Fabio Estevam <festevam@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "scottwood@freescale.com" <scottwood@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Hector Palacios,

> On 09/19/2013 06:07 PM, Marek Vasut wrote:
> > Dear Huang Shijie,
> > 
> > Sorry, I think I got lost in the discussion. I will pull out.
> > 
> > btw Hector, I managed to verify JFFS2 mounting doesn't work on 3.10 , now
> > I'm trying to backport patches from -next and apply the GPMI NAND
> > patchset, without much luck yet.
> 
> Oops, sorry, did you mean you were trying to backport them into U-Boot?
> Then please disregards my previous message.

You actually just saved me a lot of annoyance, thank you ;-)

btw feel free to run into me on IRC (#u-boot on freenode) or jabber so we can 
work on the backporting-to-uboot part ;-)

Best regards,
Marek Vasut
