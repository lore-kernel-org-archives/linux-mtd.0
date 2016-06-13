Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCMAS-0002MF-EB
 for linux-mtd@lists.infradead.org; Mon, 13 Jun 2016 07:20:18 +0000
Date: Mon, 13 Jun 2016 09:19:44 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Mychaela Falconia <mychaela.falconia@gmail.com>,
 <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 <linux-kernel@vger.kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson
 <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
In-Reply-To: <20160610180713.6f09f802@bbrezillon>
Message-ID: <alpine.DEB.2.02.1606130913400.29701@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
 <20160603165909.09f27ee0@bbrezillon>
 <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
 <CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
 <20160609200128.5b7a6e29@bbrezillon>
 <CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com>
 <20160609222307.5db4e67f@bbrezillon>
 <alpine.DEB.2.02.1606101433170.30757@lnxricardw1.se.axis.com>
 <20160610180713.6f09f802@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 10 Jun 2016, Boris Brezillon wrote:

> > Something that I am mildly miffed about is that I've posted this driver 
> > twice before on the mtd list (although, admittedly, not directly addressed 
> > to any maintainer), first as an RFC and later as a complete patch, without 
> > a single response. (Apparently Boris you did respond with comments on 
> > Oleksij's driver though which I must have missed). Although an RFC might 
> > not have initiated a detailed review, it would have been a large advantage 
> > (and wasted less time for all) if the point of using 'wrong' driver 
> > interface had been brought up and consequently discussed earlier. Yes I 
> > know, everyone is busy, it's easy to miss things, each and every driver 
> > can't be reviewed in detail, etc.
> 
> Yes, I know. I was not maintainer at that time, and was only reviewing
> a few patches from time to time.
> Now that I am, I try to answer as fast as possible. Note that the set
> of requirements might have change with me, so even if someone add
> agreed on you first submission but not taken the patches, I would have
> required the same set of changes ;).

:-)

Well, I'm not questioning that changes are required, and I'm happy to 
implement them once I've come to a clear understanding of what is needed, 
I just would have liked to known about them earlier, especially the major 
concepts.

I know there was probably no one interested enough at the time, everyone 
is busy, not every idea presented can be reviewed in detail etc etc. And 
it's not a big issue, just a minor annoyance.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
