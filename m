Received: from mail-it0-x232.google.com ([2607:f8b0:4001:c0b::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYYCO-00010e-HD
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 13:10:20 +0000
Received: by mail-it0-x232.google.com with SMTP id r185so124798944ita.0
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2017 05:09:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <12dc62a7255bd453ff4e5e89f93ebc58@mail.crapouillou.net>
References: <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
 <20170125185207.23902-1-paul@crapouillou.net>
 <20170125185207.23902-2-paul@crapouillou.net>
 <20170130203617.hpljtcmzava3rq2n@rob-hp-laptop>
 <12dc62a7255bd453ff4e5e89f93ebc58@mail.crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Jan 2017 14:09:54 +0100
Message-ID: <CACRpkdbAgy4sh6NT5DdQD6EQtOZEwevohEA6OGRcVz98yqS52Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] Documentation: dt/bindings: Document
 pinctrl-ingenic
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Paul Burton <paul.burton@imgtec.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux MIPS <linux-mips@linux-mips.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 James Hogan <james.hogan@imgtec.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2017 at 11:31 AM, Paul Cercueil <paul@crapouillou.net> wrote:
> [Rob]:
>> From the overlapping register addresses in the examples and this
>> description, it looks like the pinctrlr and gpio controller are 1 block.
>> If so, then there should only be 1 node.
>
> Well, that's what I had until Linus W. just told me to do the opposite:
>
>> Just pull all these down two levels and make them one device
>> each instead of having them inside the pin controller node
>> like this.

I guess the argument is that they are in the same coherent memory
range so they should be one device node. That is how we handle
e.g. system controllers so it makes some sense.

So can the two GPIO controllers be modeled as two subnodes of
the pin controller then?

Subnodes are certainly OK, we have that for many other devices
such as interrupt controllers on PCI bridges and what not.

So when the probing of the pin controller is ready it can just
walk down and populate the GPIO subdevices with
of_platform_default_populate() or simply by registering the
device directly with platform_device_add_data() just like an
MFD device does?

This is nice because we want to use the standard gpio ranges
to map pins to GPIO lines.

I'm sorry about the unclarities here, but it's essentially an intrinsic
problem with GPIO that has been with us for years: do we model
each "bank" as a device or do we just register each bank as a
gpiochip, or do we even make one gpiochip to cover all the banks.
All solutions can be found in the kernel... also the different DT bindings:
one node for a whole slew of GPIO controllers, or seveal nodes
and I bet also several nodes for memory ranges in close proximity.

I don't know for sure what is the most elegant solution, we might
need to build some consensus here for the future so it doesn't
get to heterogeneous.

Yours,
Linus Walleij
