Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g842W-0007kn-SM
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 13:51:47 +0000
Received: by mail-lj1-x244.google.com with SMTP id p89-v6so8463964ljb.3
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 06:51:30 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH] mtd: rawnand: ams-delta: use ->exec_op()
Date: Thu, 04 Oct 2018 15:52:57 +0200
Message-ID: <7546835.d2Xs8Qh0bZ@z50>
In-Reply-To: <20181003160634.147dd95c@bbrezillon>
References: <20180719081508.5dafebde@bbrezillon> <4278198.vlhjLe5TOR@z50>
 <20181003160634.147dd95c@bbrezillon>
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

Hi Boris,

On Wednesday, October 3, 2018 4:06:34 PM CEST Boris Brezillon wrote:
> On Wed, 03 Oct 2018 15:55:25 +0200
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
>   
> > > > 
> > > > Implementation of NAND_OP_WAITRDY_INSTR has been based on legacy
> > > > nand_wait_ready(),  
> > > 
> > > I don't remember what the ams-delta ->dev_ready()/->waitfunc() hooks
> > > are doing, but is shouldn't be too hard to replace them by an
> > > ams_delta_wait_ready() func.  
> > 
> > Default nand_wait() is used as ->waitfunc(), and ->dev_ready() returns R/B 
> > GPIO pin status.
> 
> Okay. Then it might make sense to provide a generic helper to poll a
> gpio.
> 
> void nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod)
> {
> 	...
> }

How about a still more generic helper which accepts dev_ready() callback as an 
argument?

Thanks,
Janusz
