Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7hbJ-0004P3-3R
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 13:54:06 +0000
Received: by mail-lj1-x244.google.com with SMTP id u21-v6so5180693lja.8
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 06:53:54 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH] mtd: rawnand: ams-delta: use ->exec_op()
Date: Wed, 03 Oct 2018 15:55:25 +0200
Message-ID: <4278198.vlhjLe5TOR@z50>
In-Reply-To: <20181003143054.597b3a9e@bbrezillon>
References: <20180719081508.5dafebde@bbrezillon>
 <20181003120028.9257-1-jmkrzyszt@gmail.com>
 <20181003143054.597b3a9e@bbrezillon>
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

On Wednesday, October 3, 2018 2:30:54 PM CEST Boris Brezillon wrote:
> Hi Janusz,
> 
> On Wed,  3 Oct 2018 14:00:28 +0200
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> 
> > Replace legacy callbacks with ->select_chip() and ->exec_op().
> 
> Thanks for working on that, that's really appreciated.
> 
> > 
> > Implementation of NAND_OP_WAITRDY_INSTR has been based on legacy
> > nand_wait_ready(),
> 
> I don't remember what the ams-delta ->dev_ready()/->waitfunc() hooks
> are doing, but is shouldn't be too hard to replace them by an
> ams_delta_wait_ready() func.

Default nand_wait() is used as ->waitfunc(), and ->dev_ready() returns R/B 
GPIO pin status.

> > otherwise that function would probabaly have to be
> 
> 				^ probably

Do you think other drivers which now provide ->dev_ready() won't require 
reimplementation of nand_wait_ready()?

> > reimplemented inside the driver.  Hence, legacy callback ->dev_ready()
> > is still used.
> > 
> > Use of IO_ADDR_R and IO_ADDR_W legacy structure members will be dropped
> > later, as soon as the driver is converted to use GPIO API for data I/O.
> 
> In the meantime, can you move the iomem pointer to the ams_delta
> private struct so that this driver no longer uses the ->IO_ADDR_R/W
> fields?

OK

> > 
> > Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > ---
> > Hi,
> > 
> > I've not tested the change on hardware yet as I'm not sure if:
> > - handling of NCE limited to that inside ->select_chip() is
> >   sufficient,
> 
> I think it is.
> 
> > - releasing ALE / CLE immediately after ams_delta_write_buf() is
> >   correct.
> 
> Well, you should probably consider waiting for instr->ctx.delay_ns
> nanoseconds after each instruction, but, if it was working before the
> conversion to ->exec_op(), it should work just fine now.

OK, I'll give it a try.

Thanks,
Janusz
