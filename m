Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac22Y-0006LU-VO
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 02:33:59 +0000
Received: by mail-pa0-x22b.google.com with SMTP id fi3so42411719pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 18:33:38 -0800 (PST)
Date: Fri, 4 Mar 2016 18:33:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar,
 javier@dowhile0.org, fcooper@ti.com, nsekhar@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/26] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20160305023335.GP55664@google.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <56D470E8.4070106@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56D470E8.4070106@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 29, 2016 at 06:25:12PM +0200, Roger Quadros wrote:
> On 19/02/16 23:15, Roger Quadros wrote:
> > Hi,
> > 
> > @Tony
> > Patches 15 and 24 are new and will need your review.
> > I've modified patch 22 to include the new am335x boards introduced since v4.4.
> > 
> > Patches are based on top of omap-for-v4.6/dt so that the DT changes apply cleanly.
> > 
> > @Brian
> > If you can Ack the MTD related changes we can push the series (excluding DT patches)
> > to an immutable branch and you can then pull it into l2-mtd.git
> 
> Gentle ping on this. Thanks.

I think this series looks a lot better. I don't think I have any
fundamental issues with the MTD stuff, aside from the one comment
about the 'reg' property. If we get a satisfactory answer for that (and
you fix the small stuff), then:

Acked-by: Brian Norris <computersforpeace@gmail.com>

(That's also presuming the relevant players are all on board with the DT
"ABI" breakage. But I think your old binding really needed a fixup, so
the warning might be sufficient.)

Brian
