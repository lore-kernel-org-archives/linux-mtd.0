Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3o9-0006rR-Mx
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 11:03:09 +0000
Date: Tue, 20 Nov 2018 12:02:44 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasuresh12@gmail.com"
 <nagasuresh12@gmail.com>, "robh@kernel.org" <robh@kernel.org>, Michal Simek
 <michals@xilinx.com>
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181120120244.7d2442b5@bbrezillon>
In-Reply-To: <BN6PR02MB2610C7D048E4A192E041BE14AFD90@BN6PR02MB2610.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181118204324.373ca9cc@bbrezillon>
 <MWHPR02MB2623AAEC160F40F061E23194AFD80@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181119090246.49060019@bbrezillon>
 <BN6PR02MB2610C7D048E4A192E041BE14AFD90@BN6PR02MB2610.namprd02.prod.outlook.com>
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

On Tue, 20 Nov 2018 07:02:08 +0000
Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:


> > 
> > Can you please run nandbiterrs (availaible in mtd-utils). I fear your
> > device won't pass the test.  
> Yes, nandbiterror test is passing till 24bit, after that it is failing.

Can you paste the output of nandbiterrs please?

> >   
> > > But we are hitting this because of erased page reading(needed in case of ubifs).
> > >  
> > > >
> > > > Don't you have a bit (or several bits) reporting when the ECC engine was not able to  
> > correct  
> > > > data? I you do, you should base the "detect bitflips in erase pages" logic on this information.  
> > > Bit reporting for several bit errors is there only for Hamming(1bit correction and 2bit  
> > detection) but not in BCH.  
> > >  
> > 
> > Then I tend to agree with Miquel: your ECC engine is broken, and I'm
> > not even sure how to deal with that yet.  
> So as per the Miquel's suggestion, can I proceed to add the below one?
> "you should re-read the page in raw mode and check for the number of bitflips manually (thanks to the helpers in the core). Again, if the number of BF is above 16, we can assume the page is bad and increment ->ecc.failed accordingly."

But that's just partially fixing the problem. And you didn't answer my
previous question: what happens when you configure the ECC engine in,
say 12bit/1024 and you end up with uncorrectable errors (more than 12
bitflips in a 1k block). What's the number reported ECC_ERR_CNT? Is it
set to 13?
