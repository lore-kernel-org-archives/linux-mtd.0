Received: from mail-ob0-f179.google.com ([209.85.214.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViPlN-0003xy-03
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 14:25:17 +0000
Received: by mail-ob0-f179.google.com with SMTP id wm4so1479724obc.10
 for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2013 06:24:52 -0800 (PST)
Date: Mon, 18 Nov 2013 14:24:47 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 02/10] mtd: st_spi_fsm: Supply all register address and
 bit logic defines
Message-ID: <20131118142447.GJ13640@lee--X1>
References: <1384438956-31153-1-git-send-email-lee.jones@linaro.org>
 <1384438956-31153-3-git-send-email-lee.jones@linaro.org>
 <CACRpkdaccxcTfKc-y7rPEH1H3yua3ubLvuvTzWnMs1rOwjiVNw@mail.gmail.com>
 <20131118093229.GB13640@lee--X1>
 <20131118133940.GC14306@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131118133940.GC14306@sirena.org.uk>
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

> On Mon, Nov 18, 2013 at 09:32:29AM +0000, Lee Jones wrote:
> 
> > I've actually travelled down the route of separating the SPI
> > Controller parts to drivers/spi. It's possible to do that and perhaps
> > we could then use the generic m25p80 Serial Flash driver as the
> > back-end, but it would be incredibly complicated and would mean we'd
> > need to duplicate almost all of the m25p80 driver into the SPI
> > Controller. The Falcon SPI driver tried to do something similar, but
> > now looks broken due to some incompatible changes in m25p80. We also
> > want to avoid putting ourselves in that position of fragility.
> 
> What I've said to people doing similar drivers before is that it seems
> like there should be an abstraction added in the MTD framework for SPI
> flash controllers like this is that if there is genunie flash-specific
> stuff going on then the mp25p80 driver ought to be split so that the
> code that understands what commands to send to the flash chip is split
> out from the code that actually sends those commands to the chip.  The
> existing SPI support would then be a function driver for this.  This
> would mean we don't need to support the flash chips multiple times.

Actually, there isn't much duplication. We reuse a subset of the
device table, but even that is extended for our use-case. The majority
of the code is setting up the register configs for every given
operation we issue on the controller. There are some parts which
'could' be bent in such a way that they could be abstracted, but not
much.

For example, we have thought about inserting a layer which handles the
type of communication that'll be utilised i.e. true SPI, or our
bespoke FSM implementation for instance. This would enable us to issue
serial_flash_write(), serial_flash_write_then_read(), ... in the m25p80
driver and not care which protocol is used. However, in reality this
won't really save a great deal of code - not in our case at least.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
