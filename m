Date: Thu, 7 Nov 2013 13:41:33 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v4 05/31] mtd: nand: pxa3xx: devicetree binding update
Message-ID: <20131107164132.GA30917@localhost>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383837455-30721-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131107153210.GK8308@titan.lakedaemon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131107153210.GK8308@titan.lakedaemon.net>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org,
 Tawfik Bayouk <tawfik@marvell.com>, Willy Tarreau <w@1wt.eu>,
 Huang Shijie <b32955@freescale.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 07, 2013 at 10:32:10AM -0500, Jason Cooper wrote:
> On Thu, Nov 07, 2013 at 12:17:09PM -0300, Ezequiel Garcia wrote:
> > Since the driver supports the new compatible string, the binding
> > documentation must be updated to reflect it.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Thanks for adding this, but please remember to update the Subject
> string in the future.  Both this patch and the next one are changing the
> Documentation/ portion of the tree, not drivers/.
> 

Come again?

You mean "[PATCH] Documentation: mtd: nand: Do this"

In that case: sorry, I do it differently on purpose, it looks better
to me (focus the affected driver), but maybe I'm wrong.

> And,
> 
> Acked-by: Jason Cooper <jason@lakedaemon.net>
> 

Thanks!

> thx,
> 
> Jason.
> 
> > diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> > index f1421e2..bed8390 100644
> > --- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> > @@ -2,7 +2,9 @@ PXA3xx NAND DT bindings
> >  
> >  Required properties:
> >  
> > - - compatible:		Should be "marvell,pxa3xx-nand"
> > + - compatible:		Should be set to one of the following:
> > +			marvell,pxa3xx-nand
> > +			marvell,armada370-nand
> >   - reg: 		The register base for the controller
> >   - interrupts:		The interrupt to map
> >   - #address-cells:	Set to <1> if the node includes partitions
> > -- 
> > 1.8.1.5
> > 

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
