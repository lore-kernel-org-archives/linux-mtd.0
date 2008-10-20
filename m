Subject: Re: goofy mtd m25p80 patches in GIT ...
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200810191535.05617.david-b@pacbell.net>
References: <200810191535.05617.david-b@pacbell.net>
Content-Type: text/plain
Date: Mon, 20 Oct 2008 08:40:03 +0100
Message-Id: <1224488403.6770.1517.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Chen Gong <g.chen@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2008-10-19 at 15:35 -0700, David Brownell wrote:
> [resend cc'ing linux-mtd, sorry]
> 
> I noticed a couple goofy patches in MTD GIT, while poking around
> wondering what happened to some patches that I expected would
> already have gotten upstream.  Details below.

Did you find the patches you expected to be going upstream?

> First:
> 
>  http://git.kernel.org/?p=linux/kernel/git/dwmw2/mtd-2.6.git;a=commitdiff;h=faff37508a104e9ec5285d5adecaab7e8dde472a
> 
> That patch is goofy because the command in question is *NOT* a block
> erase command.  It's a chip-erase command ... entirely unlike the
> existing *real* block erase commands used in the driver.
> 
> Could we get a fix that provides the correct name for the operations?
> Having real block commands, and this new thing, is at the very least
> confusing...

Makes sense. Chen Gong?

> 
> Second:
> 
>  http://git.kernel.org/?p=linux/kernel/git/dwmw2/mtd-2.6.git;a=commitdiff;h=75d0ee2202b5740e94e913d8a52f91c6557c4c81
> 
> That's just plain wrong ... the original code is correct, but the
> patch changed it to be incorrect.  (DMA from the stack is never
> legal.)

Ah, so spi_write() uses DMA, but spi_write_then_read() does not? 
Not entirely intuitive :)

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
