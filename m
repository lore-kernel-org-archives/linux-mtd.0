Received: from moutng.kundenserver.de ([212.227.17.8])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LRMZj-0001Gg-VV
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2009 08:12:11 +0000
From: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd: Add open firmware GPIO NAND driver
Date: Mon, 26 Jan 2009 09:07:05 +0100
References: <200901251801.52179.matthias.fuchs@esd-electronics.com>
	<20090125192710.GA26917@pengutronix.de>
In-Reply-To: <20090125192710.GA26917@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901260907.05825.matthias.fuchs@esd-electronics.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolfram,

first I thought about adding the device tree code to the platform driver.
But if you look at the code you will see that there are many places where
the drivers differ. Merging my code with the platform driver will bring a lot of #ifdefs
and I do not like that! The identical functions are only a very few lines.

There is also some common code with the ndfc driver :-)

Matthias


On Sunday 25 January 2009 20:27, Wolfram Sang wrote:
> Hello Matthias,
> 
> On Sun, Jan 25, 2009 at 06:01:51PM +0100, Matthias Fuchs wrote:
> > This patch adds a GPIO based nand driver that is configured through
> > the open firmware flat device tree. It's based on the gpio platform
> > nand driver.
> 
> As there are some identical functions in this driver and the original
> platform based driver, I think it will be easier to maintain those
> functions if they are used by both drivers. Do you think it is feasible
> to share the code among those two?
> 
> Kind regards,
> 
>    Wolfram
> 
