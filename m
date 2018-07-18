Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffvAg-0002FN-TT
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 22:43:48 +0000
Date: Thu, 19 Jul 2018 00:43:35 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: make subop helpers return unsigned values
Message-ID: <20180719004335.3f92a927@bbrezillon>
In-Reply-To: <20180719004211.4829aa8a@xps13>
References: <20180718220912.7758-1-miquel.raynal@bootlin.com>
 <20180719003134.3512f18e@bbrezillon>
 <20180719004211.4829aa8a@xps13>
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

On Thu, 19 Jul 2018 00:42:58 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
> 00:31:34 +0200:
> 
> > On Thu, 19 Jul 2018 00:09:12 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > A report from Colin Ian King pointed a CoverityScan issue where error
> > > values on these helpers where not checked in the drivers. These
> > > helpers can error out only in case of a software bug in driver code,
> > > not because of a runtime/hardware error. Hence, let's WARN_ON() in this
> > > case and return 0 which is harmless anyway.
> > > 
> > > Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> > > Cc: stable@vger.kernel.org    
> > 
> > Is it really worth backporting this patch? I mean, the bug does not
> > exist, it's just a potential problem that can only arise when
> > drivers/core are buggy, which AFAICT is not the case yet :-).  
> 
> Ok, I'll remove the Cc: stable tag but I guess I can keep the Fixes
> one.

Sure.
