Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXNZA-0003gz-0K
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 09:13:46 +0000
Date: Mon, 25 Jun 2018 11:13:21 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "mmayer@broadcom.com" <mmayer@broadcom.com>, "rogerq@ti.com"
 <rogerq@ti.com>, "ladis@linux-mips.org" <ladis@linux-mips.org>,
 "ada@thorsis.com" <ada@thorsis.com>, "honghui.zhang@mediatek.com"
 <honghui.zhang@mediatek.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>, Michal Simek <michals@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [[LINUX PATCH v10] 3/4] Documentation: nand: pl353: Add
 documentation for controller and driver
Message-ID: <20180625111321.652d12ff@bbrezillon>
In-Reply-To: <MWHPR02MB26234FD1B68C2B5ECC6B87F6AF4A0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180624225427.67c4d9c3@bbrezillon>
 <MWHPR02MB26234FD1B68C2B5ECC6B87F6AF4A0@MWHPR02MB2623.namprd02.prod.outlook.com>
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

On Mon, 25 Jun 2018 08:56:41 +0000
Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:

> Hi Boris,
> 
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > Sent: Monday, June 25, 2018 2:24 AM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> > marek.vasut@gmail.com; f.fainelli@gmail.com; mmayer@broadcom.com; rogerq@ti.com;
> > ladis@linux-mips.org; ada@thorsis.com; honghui.zhang@mediatek.com;
> > miquel.raynal@bootlin.com; nagasureshkumarrelli@gmail.com; Michal Simek
> > <michals@xilinx.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [[LINUX PATCH v10] 3/4] Documentation: nand: pl353: Add documentation
> > for controller and driver
> > 
> > On Thu, 21 Jun 2018 12:12:30 +0530
> > Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> >   
> > > Added notes about the controller and driver.
> > >
> > > Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> > > ---
> > > Changes in v10:
> > >  - None
> > > Changes in v9:
> > >  - Addressed the comments given by Miquel and Randy
> > > Changes in v8
> > >  - None
> > > Changes in v7:
> > > - None
> > > Changes in v6:
> > > - None
> > > Changes in v5:
> > > - Fixed the review comments
> > > Changes in v4:
> > > - None
> > > ---
> > >  Documentation/mtd/nand/pl353-nand.txt | 99  
> > +++++++++++++++++++++++++++++++++++  
> > >  1 file changed, 99 insertions(+)
> > >  create mode 100644 Documentation/mtd/nand/pl353-nand.txt  
> > 
> > Can we put these information directly in the driver instead of having
> > yet another place where we have things partially documented? I just
> > discovered a doc for the pxa NAND controller in this directory because
> > of this patch, which kind of proves my point :-).  
> Ok, but could you please explain where to put in driver?
> Do you mean, as comments inside drivers/mtd/raw/pl353-nand.c?

Yes. Either inline, next to the relevant section of code, or at the
beginning of the file.
