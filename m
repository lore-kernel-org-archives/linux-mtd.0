Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7hnc-0000x7-Nq
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 14:06:51 +0000
Date: Wed, 3 Oct 2018 16:06:34 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: ams-delta: use ->exec_op()
Message-ID: <20181003160634.147dd95c@bbrezillon>
In-Reply-To: <4278198.vlhjLe5TOR@z50>
References: <20180719081508.5dafebde@bbrezillon>
 <20181003120028.9257-1-jmkrzyszt@gmail.com>
 <20181003143054.597b3a9e@bbrezillon> <4278198.vlhjLe5TOR@z50>
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

On Wed, 03 Oct 2018 15:55:25 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
  
> > > 
> > > Implementation of NAND_OP_WAITRDY_INSTR has been based on legacy
> > > nand_wait_ready(),  
> > 
> > I don't remember what the ams-delta ->dev_ready()/->waitfunc() hooks
> > are doing, but is shouldn't be too hard to replace them by an
> > ams_delta_wait_ready() func.  
> 
> Default nand_wait() is used as ->waitfunc(), and ->dev_ready() returns R/B 
> GPIO pin status.

Okay. Then it might make sense to provide a generic helper to poll a
gpio.

void nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod)
{
	...
}

> 
> > > otherwise that function would probabaly have to be  
> > 
> > 				^ probably  
> 
> Do you think other drivers which now provide ->dev_ready() won't require 
> reimplementation of nand_wait_ready()?

It depends. I mean, most controllers support native R/B sensing, and in
case they do actually require you to poll the RB pin status, duplicating
the wait_ready() logic shouldn't be a problem. On the other hand, I
really want to get rid of ->dev_ready().
