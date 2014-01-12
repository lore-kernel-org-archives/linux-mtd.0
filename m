Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2Lub-00021J-Rw
 for linux-mtd@lists.infradead.org; Sun, 12 Jan 2014 14:21:14 +0000
Date: Sun, 12 Jan 2014 11:21:11 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Add "armada370-nand" compatible
Message-ID: <20140112142110.GB6099@localhost>
References: <1387899607-2656-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131224194744.GF19878@titan.lakedaemon.net>
 <20140112141907.GA6099@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140112141907.GA6099@localhost>
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

(Resending this, with Brian in the To field)

On Sun, Jan 12, 2014 at 11:19:07AM -0300, Ezequiel Garcia wrote:
> On Tue, Dec 24, 2013 at 02:47:44PM -0500, Jason Cooper wrote:
> > On Tue, Dec 24, 2013 at 12:40:07PM -0300, Ezequiel Garcia wrote:
> > > Now that the driver can support the Armada 370/XP SoC NAND controller,
> > > add the devicetree compatible string, enabling its use.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > ---
> > > Applies on top of l2-mtd.git master branch, rebased on top of v3.13-rc4
> > > in order to include:
> > > 
> > > commit 9c59ac616137fb62f6cb3f1219201b09cbcf30be
> > > Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > Date:   Mon Dec 9 18:36:26 2013 -0300
> > > 
> > >     Partially revert "mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible string"
> > > 
> > > and it is v3.14 material.
> > > 
> > >  drivers/mtd/nand/pxa3xx_nand.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > 
> > Acked-by: Jason Cooper <jason@lakedaemon.net>
> > 

Brian:

Just checking, what's your plan on this? I guess you're waiting
for v3.13 to be released, right?

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
