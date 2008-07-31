Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
Content-Type: text/plain
Date: Thu, 31 Jul 2008 08:33:03 +0100
Message-Id: <1217489583.3454.36.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: trimarchimichael@yahoo.it, jwboyer@gmail.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-07-30 at 15:39 -0700, David Brownell wrote:
> > This patch will probably break all sorts of things because that buffer is
> > &*large*: up to half a meg.
> >
> > So this patch isn't mergeable.  I'll hang onto it to bug dmwm2 with when he
> > reincarnates.
> 
> I'm still asking whether MTD folk have any plans to make that stack DMA-safe...
> more than just the SPI flash drivers (mtd_dataflash, m25p80) could benefit
> from DMA support, so I'd hope it's at least being considered.
> 
> If the answer is "no" then (a) the MTD interface specs need to finally say
> they pass DMA-unsafe addresses, and (b) those SPI flash drivers are going
> to need updates.

Yes. We're planning to change the API so it looks a lot more like the
block layer, and a lot less like the one we inherited from PCMCIA in the
1990s. One of the design considerations we've spoken about has been the
fact that we want to make DMA work properly. 

-- 
dwmw2
