Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaoVb-0007Ew-T8
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 15:45:52 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: fix the wrong dummy value
Date: Thu, 17 Apr 2014 16:15:24 +0200
References: <1397636299-2390-1-git-send-email-b32955@freescale.com>
 <201404171332.52954.marex@denx.de>
 <20140417125918.GA3248@localhost.localdomain>
In-Reply-To: <20140417125918.GA3248@localhost.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404171615.24744.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 17, 2014 at 02:59:21 PM, Huang Shijie wrote:
> On Thu, Apr 17, 2014 at 01:32:52PM +0200, Marek Vasut wrote:
> > On Thursday, April 17, 2014 at 07:01:25 AM, Huang Shijie wrote:
> > > On Thu, Apr 17, 2014 at 01:40:29AM +0200, Marek Vasut wrote:
> > > > On Wednesday, April 16, 2014 at 10:18:19 AM, Huang Shijie wrote:
> > > > > The dummy cycles is actually 8 for SPI fast/dual/quad read.
> > > > > 
> > > > > This patch fixes the wrong dummy value for both the spi-nor.c and
> > > > > m25p80.c.
> > > > > 
> > > > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > > > 
> > > > Inspecting this patch, I see the code will behave identically
> > > > with/without this patch. It is thus unclear to me from the commit
> > > > message, why this change is necessary.
> > > 
> > > firstly, in theory, the dummy cycles should be 8, not 1.
> > > secondly, the DDR QUAD READ may use 4 dummy cycles.
> > 
> > Right, it took me a bit of reading into the thread until I understood the
> > intention of the patch. If in doubt, try reading the commit message a day
> > later and you'll see that it might be insufficient. Basically, try
> > looking at the commit message from the receiving party's side ;-)
> 
> my fault.
> 
> I will update the commit message in the next version.

Thanks!

Best regards,
Marek Vasut
