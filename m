MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <19364.58488.817538.692599@pilspetsen.it.uu.se>
Date: Sat, 20 Mar 2010 16:06:32 +0100
From: Mikael Pettersson <mikpe@it.uu.se>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD: Fix Orion NAND driver compilation with ARM OABI
In-Reply-To: <1269086286.4028.6039.camel@macbook.infradead.org>
References: <20100320085507.4038.96426.stgit@pauliusz>
	<1269078083.4028.5586.camel@macbook.infradead.org>
	<badfd5ba1003200420xc0680c1h8b4cccd02a8fdaba@mail.gmail.com>
	<1269086286.4028.6039.camel@macbook.infradead.org>
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de, simon.kagstrom@netinsight.net,
	akpm@linux-foundation.org, nico@cam.org,
	linux-arm-kernel@lists.infradead.org, rth@twiddle.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse writes:
 > On Sat, 2010-03-20 at 13:20 +0200, Paulius Zaleckas wrote:
 > > On Sat, Mar 20, 2010 at 11:41 AM, David Woodhouse <dwmw2@infradead.org> wrote:
 > > > On Sat, 2010-03-20 at 10:55 +0200, Paulius Zaleckas wrote:
 > > >> -             uint64_t x;
 > > >> +             /*
 > > >> +              * force x variable to r2/r3 registers since ldrd instruction
 > > >> +              * requires first register to be even.
 > > >> +              */
 > > >> +             register uint64_t x asm ("r2");
 > > >> +
 > > >>               asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base));
 > > >
 > > > Hm, isn't there an asm constraint which will force it into an
 > > > appropriate register pair?
 > > 
 > > Not that I know of...
 > > 
 > > > Failing that, "=&r2,r4,r6,r8" ought to work.
 > > 
 > > No, fails with error: matching constraint not valid in output operand
 > 
 > Hm, crap -- GCC on ARM doesn't let you give specific registers, so that
 > trick doesn't work.

I missed the start of this thread, but looking at orion_nand.c I fail to
see why you'd need to mess with inline asm for reading a sequence of u64
values from an I/O location to an array.

Rewriting that to proper C generates a nice ldrd;strd loop with my gcc-4.4.3.
