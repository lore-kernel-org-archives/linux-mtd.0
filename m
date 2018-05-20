MIME-Version: 1.0
In-Reply-To: <3505791.x6nWYTo8eb@z50>
References: <20180518210954.29044-1-jmkrzyszt@gmail.com>
 <5456625.lDWjtgZygK@z50>
 <CAHp75Ved2nw1JKnXT2Jxnw4XLsby1eVJU6cfBjE2sp4LP4Kwmg@mail.gmail.com>
 <3505791.x6nWYTo8eb@z50>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 20 May 2018 19:17:04 +0300
Message-ID: <CAHp75Vdp5A58JMTf8vaET84QEzzZ_T7eKLUYfWV9qpWt5ptYCA@mail.gmail.com>
Subject: Re: [PATCH 5/6] mtd: rawnand: ams-delta: use GPIO lookup table
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Mark Brown <broonie@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Richard Weinberger <richard@nod.at>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-input <linux-input@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 linux-fbdev@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 20, 2018 at 6:37 PM, Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> On Sunday, May 20, 2018 4:44:31 PM CEST Andy Shevchenko wrote:

>> Though, I completely dislike "rdy" name of GPIO. Where is it documented?
>
> No documentation files for Amstrad Delta nor for its NAND driver specifically
> exist under Documentation/. However, there exist some for generic GPIO NAND
> driver where the pin name "rdy" is used explicitly:
> Documentation/driver-api/gpio/drivers-on-gpio.rst
> Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> You can find that mnemonic used across drivers/mtd/nand/, standalone or as a
> suffix, including the Amstrad Delta NAND driver before the change discussed.

> To be honest, I don't like it much either, but I'm just using it instead of
> inventing something new.

OK, that's what I was looking for. Since it's already in use and
documented, then it's fine for me.

-- 
With Best Regards,
Andy Shevchenko
