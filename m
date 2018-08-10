Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fo4OZ-0000b7-5j
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2018 10:11:48 +0000
Received: by mail-it0-x241.google.com with SMTP id g141-v6so1929338ita.4
 for <linux-mtd@lists.infradead.org>; Fri, 10 Aug 2018 03:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-5-jmkrzyszt@gmail.com>
In-Reply-To: <20180806222918.12644-5-jmkrzyszt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Aug 2018 12:11:19 +0200
Message-ID: <CACRpkdZFq3AfH6ehCzMYqwptyfpdd3NLurx3kgj==DmKRASuiA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/12] mtd: rawnand: ams-delta: request data port
 GPIO resource
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

On Tue, Aug 7, 2018 at 12:29 AM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Data port used by the driver is actually an OMAP MPUIO device, already
> under control of gpio-omap driver.  For that reason we used to not
> request the memory region of the port as that would fail because the
> region is already busy.  Despite that, we are still accessing the port
> by just ioremapping it and performing read/write operations.  Moreover,
> we are doing that without any proteciton from other users legally
> manipulating the port pins over GPIO API.
>
> The plan is to convert the driver to access the port over functions
> exposed by the gpio-omap driver.  Before that happens, already prevent
> from other users accessing the port pins by requesting an array of its
> GPIO descriptors.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
