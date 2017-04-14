Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz908-000135-Mn
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 21:43:34 +0000
Message-ID: <1492206032.25766.7.camel@kernel.crashing.org>
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Marek Vasut <marek.vasut@gmail.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>
Date: Sat, 15 Apr 2017 07:40:32 +1000
In-Reply-To: <6f7f424c-2a3f-4b6d-f7aa-bfae749de0b3@gmail.com>
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-11-git-send-email-clg@kaod.org>
 <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
 <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
 <6f7f424c-2a3f-4b6d-f7aa-bfae749de0b3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2017-04-14 at 18:18 +0200, Marek Vasut wrote:
> > Here is a proposal. We could activate this algo using a property such
> > as :
> >   
> >        "speed-mode" = "freq" or "auto-adjust"
> > 
> > How's that ? 
> 
> Thinking about it a bit more, I think having a module parameter is the
> right approach here ... or maybe compile-time switch. This shouldn't be
> in DT as it's not HW property.

Strong disagreement here :-)

DT is not *strictly* HW properties. Never was despite what some
fanatics around might say :-) Its also platform properties and can
include policies.

We put things like UART speeds in there, MAC addresses, etc... it makes
sense to put calibration info and in this case, request to perform SW
calibration.

Module parameters are crap. They are a major pain to use, they are in
practice only good for tweaking/experimenting.

Ben.
