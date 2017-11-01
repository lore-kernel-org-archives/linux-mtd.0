Date: Wed, 1 Nov 2017 21:48:22 +0200
From: Baruch Siach <baruch@tkos.co.il>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 Mark Rutland <mark.rutland@arm.com>, Mason <slash.tmp@free.fr>,
 Russell King <linux@arm.linux.org.uk>,
 Jonathan Austin <jonathan.austin@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kevin Hilman <khilman@kernel.org>, Will Deacon <will.deacon@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Douglas Anderson <dianders@chromium.org>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Ingo Molnar <mingo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC] Improving udelay/ndelay on platforms where that is possible
Message-ID: <20171101194822.hd76z7zjazlqbsmy@tarshish>
References: <d3f42f35-8175-58f6-78b7-3331efe64da2@sigmadesigns.com>
 <20171101175325.2557ce85@alans-desktop>
 <4b707ce0-6067-ab36-e167-1acf348d26bf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b707ce0-6067-ab36-e167-1acf348d26bf@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marc,

On Wed, Nov 01, 2017 at 08:03:20PM +0100, Marc Gonzalez wrote:
> On 01/11/2017 18:53, Alan Cox wrote: 
> > For that matter given the bad blocks don't randomly change why not cache
> > them ?
> 
> That's a good question, I'll ask the NAND framework maintainer.
> Store them where, by the way? On the NAND chip itself?

Yes. In the bad block table (bbt). See drivers/mtd/nand/nand_bbt.c.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
