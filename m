Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIVS4-0007PO-Jm
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 07:32:26 +0000
Date: Wed, 7 Jun 2017 09:31:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mark.marshall@omicronenergy.com" <mark.marshall@omicronenergy.com>,
 "b44839@freescale.com" <b44839@freescale.com>, "prabhakar@freescale.com"
 <prabhakar@freescale.com>
Subject: Re: [PATCHv2] mtd: nand: fsl_ifc: fix handing of bit flips in
 erased pages
Message-ID: <20170607093142.0645bbf2@bbrezillon>
In-Reply-To: <20170601152115.06895287@bbrezillon>
References: <20170420002748.5c76c9b9@bbrezillon> <20170420114057.GA4705@amd>
 <20170421105107.GA7259@amd> <20170517122224.GB583@amd>
 <20170517143211.205ff5de@bbrezillon> <20170517130059.GA3437@amd>
 <20170517152548.6d52c41b@bbrezillon> <20170517200305.GA12537@amd>
 <20170531205917.GA21878@amd>
 <3ff6a5a52b4744caaa481d482cab54bd@svr-chch-ex1.atlnz.lc>
 <20170601131232.GA12630@amd> <20170601152115.06895287@bbrezillon>
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

On Thu, 1 Jun 2017 15:21:15 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Thu, 1 Jun 2017 15:12:32 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> 
> > On Thu 2017-06-01 01:09:17, Darwin Dingel wrote:  
> > > Hi Pavel,
> > > 
> > > Just a minor thing. Sorry about the late comment.
> > > 
> > > On 01/06/17 08:59, Pavel Machek wrote:    
> > > > +
> > > > +		res = check_erased_page(chip, buf);
> > > > +		return res;
> > > > +	}    
> > > 
> > > Can we just remove 'res' and change this line to:
> > > 	return check_erased_page(chip, buf);    
> > 
> > Well... I originally had a printk there, and yes, it can be
> > simplified. I can roll v3, if required, but I'd leave it as is -- it
> > is still convenient place to add debugging to.  
> 
> I can fix it when applying, no need to send a new version.

Applied.

Thanks,

Boris
