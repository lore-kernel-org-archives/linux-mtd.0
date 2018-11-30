Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSgnw-0005j5-7d
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 11:17:54 +0000
Date: Fri, 30 Nov 2018 12:17:30 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris BREZILLON
 <boris.brezillon@free-electrons.com>, Mark Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2 v2] mtd: physmap_of_gemini: Handle pin control
Message-ID: <20181130121730.764f8f01@bbrezillon>
In-Reply-To: <CACRpkdYEp9XUEh=+ivJNMsD_vGRGb0HzDTHZC_O2c2qskTkYiQ@mail.gmail.com>
References: <20181112210729.23580-1-linus.walleij@linaro.org>
 <20181112210729.23580-2-linus.walleij@linaro.org>
 <20181120153602.166842f0@bbrezillon>
 <CACRpkdYEp9XUEh=+ivJNMsD_vGRGb0HzDTHZC_O2c2qskTkYiQ@mail.gmail.com>
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

On Thu, 22 Nov 2018 15:10:47 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Tue, Nov 20, 2018 at 3:36 PM Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> > On Mon, 12 Nov 2018 22:07:29 +0100
> > Linus Walleij <linus.walleij@linaro.org> wrote:
> >  
> > > This enables the complex mapping for the Gemini and kicks in
> > > custom read/write functions that will wrap the existing
> > > simple functions in calls to enable/disable the parallel
> > > flash pins using pin controls.
> > >
> > > This is necessary on some hardware such as the D-Link
> > > DIR-685 where all flash pins are patched in/out at the same
> > > time, but some of the flash pins are in practice unused by
> > > the flash and have anyway been reused as GPIO.
> > >
> > > This concerns specifically CE1 on the Gemini. There is only
> > > one flash chip, so only CE0 is used, and the line for CE1
> > > has been reused as chip select for the emulated SPI port
> > > connected to the display. If we try to use the same lines
> > > for flash and GPIO at the same time, one of them will loose:
> > > the GPIO line will disappear because it gets disconnected
> > > from the pin when the flash group is muxed out.
> > >
> > > Fix this by introducing two pin control states named simply
> > > "enabled" and "disabled" and only enable the flash lines
> > > when absolutely necessary (during read/write/copy). This
> > > way, they are available for GPIO at all other times and
> > > the display works.  
> >
> > Okay, so your GPIOs might be unavailable when the flash is accessed?
> >
> > How does that work in practice? Is CE1 muxed as a GPIO
> > on demand?  
> 
> Yes, well the actual pin will go into the state of CE1
> which default to a low state, the effect is
> hardware-defined.
> 
> This is not a recommendable type of electronics
> engineering if that is what you wonder... it's a way to
> patch over design mistakes in the design with
> software. (Which is what the vendor tree does.)
> 
> In one case (SQ201) the LED connected to them will light up
> since it is active low. So the LED goes on during flash
> access and gives a kind of "flash access flicker" on top
> of whatever it was indicating before.
> 
> That LED is marked "power" and I put a heartbeat on it
> so it will be brief interruptions of steady light in the
> heartbeat. The "only" problem is in UX. The vendor
> device exhibits the same strange behavior.
> 
> > What happens if the flash and SPI bus are
> > accessed at the same time? Do you
> > get -EBUSY? Not sure all MTD users retry when they
> > get -EBUSY...  
> 
> The way I set it up flash access "always win", so
> no worries for MTD.
> 
> If I simulate SPI or any other slow bus on the GPIO
> at the same time as we have muxed it out for
> flash access, it will have to do error recovery,
> because the bytes will not get through.

Do you mean that the GPIO controller does not request the pins it's
using? If it does, the pinctrl framework should complain, when the pins
are already assigned to another dev.

> 
> Ideally I would want to patch the GPIO library to
> redirect the access to this line to enable/disable
> CE1 so the pin is driven from the flash controller
> instead. But since that is essentially an address
> bit it looked pretty tricky.
> 
> In practice the use cases do not overlap, so
> we are fine, I guess if problems still occur the
> path of least resistance would simply be to have the
> display driver using this SPI line delay and
> retry a few times. It's an ugly solution perfectly
> fitting the ugly electronics IMO.

If the flash and SPI bus are never accessed concurrently and things are
controlled from userspace, maybe it's cleaner to bind/unbind devices on
demand, and let each driver mux the conflicting pins as they expect it
to be muxed.
