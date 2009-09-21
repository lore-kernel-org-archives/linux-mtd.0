Subject: Re: [patch 02/13] mtd: SST25L (non JEDEC) SPI Flash driver
From: David Woodhouse <dwmw2@infradead.org>
To: Ryan Mallon <ryan@bluewatersys.com>
In-Reply-To: <4AB6F1FC.6070302@bluewatersys.com>
References: <200909181951.n8IJpeq1023467@imap1.linux-foundation.org>
	<1253380972.6317.22.camel@macbook.infradead.org>
	<4AB6F1FC.6070302@bluewatersys.com>
Content-Type: text/plain
Date: Sun, 20 Sep 2009 23:08:53 -0700
Message-Id: <1253513333.6317.230.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linus.walleij@stericsson.com, andre@bluewatersys.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	avorontsov@ru.mvista.com, hartleys@visionengravers.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-09-21 at 15:24 +1200, Ryan Mallon wrote:
> David Woodhouse wrote:
> >
> >  while (busy) {
> >     if (timed_out) return -ETIMEDOUT;
> >     cond_resched();
> >  }
> > 
> 
> Okay, makes sense. I'm a bit busy at the moment, but I'll try and post a
> fix in the next couple of days. Is the patch still going to be merged as
> is, or are you waiting on a fix for this?

I've merged it already; a few days for a fix is fine. Thanks.

> The function above is based on the one of the same name from
> drivers/mtd/devices/m25p80.c, so that should also be changed? There are
> possibly other mtd drivers which also have this construct.

Hm, yes. I try to look out for this stuff but sometimes I miss it.

-- 
dwmw2
