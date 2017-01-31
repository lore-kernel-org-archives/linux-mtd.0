Received: from mail-it0-x232.google.com ([2607:f8b0:4001:c0b::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYY2R-0003LG-Ri
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 13:00:01 +0000
Received: by mail-it0-x232.google.com with SMTP id r185so124596852ita.0
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2017 04:59:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <08e9505d2d366557950f8e6a4e81f57a@mail.crapouillou.net>
References: <27071da2f01d48141e8ac3dfaa13255d@mail.crapouillou.net>
 <20170122144947.16158-1-paul@crapouillou.net>
 <20170122144947.16158-2-paul@crapouillou.net>
 <CACRpkdZFRH84c4x7HBwgmY3fH+=Qq4q167c9oPhvrJ70MQkjaA@mail.gmail.com>
 <08e9505d2d366557950f8e6a4e81f57a@mail.crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Jan 2017 13:59:37 +0100
Message-ID: <CACRpkda+2tnuO=AcN=HAD+YoaM4eEgnyjju7ioJL1op7+jFtqA@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] Documentation: dt/bindings: Document
 pinctrl-ingenic
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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

On Fri, Jan 27, 2017 at 4:27 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> [Me]:
>> In the former case, if this pertains to the *inside* of the SoC:
>> is it just different between jz4740 and jz4780?
>> In that case, just code this into the driver as .data to the .compatible
>> in the DT match. No special DT properties needed.
>
> Well, I've been taught that devicetree is for describing the hardware, and
> the driver code is for functionality. So that's why I put it in devicetree.

This is a gray area.

But as GPIO maintainer I'm not happy about encoding information
about the hardware, that can be deducted from the compatible-string,
into the devicetree.

I prefer to encode per-compatible hardware information tables into
the driver, as structs, and pick the right table based on the compatible
string as .data in the of match entry.

It's simple to retrieve into the driver using of_device_get_match_data()
these days.

> That's also the reason why I put the list of functions and groups in
> devicetree and not in the driver code.

I'm not super-happy about that either, and it's not the way I would
have done it but the argument has been made
that it is a lot of opaque data and people prefer to maintain it
in the device tree.

I accept it for functions and groups, but I don't like it.

I will not fold to any consistency arguments of the type "now
you allowed this one thing, so you must allow this other thing
so you are consistent", just no. I didn't like it the first time, so I'm
not liking it anymore the second time.

I guess if the DT people tell me it has to be done this way I would
accept it. After a lot of discussion. But noone has.

Please make it a table and put it in the driver instead.

Yours,
Linus Walleij
