MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20140802020617.GS3711@ld-irv-0074>
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
 <1398657227-20721-4-git-send-email-b32955@freescale.com>
 <20140730050843.GE11952@brian-ubuntu>
 <20140730064413.GA15547@shldeISGChi005.sh.intel.com>
 <20140730074500.GF11952@brian-ubuntu>
 <20140730104607.GQ17528@sirena.org.uk>
 <20140802020617.GS3711@ld-irv-0074>
Date: Sat, 2 Aug 2014 11:09:09 +0200
Message-ID: <CAMuHMdWxzKG1TTUVgYqfRP0Prp85HPwVxH7NQp7S-pNeLfFqjA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] mtd: spi-nor: add DDR quad read support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie.huang@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 2, 2014 at 4:06 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jul 30, 2014 at 11:46:07AM +0100, Mark Brown wrote:
>> On Wed, Jul 30, 2014 at 12:45:00AM -0700, Brian Norris wrote:
>> > On Wed, Jul 30, 2014 at 02:44:13PM +0800, Huang Shijie wrote:
>> > > IMHO, the DDR modes can _NOT_ be handled by the driver/spi/*.
>>
>> > I agree to some extent, but I wanted to confirm with the SPI guys that
>> > DDR is truly unique to SPI NOR. (I know it doesn't currently support
>> > it.)
>>
>> I don't know what DDR is in this context, sorry.
>
> I think it's just the ability to latch data on both the rising and
> falling edges of the SPI clock. For SPI flash, it seems to be used for
> the data portion of the opcode/address/data sequence.
>
>> I'm guessing you're
>> right since it sounds like something to do with extra clocks and this is
>> probably not something used by generic SPI devices at present (if it
>> ends up being widely implemented by sufficiently generic controllers
>> that might change but the trend seems to be to flash specific
>> controllers).
>
> OK, thanks for chiming in.
>
> Yeah, I suppose it could be wedged in later if drivers/spi/ ever adopts
> a solution.

I think this can just be another SPI_* spi_device.mode flag.

Do we need bindings for this in
Documentation/devicetree/bindings/spi/spi-bus.txt?
Unlike Quad SPI transfer support, this doesn't need special wiring, so DDR
capability is an intrinsic property of the SPI slave, and the mode bit can just
be set in the SPI slave driver, without any DT magic?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
