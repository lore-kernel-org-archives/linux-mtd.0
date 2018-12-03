Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTkdE-0002ID-H9
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 09:35:14 +0000
Date: Mon, 3 Dec 2018 10:34:50 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Provide default address width and latency
 for map selection
Message-ID: <20181203103450.61a8d98f@bbrezillon>
In-Reply-To: <20181203100814.095a12f4@bbrezillon>
References: <20181129181519.15681-1-alexander.sverdlin@nokia.com>
 <20181130114019.175ab7ec@bbrezillon>
 <f11c7ab4-ee19-ad4e-7943-d6359ac58249@nokia.com>
 <20181203092337.52817e0e@bbrezillon>
 <fcf6d1f4-4602-719a-bfda-7950c2205a31@nokia.com>
 <20181203100814.095a12f4@bbrezillon>
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

On Mon, 3 Dec 2018 10:08:14 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Mon, 3 Dec 2018 08:37:17 +0000
> "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
> wrote:
> 
> > Hi!
> > 
> > On 03/12/2018 09:23, Boris Brezillon wrote:  
> > >> This is the same instruction 65h which is used to read regs and which
> > >> appears in SMPT headers, it is a chicken-egg problem.    
> > > Oh, right, I remember now. Not a smart decision from Spansion :-/.
> > >     
> > >> Therefore, I don't know if it's possible to provide smarter heuristics
> > >> here.    
> > > Maybe:
> > > 
> > > ref_cr1 = read_CR1_using_RDCR()
> > > 
> > > for_each_possible_dummy_and_addr_width
> > > 	cr1 = read_CR1_using_RDAR()
> > > 	if (cr1 == ref_cr1)
> > > 		break;    
> > 
> > This will not work, as default value for CR1(N)V is 0 and that is the value
> > one gets with incorrect addr_width as well.
> >   
> 
> How about:
> 
> 	// set the WE bit in SR1 so that SR1 is not 0
> 	write_enable()
> 
> 	ref_sr1 = read_SR1_using_RDSR1()
> 	for_each_possible_dummy_and_addr_width
> 		sr1 = read_SR1_using_RDAR()
> 		if (sr1 == ref_sr1)
> 			break;

Oh, and you should read CR2 to make sure AL and RL fields match the
selected addr/dummy values.

> 
> 	write_disable()  
