Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g84Kd-0006ne-Dx
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 14:10:25 +0000
Received: by mail-lf1-x142.google.com with SMTP id o21-v6so6905646lfe.0
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 07:10:12 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: ams-delta: use ->exec_op()
Date: Thu, 04 Oct 2018 16:11:42 +0200
Message-ID: <38470936.GRFaOSl3cF@z50>
In-Reply-To: <20181004155933.0a32c4ac@bbrezillon>
References: <20180719081508.5dafebde@bbrezillon> <7546835.d2Xs8Qh0bZ@z50>
 <20181004155933.0a32c4ac@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, October 4, 2018 3:59:33 PM CEST Boris Brezillon wrote:
> On Thu, 04 Oct 2018 15:52:57 +0200
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> 
> > Hi Boris,
> > 
> > On Wednesday, October 3, 2018 4:06:34 PM CEST Boris Brezillon wrote:
> > > On Wed, 03 Oct 2018 15:55:25 +0200
> > > Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> > >     
> > > > > > 
> > > > > > Implementation of NAND_OP_WAITRDY_INSTR has been based on legacy
> > > > > > nand_wait_ready(),    
> > > > > 
> > > > > I don't remember what the ams-delta ->dev_ready()/->waitfunc() hooks
> > > > > are doing, but is shouldn't be too hard to replace them by an
> > > > > ams_delta_wait_ready() func.    
> > > > 
> > > > Default nand_wait() is used as ->waitfunc(), and ->dev_ready() returns 
R/B 
> > > > GPIO pin status.  
> > > 
> > > Okay. Then it might make sense to provide a generic helper to poll a
> > > gpio.
> > > 
> > > void nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod)
> > > {
> > > 	...
> > > }  
> > 
> > How about a still more generic helper which accepts dev_ready() callback 
as an 
> > argument?
> 
> Nope, I still prefer the GPIO based one. We'll see if others need a
> a more generic helper, but I doubt it.

OK.

Legacy nand_wait_ready() uses a hardcoded timeout value of 400 ms.   Should we 
follow the same approach in nand_gpio_waitrdy(), or should we rather let 
drivers pass the timeout value, like in case of nand_soft_waitrdy()?

Thanks,
Janusz
