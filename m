Received: from baldur.buserror.net ([165.227.176.147])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKtJe-00075r-KB
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 21:57:56 +0000
Message-ID: <1512165311.10062.3.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org"
 <devicetree-discuss@lists.ozlabs.org>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Date: Fri, 01 Dec 2017 15:55:11 -0600
In-Reply-To: <HE1PR04MB12414AFA5F8081730B89378497390@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1511954855-8593-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512105209.10062.1.camel@buserror.net>
 <HE1PR04MB12414AFA5F8081730B89378497390@HE1PR04MB1241.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Documentation: binding: Update endianness usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2017-12-01 at 08:42 +0000, Prabhakar Kushwaha wrote:
> > -----Original Message-----
> > From: Scott Wood [mailto:oss@buserror.net]
> > Sent: Friday, December 01, 2017 10:43 AM
> > To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; linux-
> > mtd@lists.infradead.org; devicetree-discuss@lists.ozlabs.org
> > Cc: dedekind1@gmail.com; computersforpeace@gmail.com
> > Subject: Re: [PATCH] Documentation: binding: Update endianness usage
> > 
> > On Wed, 2017-11-29 at 16:57 +0530, Prabhakar Kushwaha wrote:
> > > IFC controller version < 2.0 support IFC register access as
> > > big endian. These controller version also require IFC NOR signals to
> > > be connected in reverse order with NOR flash.
> > > 
> > > IFC >= 2.0 is other way around.
> > > 
> > > So updating IFC binding to take care of both using endianness field.
> > > 
> > > Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6
> > > ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/memory-
> > > controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-
> > > controllers/fsl/ifc.txt
> > > index 89427b0..824a2ca 100644
> > > --- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> > > @@ -18,8 +18,10 @@ Properties:
> > >                interrupt (NAND_EVTER_STAT).  If there is only one,
> > >                that interrupt reports both types of event.
> > > 
> > > -- little-endian : If this property is absent, the big-endian mode will
> > > -                  be in use as default for registers.
> > > +- little-endian or big-endin : It represents how IFC registers  to be
> > > accessed.
> > > +			It also represents connection between
> > > controller
> > > and
> > > +			NOR flash. If this property is absent, the big-
> > > endian
> > > +			mode will be in use as default.
> > 
> > "endin"?
> > 
> > If big endian is the default, is this change really
> > necessary?  Particularly
> > since the big endian chips are older and thus have existing device trees.
> > 
> 
> Earlier endianness information was only used for "how to"  access IFC-NAND
> register access.
> Now this info  will also be used for defining swap requirement of NOR
> flash. 

Is this a difference between LS1021A and PPC-based chips?

> "If this property is absent,  the big-  endian mode will be in use as
> default ". This line can be removed. 
> Please let me know your view on this. 

No, it cannot be removed because there are existing device trees with IFC
nodes that don't have either property.

-Scott
