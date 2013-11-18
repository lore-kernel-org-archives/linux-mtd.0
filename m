Received: from mail-oa0-f52.google.com ([209.85.219.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViSgb-00014K-8O
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 17:32:33 +0000
Received: by mail-oa0-f52.google.com with SMTP id h16so1480708oag.25
 for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2013 09:32:09 -0800 (PST)
Date: Mon, 18 Nov 2013 17:32:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 02/10] mtd: st_spi_fsm: Supply all register address and
 bit logic defines
Message-ID: <20131118173201.GP13640@lee--X1>
References: <20131118093229.GB13640@lee--X1>
 <20131118133940.GC14306@sirena.org.uk>
 <20131118142447.GJ13640@lee--X1>
 <20131118144512.GB24408@sirena.org.uk>
 <20131118145614.GM13640@lee--X1>
 <20131118151651.GE24408@sirena.org.uk>
 <20131118153110.GN13640@lee--X1>
 <20131118154137.GA28334@sirena.org.uk>
 <20131118160226.GO13640@lee--X1>
 <20131118172243.GO2674@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131118172243.GO2674@sirena.org.uk>
Cc: angus.clark@st.com, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Nov 2013, Mark Brown wrote:

> On Mon, Nov 18, 2013 at 04:02:26PM +0000, Lee Jones wrote:
> > On Mon, 18 Nov 2013, Mark Brown wrote:
> 
> > > Like I say I'm suggesting that the bit of the code that understands the
> > > flash chip is separate to the bit of code that knows the mechanics of
> > > sending commands and data to the chip.
> 
> > The issue is that almost the entire driver is controller side. The
> > only bits that are the same (and not in all cases) are the OPCODEs,
> > but they are one liners (21 lines out of 1153). Most of the
> > controllers which use this stuff could reuse quite a bit of the m25p80
> > driver as they just write the message containing the OPCODE as the
> > m25p80 driver sets it up, but that's simply not the case with our
> > controller. We would have to pull the OPCODE out and based on which
> > one it is, we'd have to build our own message.
> 
> OK, so then perhaps the abstraction here is simply to export the table
> with the opcodes from the m25p80 driver so that when someone comes along
> and adds a new chip they can just add it there and other drivers will
> get the update too.

We could do that, although I'd have to insist on extending the current
framework to add a configuration call-back, as it's the neatest way to
configure chip specific attributes.

I can get a patch out tomorrow if the MTD guys agree. Where are they
by the way? I haven't seen hide nor hair of them since sending out the
patch set.

> > Put it this way, if we tried to use the m25p80 our controller driver
> > would most likely be twice as large and twice as complex as it is
> > currently, which is exactly the inverse of what we're trying to
> > achieve here.
> 
> If we're having to add new flashes to multiple drivers I'd not say we're
> winning.

I agree.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
