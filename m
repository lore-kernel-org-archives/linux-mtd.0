Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRBLJ-0006pu-4W
 for linux-mtd@lists.infradead.org; Sat, 22 Mar 2014 02:07:25 +0000
Received: by mail-pd0-f177.google.com with SMTP id y10so3008298pdj.8
 for <linux-mtd@lists.infradead.org>; Fri, 21 Mar 2014 19:07:03 -0700 (PDT)
Date: Fri, 21 Mar 2014 18:59:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: fix byte addressing on 16-bit wide devices
Message-ID: <20140322015931.GB29542@ld-irv-0074>
References: <CALnQHM3PJCzB86S65TmKE14_HY7DxwVgtXAOcphrGcCJ4t24GQ@mail.gmail.com>
 <20140321180547.GA11793@arch.cereza>
 <CACwUX0PQP21PuSbQn6AvisaZuug9=JTwM3QoG5mXy54r6-tXCg@mail.gmail.com>
 <20140321185446.GA18141@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140321185446.GA18141@arch.cereza>
Cc: David Mosberger-Tang <davidm@egauge.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 21, 2014 at 03:54:46PM -0300, Ezequiel Garcia wrote:
> (Ccing Brian and Uwe)

Thanks for the heads up. Probably would have read it anyway, but you
never know :)

> Brian: Related to this, the current code for fixing READID on 16-bit devices
> seem to apply *only* for drivers that don't override cmdfunc(), right?
> So each of the drivers that have their cmdfunc() currently need some
> tweak to support 16-bit devices.

I think I fixed up all current in-tree drivers that override cmdfunc()
(and David's newer patch fixes the remaining opcodes). Whether they need
a tweak or not depends on how their hardware handles addressing for x16.
For some, they need to selectively convert some byte addresses to word
addresses. But for others, the hardware might take care of the
addressing.

Brian
