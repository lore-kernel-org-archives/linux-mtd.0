Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSkVC-0003zw-OR
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 15:14:48 +0000
Received: by mail-lj1-x242.google.com with SMTP id l15-v6so5292921lja.9
 for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2018 07:14:35 -0800 (PST)
MIME-Version: 1.0
References: <20181112210729.23580-1-linus.walleij@linaro.org>
 <20181112210729.23580-2-linus.walleij@linaro.org>
 <20181120153602.166842f0@bbrezillon>
 <CACRpkdYEp9XUEh=+ivJNMsD_vGRGb0HzDTHZC_O2c2qskTkYiQ@mail.gmail.com>
 <20181130121730.764f8f01@bbrezillon>
In-Reply-To: <20181130121730.764f8f01@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Nov 2018 16:14:20 +0100
Message-ID: <CACRpkdYoCG2oqDiFh5hcsLugLOeVwnouDj-u-qgdr8HwmZ_dXg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] mtd: physmap_of_gemini: Handle pin control
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Mark Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 30, 2018 at 12:17 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Thu, 22 Nov 2018 15:10:47 +0100 Linus Walleij <linus.walleij@linaro.org> wrote:

> Do you mean that the GPIO controller does not request the pins it's
> using? If it does, the pinctrl framework should complain, when the pins
> are already assigned to another dev.

That depends on whether the pin controller is "strict" or
not. Several pin controllers actually allow the pin to be used
for some device and GPIO at the same time.

Gemini is not strict, there is a field in struct pinmux_ops
that controls strictness and this depends on the hardware
and use cases.

I would prefer if the world was simpler, but sadly hardware
engineers doing this kind of stuff don't know what that
means.

> If the flash and SPI bus are never accessed concurrently and things are
> controlled from userspace, maybe it's cleaner to bind/unbind devices on
> demand, and let each driver mux the conflicting pins as they expect it
> to be muxed.

These are in-kernel use cases.

The problem is not entirely new: if we want a pin
to be absolutely exclusively under control of a certain
hardware block, or even another CPU, we use a hardware
semaphore, see for example how STM32 does it:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=devel&id=97cfb6cd34f2a3dab03dce5f885333c213bbec8a

The same can of course be done using software, somehow,
with something like a global mutex that the SPI host and MTD
need to take respectively. (I imagine this would be retrieved as
a resource like any other like regulator, clock etc).

However implementing that when there isn't even a clash in
reality, just in theory, and only if I construct specific test programs
to make this happen ... I dunno it's just a bit overly ambitious.
This router is already working fine, so...

Yours,
Linus Walleij
