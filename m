Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBQ1S-00079n-Q5
 for linux-mtd@lists.infradead.org; Fri, 10 Jun 2016 17:15:07 +0000
Date: Fri, 10 Jun 2016 19:14:38 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, <devicetree@vger.kernel.org>, Linux mtd
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
In-Reply-To: <20160610190357.5f10c00f@bbrezillon>
Message-ID: <alpine.DEB.2.02.1606101906110.30757@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
 <20160603162207.0688c9e6@bbrezillon>
 <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
 <20160608175018.16c88207@bbrezillon>
 <alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
 <20160610175454.327f51a2@bbrezillon>
 <alpine.DEB.2.02.1606101803120.30757@lnxricardw1.se.axis.com>
 <20160610190357.5f10c00f@bbrezillon>
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

> > Basically, in the general case, the controller can handle a matrix of 
> > nand flash chips. There can be a number of banks, each of which can 
> > have a number of individual CS lines. For the (in this case academic) 
> > case of 3 banks and 4 chip selects per bank, there would be a total of 
> > 3 x 4 = 12 CS lines.
> > 
> > For the IP configuration the driver was written for, there are only 2 
> > CS lines, and we can configure if they are to be viewed by the 
> > controller as 2 CS lines within the same single bank, or 2 separate 
> > banks with one CS each. This is what the DT property is intended to 
> > express. It basically translates directly into a register write in the 
> > IP.
> 
> Okay, got it. I guess we should just expose the chip select in a linear
> way (3 banks of 4 CS means the controller should support up to 12
> chips), unless you really have a way to change the CS pins routing
> internally.

When I go through the driver I will also revisit this and give it some 
more thought if there's a set of bindings which would make sense both for 
the case we have now and for a general configuration of the IP.

> > Yes, that makes sense of course, but what if someone would want to 
> > override the automatic settings, for whatever reason, using an 
> > optional DT property? I can think of several reasons either way, 
> > that's why I'm asking.
>
> You mean reducing the timings because the board design prevents using
> the highest supported mode for example? That would actually be a valid
> use case, and I guess we could make a generic property for that
> (without the vendor prefix).

Yes, either that, or if the automatic selection fails for some reason, say 
in a given case we know that the chips we are using support mode 2 timing, 
but one of them gets misidentified as mode 0. Sure, that is a bug and 
should be fixed of course, but I can imagine commercial situations where 
it may not be feasable to update the kernel, but where a new DT would be 
ok.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
