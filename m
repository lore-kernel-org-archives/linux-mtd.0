Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs4Hy-0004Wb-7c
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 10:53:32 +0000
Date: Tue, 21 Aug 2018 12:52:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "absahu@codeaurora.org" <absahu@codeaurora.org>, "peterpandong@micron.com"
 <peterpandong@micron.com>, "frieder.schrempf@exceet.de"
 <frieder.schrempf@exceet.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>
Subject: Re: [LINUX PATCH v10 1/2] dt-bindings: mtd: arasan: Add device tree
 binding documentation
Message-ID: <20180821125248.0eecbb5e@bbrezillon>
In-Reply-To: <MWHPR02MB2623A681FB4FF038B3F9C758AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180820143324.61af9027@bbrezillon>
 <MWHPR02MB2623F315C6D4C9775CDA08D8AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180821075948.28962170@bbrezillon>
 <MWHPR02MB2623E78222225D1CE8167463AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180821115238.1ad4dcb8@xps13>
 <MWHPR02MB2623A681FB4FF038B3F9C758AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Aug 2018 10:44:54 +0000
Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:

> Hi Miquel,
> 
> > -----Original Message-----
> > From: Miquel Raynal [mailto:miquel.raynal@bootlin.com]
> > Sent: Tuesday, August 21, 2018 3:23 PM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: Boris Brezillon <boris.brezillon@bootlin.com>; richard@nod.at; dwmw2@infradead.org;
> > computersforpeace@gmail.com; marek.vasut@gmail.com; kyungmin.park@samsung.com;
> > absahu@codeaurora.org; peterpandong@micron.com; frieder.schrempf@exceet.de; linux-
> > mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek <michals@xilinx.com>;
> > nagasureshkumarrelli@gmail.com
> > Subject: Re: [LINUX PATCH v10 1/2] dt-bindings: mtd: arasan: Add device tree binding
> > documentation
> > 
> > Hi Naga,
> > 
> > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote on Tue, 21 Aug 2018
> > 09:22:07 +0000:
> >   
> > > Hi Boris,
> > >  
> > > > -----Original Message-----
> > > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > > Sent: Tuesday, August 21, 2018 11:30 AM
> > > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > > Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> > > > computersforpeace@gmail.com; marek.vasut@gmail.com;
> > > > kyungmin.park@samsung.com; absahu@codeaurora.org;
> > > > peterpandong@micron.com; frieder.schrempf@exceet.de; linux-
> > > > mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek
> > > > <michals@xilinx.com>; nagasureshkumarrelli@gmail.com
> > > > Subject: Re: [LINUX PATCH v10 1/2] dt-bindings: mtd: arasan: Add
> > > > device tree binding documentation
> > > >
> > > > On Tue, 21 Aug 2018 05:47:18 +0000
> > > > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> > > >  
> > > > > > > +Required properties:
> > > > > > > +- compatible:		Should be "xlnx,zynqmp-nand" or "arasan,nfc-v3p10"  
> > > > > >
> > > > > > In your example it's not an "or" since both are defined.  
> > > > > In our previous discussion
> > > > > (https://lore.kernel.org/patchwork/patch/748901/)
> > > > > We decided to have compatible strings like " compatible =
> > > > > "<soc-vendor>,<ip-revision>",  
> > > > "arasan,<ip-revision>";"  
> > > > > So it should be either of these.
> > > > > so I will write something like below "Possible values are
> > > > > "xlnx,zynqmp-nand"
> > > > > 			"arasan,nfc-v3p10"
> > > > > And in example I will mention any one compatible.
> > > > > Is it ok?  
> > > >
> > > > Hm, why do you need arasan,nfc-v3p10 at all if it's supposed to be
> > > > overloaded by a soc specific compat?  
> > > Actually we put these compatible strings based on the comments on v7 series.
> > > Anyway I will just keep "xlnx,zynqmp-nand" as compatible.  
> > > >  
> > > > > > > +
> > > > > > > +Optional properties:
> > > > > > > +- arasan,has-mdma: Enables DMA support  
> > > > > >
> > > > > > Can't you detect that based on the compatible (or thanks to a
> > > > > > register). If it's something you choose when configuring the IP
> > > > > > and can't detect at  
> > > > runtime I guess it's fine.  
> > > > > There is no way to select DMA when configuring the IP.
> > > > > But it has internal DMA and there is a register to select PIO or
> > > > > DMA while starting a  
> > > > transfer.  
> > > > > So if user really don't want DMA, then we will never set DMA in
> > > > > the code based on DT  
> > > > property.
> > > >
> > > > If it's a purely SW choice, then is shouldn't be described in the DT.
> > > > You can use a module param, but I'm not even sure why one would want to disable DMA.  
> > > UBIFS doesn't work with DMA, hence we are using a DT property to operate the driver in  
> > IO.  
> > > But as you pointed (use virt_is_valid()), with this we can switch our driver to operate in  
> > PIO or DMA.  
> > > I will remove this from DT.  
> > 
> > I don't get why UBIFS would not work with DMA? This is a significant drawback.  
> UBIFS uses vmalloc'ed buffers whereas for DMA it should be DMA-able, i.e uses physically contiguous memory.
> Hence we used a DT property to make it work in PIO mode.
> Some discussion happened in https://patchwork.kernel.org/patch/9675007/.
> But whatever I said above, is with older arasan_nand driver, now anyway we have
> virt_addr_valid(). By checking this we can use DMA or PIO.
> This is the information I have, but I may be wrong.

My recommandation: set the NAND_USE_BOUNCE_BUFFER and always use DMA.
