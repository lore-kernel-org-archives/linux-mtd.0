Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXFGk-0007A4-Gd
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 21:08:34 +0000
Received: by pacfv12 with SMTP id fv12so23263955pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 14:08:13 -0700 (PDT)
Date: Wed, 2 Sep 2015 14:08:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Jonas Gorski <jogo@openwrt.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: allow dual/quad reads on S25FL129P
Message-ID: <20150902210811.GZ81844@google.com>
References: <1440593813-16360-1-git-send-email-jogo@openwrt.org>
 <201508261505.36546.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201508261505.36546.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 26, 2015 at 03:05:36PM +0200, Marek Vasut wrote:
> On Wednesday, August 26, 2015 at 02:56:53 PM, Jonas Gorski wrote:
> > According to the datasheet[1], both S25FL129P0 (256kB sectors) and
> > S25FL129P1 (64kB sectors) support dual read, quad read, dual i/o read
> > and quad i/o read.
> > 
> > I have verified dual read to be working for S25FL129P1 on a dual
> > capable spi controller. Quad as well as S25FL129P0 is untested, lacking
> > hardware to verify.
> > 
> > [1] http://www.spansion.com/Support/Datasheets/S25FL129P_00.pdf
> > 
> > Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> 
> I don't have this device, so I cannot test, sorry. On the other hand,
> spansion doesn't seem to put b/s in their datasheets, so I'd be happy
> to add my:
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied to l2-mtd.git
