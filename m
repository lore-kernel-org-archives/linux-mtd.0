Received: from mail-oa0-f51.google.com ([209.85.219.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViKw5-0005dm-Al
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 09:16:01 +0000
Received: by mail-oa0-f51.google.com with SMTP id i7so1617128oag.38
 for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2013 01:15:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1384438956-31153-3-git-send-email-lee.jones@linaro.org>
References: <1384438956-31153-1-git-send-email-lee.jones@linaro.org>
 <1384438956-31153-3-git-send-email-lee.jones@linaro.org>
Date: Mon, 18 Nov 2013 10:15:36 +0100
Message-ID: <CACRpkdaccxcTfKc-y7rPEH1H3yua3ubLvuvTzWnMs1rOwjiVNw@mail.gmail.com>
Subject: Re: [PATCH 02/10] mtd: st_spi_fsm: Supply all register address and
 bit logic defines
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: angus.clark@st.com, Mark Brown <broonie@linaro.org>,
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

On Thu, Nov 14, 2013 at 3:22 PM, Lee Jones <lee.jones@linaro.org> wrote:

> Here we provide the FSM's register addresses, register bit names/offsets
> and some commands which will prove useful as we start bulk the FMS's
> driver out with functionality.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

OK...

> +/*
> + * FSM SPI Controller Registers
> + */
> +#define SPI_CLOCKDIV                   0x0010
> +#define SPI_MODESELECT                 0x0018
> +#define SPI_CONFIGDATA                 0x0020
(...)

So what we want to know here is whether this is a general-purpose
SPI block, or if it's a special-purpose SPI block that can only be
used for accessing flashes.

If it's the former that part should be broken out into drivers/spi
of course...

But the register map seems a bit special-purpose so it could
very well be that this is for flash control only. So maybe you can
spill some beans from a datasheet here?

A clock divider at offset 0x10 already tells us that this is probably
a PL022 derivate, just that we don't know how much it has
been hacked with... does this thing contain AMBA identifiers
at the end of the IO-region, usually at 0x0fe0 thru 0x0fff?

Yours,
Linus Walleij
