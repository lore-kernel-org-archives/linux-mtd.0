Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vmgge-0007Oc-DJ
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2013 09:18:05 +0000
Received: by mail-pb0-f52.google.com with SMTP id uo5so15620938pbc.25
 for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2013 01:17:43 -0800 (PST)
Date: Sat, 30 Nov 2013 01:17:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Message-ID: <20131130091738.GE29397@norris.computersforpeace.net>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <1385715364.73252787@f82.i.mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385715364.73252787@f82.i.mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 29, 2013 at 12:56:04PM +0400, Alexander Shiyan wrote:
> > Hi Alexander,
> > 
> > We're dealing with a similar issue in other drivers currently, and I
> > think it's worth straightening out the issue for all systems.
> > 
> > On Wed, Nov 13, 2013 at 03:58:02PM +0400, Alexander Shiyan wrote:
> > > This patch adds a property to automatically determine the NAND
> > > bus width by CFI/ONFI information from chip. This property works
> > > if the bus width is not specified explicitly.
> ...
> 
> Hello Brian.
> Can at least part [2/3] "mtd: nand: gpio: Use devm_gpio_request_one() where possible"
> be applied at this time?

Probably. I was avoiding taking things out of order in the series for
now, but I'll take another look. If it looks good and applies
independently, then I'll take it.

Brian
