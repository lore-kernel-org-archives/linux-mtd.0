Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmP3m-0006BV-M8
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2018 19:51:28 +0000
Date: Sun, 5 Aug 2018 21:51:10 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mike Dunn <mikedunn@newsguy.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Remove docg4
Message-ID: <20180805215110.7464488a@bbrezillon>
In-Reply-To: <87effc1vck.fsf@belgarion.home>
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
 <87effc1vck.fsf@belgarion.home>
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

Hi Robert,

On Sun, 05 Aug 2018 21:12:11 +0200
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Boris Brezillon <boris.brezillon@bootlin.com> writes:
> 
> > The diskonchip G4 driver does not fit very well in the raw/parallel
> > NAND framework simply because such chips have an internal controller
> > translating DoC-specific commands into NAND ones.
> >
> > Keeping such a driver in the raw NAND framework is a real burden for
> > NAND maintainers.  
> Hi Boris,
> 
> I understand the "burden" part, yet we all have our burdens as old code
> maintainers.

Well, we have plenty of old drivers to maintain, but this one clearly
stands out in that it should never have been interfaced with the NAND
framework (the docg4 command set is completely different from the
parallel NAND command set). Note that you did not put docg3 in the NAND
framework, and after looking at the driver and the spec, I think you
were right, because docg3/4 clearly did (and do) not fit in the NAND
framework.

> But still, you're going to remove a working driver from one of my
> platforms. This is not something I'm really happy about.

I wouldn't be so prompt at saying the driver works, this patch says the
opposite [1], and it's apparently not something that has been broken
recently.

> 
> At least, I'd like to hear from Mike that he doesn't use this anymore.

I'd also like to hear back from Sergey (who posted [1]). As I said in my
RFC, I'm not opposed to keeping support for docg4 as long as it goes
out of drivers/mtd/nand/raw, either by being merged with the docg3
driver (whose reg layout looks surprisingly similar) or be being
interfaced with the recently introduced bus agnostic NAND layer.
But if nobody shows interest in helping me getting this driver
reworked the proper way, I'm not willing to keep it. 

Regards,

Boris

[1]https://lore.kernel.org/patchwork/patch/960428/
