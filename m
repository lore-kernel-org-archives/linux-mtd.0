Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOeWL-0005Uq-Tz
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2018 08:03:03 +0000
Date: Mon, 19 Nov 2018 09:02:46 +0100
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
Message-ID: <20181119090246.49060019@bbrezillon>
In-Reply-To: <MWHPR02MB2623AAEC160F40F061E23194AFD80@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181118204324.373ca9cc@bbrezillon>
 <MWHPR02MB2623AAEC160F40F061E23194AFD80@MWHPR02MB2623.namprd02.prod.outlook.com>
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

On Mon, 19 Nov 2018 06:20:28 +0000
Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:

> H Boris,
> 
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > Sent: Monday, November 19, 2018 1:13 AM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> > computersforpeace@gmail.com; marek.vasut@gmail.com; linux-mtd@lists.infradead.org; linux-
> > kernel@vger.kernel.org; nagasuresh12@gmail.com; robh@kernel.org; Michal Simek
> > <michals@xilinx.com>
> > Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for Arasan NAND
> > Flash Controller
> > 
> > On Thu, 15 Nov 2018 09:34:16 +0000
> > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> >   
> > > Hi Boris & Miquel,
> > >
> > > I am updating the driver by addressing your comments, and I have one
> > > concern,  especially in anfc_read_page_hwecc(), there I am checking for erased pages bit flips.
> > > Since Arasan NAND controller doesn't have multibit error detection
> > > beyond 24-bit( it can correct up to 24 bit), i.e. there is no indication from controller to detect  
> > uncorrectable error beyond 24bit.
> > 
> > Do you mean that you can't detect uncorrectable errors, or just that it's not 100% sure to detect
> > errors above max_strength?  
> Yes, in Arasan NAND controller there is no way to detect uncorrectable errors beyond 24-bit.

So how do you detect uncorrectable errors when the strength is less than
24bits?

> >   
> > > So I took some error count as default value(MULTI_BIT_ERR_CNT  16, I
> > > put this based on the error count that I got while reading erased page on Micron device).
> > > And during a page read, will just read the error count register and
> > > compare this value with the default error count(16) and if it is more Than default then I am  
> > checking for erased page bit flips.
> > 
> > Hm, that's wrong, especially if you set ecc_strength to something > 16.  
> Ok
> >   
> > > I am doubting that this will not work in all cases.  
> > 
> > It definitely doesn't.  
> Ok
> >   
> > > In my case it is just working because the error count that it got on an erased page is 16.
> > > Could you please suggest a way to do detect erased_page bit flips when reading a page with  
> > HW-ECC?.
> > 
> > I'm a bit lost. Is the problem only about bitflips in erase pages, or is it also impacting reads of
> > written pages that lead to uncorrectable errors.  
> Yes, it is for both. But in case of read errors that we can't detect beyond 24-bit, then the answer from HW design team
> Is that the flash part is bad.
> Unfortunately till now we haven't ran into that situation(read errors of written pages beyond 24-bit).

Can you please run nandbiterrs (availaible in mtd-utils). I fear your
device won't pass the test.

> But we are hitting this because of erased page reading(needed in case of ubifs).
> 
> > 
> > Don't you have a bit (or several bits) reporting when the ECC engine was not able to correct
> > data? I you do, you should base the "detect bitflips in erase pages" logic on this information.  
> Bit reporting for several bit errors is there only for Hamming(1bit correction and 2bit detection) but not in BCH.
> 

Then I tend to agree with Miquel: your ECC engine is broken, and I'm
not even sure how to deal with that yet.
