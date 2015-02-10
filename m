Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL8no-0007o3-HB
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 11:16:25 +0000
From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: m25p80 spi1.0: unrecognized JEDEC id
Date: Tue, 10 Feb 2015 11:55:44 +0100
References: <CAOMZO5BgY1YXdnoKpZJW6k9AdrDFZH=6mdCfuB=9aSVZukAV8A@mail.gmail.com>
 <20150209221859.GS18140@ld-irv-0074>
 <CAOMZO5BMrA1HGXXoriwbAk53Kmkr8GcQbEt75CuT_voeqW3s6Q@mail.gmail.com>
In-Reply-To: <CAOMZO5BMrA1HGXXoriwbAk53Kmkr8GcQbEt75CuT_voeqW3s6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201502101155.44137.marex@denx.de>
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, February 10, 2015 at 12:39:22 AM, Fabio Estevam wrote:
> On Mon, Feb 9, 2015 at 8:18 PM, Brian Norris
> 
> <computersforpeace@gmail.com> wrote:
> > On Mon, Feb 09, 2015 at 08:09:02PM -0200, Fabio Estevam wrote:
> >> Hi,
> >> 
> >> Running linux-next 20150209 on a mx28evk I see that m25p80 is not
> >> detected correctly:
> >> 
> >> m25p80 spi1.0: unrecognized JEDEC id bytes: bf, 24, 40
> > 
> > That's not good. I don't see anything in MTD's -next that should cause
> > that though.
> 
> Yes, I have just tested other platform (mx6) with linux-next and
> m25p80 can be probed.
> 
> Looks like the issue is mxs specific and comes from other area (spi
> driver, dma, clocks, etc).

Was the clock patch mucking with FRAC0 and FRAC1 merged by any chance?

Best regards,
Marek Vasut
