Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2cJu-0006t5-9T
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 07:52:27 +0000
Received: by mail-pb0-f41.google.com with SMTP id jt11so6963318pbb.14
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2014 23:52:04 -0800 (PST)
Date: Sun, 12 Jan 2014 23:52:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Add "armada370-nand" compatible
Message-ID: <20140113075201.GJ1992@norris-Latitude-E6410>
References: <1387899607-2656-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131224194744.GF19878@titan.lakedaemon.net>
 <20140112141907.GA6099@localhost> <20140112142110.GB6099@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140112142110.GB6099@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Jason Cooper <jason@lakedaemon.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 12, 2014 at 11:21:11AM -0300, Ezequiel Garcia wrote:
> On Sun, Jan 12, 2014 at 11:19:07AM -0300, Ezequiel Garcia wrote:
> > On Tue, Dec 24, 2013 at 02:47:44PM -0500, Jason Cooper wrote:
> > > On Tue, Dec 24, 2013 at 12:40:07PM -0300, Ezequiel Garcia wrote:
> > > > Now that the driver can support the Armada 370/XP SoC NAND controller,
> > > > add the devicetree compatible string, enabling its use.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > > ---
> > > > Applies on top of l2-mtd.git master branch, rebased on top of v3.13-rc4
> > > > in order to include:
> > > > 
> > > > commit 9c59ac616137fb62f6cb3f1219201b09cbcf30be
> > > > Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > > Date:   Mon Dec 9 18:36:26 2013 -0300
> > > > 
> > > >     Partially revert "mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible string"
> > > > 
> > > > and it is v3.14 material.
> > > > 
> > > >  drivers/mtd/nand/pxa3xx_nand.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > 
> > > Acked-by: Jason Cooper <jason@lakedaemon.net>
> 
> Brian:
> 
> Just checking, what's your plan on this? I guess you're waiting
> for v3.13 to be released, right?

No, I was waiting partly to see if there were any more Armada fixes
needed for this driver (wouldn't want to have to revert this again!),
but mostly I've just been pretty busy and only cherry-picking a few
patches at a time.

The patch looks good. Pushed to l2-mtd.git.

Brian
