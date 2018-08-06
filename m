Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmowx-0000SQ-EU
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2018 23:30:09 +0000
Received: by mail-it0-x241.google.com with SMTP id 139-v6so13759374itf.0
 for <linux-mtd@lists.infradead.org>; Mon, 06 Aug 2018 16:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-10-jmkrzyszt@gmail.com>
In-Reply-To: <20180806222918.12644-10-jmkrzyszt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Aug 2018 01:29:43 +0200
Message-ID: <CACRpkdZtuU6zXBz6UqprE7-31vW9-1ZabFjyzHBgWaTgmqkbbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/12] gpiolib: Identify GPIO descriptor arrays
 with direct mapping
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>,
 ext Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-doc@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Janusz!

On Tue, Aug 7, 2018 at 12:29 AM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Certain GPIO array lookup results may map directly to GPIO pins of a
> single GPIO chip in hardware order.  If that condition is recognized
> and handled efficiently, significant performance gain of get/set array
> functions may be possible.
>
> While processing a request for an array of GPIO descriptors, verify if
> the descriptors just collected represent consecutive pins of a single
> GPIO chip.  Pass that information with the array to the caller so it
> can benefit from enhanced performance as soon as bitmap based get/set
> array functions which can make efficient use of that are available.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
(...)
>  This function returns a struct gpio_descs which contains an array of
> -descriptors::
> +descriptors.  It may also contain a valid descriptor of a single GPIO chip in
> +case the array strictly matches pin hardware layout of the chip::
>
>         struct gpio_descs {
>                 unsigned int ndescs;
>                 struct gpio_desc *desc[];
> +               struct gpio_chip *chip;

This must be motivated: if the only purpose is to indicate to the consumer that
all GPIOs are on the same chip, why not just have a

bool all_on_same_chip;

That you set to true if these are all on the same chip?

Yours,
Linus Walleij
