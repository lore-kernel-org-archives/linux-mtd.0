Received: from baldur.buserror.net ([165.227.176.147])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eM3Hk-0005QM-Cq
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 02:48:42 +0000
Message-ID: <1512441957.10062.6.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Date: Mon, 04 Dec 2017 20:45:57 -0600
In-Reply-To: <HE1PR04MB1241226CD3B7ABD6D5FA2D91973C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1511954855-8593-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512105209.10062.1.camel@buserror.net>
 <HE1PR04MB12414AFA5F8081730B89378497390@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <1512165311.10062.3.camel@buserror.net>
 <HE1PR04MB1241226CD3B7ABD6D5FA2D91973C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
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

On Mon, 2017-12-04 at 04:33 +0000, Prabhakar Kushwaha wrote:
> > -----Original Message-----
> > From: Scott Wood [mailto:oss@buserror.net]
> > Sent: Saturday, December 02, 2017 3:25 AM
> > To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; linux-
> > mtd@lists.infradead.org; devicetree-discuss@lists.ozlabs.org
> > Cc: dedekind1@gmail.com; computersforpeace@gmail.com
> > Subject: Re: [PATCH] Documentation: binding: Update endianness usage
> > 
> > On Fri, 2017-12-01 at 08:42 +0000, Prabhakar Kushwaha wrote:
> > > > -----Original Message-----
> > > > From: Scott Wood [mailto:oss@buserror.net]
> > > > Sent: Friday, December 01, 2017 10:43 AM
> > > > To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; linux-
> > > > mtd@lists.infradead.org; devicetree-discuss@lists.ozlabs.org
> > > > Cc: dedekind1@gmail.com; computersforpeace@gmail.com
> > > > Subject: Re: [PATCH] Documentation: binding: Update endianness usage
> > > > 
> > > > If big endian is the default, is this change really
> > > > necessary?  Particularly
> > > > since the big endian chips are older and thus have existing device
> > > > trees.
> > > > 
> > > 
> > > Earlier endianness information was only used for "how to"  access IFC-
> > > NAND
> > > register access.
> > > Now this info  will also be used for defining swap requirement of NOR
> > > flash.
> > 
> > Is this a difference between LS1021A and PPC-based chips?
> > 
> 
> Yes. 
> CONFIG_MTD_CFI_BE_BYTE_SWAP needs to be defined For LS1021A, LS1043A,
> LS1046A  

Only because you're running a little-endian kernel on those chips.  I still
don't see why the absence of a little-endian property isn't sufficient to
communicate that the hardware is big-endian given that that's the established
default.

I now see your patch to of_flash_probe... where is the non-IFC-specific
binding that says the *parent* of a CFI node should be looked at for this? 
Where in general are endian properties kept in the parent of the node with
"reg"?  The right answer is to add endianness to mtd-physmap.txt.

-Scott
