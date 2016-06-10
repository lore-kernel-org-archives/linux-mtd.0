Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBPfF-0002LF-Or
 for linux-mtd@lists.infradead.org; Fri, 10 Jun 2016 16:52:10 +0000
Date: Fri, 10 Jun 2016 18:51:42 +0200
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
Message-ID: <alpine.DEB.2.02.1606101847250.30757@lnxricardw1.se.axis.com>
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
> > a single response.
> > ...
> 
> Yes, I know. I was not maintainer at that time, and was only reviewing
> a few patches from time to time.
> Now that I am, I try to answer as fast as possible. Note that the set
> of requirements might have change with me, so even if someone add
> agreed on you first submission but not taken the patches, I would have
> required the same set of changes ;).

:-) 

At any rate, thanks for taking the time to review the driver so promptly 
and also the for the time you've spent during the subsequent discussions.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
