Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy1RC-0002II-9K
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 21:03:39 +0000
Date: Thu, 6 Sep 2018 23:03:14 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/3] Virtual MTD concat device driver
Message-ID: <20180906230314.4f7744a6@bbrezillon>
In-Reply-To: <20180906225949.48497cb5@bbrezillon>
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
 <20180906225949.48497cb5@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 6 Sep 2018 22:59:49 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hi Bernhard,
> 
> On Thu,  6 Sep 2018 18:14:10 +0200
> Bernhard Frauendienst <kernel@nospam.obeliks.de> wrote:
> 
> > Hi everybody,
> > 
> > when porting my router board from a mach-file based OpenWRT target to a
> > device-tree based target, I found that there is no generic way to create
> > a mtd_concat device from within the dts. The following patches attempt
> > to provide that possibility.  
> 
> There's a fundamental issue with this patch series: DT is supposed to
> represent the hardware, not how you want to use it, and clearly, your
> concatenated MTD dev is a virtual device, not a real one, so I doubt it
> will pass DT maintainers' review.

BTW, did you consider doing that through the command line?
