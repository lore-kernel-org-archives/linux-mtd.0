Received: from baldur.buserror.net ([165.227.176.147])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMJXi-0003IQ-1w
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 20:10:15 +0000
Message-ID: <1512504459.10062.9.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Date: Tue, 05 Dec 2017 14:07:39 -0600
In-Reply-To: <HE1PR04MB1241ADD02E472BA492AE1C8F973D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1511954855-8593-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512105209.10062.1.camel@buserror.net>
 <HE1PR04MB12414AFA5F8081730B89378497390@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <1512165311.10062.3.camel@buserror.net>
 <HE1PR04MB1241226CD3B7ABD6D5FA2D91973C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <1512441957.10062.6.camel@buserror.net>
 <HE1PR04MB1241ADD02E472BA492AE1C8F973D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
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

On Tue, 2017-12-05 at 09:45 +0000, Prabhakar Kushwaha wrote:
> > -----Original Message-----
> > From: Scott Wood [mailto:oss@buserror.net]
> > Sent: Tuesday, December 05, 2017 8:16 AM
> > To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; linux-
> > mtd@lists.infradead.org; devicetree@vger.kernel.org
> > Cc: dedekind1@gmail.com; computersforpeace@gmail.com
> > Subject: Re: [PATCH] Documentation: binding: Update endianness usage
> > 
> > I now see your patch to of_flash_probe... where is the non-IFC-specific
> > binding that says the *parent* of a CFI node should be looked at for this?
> > Where in general are endian properties kept in the parent of the node with
> > "reg"?  The right answer is to add endianness to mtd-physmap.txt.
> > 
> 
> Flashes are always littler endian. 

We wouldn't be having this discussion if that were true...  This is about how
it presents to the CPU, not about how the actual pins on the chip are
numbered.

> It is because of IFC controller behavior, endianness is required.  
> So as per my understanding, this info should go in IFC binding. 

If the info should go in the IFC binding why is the code in a non-IFC-specific 
place?

-Scott
