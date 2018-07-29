Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fjsOI-0001y1-Tu
 for linux-mtd@lists.infradead.org; Sun, 29 Jul 2018 20:34:12 +0000
Received: by mail-it0-x241.google.com with SMTP id q20-v6so14159636ith.0
 for <linux-mtd@lists.infradead.org>; Sun, 29 Jul 2018 13:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180718235710.18242-8-jmkrzyszt@gmail.com>
In-Reply-To: <20180718235710.18242-8-jmkrzyszt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 29 Jul 2018 22:33:48 +0200
Message-ID: <CACRpkdZ316o4rwCftOWsRMNd3B+4v0mWGbdMFvp1mm7yaFsccA@mail.gmail.com>
Subject: Re: [RFC PATCH 7/8] mtd: rawnand: ams-delta: Check sanity of data
 GPIO resource
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 ext Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
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

Nice work overall! Some feedback:

On Thu, Jul 19, 2018 at 1:57 AM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> +#include <linux/gpio/driver.h>

Let's skip that.

> +       /*
> +        * For acceptable performance require the data GPIO
> +        * chip to support get/set_multiple() callbacks.
> +        */
> +       if (!data_gpioc->get_multiple || !data_gpioc->set_multiple) {
> +               err = -EINVAL;
> +               dev_err(&pdev->dev,
> +                       "data GPIO chip does not support get/set_multiple()\n");
> +               goto out_mtd;
> +       }

Since we know which platform it is, we know that we applied the previous
get/set multiple patch, so we need not check this if the patches are
applied in sequence.

As long as all patches go in the same merge window, no problem.

I'm BTW ready to apply the get/set multiple patch already.

Yours,
Linus Walleij
