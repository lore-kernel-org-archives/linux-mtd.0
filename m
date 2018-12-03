Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTjWJ-0006KT-HV
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 08:24:01 +0000
Date: Mon, 3 Dec 2018 09:23:37 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Provide default address width and latency
 for map selection
Message-ID: <20181203092337.52817e0e@bbrezillon>
In-Reply-To: <f11c7ab4-ee19-ad4e-7943-d6359ac58249@nokia.com>
References: <20181129181519.15681-1-alexander.sverdlin@nokia.com>
 <20181130114019.175ab7ec@bbrezillon>
 <f11c7ab4-ee19-ad4e-7943-d6359ac58249@nokia.com>
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

On Mon, 3 Dec 2018 08:03:18 +0000
"Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
wrote:

> Hello Boris!
> 
> On 30/11/2018 11:40, Boris Brezillon wrote:
> >> +		/*
> >> +		 * JESD216 allows to omit particular address length or latency
> >> +		 * specification in the header and at this point they are still
> >> +		 * unset, so we need some heuristics. One example is S25FS128S.
> >> +		 */
> >> +		if (!nor->addr_width)
> >> +			nor->addr_width = 3;
> >> +		if (!nor->read_dummy)
> >> +			nor->read_dummy = 8;
> >> +  
> > Looks like the same problem was reported by Yogesh here [1]. One more  
> 
> This is indeed the same problem, although I was not aware of the [1] discussion.
> 
> > proof that parsing SFDP is not trivial. I mean, what's the point of
> > defining a generic tables to describe NOR capabilities if you then
> > depend on vendor/chip specific init to read those tables...
> > 
> > Anyway, I think this sort of initialization should be placed in a
> > pre_sfdp() fixup hook, as getting the right values likely requires  
> 
> This is still on my TODO list, to learn about new hooks.

->pre_sfdp() does not exist yet, but I'm about to add it for other
reasons, and it looks like a good place to put this sort of
initialization.

> 
> > reading some volatile/non-volatile regs.  
> 
> This is the same instruction 65h which is used to read regs and which
> appears in SMPT headers, it is a chicken-egg problem.

Oh, right, I remember now. Not a smart decision from Spansion :-/.

> 
> Therefore, I don't know if it's possible to provide smarter heuristics
> here.

Maybe:

ref_cr1 = read_CR1_using_RDCR()

for_each_possible_dummy_and_addr_width
	cr1 = read_CR1_using_RDAR()
	if (cr1 == ref_cr1)
		break;


> But without it Spansion S25FS-S Family is now broken by SFDP.

Do you have [1] in your tree? IIRC, this fixed Yogesh issue.

[1]https://patchwork.ozlabs.org/patch/994765/
