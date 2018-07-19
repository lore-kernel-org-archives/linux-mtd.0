Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgGDw-0001zE-3V
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 21:12:36 +0000
Date: Thu, 19 Jul 2018 23:12:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: make subop helpers return unsigned values
Message-ID: <20180719231214.141c66b9@xps13>
In-Reply-To: <20180719004335.3f92a927@bbrezillon>
References: <20180718220912.7758-1-miquel.raynal@bootlin.com>
 <20180719003134.3512f18e@bbrezillon>
 <20180719004211.4829aa8a@xps13>
 <20180719004335.3f92a927@bbrezillon>
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


> > > > A report from Colin Ian King pointed a CoverityScan issue where error
> > > > values on these helpers where not checked in the drivers. These
> > > > helpers can error out only in case of a software bug in driver code,
> > > > not because of a runtime/hardware error. Hence, let's WARN_ON() in this
> > > > case and return 0 which is harmless anyway.
> > > > 
> > > > Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> > > > Cc: stable@vger.kernel.org      
> > > 
> > > Is it really worth backporting this patch? I mean, the bug does not
> > > exist, it's just a potential problem that can only arise when
> > > drivers/core are buggy, which AFAICT is not the case yet :-).    
> > 
> > Ok, I'll remove the Cc: stable tag but I guess I can keep the Fixes
> > one.  
> 
> Sure.

Applied to nand/next without the cc:stable tag.
 

-- 
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
