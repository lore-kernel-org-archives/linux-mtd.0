Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxemo-00015B-0I
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2018 20:52:27 +0000
Received: by mail-lf1-x142.google.com with SMTP id j8-v6so7168888lfb.4
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2018 13:52:14 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Tony Lindgren <tony@atomide.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: rawnand: ams-delta: Cleanups and optimizations
Date: Wed, 05 Sep 2018 22:53:27 +0200
Message-ID: <1855340.fVHtouTg44@z50>
In-Reply-To: <20180905084757.432e7c19@xps13>
References: <20180813223448.21316-1-jmkrzyszt@gmail.com>
 <20180820213904.13475-1-jmkrzyszt@gmail.com> <20180905084757.432e7c19@xps13>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel, Tony,

On Wednesday, September 5, 2018 8:47:57 AM CEST Miquel Raynal wrote:
> Hi Janusz,
> 
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Mon, 20 Aug 2018
> 23:39:01 +0200:
> 
> > This series consist of possibly ready to apply patches extracted from
> > a former one titled "mtd: rawnand:  ams-delta: Use GPIO API for data I/O".
> > Remaining patches implementing conversion of data I/O to GPIO have been
> > postponed until gpiolib is optimized to ensure sufficient performance.
> > 
> > 
> > Janusz Krzysztofik (3):
> >       mtd: rawnand: ams-delta: show parent device in sysfs
> >       mtd: rawnand: ams-delta: Use private structure
> >       mtd: rawnand: ams-delta: Set port direction when needed
> 
> Patch 2/3 does not apply on nand/next. Indeed the driver does not look
> the same as in the diff.

That's because I built it on top of my former series from the mid of July, 
containing "[PATCH v2 2/3 v4] mtd: rawnand: ams-delta: use GPIO lookup table". 
It was acked by you, Miquel, and supposed to be merged via linux-omap tree.

> I don't see any changes on my side that could
> explain this so perhaps you could rebase on top of 4.19-rc2 (or
> nand/next, as you wish) and resend the series?

As far as I can see, Tony hasn't applied that series yet, so maybe I can still 
move that patch out of there and insert it into this series in front of the 
other 3 patches and resend. That would however make patch 3/3 of that old 
series depend on this one.

Tony, what do you think?

Thanks,
Janusz
