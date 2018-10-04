Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g84AL-00024R-2c
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 14:00:42 +0000
Date: Thu, 4 Oct 2018 15:59:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: ams-delta: use ->exec_op()
Message-ID: <20181004155933.0a32c4ac@bbrezillon>
In-Reply-To: <7546835.d2Xs8Qh0bZ@z50>
References: <20180719081508.5dafebde@bbrezillon> <4278198.vlhjLe5TOR@z50>
 <20181003160634.147dd95c@bbrezillon> <7546835.d2Xs8Qh0bZ@z50>
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

On Thu, 04 Oct 2018 15:52:57 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Hi Boris,
> 
> On Wednesday, October 3, 2018 4:06:34 PM CEST Boris Brezillon wrote:
> > On Wed, 03 Oct 2018 15:55:25 +0200
> > Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> >     
> > > > > 
> > > > > Implementation of NAND_OP_WAITRDY_INSTR has been based on legacy
> > > > > nand_wait_ready(),    
> > > > 
> > > > I don't remember what the ams-delta ->dev_ready()/->waitfunc() hooks
> > > > are doing, but is shouldn't be too hard to replace them by an
> > > > ams_delta_wait_ready() func.    
> > > 
> > > Default nand_wait() is used as ->waitfunc(), and ->dev_ready() returns R/B 
> > > GPIO pin status.  
> > 
> > Okay. Then it might make sense to provide a generic helper to poll a
> > gpio.
> > 
> > void nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod)
> > {
> > 	...
> > }  
> 
> How about a still more generic helper which accepts dev_ready() callback as an 
> argument?

Nope, I still prefer the GPIO based one. We'll see if others need a
a more generic helper, but I doubt it.
