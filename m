Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
 helo=am1outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WafJw-0006SS-Bp
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 05:57:12 +0000
Date: Thu, 17 Apr 2014 13:01:25 +0800
From: Huang Shijie <b32955@freescale.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: fix the wrong dummy value
Message-ID: <20140417050123.GC29495@localhost>
References: <1397636299-2390-1-git-send-email-b32955@freescale.com>
 <201404170140.29747.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <201404170140.29747.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 17, 2014 at 01:40:29AM +0200, Marek Vasut wrote:
> On Wednesday, April 16, 2014 at 10:18:19 AM, Huang Shijie wrote:
> > The dummy cycles is actually 8 for SPI fast/dual/quad read.
> > 
> > This patch fixes the wrong dummy value for both the spi-nor.c and m25p80.c.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> 
> Inspecting this patch, I see the code will behave identically with/without this 
> patch. It is thus unclear to me from the commit message, why this change is 
> necessary.
> 
firstly, in theory, the dummy cycles should be 8, not 1.
secondly, the DDR QUAD READ may use 4 dummy cycles.

thanks
Huang Shijie
