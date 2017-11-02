Date: Thu, 2 Nov 2017 17:12:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Mark Rutland
 <mark.rutland@arm.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Russell King
 <linux@arm.linux.org.uk>, Jonathan Austin <jonathan.austin@arm.com>, Arnd
 Bergmann <arnd@arndb.de>, Mason <slash.tmp@free.fr>, Peter Zijlstra
 <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>, Michael
 Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Douglas Anderson
 <dianders@chromium.org>, Kevin Hilman <khilman@kernel.org>, John Stultz
 <john.stultz@linaro.org>, linux-mtd@lists.infradead.org, Thomas Gleixner
 <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo
 Molnar <mingo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] Improving udelay/ndelay on platforms where that is possible
Message-ID: <20171102171213.6449268c@bbrezillon>
In-Reply-To: <20171101194822.hd76z7zjazlqbsmy@tarshish>
References: <d3f42f35-8175-58f6-78b7-3331efe64da2@sigmadesigns.com>
 <20171101175325.2557ce85@alans-desktop>
 <4b707ce0-6067-ab36-e167-1acf348d26bf@free.fr>
 <20171101194822.hd76z7zjazlqbsmy@tarshish>
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

On Wed, 1 Nov 2017 21:48:22 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Marc,
> 
> On Wed, Nov 01, 2017 at 08:03:20PM +0100, Marc Gonzalez wrote:
> > On 01/11/2017 18:53, Alan Cox wrote:   
> > > For that matter given the bad blocks don't randomly change why not cache
> > > them ?  
> > 
> > That's a good question, I'll ask the NAND framework maintainer.
> > Store them where, by the way? On the NAND chip itself?  
> 
> Yes. In the bad block table (bbt). See drivers/mtd/nand/nand_bbt.c.

Yes, you can cache this information in a bad block table stored on the
flash. But still, the ndelay()/udelay() problem remains: reading the
out-of-band area of each eraseblock to re-create the bad block table is
just one use case. This ndelay() is something you can have on all kind
of read/write operations. As Thomas Gleixner stated, this is not really
needed on modern NAND controllers which take care of various
timing constraints internally, but still, we have some controllers
that are not that smart, and we have to support them.

I'm not concerned about performances here, and if I'm told that we
should turn all ndelay() calls into usleep_range() ones, then I'm
perfectly fine with that, but I need a guarantee that when I say "I
want to wait at least X ns/us", the function does not return before
that time has expired.

Not sure if that would work, but maybe we could create a wrapper like

void nand_ndelay(unsigned long nanoseconds)
{
	ktime_t end = ktime_add_ns(ktime_get(), nanoseconds);

	do {
		ndelay(nanoseconds);
	} while (ktime_before(ktime_get(), end));
}
