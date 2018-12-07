Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVC9t-0001UH-Ay
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:11:12 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [2/2,v3] mtd: physmap_of_gemini: Handle pin control
Date: Fri,  7 Dec 2018 10:10:42 +0100
Message-Id: <20181207091042.17167-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181127205358.32502-2-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2018-11-27 at 20:53:58 UTC, Linus Walleij wrote:
> This enables the complex mapping for the Gemini and kicks in
> custom read/write functions that will wrap the existing
> simple functions in calls to enable/disable the parallel
> flash pins using pin controls.
> 
> This is necessary on some hardware such as the D-Link
> DIR-685 where all flash pins are patched in/out at the same
> time, but some of the flash pins are in practice unused by
> the flash and have anyway been reused as GPIO.
> 
> This concerns specifically CE1 on the Gemini. There is only
> one flash chip, so only CE0 is used, and the line for CE1
> has been reused as chip select for the emulated SPI port
> connected to the display. If we try to use the same lines
> for flash and GPIO at the same time, one of them will loose:
> the GPIO line will disappear because it gets disconnected
> from the pin when the flash group is muxed out.
> 
> Fix this by introducing two pin control states named simply
> "enabled" and "disabled" and only enable the flash lines
> when absolutely necessary (during read/write/copy). This
> way, they are available for GPIO at all other times and
> the display works.
> 
> Collect all the state variables in a struct named
> struct gemini_flash and allocate this struct at probe
> time.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
